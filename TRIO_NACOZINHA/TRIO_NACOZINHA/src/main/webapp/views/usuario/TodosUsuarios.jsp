<%@page import="br.edu.ifsp.arq.model.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Todos os usuarios</title>
</head>
<body>
<div>
	<h1>Usuarios: </h1>
 	<c:forEach var="usuario" items="${usuarios}">
 			<img alt="" src="<%= request.getContextPath() %>/imagens/${usuario.img}">
			<p>ID: ${usuario.id} </p>
	        <p>Nome: ${usuario.nome}</p>
	        <p>senha: ${usuario.senha}</p>
	        <p>Tipo: ${usuario.tipoUsu}</p>
	        <br>
	        <a href="<%= request.getContextPath() %>/UsuarioServletEditar?id=${  usuario.id }">Editar</a>
	        <br>
	        <a href="<%= request.getContextPath() %>/UsuarioServletDeletar?id=${  usuario.id }">Deletar</a>
   			<br><br>
    </c:forEach>
    
    <a href="<%= request.getContextPath() %>/views/usuario/Conta.jsp">Voltar a conta</a>
</div>
</body>	
</html>