<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title>Erro - Trio Na Cozinha</title>

<!-- Favicon -->
<link rel="icon" href="${ctx}/imagens/logo/iconsite.png" type="image/png">

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    body {
        background-color: #f8f9fa;
        font-family: 'Montserrat', sans-serif;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .error-container {
        background: white;
        padding: 2rem 3rem;
        border-radius: 0.5rem;
        box-shadow: 0 0 15px rgba(0,0,0,0.1);
        max-width: 400px;
        text-align: center;
    }
    .error-container h1 {
        color: #dc3545;
        margin-bottom: 1rem;
    }
</style>

</head>
<body>

<div class="error-container">
    <h1><i class="fa-solid fa-triangle-exclamation"></i> Acesso Negado</h1>
    <p class="lead"><%= request.getAttribute("msgErro") != null ? request.getAttribute("msgErro") : "Você não deveria estar aqui." %></p>
    <a href="<%= request.getContextPath() %>/ServletRenovaPrincipal" class="btn btn-warning mt-3">
        <i class="fa-solid fa-arrow-left"></i> Voltar para a página principal
    </a>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />

</body>
</html>
