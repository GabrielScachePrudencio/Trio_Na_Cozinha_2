package br.edu.ifsp.arq.controller.controllerUsuario;

import java.awt.Window.Type;

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

import br.edu.ifsp.arq.dao.UsuarioDAO;
import br.edu.ifsp.arq.model.Receita;
import br.edu.ifsp.arq.model.Usuario;

/**
 * Servlet implementation class UsuarioServletSalvar
 */
@WebServlet("/UsuarioServletSalvar")
@MultipartConfig
public class UsuarioServletSalvar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       UsuarioDAO usuarioDao;
 
    public UsuarioServletSalvar() {
        super();
        usuarioDao = UsuarioDAO.getInstance_U();
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sessao = request.getSession();
		Usuario usuarioLogado = (Usuario) sessao.getAttribute("usuarioLogado");
		
		String id = request.getParameter("id");
		int id2 = Integer.parseInt(id);
		String nome = request.getParameter("nome");
		String senha = request.getParameter("senha");
		
		ArrayList<Receita> minhasRece = usuarioDao.buscarPorID(id2).getMinhasReceitas();
		
		System.out.println("ID recebido Editar: " + request.getParameter("id"));
		System.out.println("ID2 recebido Editar: " + id2);
		
		
		
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
		
		

		Usuario u = new Usuario(0 , nome, senha, "cliente", fileName, minhasRece);
		
		usuarioDao.editar(id2, u);
		sessao.setAttribute("usuarioLogado", u);
		
		request.setAttribute("usuarios", usuarioDao.mostrarTodos());
		request.getRequestDispatcher("/index.jsp").forward(request, response);
		request.getRequestDispatcher("/ServletRenovaPrincipal").forward(request, response);
		
	}
}
