package br.edu.ifsp.arq.model;

import java.util.ArrayList;

public class Usuario {
	private int id;
	private String nome;
	private String senha;
	private String img;
	private ArrayList<Receita> minhasReceitas;
	
	public Usuario(int id, String nome, String senha, String img, ArrayList<Receita> minhasReceitas) {
		setId(id);
		setNome(nome);
		setSenha(senha);
		setImg(img);
		setMinhasReceitas(minhasReceitas);
	}
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	
	
	
	
	public String getImg() {
		return img;
	}


	public void setImg(String img) {
		this.img = img;
	}
	
	

	public ArrayList<Receita> getMinhasReceitas() {
		return minhasReceitas;
	}


	public void setMinhasReceitas(ArrayList<Receita> minhasReceitas) {
		this.minhasReceitas = minhasReceitas;
	}


	@Override
	public String toString() {
	    return "Usuário {" +
	           "\n  ID: " + id +
	           "\n  Nome: " + nome +
	           "\n  Senha: " + senha +
	           "\n}";
	}

	
}
