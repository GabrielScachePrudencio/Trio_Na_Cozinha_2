<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Sobre Nós - Trio Na Cozinha</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome (ícones) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Montserrat', sans-serif;
            background-color: #f8f9fa;
        }
        .card img {
            border-radius: 50%;
            object-fit: cover;
            height: 200px;
            width: 200px;
            margin: auto;
        }
        .navbar {
            background-color: #ffc107;
        }
        .navbar-brand {
            font-weight: bold;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light">
    <div class="container">
        <a class="navbar-brand" href="<%= request.getContextPath() %>/ServletRenovaPrincipal">
            Trio Na Cozinha
        </a>
        <div class="text-center mt-5">
        <a href="<%= request.getContextPath() %>/ServletRenovaPrincipal" class="btn btn-warning">
            <i class="fa-solid fa-arrow-left"></i> Voltar para a página principal
        </a>
    </div>
    </div>
</nav>

<!-- Conteúdo Sobre Nós -->
<div class="container my-5">
    <h2 class="text-center mb-4">Sobre Nós</h2>
    <p class="text-center mb-5">
        Somos o <strong>Trio Na Cozinha</strong>, apaixonados por gastronomia e tecnologia.
        Formado por três amigos que decidiram unir suas habilidades pra criar um site simples, mas cheio de sabor!
    </p>

    <div class="row g-4">
        <!-- Gabriel -->
        <div class="col-md-4">
            <div class="card text-center p-3">
                <img src="img/gsp.jpeg" alt="Gabriel Scache">
                <div class="card-body">
                    <h5 class="card-title">Gabriel Scache Prudencio</h5>
                    <p>Desenvolvedor, organizador e fã de pratos bem feitos.</p>
                    <p><i class="fa-solid fa-envelope"></i> bielscache@gmail.com</p>
                    <p>
                        <a href="https://www.instagram.com/gabrielscache/" target="_blank">
                            <i class="fa-brands fa-instagram"></i> @gabrielscache
                        </a>
                        <br>
                        <a href="https://github.com/GabrielScachePrudencio" target="_blank">
                            <i class="fa-brands fa-github"></i> GabrielScachePrudencio
                        </a>
                    </p>
                </div>
            </div>
        </div>

        <!-- Jonas -->
        <div class="col-md-4">
            <div class="card text-center p-3">
                <img src="img/jonas.jpeg" alt="Jonas Gonçalves">
                <div class="card-body">
                    <h5 class="card-title">Jonas Gonçalves</h5>
                    <p>Desenvolvedor, criativo e responsável por deixar tudo com um toque especial.</p>
                    <p><i class="fa-solid fa-envelope"></i> jonas@email.com</p>
                    <p>
                        <a href="https://www.instagram.com/jonasperfil/" target="_blank">
                            <i class="fa-brands fa-instagram"></i> @jonasperfil
                        </a>
                        <br>
                        <a href="https://github.com/jonasperfil" target="_blank">
                            <i class="fa-brands fa-github"></i> jonasperfil
                        </a>
                    </p>
                </div>
            </div>
        </div>

        <!-- Wesley -->
        <div class="col-md-4">
            <div class="card text-center p-3">
                <img src="img/wms.jpeg" alt="Wesley Martins">
                <div class="card-body">
                    <h5 class="card-title">Wesley Martins de Souza</h5>
                    <p>Desenvolvedor, cuida dos detalhes e garante que tudo funcione direitinho.</p>
                    <p><i class="fa-solid fa-envelope"></i> wumartinss@gmail.com</p>
                    <p>
                        <a href="https://www.instagram.com/wu_m4rtin/" target="_blank">
                            <i class="fa-brands fa-instagram"></i> @wu_m4rtin
                        </a>
                        <br>
                        <a href="https://github.com/Wesley-Martinss" target="_blank">
                            <i class="fa-brands fa-github"></i> Wesley-Martinss
                        </a>
                    </p>
                </div>
            </div>
        </div>
    </div>

    <div class="text-center mt-5">
        <a href="<%= request.getContextPath() %>/ServletRenovaPrincipal" class="btn btn-warning">
            <i class="fa-solid fa-arrow-left"></i> Voltar para a página principal
        </a>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
