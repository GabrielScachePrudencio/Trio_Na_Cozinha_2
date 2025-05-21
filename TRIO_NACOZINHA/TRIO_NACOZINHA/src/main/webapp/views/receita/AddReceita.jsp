<%@page import="br.edu.ifsp.arq.model.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Adicionar Receita</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%
    HttpSession sessao = request.getSession();
    Usuario usuarioLogado = (Usuario) sessao.getAttribute("usuarioLogado");
%>

<div class="container mt-5">
    <div class="card shadow">
        <div class="card-header bg-marrom text-bege ">
            <h3 class="mb-0 tituloaddreceita">Adicionar Nova Receita - <%= usuarioLogado.getNome() %></h3>
        </div>
        <div class="card-body">
            <form action="<%= request.getContextPath() %>/ReceitaServletAdd" method="POST" enctype="multipart/form-data">
                <div class="mb-3">
                    <label for="nome" class="form-label">Nome da Receita</label>
                    <input type="text" class="form-control" id="nome" name="nome" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Autor</label>
                    <input type="text" class="form-control" value="<%= usuarioLogado.getNome() %>" readonly>
                </div>

                <div class="mb-3">
                    <label for="modoPreparo" class="form-label">Modo de Preparo</label>
                    <textarea class="form-control" id="modoPreparo" name="modoPreparo" rows="4" required></textarea>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="tempoDePreparoMinutos" class="form-label">Tempo de Preparo (min)</label>
                        <input type="number" class="form-control" id="tempoDePreparoMinutos" name="tempoDePreparoMinutos" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="qtddPorcoes" class="form-label">Quantidade de Porções</label>
                        <input type="number" class="form-control" id="qtddPorcoes" name="qtddPorcoes" required>
                    </div>
                </div>

                <div class="mb-3">
                    <label class="form-label">Ingredientes</label>
                    <div class="row row-cols-2 row-cols-md-3 g-1">
                        <%
                            String[] ingredientes = {"Açúcar", "Farinha", "Leite", "Ovo", "Chocolate", "Fermento", "Essencia de baunilha", "Agua", "Guarana", "Coco"};
                            for (String ing : ingredientes) {
                        %>
                            <div class="form-check col">
                                <input class="form-check-input" type="checkbox" name="ingredientes" value="<%= ing %>" id="ing<%= ing.hashCode() %>">
                                <label class="form-check-label" for="ing<%= ing.hashCode() %>"><%= ing %></label>
                            </div>
                        <%
                            }
                        %>
                    </div>
                </div>

                <div class="mb-3">
                    <label class="form-label">Categorias</label>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="categorias" value="Bolos" id="catBolos">
                        <label class="form-check-label" for="catBolos">Bolos</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="categorias" value="Biscoitos" id="catBiscoitos">
                        <label class="form-check-label" for="catBiscoitos">Biscoitos</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="categorias" value="Naturais" id="catNaturais">
                        <label class="form-check-label" for="catNaturais">Naturais</label>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="img" class="form-label">Imagem</label>
                    <input class="form-control" type="file" name="img" id="img" accept="image/*" required>
                </div>

                <div class="d-grid">
                    <button type="submit" class="btn btn-success">Adicionar Receita</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
