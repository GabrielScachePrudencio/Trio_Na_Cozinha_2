<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .bg-marrom {
            background-color: #212529;
        }
        .text-bege {
            color: #ffc107;
        }
        .btn-bege {
            background-color: #ffc107;
            color: #212529;
            border: none;
        }
        .btn-bege:hover {
            background-color: #e0ac06;
            color: #212529;
        }
        .btn-outline-bege {
            color: #ffc107;
            border: 1px solid #ffc107;
        }
        .btn-outline-bege:hover {
            background-color: #ffc107;
            color: #212529;
        }

        .login-container {
            min-height: 90vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-box {
            background-color: #212529;
            border: 2px solid #ffc107;
            border-radius: 10px;
            padding: 40px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
            width: 100%;
            max-width: 400px;
        }

        .login-logo {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }

        .login-logo img {
            height: 40px;
        }

        .login-box label,
        .login-box p,
        .login-box a {
            color: #ffc107;
        }

        .form-control {
            background-color: #fff;
            color: #212529;
        }
    </style>
</head>
<body>

<!-- ✅ Navbar -->
<nav class="navbar navbar-expand-lg bg-marrom text-bege px-4 py-3">
    <div class="container-fluid justify-content-between">
        <a class="navbar-brand" href="#">
            <img src="../../imagens/logo/logo_pageindex.png" alt="Trio Na Cozinha" height="40">
        </a>
        <div class="d-flex align-items-center gap-3">
            <form class="d-flex" role="search" action="<%= request.getContextPath() %>/ReceitaServletDetalhada" method="POST">
                <input class="form-control me-2" type="search" name="busca" placeholder="Pesquisar">
                <button class="btn btn-bege" type="submit">Pesquisar</button>
            </form>
            <a href="<%=request.getContextPath()%>/views/extras/SobreNos.jsp" class="btn btn-outline-bege">Sobre nós</a>
        </div>
    </div>
</nav>

<!-- ✅ Conteúdo da página de login -->
<div class="container login-container">
    <div class="login-box">
        <div class="login-logo">
            <img src="../../imagens/logo/logo_pageindex.png" alt="Trio Na Cozinha" >
        </div>
        <form action="<%= request.getContextPath() %>/UsuarioServletLogar" method="POST">
            <div class="mb-3">
                <label for="nome" class="form-label">Nome de Usuário</label>
                <input type="text" class="form-control" id="nome" name="nome" required>
            </div>
            <div class="mb-3">
                <label for="senha" class="form-label">Senha</label>
                <input type="password" class="form-control" id="senha" name="senha" required>
            </div>
            <button type="submit" class="btn btn-bege w-100">Entrar</button>
            <div class="text-center mt-3">
                <a href="<%=request.getContextPath()%>/views/usuario/AddUsuario.jsp" class="btn btn-outline-bege w-100">
    Cadastrar-se
</a>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
