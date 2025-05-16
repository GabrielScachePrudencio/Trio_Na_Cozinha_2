<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Erro</title>
</head>
<body>
	<h1>Voce nao deveria estar aqui</h1>
	<br>
	<p><%= request.getAttribute("msgErro") %></p>
	<br>
	
	<a href="<%= request.getContextPath() %>/ServletRenovaPrincipal">Voltar a pagina principal</a>
</body>
</html>