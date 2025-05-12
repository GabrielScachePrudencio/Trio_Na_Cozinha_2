package br.edu.ifsp.arq.controller.controllerReceita;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import br.edu.ifsp.arq.dao.ReceitaDAO;
import br.edu.ifsp.arq.model.Receita;
import java.util.ArrayList;




@WebServlet("/ReceitaServletEditar")
@MultipartConfig
public class ReceitaServletEditar extends HttpServlet {
	private static final long serialVersionUID = 1L;

    ReceitaDAO receitaDao;   	
    
    public ReceitaServletEditar() {
        super();
        receitaDao = ReceitaDAO.getInstance_R();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		int id2 = Integer.parseInt(id);
		
		Receita receita = receitaDao.buscarPorID(id2);
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<form action='ReceitaServletSalvar' method='POST' enctype='multipart/form-data'>  '");

		// Campo oculto com ID
		out.println("<input type='hidden' name='id' value='" + receita.getId() + "'><br>\r\n" + "<br>");

		out.println("<label for='nome'>Nome da Receita:</label>");
		out.println("<input type='text' id='nome' name='nome' value='" + receita.getNome() + "' required><br><br>");

		out.println("<label for='autor'>Autor:</label>");
		out.println("<input type='text' id='autor' name='autor' value='" + receita.getAutor() + "' required><br><br>");

		out.println("<label for='modoPreparo'>Modo de Preparo:</label><br>");
		out.println("<textarea id='modoPreparo' name='modoPreparo' rows='4' cols='50' required>" + receita.getModoPreparo() + "</textarea><br><br>");

		out.println("<label for='tempoDePreparoMinutos'>Tempo de Preparo (em minutos):</label>");
		out.println("<input type='number' id='tempoDePreparoMinutos' name='tempoDePreparoMinutos' value='" + receita.getTempoDePreparoMinutos() + "' required><br><br>");

		out.println("<label for='qtddPorcoes'>Quantidade de Porções:</label>");
		out.println("<input type='number' id='qtddPorcoes' name='qtddPorcoes' value='" + receita.getQtddPorcoes() + "' required><br><br>");

		System.out.print("ingre" + receita.getIngredientes());
		System.out.print("cat" + receita.getCategorias());
		// Ingredientes
		out.println("<label for='ingredientes'>Ingredientes:</label><br>");
		ArrayList<String> ingredientes = receita.getIngredientes();
		String[] todosIngredientes = {"Açúcar", "Farinha", "Leite", "Ovo", "Chocolate", "Fermento", "Essencia de baunilha", "Agua", "Guarana", "Coco", "avelã", "manteiga", "3 ovos"};
		for (String ing : todosIngredientes) {
		    boolean checked = ingredientes.contains(ing); // Verifica se o ingrediente está na lista
		    out.println("<input type='checkbox' name='ingredientes' value='" + ing + "'" + (checked ? " checked" : "") + "> " + ing + "<br>");
		}
		out.println("<br>");

		// Categorias
		out.println("<label for='categorias'>Categorias:</label><br>");
		ArrayList<String> categorias = receita.getCategorias();
		String[] todasCategorias = {"Bolos", "Biscoitos", "Naturais", "Doce"};
		for (String cat : todasCategorias) {
		    boolean checked = categorias.contains(cat); // Verifica se a categoria está na lista
		    out.println("<input type='checkbox' name='categorias' value='" + cat + "'" + (checked ? " checked" : "") + "> " + cat + "<br>");
		}
		out.println("<br>");

		
		
		out.println("<label for=\"img\">Imagem:</label>");
		out.println("<input type=\"file\" name=\"img\" accept=\"image/*\"><br><br>");
		out.println("<img src='" + "imagens/"+ receita.getImg() + "' width='200px'><br><br>");

		

		out.println("<button type='submit'>Salvar Alterações</button>");
		out.println("</form>");

	}	

	

}
