package br.edu.ifsp.arq.controller;

import java.io.IOException;



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
import br.edu.ifsp.arq.model.*;
import br.edu.ifsp.arq.dao.*;

@WebServlet("/ServletInicial")
//@MultipartConfig
@MultipartConfig
public class ServletInicial extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ReceitaDAO receita_dao;
	private UsuarioDAO usuario_dao;
	private static int soUmaVez = 0;
	
    public ServletInicial() {
        super(); 
        receita_dao = ReceitaDAO.getInstance_R();
        usuario_dao = UsuarioDAO.getInstance_U();
    }

	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	HttpSession sessao = request.getSession();
    	sessao.setAttribute("usuarioLogado", null);

    	request.setAttribute("receitas", receita_dao.mostrarTodos());
    	request.setAttribute("usuarios", usuario_dao.mostrarTodos());

    	getServletContext().getRequestDispatcher("/index.html").forward(request, response);
    }
}
