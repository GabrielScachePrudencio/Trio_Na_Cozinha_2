package br.edu.ifsp.arq.controller.controllerReceita;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.edu.ifsp.arq.dao.ReceitaDAO;
import br.edu.ifsp.arq.model.Receita;

/**
 * Servlet implementation class ReceitaServletDetalhada
 */
@WebServlet("/ReceitaServletDetalhada")
public class ReceitaServletDetalhada extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ReceitaDAO receitaDao;
	
    public ReceitaServletDetalhada() {
        super();
        receitaDao = ReceitaDAO.getInstance_R();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		int id2 = Integer.parseInt(id);
		Receita r = receitaDao.buscarPorID(id2);
		
		request.setAttribute("receitaDetalhada", r);
		request.getRequestDispatcher("views/receita/ReceitaEspecifica.jsp").forward(request, response);
	}

	

}
