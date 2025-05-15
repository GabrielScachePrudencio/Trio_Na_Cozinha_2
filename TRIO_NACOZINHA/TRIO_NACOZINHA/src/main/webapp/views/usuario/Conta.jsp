<%@page import="br.edu.ifsp.arq.model.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%
	    	HttpSession sessao = request.getSession();
		    Usuario usuarioLogado = (Usuario) sessao.getAttribute("usuarioLogado");
		    Boolean isADMAttr = (Boolean) sessao.getAttribute("isADM");

		%>
<title>Conta <%= usuarioLogado.getNome() %></title>
</head>
<body>
		
		
		<div class="conta">		
			<img src="<%= request.getContextPath() %>/imagens/<%= usuarioLogado.getImg() %>" width="200">
			<h1>Nome: <%= usuarioLogado.getNome() %></h1>
			<h1>Senha: <%= usuarioLogado.getSenha() %></h1>
			<h1>tipo: <%= usuarioLogado.getTipoUsu() %></h1>
			<br>
		
			<h1>Suas Receitas:</h1>
		
			<br>
			<c:forEach var="receita" items="${usuarioLogado.minhasReceitas}">
	   			<div class="receita-card" style="border: 1px solid black">
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
			        
			        <a href="<%= request.getContextPath() %>/ReceitaServletEditar?id=${  receita.id }">Editar Receita</a>
			        <br>
			        <a href="<%= request.getContextPath() %>/ReceitaServletDeletar?id=${  receita.id }">Deletar Receita</a>
		   			<br>
		   			
		    	</div>
			</c:forEach>
			
			<a href="<%= request.getContextPath() %>/UsuarioServletEditar?id=<%= usuarioLogado.getId() %>">Editar Usuario</a>
			<br>
		
			<c:if test="${ sessionScope.isADM }">
			     	<a href="<%= request.getContextPath() %>/UsuarioServletTodosUsuarios?id=<%= usuarioLogado.getId() %>">Mostrar todos os usuarios criados</a>
					<br>
					<a href="<%= request.getContextPath() %>/ReceitaServletTodosReceitas?id=<%= usuarioLogado.getId() %>">Mostrar todos as receitas criadas</a>
						 
			</c:if>
			<br>
		
			<a href="<%= request.getContextPath() %>/UsuarioServletDeconectar?id=<%= usuarioLogado.getId() %>">Desconectar da conta </a>
			<br>
			<a href="<%= request.getContextPath() %>/UsuarioServletDeletar?id=<%= usuarioLogado.getId() %>">Deletar conta (tem q tirar isso daqui) </a>
		
			<br>
			<a href="<%= request.getContextPath() %>/ServletRenovaPrincipal">Voltar a pagina principal</a>
			
		</div>
</body>
</html>