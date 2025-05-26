<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="br.edu.ifsp.arq.model.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:import url="header.jsp" />

<link rel="stylesheet" href="${ctx}/css/style.css">

<nav class="navbar navbar-expand-lg bg-marrom text-bege px-4 py-3">
  <div class="container-fluid justify-content-between">
    <a class="navbar-brand" href="#">
      <img src="imagens/logo/logo_pageindex.png" alt="Trio Na Cozinha" height="40">
    </a>
    <div class="d-flex align-items-center gap-3">
      <a href="views/extras/SobreNos.jsp" class="btn btn-outline-bege">Sobre nós</a>

      <c:choose>
        <c:when test="${not empty sessionScope.usuarioLogado}">
          <form class="d-flex" role="search" action="${ctx}/ReceitaServletDetalhada" method="POST">
            <input class="form-control me-2" type="search" name="busca" placeholder="Pesquisar">
            <button class="btn btn-bege" type="submit">Pesquisar</button>
          </form>
          <a href="views/receita/AddReceita.jsp" class="btn btn-bege">Adicionar Receita</a>
          <a href="views/usuario/Conta.jsp" class="btn btn-outline-bege">
          
			<img src="<%= request.getContextPath() %>/imagens/${sessionScope.usuarioLogado.img}" alt="Foto de ${ sessionScope.usuarioLogado.img}" class="imgPerfil">
          	<span class="text-bege">${sessionScope.usuarioLogado.nome}</span>
          </a>
        </c:when>
        <c:otherwise>
          <form class="d-flex" role="search" action="${ctx}/ReceitaServletDetalhada" method="POST">
            <input class="form-control me-2" type="search" name="busca" placeholder="Pesquisar">
            <button class="btn btn-bege" type="submit">Pesquisar</button>
          </form>
          <a href="views/usuario/LogarUsuario.jsp" class="btn btn-bege">Adicionar Receita</a>
          <a href="views/usuario/AddUsuario.jsp" class="btn btn-outline-bege">Cadastrar-se</a>
          <a href="views/usuario/LogarUsuario.jsp" class="btn btn-outline-bege">Logar</a>
        </c:otherwise>
      </c:choose>
    </div>
  </div>
</nav>


<div class="container my-5" style="background-color: #fff4e6; padding: 20px; border-radius: 12px;">
  <c:if test="${not empty sessionScope.usuarioLogado}">
    <h2 class="mb-4" style="color: #d35400; font-weight: 700;">Suas receitas</h2>
    <div class="row g-4 justify-content-center">
      <c:forEach var="receita" items="${sessionScope.usuarioLogado.minhasReceitas}">
        <div class="card card-bege h-100 p-3" onclick="irParaReceitaMaisDetalhada5(${receita.id})">
          <img src="${ctx}/imagens/${receita.img}" class="card-img-top" alt="Imagem da Receita">
          <div class="card-body">
            <h5 class="card-title text-center">${receita.nome}</h5>
            <p class="card-text"><strong>Autor:</strong> ${receita.autor}</p>

            <p class="mb-1"><strong>Ingredientes:</strong></p>
            <ul>
              <c:forEach var="ingrediente" items="${receita.ingredientes}">
                <li>${ingrediente}</li>
              </c:forEach>
            </ul>

            <p class="mb-1"><strong>Modo de Preparo:</strong></p>
            <p style="font-size: 0.85rem;">${receita.modoPreparo}</p>

            <p class="mb-1"><strong>Categorias:</strong></p>
            <ul>
              <c:forEach var="categoria" items="${receita.categorias}">
                <li>${categoria}</li>
              </c:forEach>
            </ul>
          </div>
        </div>
      </c:forEach>
    </div>
  </c:if>
</div>

<!-- CARROSSEL -->
<div id="carouselExample" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="imagens/logo/carrosellogo.png" class="d-block w-100" alt="Trio na Cozinha">
    </div>
    <div class="carousel-item">
      <img src="imagens/logo/PratosComida.png" class="d-block w-100" alt="Comidas">
    </div>
    <div class="carousel-item">
      <img src="imagens/logo/PratosComida3.jpg" class="d-block w-100" alt="Comida Deliciosa">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Anterior</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Próximo</span>
  </button>
