package br.edu.ifsp.arq.controller.controllerUsuario;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.edu.ifsp.arq.dao.ReceitaDAO;
import br.edu.ifsp.arq.dao.UsuarioDAO;
import br.edu.ifsp.arq.model.Usuario;


@WebServlet("/UsuarioServletDeletar")
public class UsuarioServletDeletar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       UsuarioDAO usuarioDao;
       ReceitaDAO receitaDAO;
   
    public UsuarioServletDeletar() {
        super();
        usuarioDao = UsuarioDAO.getInstance_U();
        receitaDAO = ReceitaDAO.getInstance_R();
    }

	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ID recebido: " + request.getParameter("id"));
		HttpSession sessao = request.getSession(false);
		Usuario usuarioLogado = (Usuario) sessao.getAttribute("usuarioLogado");
		
		if (usuarioLogado != null) {
		    String id = request.getParameter("id");
		    int id2 = Integer.parseInt(id);

		    Usuario u = usuarioDao.buscarPorID(id2);

		    if (u.getTipoUsu().equals("admin")) {
		        request.setAttribute("msgErro", "Você não pode deletar um administrador!");
			    request.getRequestDispatcher("/views/extras/Erro.jsp").forward(request, response);

		    } else {
		        if (usuarioLogado.getId() == id2) {
		            sessao.setAttribute("isADM", false);
		            sessao.setAttribute("usuarioLogado", null);
		        }
		        usuarioDao.deletar(id2);
		        receitaDAO.deletar(id2);
		    }

		    request.setAttribute("usuarios", usuarioDao.mostrarTodos());
		    request.getRequestDispatcher("/ServletRenovaPrincipal").forward(request, response);

		} else {
			request.setAttribute("msgErro", "precisa estar logado para poder deletar");
		    request.getRequestDispatcher("/views/extras/Erro.jsp").forward(request, response);
		}

	}
}
