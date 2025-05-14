<%@page import="br.edu.ifsp.arq.model.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<%
	    	HttpSession sessao = request.getSession();
		    Usuario usuarioLogado = (Usuario) sessao.getAttribute("usuarioLogado");
		    Boolean isADMAttr = (Boolean) sessao.getAttribute("isADM");

		%>
		
		<div class="conta">		
			<img src="<%= request.getContextPath() %>/imagens/<%= usuarioLogado.getImg() %>" width="200">
			<h1>Nome: <%= usuarioLogado.getNome() %></h1>
			<h1>Senha: <%= usuarioLogado.getSenha() %></h1>
			<h1>tipo: <%= usuarioLogado.getTipoUsu() %></h1>
			<br>
		
			<a href="<%= request.getContextPath() %>/UsuarioServletEditar?id=<%= usuarioLogado.getId() %>">Editar</a>
			<br>
		
			<c:if test="${ sessionScope.isADM }">
			     	<a href="<%= request.getContextPath() %>/UsuarioServletTodosUsuarios?id=<%= usuarioLogado.getId() %>">Mostrar todos os usuarios criados</a>
					<br>
					<a href="<%= request.getContextPath() %>/ReceitaServletTodosReceitas?id=<%= usuarioLogado.getId() %>">Mostrar todos as receitas criadas</a>
						 
			</c:if>
			<br>
		
			<a href="<%= request.getContextPath() %>/UsuarioServletDeconectar?id=<%= usuarioLogado.getId() %>">Sair da conta</a>
			<br>
			<a href="<%= request.getContextPath() %>/UsuarioServletDeletar">Deletar conta (tem q tirar isso daqui)</a>
			<br>
			<a href="<%= request.getContextPath() %>/index.jsp">Voltar</a>
			
		
		
		</div>
</body>
</html>