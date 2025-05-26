package br.edu.ifsp.arq.model;

import java.util.ArrayList;

public class Receita {
    private int id;
    private String nome;
    private String autor;
    private long tempoDePreparoMinutos;
    private ArrayList<String> ingredientes;
    private String modoPreparo;
    private ArrayList<String> categorias;
    private long qtddPorcoes;

    private String img;

    public Receita(int id, String nome, String autor, long tempoDePreparoMinutos, ArrayList<String> ingredientes, String modoPreparo, ArrayList<String> categorias, long qtddPorcoes, String img) {
        setId(id);
        setNome(nome);
        setAutor(autor);
        setTempoDePreparoMinutos(tempoDePreparoMinutos);
        setIngredientes(ingredientes);
        setModoPreparo(modoPreparo);
        setCategorias(categorias);
        setQtddPorcoes(qtddPorcoes);
        setImg(img);
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

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public long getTempoDePreparoMinutos() {
        return tempoDePreparoMinutos;
    }

    public void setTempoDePreparoMinutos(long tempoDePreparoMinutos) {
        this.tempoDePreparoMinutos = tempoDePreparoMinutos;
    }

    public ArrayList<String> getIngredientes() {
        return ingredientes;
    }

    public void setIngredientes(ArrayList<String> ingredientes) {
        this.ingredientes = ingredientes;
    }

    public String getModoPreparo() {
        return modoPreparo;
    }

    public void setModoPreparo(String modoPreparo) {
        this.modoPreparo = modoPreparo;
    }

    public ArrayList<String> getCategorias() {
        return categorias;
    }

    public void setCategorias(ArrayList<String> categorias) {
        this.categorias = categorias;
    }

    public long getQtddPorcoes() {
        return qtddPorcoes;
    }

    public void setQtddPorcoes(long qtddPorcoes) {
        this.qtddPorcoes = qtddPorcoes;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    @Override
    public String toString() {
        return "Receita {" +
            "\n  ID: " + id +
            "\n  Nome: " + nome +
            "\n  Autor: " + autor +
            "\n  Tempo de Preparo: " + tempoDePreparoMinutos + " minutos" +
            "\n  Ingredientes: " + getIngredientes() +
            "\n  Modo de Preparo: " + modoPreparo +
            "\n  Categorias: " + getCategorias() +
            "\n  Quantidade de Porções: " + qtddPorcoes +
            "\n}";
    }
}
