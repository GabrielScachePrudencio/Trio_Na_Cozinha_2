<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Adicionar Receita</title>
</head>
<body>
    <h1>Adicionar Nova Receita</h1>

    <form action="ReceitaServletAdd" method="POST" enctype='multipart/form-data'>  <!-- enctype='multipart/form-data' -->
        <label for="nome">Nome da Receita:</label>
        <input type="text" id="nome" name="nome" required><br><br>

        <label for="autor">Autor:</label>
        <input type="text" id="autor" name="autor" required><br><br>

        <label for="modoPreparo">Modo de Preparo:</label><br>
        <textarea id="modoPreparo" name="modoPreparo" rows="4" cols="50" required></textarea><br><br>

        <label for="tempoDePreparoMinutos">Tempo de Preparo (em minutos):</label>
        <input type="number" id="tempoDePreparoMinutos" name="tempoDePreparoMinutos" required><br><br>

        <label for="qtddPorcoes">Quantidade de Porções:</label>
        <input type="number" id="qtddPorcoes" name="qtddPorcoes" required><br><br>

        <label for="ingredientes">Ingredientes:</label><br>
        <input type="checkbox" name="ingredientes" value="Açúcar"> Açúcar<br>
        <input type="checkbox" name="ingredientes" value="Farinha"> Farinha<br>
        <input type="checkbox" name="ingredientes" value="Leite"> Leite<br>
        <input type="checkbox" name="ingredientes" value="Ovo"> Ovo<br>
        <input type="checkbox" name="ingredientes" value="Chocolate"> Chocolate<br>
        <input type="checkbox" name="ingredientes" value="Fermento"> Fermento<br>
        <input type="checkbox" name="ingredientes" value="Essencia de baunilha"> Essencia de baunilha<br>
        <input type="checkbox" name="ingredientes" value="Agua"> Agua<br>
        <input type="checkbox" name="ingredientes" value="Guarana"> Guarana<br>
        <input type="checkbox" name="ingredientes" value="Coco"> Coco<br><br>

        <label for="categorias">Categorias:</label><br>
        <input type="checkbox" name="categorias" value="Bolos"> Bolos<br>
        <input type="checkbox" name="categorias" value="Biscoitos"> Biscoitos<br>
        <input type="checkbox" name="categorias" value="Naturais"> Naturais<br><br>

		<label for="img">Imagem:  </label>
		<input type="file" name="img" accept="image/*" required><br><br>
		
	
        <button type="submit">Adicionar Receita</button>
    </form>

</body>
</html>
