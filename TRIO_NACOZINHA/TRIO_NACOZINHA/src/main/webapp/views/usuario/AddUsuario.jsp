<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Adicionar Usuarios</title>
</head>

<body>
	<h1>Novo usuario</h1>
	<form action="<%= request.getContextPath() %>/UsuarioServletAdd" method="POST" enctype='multipart/form-data'>
        <label for="nome">Nome de usuario:</label>
        <input type="text" id="nome" name="nome" required><br><br>

        <label for="autor">Senha</label>
        <input type="text" id="senha" name="senha" required><br><br>  
	
		<label for="img">Imagem:  </label>
		<input type="file" name="img" accept="image/*" required><br><br>
	
	    <button type="submit">Adicionar Usuario</button>
    </form>
	
</body>
</html>