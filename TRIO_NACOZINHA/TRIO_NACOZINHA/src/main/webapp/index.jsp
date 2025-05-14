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

todos editares ou apagar so pode rao ser feito apartir do admin pela sua conta
Arumar editar e deletar de usuarios na conta do admin
arrumar editar de receitas na conta do admin
arrumar que quando voltar para index ele apareça sempre as receitas

ao pesquisar sera direcionado a uma pagina chamada em especifico que tera o mesmo nome da pesquisa e mostrara-ra a pagina da receita 
ao cliclar numa em uma receita tambem sera jgoadao para esse mesmo site

fazer pagina para erros no nosso dominio

Arrunmar a pagina inicial colocar certo o index e pagina inicial


HTML E CSS IGUAL DO CANVA
ser tudo responsivel


 -->
<%
	ArrayList<Receita> receitas = (ArrayList<Receita>) request.getAttribute("receitas");
	ArrayList<Usuario> usuarios = (ArrayList<Usuario>) request.getAttribute("usuarios");

%>

<div class="container">
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
</div>

<br><br>

	
<c:import url="footer.jsp" />

<script 
  src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" 
  integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" 
  crossorigin="anonymous">
</script>
<script 
  src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" 
  integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" 
  crossorigin="anonymous">
</script>

</body>
</html>
