package br.edu.ifsp.arq.controller.controllerUsuario;

import java.io.File;

import java.io.IOException;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import br.edu.ifsp.arq.dao.UsuarioDAO;
import br.edu.ifsp.arq.dao.ReceitaDAO;
import br.edu.ifsp.arq.model.Usuario;

/**
 * Servlet implementation class UsuarioServletLogar
 */
@WebServlet("/UsuarioServletLogar")
public class UsuarioServletLogar extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UsuarioDAO usuario_dao;

	public UsuarioServletLogar() {
		super();
		usuario_dao = UsuarioDAO.getInstance_U();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nome = request.getParameter("nome");
		String senha = request.getParameter("senha");
		HttpSession sessao = request.getSession();
		Usuario usuarioLogado = (Usuario) sessao.getAttribute("usuarioLogado");

		System.out.println("NOME = " + nome);
		System.out.println("SENHA = " + senha);

		if (usuarioLogado == null) {
			if (nome != null && senha != null) {
				for (Usuario u : usuario_dao.mostrarTodos()) {
					if (u.getNome().equals(nome) && u.getSenha().equals(senha)) {
						sessao.setAttribute("usuarioLogado", u);

						request.setAttribute("usuarios", usuario_dao.mostrarTodos());
						request.setAttribute("receitas", ReceitaDAO.getInstance_R().mostrarTodos());

						request.getRequestDispatcher("/ServletRenovaPrincipal").forward(request, response);
						return;
					}
				}
			}
			
			request.setAttribute("msgErro", "Usuário ou senha inválidos");
			request.getRequestDispatcher("/views/extras/Erro.jsp").forward(request, response);
			
		} else {
			request.setAttribute("msgErro", "Você já está logado");
			request.getRequestDispatcher("/views/extras/Erro.jsp").forward(request, response);
		}
	}
}


