package br.edu.ifsp.arq.controller.controllerUsuario;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.edu.ifsp.arq.dao.UsuarioDAO;


@WebServlet("/UsuarioServletDeletar")
public class UsuarioServletDeletar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       UsuarioDAO usuarioDao;
   
    public UsuarioServletDeletar() {
        super();
        usuarioDao = UsuarioDAO.getInstance_U();
    }

	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ID recebido: " + request.getParameter("id"));

		String id = request.getParameter("id");
		int id2 = Integer.parseInt(id);
		usuarioDao.deletar(id2);
		
		request.setAttribute("receitas", usuarioDao.mostrarTodos());
		getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
	}
}
