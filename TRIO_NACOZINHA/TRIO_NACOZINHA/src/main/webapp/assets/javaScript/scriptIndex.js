
const contextPath = "http://localhost:8080/TRIO_NACOZINHA";

carregarTodas();
verificarLogin();

function verificarLogin(){
	fetch("http://localhost:8080/TRIO_NACOZINHA/UsuarioServletLogar")
	.then(resp => {
		if(!resp.ok) throw new Error("Usuario nao logado");
		return resp.json();
	})
	.then(usuario => {
		console.log("usuario Logado nome:" + usuario.nome + " senha: "+ usuario.senha);
	})
	.catch(err => {
	    console.warn("Usuário não autenticado!");
	  });
}

function carregarTodas() {
	fetch("http://localhost:8080/TRIO_NACOZINHA/ReceitaServletMostrarTodas")
	.then(response => response.json())
	.then(data => {
		let containerPai = document.querySelector("#containerTodasReceitas");
		containerPai.innerHTML = "";
		console.log("Quantidade de receitas:", data.length);
		console.log(data);
		
		for (let d of data) {
		    try {
		        let card = document.createElement("div");
		        card.classList.add("card", "card-bege");

		        card.onclick = () => irParaReceitaMaisDetalhada5(d.id);
		        card.style.cursor = "pointer";

		        card.innerHTML = `
		            <img src="assets/imagens/${d.img}" class="card-img-top" alt="${d.nome}">
		            <div class="card-body">
		                <h5 class="card-title">${d.nome}</h5>
		                <p><strong>Autor:</strong> ${d.autor}</p>
		                <p><strong>Tempo:</strong> ${d.tempoDePreparoMinutos} min</p>
		                <p><strong>Porções:</strong> ${d.qtddPorcoes}</p>
		                <p><strong>Modo de Preparo:</strong> ${d.modoPreparo || ""}</p>
		                <p><strong>Categorias:</strong> ${d.categorias ? d.categorias.join(", ") : ""}</p>
		                <p><strong>Ingredientes:</strong></p>
		                <ul>${d.ingredientes ? d.ingredientes.map(ing => `<li>${ing}</li>`).join("") : ""}</ul>
		            </div>
		        `;
					
		        containerPai.appendChild(card);
		    } catch (error) {
		        console.error("Erro ao criar card da receita", d, error);
		    }
		}

	});
}

ARRUMAR O SISTEMA DE MENU EM TODAS OS HTML Q 
acho q o certo e fazer uma função q quando a pagina carrega ela cria tudo 
de acordo se o usuario estiver logado ou nao

function irParaReceitaMaisDetalhada5(id) {
  window.location.href = "/TRIO_NACOZINHA/assets/views/receita/ReceitaEspecifica.html?id=" + id;
}




