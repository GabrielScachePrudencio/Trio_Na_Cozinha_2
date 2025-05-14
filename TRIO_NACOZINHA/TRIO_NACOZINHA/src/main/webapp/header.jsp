<%@page import="br.edu.ifsp.arq.model.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="menu">
  <h1><a href="#">Trio_Na_Cozinha</a></h1>
  <div class="menu-actions">
    <form action="ReceitaPesquisa" method="POST">
      <input type="search" placeholder="Pesquisar">
      <input type="submit" value="Pesquisar">
    </form>
	
	<%
	
    	HttpSession sessao = request.getSession();
	    Boolean isADMAttr = (Boolean) sessao.getAttribute("isADM");
	    Usuario usuarioLogado = (Usuario) sessao.getAttribute("usuarioLogado");

	    System.out.println("HEADER isADM (session): " + isADMAttr);
	    System.out.println("HEADER usuarioLogado (session): " + usuarioLogado);
	%>
	

	<c:choose>
	
      <c:when test="${not empty sessionScope.usuarioLogado}">
        
        <c:if test="${sessionScope.isADM}">
          <a href="views/receita/AddReceita.jsp">ADD Receita</a>
        </c:if>
        
        <p>${sessionScope.usuarioLogado.nome}</p>
        <a href="views/usuario/Conta.jsp">Conta</a>
      </c:when>

      <c:otherwise>
        <a href="views/usuario/AddUsuario.jsp">Cadastra-se</a>
        <a href="views/usuario/LogarUsuario.jsp">Logar</a>
      </c:otherwise>
    </c:choose>

  </div>
</nav>


