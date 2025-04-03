package dao;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import models.Recette;
import models.Utilisateur;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class UtilisateurDAOImpl {
	//private static final String filePath = "/WEB-INF/data/users.json";
	// private static String filePath;

	/* public static void setFilePath(String path) {
    	 filePath = path;
	}*/
	private static final String FILE_PATH = System.getProperty("catalina.base") + "/temp/users.json";
	private List<Utilisateur> utilisateurs;
	private Gson gson;

	public UtilisateurDAOImpl (){
		this.gson = new Gson();
		this.utilisateurs = loadUtilisateurs();
	}

	// Charger les utilisateurs depuis le fichier JSON
	public List<Utilisateur> loadUtilisateurs() {

		File file = new File(FILE_PATH);
		if (!file.exists()) {
			System.out.println("Le fichier JSON n'existe pas, création d'un nouveau : " + FILE_PATH);
			return new ArrayList<>();
		}

		try (Reader reader = new FileReader(FILE_PATH)) {
			return gson.fromJson(reader, new TypeToken<List<Utilisateur>>(){}.getType());
		} catch (IOException e) {
			e.printStackTrace();
			return new ArrayList<>();
		}

	}

	// Sauvegarder les utilisateurs dans le fichier JSON
	public synchronized void saveUtilisateurs() {
		try {
			File file = new File(FILE_PATH);
			if (!file.exists()) {
				file.getParentFile().mkdirs(); 
				file.createNewFile(); 
			}
			try (Writer writer = new FileWriter(FILE_PATH)) {
				gson.toJson(utilisateurs, writer);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	 // Trouver un utilisateur par ID
    public Utilisateur findUtilisateurById(UUID id) {
        return utilisateurs.stream().filter(u -> u.getId().equals(id)).findFirst().orElse(null);
    }
    
	// Trouver un utilisateur par email
	public Utilisateur findUtilisateurByEmail(String email) {
		return utilisateurs.stream().filter(u -> u.getEmail().equals(email)).findFirst().orElse(null);
	}

	// Ajouter un utilisateur
	public void addUtilisateur(Utilisateur utilisateur) {
		if (findUtilisateurByEmail(utilisateur.getEmail()) != null) {
			throw new IllegalArgumentException("Un utilisateur avec cet email existe déjà !");
		}
		utilisateurs.add(utilisateur);
		saveUtilisateurs();
	    this.utilisateurs = loadUtilisateurs();
		
	}

	// Mettre à jour un utilisateur
	public  void updateUtilisateur(Utilisateur updatedUtilisateur) {
		for (int i = 0; i < utilisateurs.size(); i++) {
			if (utilisateurs.get(i).getId().equals(updatedUtilisateur.getId())) {
				utilisateurs.set(i, updatedUtilisateur);
				break;
			}
		}
		saveUtilisateurs();
	}

	// Récupérer les recettes d’un utilisateur via RecetteDAO
    public List<Recette> getRecettesParUtilisateur(UUID utilisateurId, RecetteDAOImpl recetteDAO) {
        return recetteDAO.getRecettesParUtilisateur(utilisateurId);
    }

}
