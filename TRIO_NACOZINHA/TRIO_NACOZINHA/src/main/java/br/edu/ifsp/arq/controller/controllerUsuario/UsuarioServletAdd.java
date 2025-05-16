package br.edu.ifsp.arq.controller.controllerUsuario;

import java.io.File;

import java.io.IOException;
import java.nio.file.Paths;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import br.edu.ifsp.arq.dao.ReceitaDAO;
import br.edu.ifsp.arq.dao.UsuarioDAO;
import br.edu.ifsp.arq.model.Receita;
import br.edu.ifsp.arq.model.Usuario;

@WebServlet("/UsuarioServletAdd")
@MultipartConfig
public class UsuarioServletAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private UsuarioDAO usuario_dao;
    
    public UsuarioServletAdd() {
        super();
        usuario_dao = UsuarioDAO.getInstance_U();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nome = request.getParameter("nome");
        String senha = request.getParameter("senha");
        HttpSession sessao = request.getSession(false);
        Usuario usuarioLogado = (Usuario) sessao.getAttribute("usuarioLogado");
        
        if (usuarioLogado == null) {
            boolean nomeJaExiste = false;
            for (Usuario u : usuario_dao.mostrarTodos()) {
                if (u.getNome().equalsIgnoreCase(nome)) { 
                	nomeJaExiste = true;
                    break;
                }
            }

            if (nomeJaExiste) {
                request.setAttribute("msgErro", "Já existe um usuário com esse nome. Escolha outro nome.");
                request.getRequestDispatcher("/views/extras/Erro.jsp").forward(request, response);
                return; 
            }

            Part filePart = request.getPart("img");
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String uploadPath = getServletContext().getRealPath("") + File.separator + "imagens";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir();

            filePart.write(uploadPath + File.separator + fileName);
            ArrayList<Receita> minhasReceitas = new ArrayList<Receita>();

            Usuario u = new Usuario(0, nome, senha, "cliente", fileName, minhasReceitas);
            usuario_dao.add(u);

            request.setAttribute("usuarios", usuario_dao.mostrarTodos());
            request.setAttribute("receitas", ReceitaDAO.getInstance_R().mostrarTodos());
            request.getRequestDispatcher("/index.jsp").forward(request, response);

        } else {
            request.setAttribute("msgErro", "Não pode adicionar outro usuário enquanto estiver logado");
            request.getRequestDispatcher("/views/extras/Erro.jsp").forward(request, response);
        }
    }

}
