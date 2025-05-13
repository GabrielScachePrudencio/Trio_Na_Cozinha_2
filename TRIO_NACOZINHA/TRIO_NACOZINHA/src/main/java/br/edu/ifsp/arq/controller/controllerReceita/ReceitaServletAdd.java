package br.edu.ifsp.arq.controller.controllerReceita;

import java.io.File;

import java.io.IOException;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import br.edu.ifsp.arq.model.*;
import br.edu.ifsp.arq.dao.*;
import java.util.ArrayList;

@WebServlet("/ReceitaServletAdd")
@MultipartConfig
public class ReceitaServletAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ReceitaDAO receita_dao;
    	
    public ReceitaServletAdd() {
        super();
        receita_dao = ReceitaDAO.getInstance_R();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nome = request.getParameter("nome");
		String autor = request.getParameter("autor");
		String modoPreparo = request.getParameter("modoPreparo");
		int tempoDePreparoMinutos = Integer.parseInt(request.getParameter("tempoDePreparoMinutos"));
		int qtddPorcoes = Integer.parseInt(request.getParameter("qtddPorcoes"));

		String[] ingredientesArray = request.getParameterValues("ingredientes");
		ArrayList<String> ingredientes = new ArrayList<>();
		if (ingredientesArray != null) {
		    for (String ingrediente : ingredientesArray) {
		        ingredientes.add(ingrediente);
		    }
		}

		String[] categoriasArray = request.getParameterValues("categorias");
		ArrayList<String> categorias = new ArrayList<>();
		if (categoriasArray != null) {
		    for (String categoria : categoriasArray) {
		        categorias.add(categoria);
		    }
		}

		Part filePart = request.getPart("img");
		String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
		String uploadPath = getServletContext().getRealPath("") + File.separator + "imagens";
		File uploadDir = new File(uploadPath);
		if(!uploadDir.exists()) uploadDir.mkdir();
		filePart.write(uploadPath + File.separator + fileName); 
		
		Receita r = new Receita(0, nome, autor, tempoDePreparoMinutos, ingredientes, modoPreparo, categorias, qtddPorcoes, fileName);

		receita_dao.add(r);

		request.setAttribute("receitas", receita_dao.mostrarTodos());
		getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
	}

}
