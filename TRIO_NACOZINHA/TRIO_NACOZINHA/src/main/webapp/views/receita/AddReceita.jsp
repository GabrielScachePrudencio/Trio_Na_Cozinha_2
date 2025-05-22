<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="br.edu.ifsp.arq.model.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Adicionar Receita</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: #f5f6fa;
            font-family: 'Poppins', sans-serif;
        }
        .form-container {
            background-color: #f2ce91;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0px 5px 30px rgba(0,0,0,0.1);
            color: white;
            max-width: 700px;
            margin: 50px auto;
        }
        .form-container h2 {
            font-weight: bold;
            text-align: center;
            margin-bottom: 30px;
        }
        .form-container label {
            font-weight: bold;
            margin-top: 15px;
        }
        .form-container input,
        .form-container textarea {
            background-color: transparent;
            border: none;
            border-bottom: 2px solid white;
            border-radius: 0;
            color: white;
        }
        .form-container input:focus,
        .form-container textarea:focus {
            box-shadow: none;
            border-color: white;
            outline: none;
        }
        .form-container .btn {
            margin-top: 30px;
            background-color: transparent;
            color: white;
            font-weight: bold;
            border: none;
        }
        .form-container .btn:hover {
            color: #f2ce91;
            background-color: white;
        }
    </style>
</head>

<body>

<%
    HttpSession sessao = request.getSession();
    Usuario usuarioLogado = (Usuario) sessao.getAttribute("usuarioLogado");
%>

<div class="form-container">
    <h2>Adicionar nova Receita</h2>
    <form action="<%= request.getContextPath() %>/ReceitaServletAdd" method="POST" enctype="multipart/form-data">

        <label for="nome">Nome:</label>
        <input type="text" class="form-control" id="nome" name="nome" required>

        <label for="autor">Autor:</label>
        <input type="text" class="form-control" id="autor" value="<%= usuarioLogado.getNome() %>" readonly>

        <label for="tempoDePreparoMinutos">Tempo de preparo (min):</label>
        <input type="number" class="form-control" id="tempoDePreparoMinutos" name="tempoDePreparoMinutos" required>

		<label for="qtddPorcoes">Quantidade de Porções:</label>
		<input type="number" class="form-control" id="qtddPorcoes" name="qtddPorcoes" required>

        <div class="mt-4">
            <label class="form-label">Ingredientes:</label>
            <div class="row row-cols-2 row-cols-md-3 g-1">
                <%
                    String[] ingredientes = {"Açúcar", "Farinha", "Leite", "Ovo", "Chocolate", "Fermento", "Essência de baunilha", "Água", "Guaraná", "Coco", "avelã",
                    		 "manteiga"};
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

        <div class="mt-4">
            <label class="form-label">Categorias:</label>
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
            <div class="form-check">
                <input class="form-check-input" type="checkbox" name="categorias" value="Doces" id="catDoces">
                <label class="form-check-label" for="catDoces">Doces</label>
            </div>
        </div>

        <div class="mt-4">
            <label for="img" class="form-label">Imagem:</label>
            <input class="form-control" type="file" name="img" id="img" accept="image/*" required>
        </div>

        <label for="modoPreparo" class="mt-4">Modo de preparo:</label>
        <textarea class="form-control" id="modoPreparo" name="modoPreparo" rows="3" required></textarea>
        
		
        <div class="text-center">
            <button type="submit" class="btn">Adicionar</button>
        </div>
    </form>
</div>

</body>
</html>
