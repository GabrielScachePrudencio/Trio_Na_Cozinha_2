<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${receitaDetalhada.nome}</title>
</head>
<body>
	<div class="receitaEspecifica">
	
		<img alt="Imagem da Receita" src="${pageContext.request.contextPath}/imagens/${receitaDetalhada.img}" width="200">
		        
		    <p>ID: ${receitaDetalhada.id}</p>
		    <p>Nome: ${receitaDetalhada.nome}</p>
		    <p>Autor: ${receitaDetalhada.autor}</p>
		    <p>Tempo de Preparo: ${receitaDetalhada.tempoDePreparoMinutos} minutos</p>
		    <p>Quantidade de Porções: ${receitaDetalhada.qtddPorcoes}</p>
		        
		    <p>Ingredientes:</p>
		    <ul>
		    	<c:forEach var="ingrediente" items="${receitaDetalhada.ingredientes}">
		         
		         	<li>${ingrediente}</li>
		        </c:forEach>
		    </ul>
		        
		    <p>Modo de Preparo: ${receitaDetalhada.modoPreparo}</p>
		        
		    <p>Categorias:</p>
		     <ul>
		         <c:forEach var="categoria" items="${receitaDetalhada.categorias}">
		             <li>${categoria}</li>
		         </c:forEach>
		    </ul>
	</div>
	
	<a href="<%= request.getContextPath() %>/ServletRenovaPrincipal">Voltar a pagina principal</a>
</body>
</html>