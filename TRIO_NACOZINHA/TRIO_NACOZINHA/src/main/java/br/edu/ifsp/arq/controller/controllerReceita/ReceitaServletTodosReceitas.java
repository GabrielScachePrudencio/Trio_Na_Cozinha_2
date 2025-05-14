package br.edu.ifsp.arq.controller.controllerReceita;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.edu.ifsp.arq.dao.ReceitaDAO;

/**
 * Servlet implementation class ReceitaServletTodosReceitas
 */
@WebServlet("/ReceitaServletTodosReceitas")
public class ReceitaServletTodosReceitas extends HttpServlet {
	private static final long serialVersionUID = 1L;
    ReceitaDAO receitaDao;
   
    public ReceitaServletTodosReceitas() {
        super();
        receitaDao = ReceitaDAO.getInstance_R();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("receitas", receitaDao.mostrarTodos());
		request.getRequestDispatcher("/views/receita/TodosReceitas.jsp").forward(request, response);
	}

	

}
