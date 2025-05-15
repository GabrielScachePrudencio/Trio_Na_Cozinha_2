package br.edu.ifsp.arq.dao;

import java.util.ArrayList;
import br.edu.ifsp.arq.model.Receita;

public class ReceitaDAO implements GenericDAO<Receita> {
	private static ReceitaDAO instance;
	private static ArrayList<Receita> receitas;
	private static int idCount = 0;
	
	private ReceitaDAO() {
		this.receitas = new ArrayList<Receita>();
	}
	
	public static ReceitaDAO getInstance_R() {
		if(instance == null) {
			instance = new ReceitaDAO();
		}
		
		return instance;
	}
	
	
	public boolean add(Receita r) {
		r.setId(idCount++);
		return receitas.add(r);
	}
	
	public boolean deletar(int id) {
		for(int i = 0; i < receitas.size(); i++ ) {
			if(receitas.get(i).getId() == id) {
				receitas.remove(i);
				return true;
			}
		}
		return false;
	}

	public boolean editar(int id, Receita obj) {
		for(int i = 0; i < receitas.size(); i++ ) {
			if(receitas.get(i).getId() == id) {
				obj.setId(id); 
				receitas.set(i, obj);
				return true;
			}
		}
		return false;
	}
	
	public ArrayList<Receita> mostrarTodos(){
		return receitas;
	}
	
	public Receita buscarPorID(int id) {
		for (Receita r : receitas) {
			if (r.getId() == id) {
				return r;
			}
		}
		return null;
	}	

}
