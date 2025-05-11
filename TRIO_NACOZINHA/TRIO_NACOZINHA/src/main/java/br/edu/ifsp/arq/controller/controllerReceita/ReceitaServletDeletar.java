package br.edu.ifsp.arq.controller.controllerReceita;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.edu.ifsp.arq.dao.ReceitaDAO;
import br.edu.ifsp.arq.model.Receita;


@WebServlet("/ReceitaServletDeletar")
public class ReceitaServletDeletar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       	ReceitaDAO receitaDao;
    
    public ReceitaServletDeletar() { 
        super();
        receitaDao = ReceitaDAO.getInstance_R();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		int id2 = Integer.parseInt(id);
		receitaDao.deletar(id2);
		
		getServletContext().setAttribute("receitas", receitaDao.mostrarTodos());
		getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
	}

	

}
