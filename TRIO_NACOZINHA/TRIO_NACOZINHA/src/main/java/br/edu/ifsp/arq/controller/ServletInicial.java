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
    private Usuario usuarioLogado = null;
	
    public ServletInicial() {
        super(); 
        receita_dao = ReceitaDAO.getInstance_R();
        usuario_dao = UsuarioDAO.getInstance_U();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(soUmaVez < 1) {
			String nome = "Bolo de Chocolate", autor = "Scache", modoPre = "mecha ovos e leite e misture com o fermento", img = "receita/boloChocolate.jpg";
			int tempo = 100, qtdd = 1;
			ArrayList<String> ingre = new ArrayList<String>();
			ingre.add("avelã");
			ingre.add("farinha");
			ingre.add("3 ovos");
			ingre.add("manteiga");
			ArrayList<String> categ = new ArrayList<String>();
			categ.add("Doce");
			
			Receita r = new Receita(0,nome, autor, tempo, ingre, modoPre, categ, qtdd, img);
			receita_dao.add(r);
			
			
			String nomeU = "123", senha = "123", tipoU = "admin", imgU = "usuario/ancelloti.png";
			Usuario u = new Usuario(qtdd, nomeU, senha, tipoU, imgU);
			usuario_dao.add(u);
					
			
			soUmaVez++;
		}
			
		HttpSession sessao = request.getSession();
		sessao.setAttribute("usuarioLogado", usuarioLogado);
		sessao.setAttribute("isADM", false);

		request.setAttribute("receitas", receita_dao.mostrarTodos());
		request.setAttribute("usuarios", usuario_dao.mostrarTodos());
		
		
		
		getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);

	}

	
}
