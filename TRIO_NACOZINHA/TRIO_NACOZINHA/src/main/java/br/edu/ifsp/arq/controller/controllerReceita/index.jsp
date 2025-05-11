<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="header.jsp"></c:import>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CRUD LIVRO</title>
</head>
<body>
	<h1>Home cadastre um livro</h1>
	
	<form action="LivroServlet" method="POST">
		<label for="nome">Titulo do livro</label>
		<input type="text" name="titulo">
		<br>
		<label for="autor">Autor do livro</label>
		<input type="text" name="autor">
		<br>
		<input type="checkbox" name="genero" value="Ficcao">
		<label for="Ficcao"> Ficcao</label>
		<input type="checkbox" name="genero" value="NaoFiccao">
		<label for="NaoFiccao">Nao ficcao </label>
		<input type="checkbox" name="genero" value="Fantasia">
		<label for="Fantasia">Fantasia</label>
		<input type="checkbox" name="genero" value="Romance">
		<label for="Romance">Romance</label>
		
		<br>
		<label for="nome">Data de lançamento do livro</label>
		<input type="date" name="data">
		<br>
		
		<input type="submit" value="Cadastrar"> 
	</form>
</body>
</html>




<c:import url="footer.jsp"></c:import>