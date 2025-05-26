package br.edu.ifsp.arq.controller.controllerReceita;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import br.edu.ifsp.arq.dao.ReceitaDAO;
import br.edu.ifsp.arq.model.Receita;
import br.edu.ifsp.arq.model.Usuario;

@WebServlet("/ReceitaServletAdd")
@MultipartConfig
public class ReceitaServletAdd extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ReceitaDAO receita_dao;

    public ReceitaServletAdd() {
        super();
        receita_dao = ReceitaDAO.getInstance_R();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        HttpSession sessao = request.getSession();
        Usuario usuarioLogado = (Usuario) sessao.getAttribute("usuarioLogado");

        if (usuarioLogado != null) {
            boolean nomeJaExiste = false;
            String nome = request.getParameter("nome");

            for (Receita r : receita_dao.mostrarTodos()) {
                if (r.getNome().equalsIgnoreCase(nome)) {
                    nomeJaExiste = true;
                    break;
                }
            }

            if (nomeJaExiste) {
                request.setAttribute("msgErro", "Já existe uma receita com esse nome. Escolha outro nome.");
                request.getRequestDispatcher("/views/extras/Erro.jsp").forward(request, response);
                return;
            }

            String modoPreparo = request.getParameter("modoPreparo");

            long tempoDePreparoMinutos;
            long qtddPorcoes;

            try {
                tempoDePreparoMinutos = Long.parseLong(request.getParameter("tempoDePreparoMinutos"));
                qtddPorcoes = Long.parseLong(request.getParameter("qtddPorcoes"));

                // Validação simples para evitar números absurdos
                if (tempoDePreparoMinutos <= 0 || tempoDePreparoMinutos > 10000 ||
                    qtddPorcoes <= 0 || qtddPorcoes > 10000) {
                    throw new NumberFormatException("Valores fora do intervalo permitido.");
                }
            } catch (NumberFormatException e) {
                request.setAttribute("msgErro", "Tempo de preparo ou quantidade de porções inválidos.");
                request.getRequestDispatcher("/views/extras/Erro.jsp").forward(request, response);
                return;
            }

            // Ingredientes fixos
            String[] ingredientesFixos = request.getParameterValues("ingredientes");

            // Ingredientes personalizados digitados (dinâmicos)
            String[] ingredientesPersonalizados = request.getParameterValues("ingredientesPersonalizados");

            ArrayList<String> ingredientes = new ArrayList<>();

            if (ingredientesFixos != null) {
                ingredientes.addAll(Arrays.asList(ingredientesFixos));
            }

            if (ingredientesPersonalizados != null) {
                for (String ing : ingredientesPersonalizados) {
                    if (ing != null && !ing.trim().isEmpty()) {
                        ingredientes.add(ing.trim());
                    }
                }
            }

            // Categorias
            String[] categoriasArray = request.getParameterValues("categorias");
            ArrayList<String> categorias = new ArrayList<>();
            if (categoriasArray != null) {
                categorias.addAll(Arrays.asList(categoriasArray));
            }

            // Upload da imagem
            Part filePart = request.getPart("img");
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String uploadPath = getServletContext().getRealPath("") + File.separator + "imagens";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir();
            filePart.write(uploadPath + File.separator + fileName);

            // Criar nova receita com longs para tempo e porções
            Receita novaReceita = new Receita(
                0, nome, usuarioLogado.getNome(), tempoDePreparoMinutos,
                ingredientes, modoPreparo, categorias, qtddPorcoes, fileName
            );

            // Salva e atualiza sessão
            receita_dao.add(novaReceita);
            usuarioLogado.getMinhasReceitas().add(novaReceita);
            sessao.setAttribute("usuarioLogado", usuarioLogado);
            request.setAttribute("receitas", receita_dao.mostrarTodos());

            getServletContext().getRequestDispatcher("/ServletRenovaPrincipal").forward(request, response);
        } else {
            request.setAttribute("msgErro", "Para adicionar receitas, é necessário estar logado.");
            request.getRequestDispatcher("/views/extras/Erro.jsp").forward(request, response);
        }
    }
}
