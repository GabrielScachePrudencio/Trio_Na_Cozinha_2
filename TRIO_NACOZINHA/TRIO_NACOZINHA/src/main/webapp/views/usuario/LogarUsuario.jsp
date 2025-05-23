<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	<h1>LOGIN</h1>
	<form action="<%= request.getContextPath() %>/UsuarioServletLogar" method="POST">
	
        <label for="nome">Nome de usuario:</label>
        <input type="text" id="nome" name="nome" required><br><br>

        <label for="senha">Senha</label>
        <input type="text" id="senha" name="senha" required><br><br>  
		
		
        <button type="submit">Logar</button>
    </form>
</body>
</html>

