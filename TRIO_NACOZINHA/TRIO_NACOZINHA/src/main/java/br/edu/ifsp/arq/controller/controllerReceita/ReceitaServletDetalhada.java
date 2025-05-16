package br.edu.ifsp.arq.controller.controllerReceita;

import java.io.IOException;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.edu.ifsp.arq.dao.ReceitaDAO;
import br.edu.ifsp.arq.model.Receita;


@WebServlet("/ReceitaServletDetalhada")
public class ReceitaServletDetalhada extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ReceitaDAO receitaDao;
	
    public ReceitaServletDetalhada() {
        super();
        receitaDao = ReceitaDAO.getInstance_R();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String busca = request.getParameter("busca");

        if (busca != null && !busca.trim().isEmpty()) {
            for (Receita r : receitaDao.mostrarTodos()) {
                if (r.getNome().toLowerCase().contains(busca.toLowerCase())) {
                    request.setAttribute("receitaDetalhada", r);
                    request.getRequestDispatcher("views/receita/ReceitaEspecifica.jsp").forward(request, response);
                    return; 
                }
            }
            request.setAttribute("msgErro", "Nenhuma receita encontrada com esse nome.");
            request.getRequestDispatcher("/views/extras/Erro.jsp").forward(request, response);
        } else {
            request.setAttribute("msgErro", "Campo de busca vazio.");
            request.getRequestDispatcher("/views/extras/Erro.jsp").forward(request, response);
        }
    }


    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		String id = request.getParameter("id");
		int id2 = Integer.parseInt(id);
		Receita r = receitaDao.buscarPorID(id2);
		
		request.setAttribute("receitaDetalhada", r);
		request.getRequestDispatcher("views/receita/ReceitaEspecifica.jsp").forward(request, response);
	}

	

}
