<%@page import="br.edu.ifsp.arq.model.Receita"%>
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
Fazer a parte do icones nao aparecerem de inicio(somar e editar das receitas)

usuarios logados ou deslogados so poderao visualizar as receitas e pesquisar 

ao pesquisar sera direcionado a uma pagina chamada em especifico que tera o mesmo nome da pesquisa e mostrara-ra a pagina da receita 
ao cliclar numa em uma receita tambem sera jgoadao para esse mesmo site

usuarios Admin podem alterar e add recetas e deletar somente ele

fazer pagina para erros no nosso dominio

HTML E CSS IGUAL DO CANVA
ser tudo responsivel

 -->

<div class="container">
<%
	ArrayList<Receita> receitas = (ArrayList<Receita>) request.getAttribute("receitas");
	if (receitas != null) {
    	for (Receita r : receitas) {

	%>	
		<br>
		<img src="imagens/<%= r.getImg() %>" width="200">
		<p> <%= r.toString() %> </p>
		<a href="ReceitaServletDeletar?id=<%= r.getId() %>">Deletar</a>
		<a href="ReceitaServletEditar?id=<%= r.getId() %>">Editar</a>
	<%
    	}
	}
	%>
</div>

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
