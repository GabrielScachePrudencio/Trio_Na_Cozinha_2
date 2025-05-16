<%@page import="br.edu.ifsp.arq.model.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <title>Trio_Na_Cozinha</title>

  <link rel="stylesheet" href="css/style.css">
  

</head>
<body>

<c:import url="header.jsp" />


<!--

Fazer o sistema dele ao editar o usuario isso se refletir em todas as receitas 



Arrunmar a pagina inicial colocar certo o index e pagina inicial

HTML E CSS IGUAL DO CANVA
ser tudo responsivel

e o video

 -->
<%
	ArrayList<Receita> receitas = (ArrayList<Receita>) request.getAttribute("receitas");
	ArrayList<Usuario> usuarios = (ArrayList<Usuario>) request.getAttribute("usuarios");
	HttpSession sessao = request.getSession();
    Usuario usuarioLogado = (Usuario) sessao.getAttribute("usuarioLogado");

%>
<div class="container">
	<c:if test="${not empty usuarioLogado}">
	<h1>Suas receitas</h1>
		<c:forEach var="receita" items="${usuarioLogado.minhasReceitas}">
		    	<div onclick="irParaReceitaMaisDetalhada(${receita.id})">
		    		
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
			        
		   			<br><br>
			    </div>
		</c:forEach>
	</c:if>
</div>

<br><br>
<div class="container">
	<h1>Todas as receitas</h1>
	<c:forEach var="receita" items="${receitas}">
		  <div onclick="irParaReceitaMaisDetalhada(${receita.id})">
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
		        
	   			<br><br>
	    </div>
	</c:forEach>
</div>

<br><br>

	
<c:import url="footer.jsp" />
<script src="javaScript/menu.js"></script>

</body>
</html>