</div>

<!-- TODAS AS RECEITAS -->
<div class="container my-5" style="background-color: #fff4e6; padding: 20px; border-radius: 12px;">
  <h2 class="mb-4" style="text-align: center; color: #d35400; font-weight: 700;">Todas as receitas</h2>
  <div class="row g-4 justify-content-center">
    <c:forEach var="receita" items="${requestScope.receitas}">
      <div class="card card-bege h-100 p-3" onclick="irParaReceitaMaisDetalhada5(${receita.id})">
        <img src="${ctx}/imagens/${receita.img}" class="card-img-top" alt="Imagem da Receita">
        <div class="card-body">
          <h5 class="card-title text-center">${receita.nome}</h5>
          <p class="card-text"><strong>Autor:</strong> ${receita.autor}</p>
          </ul>
        </div>
      </div>
    </c:forEach>
  </div>
</div>

<footer>
  <div class="footer-container">
    <div class="developers">
      <div class="developer"><h3>Gabriel Scache Prudencio</h3></div>
      <div class="developer"><h3>Jonas Gonçalves</h3></div>
      <div class="developer"><h3>Wesley Martins de Souza</h3></div>
    </div>
    <div class="footer-bottom">
      &copy; 2025 Trio Na Cozinha. Todos os direitos reservados.
    </div>
  </div>
</footer>

<script type="text/javascript">
  const contextPath = "${pageContext.request.contextPath}";
  function irParaReceitaMaisDetalhada5(id) {
    window.location.href = contextPath + "/ReceitaServletDetalhada?id=" + id;
  }
</script>

<style>
  body {
    background-color: #fff4e6;
    margin: 0;
    padding: 0;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  }

  .carousel-item img {
    width: 100%;
    height: 600px;
    object-fit: cover;
  }

  .carousel-control-prev-icon,
  .carousel-control-next-icon {
    background-color: #ff6600;
    border-radius: 50%;
    padding: 10px;
  }

  footer {
    background-color: #000;
    color: #fff;
    padding: 40px 20px;
  }

  .footer-container {
    max-width: 1200px;
    margin: 0 auto;
  }

  .developers {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 40px;
    margin-bottom: 30px;
  }

  .developer {
    text-align: center;
    max-width: 300px;
  }

  .footer-bottom {
    text-align: center;
    border-top: 1px solid #333;
    padding-top: 20px;
    font-size: 14px;
    color: #888;
  }

  .row.g-4.justify-content-center {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    justify-content: center;
  }

  .card.card-bege {
    width: 280px;
    height: 420px;
    border-radius: 12px;
    overflow: hidden;
    cursor: pointer;
    box-shadow: 0 4px 12px rgb(211 115 44 / 0.4);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    display: flex;
    flex-direction: column;
    background-color: #FFFFFF;
    color: black;
    border: none;
  }

  .card.card-bege:hover {
    transform: scale(1.05);
    box-shadow: 0 10px 25px rgb(211 115 44 / 0.7);
  }

  .card.card-bege img.card-img-top {
    width: 100%;
    height: 160px;
    object-fit: cover;
    border-top-left-radius: 12px;
    border-top-right-radius: 12px;
    border-bottom: 3px solid #e67e22;
  }

  .card.card-bege .card-body {
    padding: 15px;
    flex-grow: 1;
    overflow-y: auto;
  }

  .card.card-bege h5.card-title {
    font-size: 1.3rem;
    font-weight: 700;
    margin-bottom: 0.75rem;
  }

  .card.card-bege p,
  .card.card-bege ul {
    font-size: 0.9rem;
    margin-bottom: 0.5rem;
    color: #000;
  }

  .card.card-bege ul {
    padding-left: 20px;
    margin: 0;
    max-height: 80px;
    overflow-y: auto;
  }

  .card-body ul::-webkit-scrollbar {
    width: 6px;
  }

  .card-body ul::-webkit-scrollbar-thumb {
    background-color: #e67e22;
    border-radius: 10px;
  }
</style>

<%@ include file="footer.jsp" %>
