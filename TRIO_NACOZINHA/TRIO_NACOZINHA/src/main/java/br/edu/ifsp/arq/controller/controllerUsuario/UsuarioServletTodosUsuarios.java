package br.edu.ifsp.arq.controller.controllerUsuario;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.edu.ifsp.arq.dao.UsuarioDAO;

@WebServlet("/UsuarioServletTodosUsuarios")
public class UsuarioServletTodosUsuarios extends HttpServlet {
	private static final long serialVersionUID = 1L;
       UsuarioDAO usuarioDao;
    
    public UsuarioServletTodosUsuarios() {
        super();
        usuarioDao = UsuarioDAO.getInstance_U();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		HttpSession sessao = request.getSession(false);
		boolean isADM = (boolean) sessao.getAttribute("isADM");
		
		if(isADM) {
			request.setAttribute("usuarios", usuarioDao.mostrarTodos());
			request.getRequestDispatcher("/views/usuario/TodosUsuarios.jsp").forward(request, response);
		} 
		request.setAttribute("msgErro", "precisa ser o adm para poder ver todos os usuarios");
		request.getRequestDispatcher("/views/extras/Erro.jsp").forward(request, response);
	}

	

}
