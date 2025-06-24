package br.edu.ifsp.arq.dao;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Scanner;


import com.google.gson.Gson;

import br.edu.ifsp.arq.model.Receita;

public class ReceitaDAO implements GenericDAO<Receita> {
	private static ReceitaDAO instance;

    private static final String CAMINHO_ARQUIVO = "C:\\Users\\Flavio\\Desktop\\Java\\TerceiroSemestre\\JavaWeb\\Tarefas\\Trio_Na_Cozinha\\TRIO_NACOZINHA\\TRIO_NACOZINHA\\src\\main\\java\\br\\edu\\ifsp\\arq\\dados\\jsonReceitas.json";
    private Gson gson;
	
	private ReceitaDAO() {
        gson = new Gson();
	}
	
	public static ReceitaDAO getInstance_R() {
		if(instance == null) {
			instance = new ReceitaDAO();
		}
		
		return instance;
	}
	
	
	public boolean add(Receita r) {
		ArrayList<Receita> lista = getDadosArq();
		
		int maiorId = 0;
		for(Receita re : lista) {
			if(re.getId() > maiorId) {
				maiorId = re.getId();
			}
		}
		
		Receita novaRec = new Receita(maiorId+1, r.getNome(), r.getAutor(), r.getTempoDePreparoMinutos(), r.getIngredientes(), r.getModoPreparo(), r.getCategorias(), r.getQtddPorcoes(), r.getImg());
		lista.add(novaRec);
		
		return setDadosArq(lista);

	}
	
	public boolean deletar(int id) {
		ArrayList<Receita> receitas = getDadosArq();
              
		
		for(int i = 0; i < receitas.size(); i++ ) {
			if(receitas.get(i).getId() == id) {
				receitas.remove(i);
				setDadosArq(receitas);
				return true;
			}
		}
		
		return false;
	}


	public boolean editar(int id, Receita obj) {
		ArrayList<Receita> receitas = getDadosArq();

		
		for(int i = 0; i < receitas.size(); i++ ) {
			if(receitas.get(i).getId() == id) {
				obj.setId(id); 
				receitas.set(i, obj);
				setDadosArq(receitas);
				return true;
			}
		}
		return false;
	}
	
	
	public ArrayList<Receita> mostrarTodos(){
		return getDadosArq();
	}
	
	public Receita buscarPorID(int id) {
		ArrayList<Receita> receitas = getDadosArq();

		for (Receita r : receitas) {
			if (r.getId() == id) {
				return r;
			}
		}
		return null;
	}	

	
	//get dos dados do json
	public ArrayList<Receita> getDadosArq() {
	    File arq = new File(CAMINHO_ARQUIVO);

	    // Verifica se o arquivo existe, senão cria o caminho e o arquivo
	    if (!arq.exists()) {
	        try {
	            File pasta = arq.getParentFile();
	            if (!pasta.exists()) {
	                pasta.mkdirs(); // Garante que todas as pastas sejam criadas
	            }
	            arq.createNewFile();
	        } catch (IOException e) {
	            System.err.println("Erro ao criar o arquivo de receitas.");
	            e.printStackTrace();
	            return new ArrayList<>(); // Retorna lista vazia em caso de erro
	        }
	        return new ArrayList<>();
	    }

	    ArrayList<Receita> lista = new ArrayList<>();
	    int maiorId = 0;

	    // Leitura do arquivo com segurança
	    try (Scanner sc = new Scanner(new FileInputStream(arq), "UTF-8")) {
	        while (sc.hasNextLine()) {
	            String linha = sc.nextLine().trim();

	            // Ignora linhas vazias
	            if (!linha.isEmpty()) {
	                try {
	                    Receita t = gson.fromJson(linha, Receita.class);

	                    if (t != null) {
	                        lista.add(t);
	                        if (t.getId() > maiorId) {
	                            maiorId = t.getId();
	                        }
	                    }
	                } catch (Exception e) {
	                    System.err.println("❌ Erro ao interpretar a linha como Receita:");
	                    System.err.println("Linha com erro: " + linha);
	                    e.printStackTrace();
	                }
	            }
	        }
	    } catch (Exception e) {
	        System.err.println("❌ Erro ao ler o arquivo de receitas:");
	        e.printStackTrace();
	    }

	    // Atualiza o ID estático da classe Receita
	    Receita.atualizarProximoId(maiorId);

	    return lista;
	}

	
	//set dos dados do json
	public boolean setDadosArq(ArrayList<Receita> lista){
		//aqui apaga tudo e rescreve com a nova lista;
    	try (OutputStreamWriter writer = new OutputStreamWriter(new FileOutputStream(CAMINHO_ARQUIVO), StandardCharsets.UTF_8);
    		     BufferedWriter bw = new BufferedWriter(writer);
    		     PrintWriter pw = new PrintWriter(bw)) {

    		    for (Receita t : lista) {
    		        String json = gson.toJson(t);
    		        pw.println(json);
    		    }
    		    return true;

    		} catch (IOException e) {
    		    e.printStackTrace();
    		    return false;
    		}
	}
	
}























