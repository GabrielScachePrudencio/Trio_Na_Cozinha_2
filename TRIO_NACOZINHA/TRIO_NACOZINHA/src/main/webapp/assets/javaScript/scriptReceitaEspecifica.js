function getIdFromUrl() {
  const params = new URLSearchParams(window.location.search);
  return params.get('id');
}

async function carregarReceita() {
  const id = getIdFromUrl();
  if (!id) {
    alert('ID da receita não encontrado na URL');
    return;
  }

  try {
    const response = await fetch(`http://localhost:8080/TRIO_NACOZINHA/ReceitaServletDetalhada?id=${id}`);
    if (!response.ok) throw new Error('Erro na requisição');

    const receita = await response.json();

    document.getElementById('nomeReceita').textContent = receita.nome;
    document.getElementById('autorReceita').textContent = receita.autor;

    // Categorias
    const categoriasDiv = document.getElementById('categoriasReceita');
    categoriasDiv.innerHTML = '';
    receita.categorias.forEach(cat => {
      const span = document.createElement('span');
      span.textContent = cat;
      span.classList.add('border', 'px-2', 'py-1', 'small', 'rounded', 'categoriaIndividual', 'hover-effect', 'me-2');
      categoriasDiv.appendChild(span);
    });

    // Imagem
    const img = document.getElementById('imgReceita');
	img.src = `/TRIO_NACOZINHA/assets/imagens/${receita.img}`;
    img.alt = `Imagem da receita ${receita.nome}`;

    document.getElementById('tempoReceita').textContent = receita.tempoDePreparoMinutos;
    document.getElementById('porcoesReceita').textContent = receita.qtddPorcoes;

    // Ingredientes
    const ingredientesUL = document.getElementById('ingredientesReceita');
    ingredientesUL.innerHTML = '';
    receita.ingredientes.forEach((ing, i) => {
      const li = document.createElement('li');
      li.classList.add('form-check', 'd-flex', 'align-items-center', 'ms-3', 'mb-1');

      const checkbox = document.createElement('input');
      checkbox.type = 'checkbox';
      checkbox.classList.add('form-check-input', 'me-2');
      checkbox.id = `ingrediente${i}`;

      const label = document.createElement('label');
      label.classList.add('form-check-label', 'w-100', 'py-1', 'px-2', 'rounded');
      label.htmlFor = `ingrediente${i}`;
      label.textContent = ing;

      li.appendChild(checkbox);
      li.appendChild(label);
      ingredientesUL.appendChild(li);
    });

    document.getElementById('modoPreparoReceita').textContent = receita.modoPreparo;

  } catch (error) {
    alert('Erro ao carregar receita: ' + error.message);
  }
}

window.onload = carregarReceita;
