package br.edu.ifsp.arq.controller.controllerReceita;

import java.io.IOException;
import com.google.gson.Gson;
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
                    request.getRequestDispatcher("assets/views/receita/ReceitaEspecifica.html").forward(request, response);
                    return; 
                }
            }
            request.setAttribute("msgErro", "Nenhuma receita encontrada com esse nome.");
            request.getRequestDispatcher("assets/views/extras/Erro.html").forward(request, response);
        } else {
            request.setAttribute("msgErro", "Campo de busca vazio.");
            request.getRequestDispatcher("assets/views/extras/Erro.html").forward(request, response);
        }
    }


    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        int id2 = Integer.parseInt(id);
        Receita receita = receitaDao.buscarPorID(id2);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        Gson gson = new Gson();
        String json = gson.toJson(receita);

        response.getWriter().write(json);
    }


	

}
