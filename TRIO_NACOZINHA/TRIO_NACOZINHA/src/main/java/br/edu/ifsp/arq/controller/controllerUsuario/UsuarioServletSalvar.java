package br.edu.ifsp.arq.controller.controllerUsuario;

import java.awt.Window.Type;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import br.edu.ifsp.arq.dao.UsuarioDAO;
import br.edu.ifsp.arq.model.Receita;
import br.edu.ifsp.arq.model.Usuario;

/**
 * Servlet implementation class UsuarioServletSalvar
 */
@WebServlet("/UsuarioServletSalvar")
public class UsuarioServletSalvar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       UsuarioDAO usuarioDao;
 
    public UsuarioServletSalvar() {
        super();
        usuarioDao = UsuarioDAO.getInstance_U();
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ID recebido: " + request.getParameter("id"));
		String id = request.getParameter("id");
		int id2 = Integer.parseInt(id);
		String nome = request.getParameter("nome");
		String senha = request.getParameter("senha");
		
		
		
		
		Part filePart = request.getPart("img");
		String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
		if (fileName.isEmpty()) {
		    fileName = usuarioDao.buscarPorID(id2).getImg();
		}
		else {
			String uploadPath = getServletContext().getRealPath("") + File.separator + "imagens";
			File uploadDir = new File(uploadPath);
			if(!uploadDir.exists()) uploadDir.mkdir();
			filePart.write(uploadPath + File.separator + fileName); 
		}
		
		

		Usuario u = new Usuario(0 , nome, senha, "cliente", fileName);
		
		usuarioDao.editar(id2, u);
		
		request.setAttribute("usuarios", usuarioDao.mostrarTodos());
		request.getRequestDispatcher("/index.jsp").forward(request, response);
		
	}
}
