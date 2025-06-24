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
    <link rel="icon" href="${ctx}/imagens/logo/iconsite.png" type="image/png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        body {
            background: black;
            font-family: 'Montserrat', sans-serif;
        }

        .form-container {
            background-color: #ffc107;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0px 8px 25px rgba(0, 0, 0, 0.2);
            color: #212529;
            max-width: 700px;
            margin: 50px auto;
        }

        .form-container h2 {
            font-weight: bold;
            text-align: center;
            margin-bottom: 30px;
            color: #212529;
        }

        .form-container label {
            font-weight: bold;
            margin-top: 15px;
            color: #212529;
        }

        .form-control {
            background-color: transparent;
            border: 2px solid #212529;
            border-radius: 5px;
            color: #212529;
        }

        .form-control:focus {
            border-color: #212529;
            box-shadow: none;
            background-color: #fffde7;
        }

        .form-check-label {
            color: #212529;
        }

        .form-container .btn {
            margin-top: 30px;
            background-color: #212529;
            color: #ffc107;
            font-weight: bold;
            border-radius: 25px;
            padding: 10px 25px;
            transition: 0.3s;
        }

        .form-container .btn:hover {
            background-color: #ffc107;
            color: #212529;
            border: 2px solid #212529;
        }

        .ingrediente-extra {
            margin-bottom: 10px;
        }
    </style>
</head>

<body>

<%
    HttpSession sessao = request.getSession();
    Usuario usuarioLogado = (Usuario) sessao.getAttribute("usuarioLogado");
%>

<div class="text-center mt-5">
    <a href="<%= request.getContextPath() %>/ServletRenovaPrincipal" class="btn btn-warning">
        <i class="fa-solid fa-arrow-left"></i> Voltar para a página principal
    </a>
</div>

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
            <label class="form-label">Ingredientes (selecione):</label>
            <div class="row row-cols-2 row-cols-md-3 g-1">
                <%
                    String[] todosIngredientes = {"Açúcar", "Farinha", "Leite", "Ovo", "Chocolate", "Fermento", "Essência de baunilha", "Água", "Guaraná", "Coco", "Avelã", "Manteiga", "3 ovos"};
                    for (String ing : todosIngredientes) {
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
            <label class="form-label">Ingredientes adicionais:</label>
            <div id="ingredientesExtras"></div>
            <button type="button" class="btn btn-dark mt-2" onclick="adicionarIngrediente()">+ Adicionar ingrediente</button>
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

        <div class="d-flex justify-content-end">
            <button type="submit" class="btn">Adicionar</button>
        </div>
    </form>
</div>

<script>
    function adicionarIngrediente() {
        const container = document.getElementById("ingredientesExtras");

        const div = document.createElement("div");
        div.classList.add("ingrediente-extra");

        const input = document.createElement("input");
        input.type = "text";
        input.name = "ingredientes";
        input.placeholder = "Novo ingrediente";
        input.classList.add("form-control", "mt-2");

        div.appendChild(input);
        container.appendChild(div);
    }
</script>

</body>
</html>
