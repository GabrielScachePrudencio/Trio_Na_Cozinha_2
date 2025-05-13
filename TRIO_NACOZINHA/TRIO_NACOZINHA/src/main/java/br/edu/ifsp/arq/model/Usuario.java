package br.edu.ifsp.arq.model;

public class Usuario {
	private int id;
	private String nome;
	private String senha;
	private String tipoUsu;
	private String img;
	
	
	public Usuario(int id, String nome, String senha, String tipoUsu, String msg) {
		setId(id);
		setNome(nome);
		setSenha(senha);
		setTipoUsu(tipoUsu);
		setImg(img);
	}
	public Usuario(int id, String nome, String senha, String tipoUsu) {
		setId(id);
		setNome(nome);
		setSenha(senha);
		setTipoUsu(tipoUsu);
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
	public String getTipoUsu() {
		return tipoUsu;
	}
	public void setTipoUsu(String tipoUsu) {
		this.tipoUsu = tipoUsu;
	}
	
	
	
	public String getImg() {
		return img;
	}


	public void setImg(String img) {
		this.img = img;
	}


	@Override
	public String toString() {
	    return "Usuário {" +
	           "\n  ID: " + id +
	           "\n  Nome: " + nome +
	           "\n  Senha: " + senha +
	           "\n  Tipo de Usuário: " + tipoUsu +
	           "\n}";
	}

	
}
