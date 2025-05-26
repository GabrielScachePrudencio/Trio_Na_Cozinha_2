package br.edu.ifsp.arq.controller.controllerReceita;

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
import br.edu.ifsp.arq.model.Receita;
import br.edu.ifsp.arq.model.Usuario;



@WebServlet("/ReceitaServletSalvar")
@MultipartConfig
public class ReceitaServletSalvar extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ReceitaDAO receitaDao;
	
    public ReceitaServletSalvar() {
        super();
        receitaDao = ReceitaDAO.getInstance_R();
        
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sessao = request.getSession();
		Usuario usuarioLogado = (Usuario) sessao.getAttribute("usuarioLogado");
		
		if(usuarioLogado != null) {
			
		
		
			System.out.println("ID recebido: " + request.getParameter("id"));
			String id = request.getParameter("id");
			
			int id2 = Integer.parseInt(id);
			String nome = request.getParameter("nome");
			String autor = request.getParameter("autor");
			String modoPreparo = request.getParameter("modoPreparo");
			int tempoDePreparoMinutos = Integer.parseInt(request.getParameter("tempoDePreparoMinutos"));
			int qtddPorcoes = Integer.parseInt(request.getParameter("qtddPorcoes"));
	
			String[] ingredientesArray = request.getParameterValues("ingredientes");
			ArrayList<String> ingredientes = new ArrayList<>();
			if (ingredientesArray != null) {
			    for (String ingrediente : ingredientesArray) {
			        ingredientes.add(ingrediente);
			    }
			}
	
			String[] categoriasArray = request.getParameterValues("categorias");
			ArrayList<String> categorias = new ArrayList<>();
			if (categoriasArray != null) {
			    for (String categoria : categoriasArray) {
			        categorias.add(categoria);
			    }
			}
			
			
			Part filePart = request.getPart("img");
			String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
			if (fileName.isEmpty()) {
			    fileName = receitaDao.buscarPorID(id2).getImg(); // mantém a imagem anterior
			}
			else {
				String uploadPath = getServletContext().getRealPath("") + File.separator + "imagens";
				File uploadDir = new File(uploadPath);
				if(!uploadDir.exists()) uploadDir.mkdir();
				filePart.write(uploadPath + File.separator + fileName); 
			}
			
			
	        boolean nomeJaExiste = false;
	        for (Receita u : receitaDao.mostrarTodos()) {
	            if (u.getNome().equalsIgnoreCase(nome) && u.getId() != id2) {
	                nomeJaExiste = true;
	                break;
	            }
	        }
	        
	        if (nomeJaExiste) {
	            request.setAttribute("msgErro", "Já existe uma receita com esse nome. Escolha outro nome.");
	            request.getRequestDispatcher("/views/extras/Erro.jsp").forward(request, response);
	            return; 
	        }
			
			Receita r = new Receita(0, nome, autor, tempoDePreparoMinutos, ingredientes, modoPreparo, categorias, qtddPorcoes, fileName);
			
			receitaDao.editar(id2, r);

			for (int i = 0; i < usuarioLogado.getMinhasReceitas().size(); i++) {
			    if (usuarioLogado.getMinhasReceitas().get(i).getId() == id2) {
			    	usuarioLogado.getMinhasReceitas().set(i, r);
			        break;
			    }
			}

            sessao.setAttribute("usuarioLogado", usuarioLogado);
			request.setAttribute("receitas", receitaDao.mostrarTodos());
			request.getRequestDispatcher("/ServletRenovaPrincipal").forward(request, response);
		} else {
			request.setAttribute("msgErro", "precisa estar logado para poder salvar");
			request.getRequestDispatcher("/views/extras/Erro.jsp").forward(request, response);

		}
		
	
	}

}
