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
    	if (soUmaVez < 1) {
    		// Receita 1 - Bolo de Chocolate
    		String nome1 = "Bolo de Chocolate";
    		String modoPre1 = "Mecha ovos e leite e misture com o fermento.";
    		String img1 = "receita/boloChocolate.jpg";
    		int tempo1 = 100, qtdd1 = 1;
    		ArrayList<String> ingre1 = new ArrayList<>();
    		ingre1.add("Avelã");
    		ingre1.add("Farinha");
    		ingre1.add("3 ovos");
    		ingre1.add("Manteiga");
    		ArrayList<String> categ1 = new ArrayList<>();
    		categ1.add("Doce");

    		// Receita 2 - Feijoada Tradicional
    		String nome2 = "Feijoada Tradicional";
    		String modoPre2 = "Dessalgue as carnes. Cozinhe o feijão e junte com as carnes refogadas. Deixe apurar e finalize com cheiro-verde.";
    		String img2 = "receita/feijoada.png";
    		int tempo2 = 150, qtdd2 = 8;
    		ArrayList<String> ingre2 = new ArrayList<>();
    		ingre2.add("Feijão preto");
    		ingre2.add("Carne seca");
    		ingre2.add("Costelinha suína");
    		ingre2.add("Linguiça calabresa");
    		ingre2.add("Paio");
    		ingre2.add("Cebola");
    		ingre2.add("Alho");
    		ingre2.add("Folha de louro");
    		ArrayList<String> categ2 = new ArrayList<>();
    		categ2.add("Almoço");
    		categ2.add("Tradicional");

    		// Receita 3 - Torta de Frango com Catupiry
    		String nome3 = "Torta de Frango";
    		String modoPre3 = "Refogue o frango com temperos. Prepare a massa, coloque o recheio e leve ao forno até dourar.";
    		String img3 = "receita/tortafrango.png";
    		int tempo3 = 90, qtdd3 = 6;
    		ArrayList<String> ingre3 = new ArrayList<>();
    		ingre3.add("Peito de frango desfiado");
    		ingre3.add("Catupiry");
    		ingre3.add("Farinha de trigo");
    		ingre3.add("Leite");
    		ingre3.add("Ovo");
    		ingre3.add("Fermento");
    		ArrayList<String> categ3 = new ArrayList<>();
    		categ3.add("Salgado");
    		categ3.add("Lanche");

    		// Usuário padrão
    		String nomeU = "123", senha = "123", imgU = "usuario/ancelloti.png";
    		String autor = nomeU;

    		Receita r1 = new Receita(0, nome1, autor, tempo1, ingre1, modoPre1, categ1, qtdd1, img1);
    		Receita r2 = new Receita(0, nome2, autor, tempo2, ingre2, modoPre2, categ2, qtdd2, img2);
    		Receita r3 = new Receita(0, nome3, autor, tempo3, ingre3, modoPre3, categ3, qtdd3, img3);

    		ArrayList<Receita> minhasRece = new ArrayList<>();
    		minhasRece.add(r1);
    		minhasRece.add(r2);
    		minhasRece.add(r3);

    		Usuario u = new Usuario(0, nomeU, senha, imgU, minhasRece);

    		receita_dao.add(r1);
    		receita_dao.add(r2);
    		receita_dao.add(r3);
    		usuario_dao.add(u);

    		soUmaVez++;
    	} else {
    		request.getRequestDispatcher("/views/extras/Erro.jsp").forward(request, response);
    		return;
    	}

    	HttpSession sessao = request.getSession();
    	sessao.setAttribute("usuarioLogado", null);

    	request.setAttribute("receitas", receita_dao.mostrarTodos());
    	request.setAttribute("usuarios", usuario_dao.mostrarTodos());

    	getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
    }
}
