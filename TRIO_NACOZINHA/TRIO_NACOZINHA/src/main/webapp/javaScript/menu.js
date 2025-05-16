function verificarLogin(logado) {
	alert(logado);
	if (!logado || logado === "false") {
	    event.preventDefault(); // Impede o link de abrir
	    const msg = document.getElementById("mensagem");
	    if (msg) {
	      msg.innerText = "⚠️ Você precisa estar logado para adicionar uma receita.";
	    } else {
	      alert("Você precisa estar logado para adicionar uma receita.");
	    }
	  }
}

function irParaReceitaMaisDetalhada(id){
	window.location.href = "ReceitaServletDetalhada?id=" + id;
	
}