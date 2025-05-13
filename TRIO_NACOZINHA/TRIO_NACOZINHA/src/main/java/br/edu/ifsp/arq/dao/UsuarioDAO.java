package br.edu.ifsp.arq.dao;

import java.util.ArrayList;

import br.edu.ifsp.arq.model.Receita;
import br.edu.ifsp.arq.model.Usuario;

public class UsuarioDAO {
	private static UsuarioDAO instance;
	private static ArrayList<Usuario> usuarios;
	private static int idCount = 0;
	
	private UsuarioDAO() {
		this.usuarios = new ArrayList<Usuario>();
	}
	
	public static UsuarioDAO getInstance_U() {
		if(instance == null) {
			instance = new UsuarioDAO();
		}
		
		return instance;
	}

	public boolean add(Usuario u) {
		u.setId(idCount++);
		return usuarios.add(u);
	}
	
	public boolean deletar(int id) {
		for(int i = 0; i < usuarios.size(); i++ ) {
			if(usuarios.get(i).getId() == id) {
				usuarios.remove(i);
				return true;
			}
		}
		return false;
	}

	public boolean editar(int id, Usuario obj) {
		for(int i = 0; i < usuarios.size(); i++ ) {
			if(usuarios.get(i).getId() == id) {
				obj.setId(id); 
				usuarios.set(i, obj);
				return true;
			}
		}
		return false;
	}
	
	public ArrayList<Usuario> mostrarTodos(){
		return usuarios;
	}
	
	public Usuario buscarPorID(int id) {
		for (Usuario u : usuarios) {
			if (u.getId() == id) {
				return u;
			}
		}
		return null;
	}	
	
}
