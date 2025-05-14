<%@page import="br.edu.ifsp.arq.model.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Todas as re	ceitas</title>
</head>
<body>

<%

	ArrayList<Receita> receitas = (ArrayList<Receita>) request.getAttribute("receitas");

%>
<div class="container">
	<h1>Receitas: </h1>

	
	<c:forEach var="receita" items="${receitas}">
    <div class="receita-card">
	        <img alt="Imagem da Receita" src="${pageContext.request.contextPath}/imagens/${receita.img}" width="200">
	        
	        <p>ID: ${receita.id}</p>
	        <p>Nome: ${receita.nome}</p>
	        <p>Autor: ${receita.autor}</p>
	        <p>Tempo de Preparo: ${receita.tempoDePreparoMinutos} minutos</p>
	        <p>Quantidade de Porções: ${receita.qtddPorcoes}</p>
	        
	        <p>Ingredientes:</p>
	        <ul>
	            <c:forEach var="ingrediente" items="${receita.ingredientes}">
	                <li>${ingrediente}</li>
	            </c:forEach>
	        </ul>
	        
	        <p>Modo de Preparo: ${receita.modoPreparo}</p>
	        
	        <p>Categorias:</p>
	        <ul>
	            <c:forEach var="categoria" items="${receita.categorias}">
	                <li>${categoria}</li>
	            </c:forEach>
	        </ul>
	        
	        <a href="<%= request.getContextPath() %>/ReceitaServletEditar?id=${  usuario.id }">Editar</a>
	        <br>
	        <a href="<%= request.getContextPath() %>/ReceitaServletDeletar?id=${  usuario.id }">Deletar</a>
   			<br><br>
	    </div>
	</c:forEach>

	<a href="<%= request.getContextPath() %>/index.jsp">Voltar</a>
</div>
</body>
</html>