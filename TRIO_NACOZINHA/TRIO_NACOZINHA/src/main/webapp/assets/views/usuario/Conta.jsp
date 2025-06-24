<%@page import="br.edu.ifsp.arq.model.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    HttpSession sessao = request.getSession();
    Usuario usuarioLogado = (Usuario) sessao.getAttribute("usuarioLogado");
    String imgUsuario = (usuarioLogado.getImg() != null && !usuarioLogado.getImg().isEmpty()) ? usuarioLogado.getImg() : "padrao-perfil.png";
%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Conta - <%= usuarioLogado.getNome() %></title>
    <link rel="icon" href="${ctx}/imagens/logo/iconsite.png" type="image/png">

<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: #f5f5f5;
        margin: 0;
        padding: 20px;
        color: #333;
    }
    .conta {
        max-width: 900px;
        background: #fff;
        margin: 30px auto;
        padding: 30px 40px;
        border-radius: 10px;
        box-shadow: 0 6px 15px rgba(0,0,0,0.1);
    }
    .conta img {
        display: block;
        margin: 0 auto 25px auto;
        width: 400px;
        height: 400px;
        object-fit: cover;
        border-radius: 50%;
        box-shadow:
            0 0 0 4px white,
            0 2px 8px rgba(0, 0, 0, 0.15);
        transition: box-shadow 0.3s ease;
    }
    .conta img:hover {
        box-shadow:
            0 0 0 4px #c13584,
            0 4px 20px rgba(193, 53, 132, 0.6);
    }
    @media (max-width: 480px) {
        .conta img {
            width: 100px;
            height: 100px;
        }
    }
    h1 {
        text-align: center;
        color: #6a4c93;
        margin-bottom: 15px;
        font-weight: 700;
    }
    h2 {
        margin-top: 40px;
        color: #444;
        border-bottom: 2px solid #6a4c93;
        padding-bottom: 5px;
    }
    .receita-card {
        background: #fafafa;
        border-radius: 8px;
        padding: 15px 20px;
        margin-bottom: 25px;
        box-shadow: 0 3px 8px rgba(0,0,0,0.08);
        cursor: pointer;
        transition: transform 0.2s ease, box-shadow 0.2s ease;
    }
    .receita-card:hover {
        transform: scale(1.02);
        box-shadow: 0 6px 20px rgba(0,0,0,0.12);
    }
    .receita-card img {
        float: left;
        margin-right: 20px;
        border-radius: 6px;
        width: 180px;
        height: 120px;
        object-fit: cover;
    }
    .receita-card p {
        margin: 5px 0;
        font-size: 0.95rem;
        color: #555;
    }
    .receita-card ul {
        list-style: disc inside;
        margin: 5px 0 10px 0;
        padding-left: 0;
    }
    .receita-card ul li {
        font-size: 0.9rem;
        color: #666;
    }
    .receita-card a {
        display: inline-block;
        margin-top: 8px;
        margin-right: 10px;
        font-size: 0.9rem;
        text-decoration: none;
        color: #6a4c93;
        font-weight: 600;
        transition: color 0.2s ease;
    }
    .receita-card a:hover {
        color: #9b76c1;
        text-decoration: underline;
    }

    .links-conta {
        margin-top: 40px;
        text-align: center;
    }
    .links-conta a {
        margin: 10px;
        color: #6a4c93;
        text-decoration: none;
        font-weight: 600;
        border: 2px solid #6a4c93;
        padding: 10px 20px;
        border-radius: 30px;
        transition: background-color 0.3s ease, color 0.3s ease;
        display: inline-block;
    }
    .links-conta a:hover {
        background-color: #6a4c93;
        color: white;
    }

    @media (max-width: 768px) {
        .receita-card img {
            float: none;
            display: block;
            margin: 0 auto 15px auto;
            width: 100%;
            height: auto;
        }

        .links-conta {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 10px;
        }

        .links-conta a {
            display: block;
            width: 100%;
            max-width: 300px;
            margin: 5px auto;
            text-align: center;
        }
    }
</style>


</head>

<body>
    <div class="conta">
        <img src="<%= request.getContextPath() %>/imagens/<%= imgUsuario %>" alt="Foto de <%= usuarioLogado.getNome() %>">

        <h1>Olá, <%= usuarioLogado.getNome() %>!</h1>

        <h2>Suas Receitas</h2>

        <c:forEach var="receita" items="${usuarioLogado.minhasReceitas}">
            <div class="receita-card" onclick="irParaReceitaMaisDetalhada2(${receita.id})" role="button" tabindex="0" onkeypress="if(event.key === 'Enter') irParaReceitaMaisDetalhada2(${receita.id})">
                <img alt="Imagem da Receita" src="${pageContext.request.contextPath}/imagens/${receita.img}">
                
                <p><strong>ID:</strong> ${receita.id}</p>
                <p><strong>Nome:</strong> ${receita.nome}</p>
                <p><strong>Autor:</strong> ${receita.autor}</p>
                <p><strong>Tempo de Preparo:</strong> ${receita.tempoDePreparoMinutos} minutos</p>
                <p><strong>Porções:</strong> ${receita.qtddPorcoes}</p>
                
                <p><strong>Ingredientes:</strong></p>
                <ul>
                    <c:forEach var="ingrediente" items="${receita.ingredientes}">
                        <li>${ingrediente}</li>
                    </c:forEach>
                </ul>
                
                <p><strong>Modo de Preparo:</strong> ${receita.modoPreparo}</p>
                
                <p><strong>Categorias:</strong></p>
                <ul>
                    <c:forEach var="categoria" items="${receita.categorias}">
                        <li>${categoria}</li>
                    </c:forEach>
                </ul>
                
                <a href="<%= request.getContextPath() %>/ReceitaServletEditar?id=${receita.id}">Editar Receita</a>
                <a href="<%= request.getContextPath() %>/ReceitaServletDeletar?id=${receita.id}">Deletar Receita</a>
            </div>
        </c:forEach>

        <div class="links-conta">
            <a href="<%= request.getContextPath() %>/UsuarioServletEditar?id=<%= usuarioLogado.getId() %>">Editar Usuário</a>
            <a href="<%= request.getContextPath() %>/UsuarioServletDeconectar?id=<%= usuarioLogado.getId() %>">Desconectar</a>
            <!-- Remova o botão Deletar conta se quiser -->
            <a href="<%= request.getContextPath() %>/UsuarioServletDeletar?id=<%= usuarioLogado.getId() %>">Deletar Conta</a>
            <a href="<%= request.getContextPath() %>/ServletRenovaPrincipal">Voltar à Página Principal</a>
        </div>
    </div>

    <script>
        const contextPath = "${pageContext.request.contextPath}";
        function irParaReceitaMaisDetalhada2(id) {
            window.location.href = contextPath + "/ReceitaServletDetalhada?id=" + id;
        }
    </script>
</body>
</html>
