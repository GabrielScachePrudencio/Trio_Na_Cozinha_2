package br.edu.ifsp.arq.controller.controllerReceita;

import java.io.IOException;



import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.edu.ifsp.arq.dao.*;
import br.edu.ifsp.arq.model.*;


@WebServlet("/ReceitaServletDeletar")
public class ReceitaServletDeletar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       	ReceitaDAO receitaDao;
    
    public ReceitaServletDeletar() { 
        super();
        receitaDao = ReceitaDAO.getInstance_R();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ID recebido: " + request.getParameter("id"));
		HttpSession sessao = request.getSession();
		Usuario usuarioLogado = (Usuario) sessao.getAttribute("usuarioLogado");
		
		if(usuarioLogado != null) {
			String id = request.getParameter("id");
			int id2 = Integer.parseInt(id);
			receitaDao.deletar(id2);
			

			for (int i = 0; i < usuarioLogado.getMinhasReceitas().size(); i++) {
			    if (usuarioLogado.getMinhasReceitas().get(i).getId() == id2) {
			    	usuarioLogado.getMinhasReceitas().remove(i);
			        break;
			    }
			}
			
			
			request.setAttribute("receitas", receitaDao.mostrarTodos());
			sessao.setAttribute("usuarioLogado", usuarioLogado);
			
			//caminho relativo a raiz da aplicação
			getServletContext().getRequestDispatcher("/ServletRenovaPrincipal").forward(request, response);
			// caminho relativo ao caminho atual request.getRequestDispatcher("/ServletRenovaPrincipal").forward(request, response);
		} else {
			request.setAttribute("msgErro", "precisa estar logado para poder deletar");
		    request.getRequestDispatcher("/views/extras/Erro.jsp").forward(request, response);
		
		}

	}

	

}
