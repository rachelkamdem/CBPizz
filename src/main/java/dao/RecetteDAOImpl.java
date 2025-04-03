package dao;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import java.io.*;
import java.io.IOException;
import java.util.List;
import java.util.ArrayList;
import java.util.UUID;

import models.Recette;

public class RecetteDAOImpl {

	//private static final String FILE_PATH = "E:\\UNIVERSITE DE BORDEAUX\\SEMESTRE 8\\WEB SERVICE\\ProjetWS\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\pizzaRecipe\\WEB-INF\\data\\recettes.json";
	//private static final String FILE_PATH = "C:/data/recettes.json";
	private static final String FILE_PATH = System.getProperty("catalina.base") + "/temp/recettes.json";
	private List<Recette> recettes;
    private Gson gson;

    public RecetteDAOImpl() {
        this.gson = new Gson();
        this.recettes = loadRecettes();
    }

    // Charger les recettes depuis le fichier JSON
    public List<Recette> loadRecettes() {
    	 File file = new File(FILE_PATH);
         if (!file.exists()) {
             System.out.println("Le fichier JSON n'existe pas, création d'un nouveau : " + FILE_PATH);
             return new ArrayList<>();
         }

         try (Reader reader = new FileReader(FILE_PATH)) {
             return gson.fromJson(reader, new TypeToken<List<Recette>>(){}.getType());
         } catch (IOException e) {
             e.printStackTrace();
             return new ArrayList<>();
         }
    }

    // Sauvegarder les recettes dans le fichier JSON
    public void saveRecettes() {
    	try {
            File file = new File(FILE_PATH);
            if (!file.exists()) {
                file.getParentFile().mkdirs(); 
                file.createNewFile(); 
            }
            try (Writer writer = new FileWriter(FILE_PATH)) {
                gson.toJson(recettes, writer);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

 // Ajouter une recette (vérifie d'abord si l'utilisateur existe)
    public void ajouterRecette(Recette recette, UtilisateurDAOImpl utilisateurDAO) {
        if (utilisateurDAO.findUtilisateurById(recette.getUtilisateurId()) == null) {
            throw new IllegalArgumentException("L'utilisateur associé à cette recette n'existe pas !");
        }
        recettes.add(recette);
        saveRecettes();
        this.recettes = loadRecettes();
        System.out.println("Recette ajoutée avec succès.");
    }
    /* Ajouter une recette
    public void ajouterRecette(Recette recette) {
        recettes.add(recette);
        saveRecettes();
        this.recettes = loadRecettes();
        System.out.println("ajout effectué avec succès");
    }*/

    // Récupérer une recette par ID
    public Recette getRecetteParId(UUID id) {
        return recettes.stream().filter(r -> r.getId().equals(id)).findFirst().orElse(null);
    }

    // Récupérer une recette par nom
    public Recette getRecetteParNom(String nom) {
        return recettes.stream().filter(r -> r.getNom().equalsIgnoreCase(nom)).findFirst().orElse(null);
    }
    
    // Récupérer toutes les recettes d’un utilisateur
    public List<Recette> getRecettesParUtilisateur(UUID utilisateurId) {
        List<Recette> userRecettes = new ArrayList<>();
        for (Recette r : recettes) {
            if (r.getUtilisateurId().equals(utilisateurId)) {
                userRecettes.add(r);
            }
        }
        return userRecettes;
    }

    // Récupérer toutes les recettes
    public List<Recette> getToutesLesRecettes() {
        return new ArrayList<>(recettes);
    }
    
    // Mettre à jour une recette
    public void mettreAJourRecette(Recette recette) {
        for (int i = 0; i < recettes.size(); i++) {
            if (recettes.get(i).getId().equals(recette.getId())) {
                recettes.set(i, recette);
                saveRecettes(); 
                return;
            }
        }
        throw new IllegalArgumentException("Recette non trouvée !");
    }

    
 // Supprimer une recette par ID
    public Boolean supprimerRecette(UUID id) {
        try {
            // Vérifier si une recette avec cet ID existe
            boolean exists = recettes.stream().anyMatch(r -> r.getId().equals(id));
            if (!exists) {
                System.out.println("Aucune recette trouvée avec l'ID : " + id);
                return false;
            }

            // Supprimer la recette correspondante
            boolean isRemoved = recettes.removeIf(r -> r.getId().equals(id));

            // Sauvegarder les modifications dans la base (ex. fichier JSON ou autre)
            if (isRemoved) {
                saveRecettes();
                System.out.println("Recette supprimée avec succès : " + id);
                return true;
            } else {
                System.out.println("Échec de la suppression de la recette : " + id);
                return false;
            }
        } catch (Exception e) {
            // Gestion des exceptions
            System.out.println("Erreur lors de la suppression de la recette : " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }


}




