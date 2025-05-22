<%@page import="br.edu.ifsp.arq.model.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="header.jsp" />


<!-- Estilo externo -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

<nav class="navbar navbar-expand-lg bg-marrom text-bege px-4 py-3">
  <div class="container-fluid justify-content-between">
    <a class="navbar-brand text-bege fs-3" href="#">Trio Na Cozinha</a>

    <div class="d-flex align-items-center gap-3">
      
      <!-- Botão Sobre nós aparece sempre -->
      <a href="views/extras/SobreNos.jsp" class="btn btn-outline-bege">Sobre nós</a>

      <c:choose>
        <c:when test="${not empty sessionScope.usuarioLogado}">
          <form class="d-flex" role="search" action="${pageContext.request.contextPath}/ReceitaServletDetalhada" method="POST">
            <input class="form-control me-2" type="search" name="busca" placeholder="Pesquisar">
            <button class="btn btn-bege" type="submit">Pesquisar</button>
          </form>
          <a href="views/receita/AddReceita.jsp" class="btn btn-bege">Adicionar Receita</a>
          <span class="text-bege">${sessionScope.usuarioLogado.nome}</span>
          <a href="views/usuario/Conta.jsp" class="btn btn-outline-bege">Conta</a>
        </c:when>
        <c:otherwise>
          <form class="d-flex" role="search" action="${pageContext.request.contextPath}/ReceitaServletDetalhada" method="POST">
            <input class="form-control me-2" type="search" name="busca" placeholder="Pesquisar">
            <button class="btn btn-bege" type="submit">Pesquisar</button>
          </form>
          <a href="views/receita/AddReceita.jsp" class="btn btn-bege" onclick="verificarLogin(${sessionScope.usuarioLogado})">Adicionar Receita</a>
          <p id="mensagem" class="text-danger m-0"></p>
          <a href="views/usuario/AddUsuario.jsp" class="btn btn-outline-bege">Cadastrar-se</a>
          <a href="views/usuario/LogarUsuario.jsp" class="btn btn-outline-bege">Logar</a>
        </c:otherwise>
      </c:choose>
    </div>
  </div>
</nav>



<!--  
<nav class="navbar navbar-expand-lg bg-marrom text-bege px-4 py-3">
  <div class="container-fluid justify-content-between">
    <a class="navbar-brand text-bege fs-3" href="#">Trio Na Cozinha</a>
    
    

    <div class="d-flex align-items-center gap-3">
      <c:choose>
        <c:when test="${not empty sessionScope.usuarioLogado}">
        <form class="d-flex" role="search" action="${pageContext.request.contextPath}/ReceitaServletDetalhada" method="POST">
	      <input class="form-control me-2" type="search" name="busca" placeholder="Pesquisar">
	      <button class="btn btn-bege" type="submit">Pesquisar</button>
	    </form>
          <a href="views/receita/AddReceita.jsp" class="btn btn-bege">Adicionar Receita</a>
          <span class="text-bege">${sessionScope.usuarioLogado.nome}</span>
          <a href="views/usuario/Conta.jsp" class="btn btn-outline-bege">Conta</a>
        </c:when>
        <c:otherwise>
          <form class="d-flex" role="search" action="${pageContext.request.contextPath}/ReceitaServletDetalhada" method="POST">
	      <input class="form-control me-2" type="search" name="busca" placeholder="Pesquisar">
	      <button class="btn btn-bege" type="submit">Pesquisar</button>
	    </form>
          <a href="views/extras/SobreNos.jsp" class="btn btn-outline-bege">Sobre nós</a>
          <a href="views/receita/AddReceita.jsp" class="btn btn-bege" onclick="verificarLogin(${sessionScope.usuarioLogado})">Adicionar Receita</a>
          <p id="mensagem" class="text-danger m-0"></p>
          <a href="views/usuario/AddUsuario.jsp" class="btn btn-outline-bege">Cadastrar-se</a>
          <a href="views/usuario/LogarUsuario.jsp" class="btn btn-outline-bege">Logar</a>
        </c:otherwise>
      </c:choose>
    </div>
  </div>
</nav>
-->
<%
	ArrayList<Receita> receitas = (ArrayList<Receita>) request.getAttribute("receitas");
	ArrayList<Usuario> usuarios = (ArrayList<Usuario>) request.getAttribute("usuarios");
%>

<div class="container my-5">
	<c:if test="${not empty usuarioLogado}">
		<h2 class="mb-4">Suas receitas</h2>
		<div class="row row-cols-1 row-cols-md-2 g-4">
			<c:forEach var="receita" items="${usuarioLogado.minhasReceitas}">
				<div class="col">
					<div class="card card-bege h-100 p-3" onclick="irParaReceitaMaisDetalhada(${receita.id})">
						<img src="${pageContext.request.contextPath}/imagens/${receita.img}" class="card-img-top" alt="Imagem da Receita">
						<div class="card-body">
							<h5 class="card-title">${receita.nome}</h5>
							<p class="card-text">Autor: ${receita.autor}</p>
							<p>Tempo: ${receita.tempoDePreparoMinutos} min</p>
							<p>Porções: ${receita.qtddPorcoes}</p>
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
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</c:if>
</div>

<div class="container my-5">
	<h2 class="mb-4">Todas as receitas</h2>
	<div class="row row-cols-1 row-cols-md-2 g-4">
		<c:forEach var="receita" items="${receitas}">
			<div class="col">
				<div class="card card-bege h-100 p-3" onclick="irParaReceitaMaisDetalhada(${receita.id})">
					<img src="${pageContext.request.contextPath}/imagens/${receita.img}" class="card-img-top" alt="Imagem da Receita">
					<div class="card-body">
						<h5 class="card-title">${receita.nome}</h5>
						<p class="card-text">Autor: ${receita.autor}</p>
						<p>Tempo: ${receita.tempoDePreparoMinutos} min</p>
						<p>Porções: ${receita.qtddPorcoes}</p>
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
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>

<%@ include file="footer.jsp" %>
