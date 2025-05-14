package br.edu.ifsp.arq.controller.controllerUsuario;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.edu.ifsp.arq.dao.ReceitaDAO;
import br.edu.ifsp.arq.dao.UsuarioDAO;
import br.edu.ifsp.arq.model.Usuario;

/**
 * Servlet implementation class UsuarioServletEditar
 */
@WebServlet("/UsuarioServletEditar")
@MultipartConfig
public class UsuarioServletEditar extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UsuarioDAO usuarioDao;
    
    public UsuarioServletEditar() {
        super();
        usuarioDao = UsuarioDAO.getInstance_U();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			String id = request.getParameter("id");
			int id2 = Integer.parseInt(id);
			
			Usuario u = usuarioDao.buscarPorID(id2); 
					
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.println("<form action='ReceitaServletSalvar' method='POST' enctype='multipart/form-data'>  '");

			// Campo oculto com ID
			out.println("<input type='hidden' name='id' value='" + u.getId() + "'><br>\r\n" + "<br>");

			out.println("<label for='nome'>Nome da Receita:</label>");
			out.println("<input type='text' id='nome' name='nome' value='" + u.getNome() + "' required><br><br>");

			out.println("<label for='senha'>Senha:</label>");
			out.println("<input type='text' id='senha' name='senha' value='" + u.getSenha() + "' required><br><br>");

			out.println("<br>");

			out.println("<label for=\"img\">Imagem:</label>");
			out.println("<input type=\"file\" name=\"img\" accept=\"image/*\"><br><br>");
			out.println("<img src='" + "imagens/usuario"+ u.getImg() + "' width='200px'><br><br>");
			
			out.println("<button type='submit'>Salvar Alterações</button>");
			out.println("</form>");
			
		}	
}
