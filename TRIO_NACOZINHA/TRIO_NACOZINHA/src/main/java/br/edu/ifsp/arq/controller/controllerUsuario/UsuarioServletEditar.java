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
import javax.servlet.http.HttpSession;

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
			System.out.println("ID recebido Editar: " + request.getParameter("id"));
			HttpSession sessao = request.getSession(false);
			Usuario usuarioLogado = (Usuario) sessao.getAttribute("usuarioLogado");

			String id = request.getParameter("id");
			int id2 = Integer.parseInt(id);
			Usuario u = usuarioDao.buscarPorID(id2); 
			System.out.println("ID recebido Editar: " + request.getParameter("id"));
			System.out.println("ID2 recebido Editar: " + id2);
			System.out.println("u.getid recebido Editar: " + u.getId());
		
			if(usuarioLogado != null) {
				response.setContentType("text/html");
				PrintWriter out = response.getWriter();
				out.println("<form action=\"" + request.getContextPath() + "/UsuarioServletSalvar?id=" + u.getId() + "\" method=\"POST\" enctype='multipart/form-data'>");

				// Campo oculto com ID
				out.println("<label for='id'> "+ u.getId()  +" </label>");
				out.println("<input type='hidden' id='id' name='id' value='" + u.getId() + "'><br>\r\n" + "<br>");

				out.println("<label for='nome'>Nome da Receita:</label>");
				out.println("<input type='text' id='nome' name='nome' value='" + u.getNome() + "' required><br><br>");

				out.println("<label for='senha'>Senha:</label>");
				out.println("<input type='text' id='senha' name='senha' value='" + u.getSenha() + "' required><br><br>");

				out.println("<br>");

				out.println("<label for=\"img\">Imagem:</label>");
				out.println("<input type=\"file\" name=\"img\" accept=\"image/*\"><br><br>");
				out.println("<img src=\"" + request.getContextPath() + "/imagens/" + u.getImg() + "\" width='200px'><br><br>");
				
				out.println("<button type='submit'>Salvar Alterações</button>");
				out.println("</form>");
				out.println("<a href=\"" + request.getContextPath() + "/ServletRenovaPrincipal\">Voltar à página principal</a>");

			} else {
				request.setAttribute("msgErro", "precisa estar logado para poder editar");
			    request.getRequestDispatcher("/views/extras/Erro.jsp").forward(request, response);

			}
		}	
}
