package br.edu.ifsp.arq.controller.controllerUsuario;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/UsuarioServletDeconectar")
public class UsuarioServletDeconectar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sessao = request.getSession(false);
		sessao.setAttribute("isADM", false);
        sessao.setAttribute("usuarioLogado", null);
        request.getRequestDispatcher("/index.jsp").forward(request, response);
	}	

	
}
