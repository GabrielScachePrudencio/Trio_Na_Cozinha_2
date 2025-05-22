<%@page import="br.edu.ifsp.arq.model.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title>${receitaDetalhada.nome}</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    .hover-effect:hover {
        background-color: black;
        color: white;
        transition: 0.3s;
    }

    a {
        border-bottom: 1px solid transparent;
        transition: border-bottom 0.3s;
    }

    a:hover {
        border-bottom: 1px solid black;
    }

    .form-check-label:hover {
        background-color: #fff5e4;
        padding: 0px 20px;
        transition: 0.5s;
    }

    @media (min-width: 992px) {
        .imagem-receita {
            margin-left: 4rem;
        }
    }
</style>
</head>

<body>

<div class="container mb-4 mt-4">
  <div class="d-flex justify-content-between align-items-center flex-wrap gap-3">
    <a href="<%= request.getContextPath() %>/ServletRenovaPrincipal" class="navbar-brand text-bege fs-3 ">
      Trio Na Cozinha
    </a>

    <!-- Container com botão e menu, lado a lado -->
	<div class="d-flex align-items-center gap-3">
	  <button
	    class="btn btn-primary"
	    type="button"
	    data-bs-toggle="collapse"
	    data-bs-target="#menuOpcoes"
	    aria-expanded="false"
	    aria-controls="menuOpcoes"
	  >
	    Opções
	  </button>
	
	  <div class="collapse" id="menuOpcoes">
	    <div class="d-flex gap-2 flex-wrap align-items-center">
	    <form class="d-flex" role="search" action="${pageContext.request.contextPath}/ReceitaServletDetalhada" method="POST">
	      <input class="form-control me-2" type="search" name="busca" placeholder="Pesquisar">
	      <button class="btn btn-bege" type="submit">Pesquisar</button>
	    </form>
	      <c:choose>
	        <c:when test="${not empty sessionScope.usuarioLogado}">
	          <a href="views/receita/AddReceita.jsp" class="btn btn-bege">Adicionar Receita</a>
	          <span class="text-bege">${sessionScope.usuarioLogado.nome}</span>
	          <a href="views/usuario/Conta.jsp" class="btn btn-outline-bege">Conta</a>
	        </c:when>
	        <c:otherwise>
	          <a href="views/extras/SobreNos.jsp" class="btn btn-outline-bege">Sobre nós</a>
	          <a href="views/receita/AddReceita.jsp" class="btn btn-bege" onclick="verificarLogin(${sessionScope.usuarioLogado})">Adicionar Receita</a>
	          <p id="mensagem" class="text-danger m-0"></p>
	          <a href="views/usuario/AddUsuario.jsp" class="btn btn-outline-bege">Cadastrar-se</a>
	          <a href="views/usuario/LogarUsuario.jsp" class="btn btn-outline-bege">Logar</a>
	        </c:otherwise>
      </c:choose>
      </div>
      </div>
    </div>
  </div>
</div>


       

<!-- Receita e imagem -->
<div class="container mb-5">
    <div class="d-flex flex-column flex-lg-row align-items-center">
        <div class="me-lg-5 mb-4 mb-lg-0 pe-lg-5">
            <h1 class="display-4"><strong>${receitaDetalhada.nome}</strong></h1>
            <p class="mb-2">Criado por ${receitaDetalhada.autor}</p>
            <div class="d-flex flex-wrap gap-2">
                <c:forEach var="categoria" items="${receitaDetalhada.categorias}">
                    <span class="border px-2 py-1 small rounded categoriaIndividual hover-effect">${categoria}</span>
                </c:forEach>
            </div>
        </div>
        <img src="${pageContext.request.contextPath}/imagens/${receitaDetalhada.img}" 
             alt="Imagem da Receita"
             class="img-fluid rounded imagem-receita ms-lg-auto" 
             style="max-width: 600px;">
    </div>
</div>

<!-- Bloco amarelo -->
<div style="background-color: #efd19f; width: 100%;">
    <div class="container py-5">
        <p><strong>Tempo de Preparo:</strong> ${receitaDetalhada.tempoDePreparoMinutos} minutos</p>
        <p><strong>Quantidade de Porções:</strong> ${receitaDetalhada.qtddPorcoes}</p>

        <!-- Ingredientes -->
        <div>
            <h5>Ingredientes:</h5>
            <div class="d-flex flex-column gap-2">
                <c:forEach var="ingrediente" varStatus="status" items="${receitaDetalhada.ingredientes}">
                    <div class="form-check d-flex align-items-center ms-3">
                        <input class="form-check-input me-2" type="checkbox" id="ingrediente${status.index}">
                        <label class="form-check-label w-100 py-1 px-2 rounded" for="ingrediente${status.index}">
                            ${ingrediente}
                        </label>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

<!-- Modo de preparo -->
<div class="container py-5">
    <h5>Modo de Preparo:</h5>
    <p>${receitaDetalhada.modoPreparo}</p>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
function verificarLogin(logado) {
	if (!logado || logado === "false") {
	    event.preventDefault();
	    alert("Você precisa estar logado para adicionar uma receita.");
	    
	  }
}
</script>
</body>
</html>
