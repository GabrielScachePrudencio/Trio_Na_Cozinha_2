
<!--
	
Deixar varias receitas prontas desde o inicio


Arrunmar a pagina inicial colocar certo o index e pagina inicial

HTML E CSS IGUAL DO CANVA
ser tudo responsivel

e o video

 -->

<%@page import="br.edu.ifsp.arq.model.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="header.jsp" />

<nav class="menu">
  <h1><a href="#">Trio_Na_Cozinha</a></h1>
  <div class="menu-actions">
	<form action="${pageContext.request.contextPath}/ReceitaServletDetalhada" method="POST">

      <input type="search" name="busca" placeholder="Pesquisar">
      <input type="submit" value="Pesquisar">
    </form>
	
	<%
	
    	HttpSession sessao = request.getSession();
	    Usuario usuarioLogado = (Usuario) sessao.getAttribute("usuarioLogado");

	    System.out.println("HEADER usuarioLogado (session): " + usuarioLogado);
	%>
	

	<c:choose>
	
      <c:when test="${not empty sessionScope.usuarioLogado}">
        
        
        <a href="views/receita/AddReceita.jsp">ADD Receita</a>
       
        
        <p>${sessionScope.usuarioLogado.nome}</p>
        <a href="views/usuario/Conta.jsp">Conta</a>
      </c:when>

      <c:otherwise>
      	<a href="views/extras/SobreNos.jsp"> Sobre nos </a>
      	<a href="views/receita/AddReceita.jsp" onclick="verificarLogin(${sessionScope.usuarioLogado})">ADD Receita</a>
      	<p id="mensagem" style="color:red;"></p>
        <a href="views/usuario/AddUsuario.jsp">Cadastra-se</a>
        <a href="views/usuario/LogarUsuario.jsp">Logar</a>
        
      </c:otherwise>
    </c:choose>
	
  </div>
</nav>



<%
	ArrayList<Receita> receitas = (ArrayList<Receita>) request.getAttribute("receitas");
	ArrayList<Usuario> usuarios = (ArrayList<Usuario>) request.getAttribute("usuarios");
	

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

</body>
</html>
