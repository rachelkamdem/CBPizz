package models;

import java.util.List;
import java.util.ArrayList;
import java.util.UUID;

public class Recette {
	private UUID id;
	private String nom;
	private String description;
	private String image;
	private Utilisateur utilisateur;
	private List<String> ingredients;
	private List<String> etapesPreparation;
	private UUID utilisateurId;

	public Recette() {
		this.id = UUID.randomUUID();
		this.ingredients = new ArrayList<>();
		this.etapesPreparation = new ArrayList<>();
	}

	public Recette(String nom, String description, String image, List<String> ingredients, List<String> etapesPreparation, UUID utilisateurId ) {
		this.id = UUID.randomUUID();
		this.nom = nom;
		this.description = description;
		this.image = image;
		this.ingredients = new ArrayList<>(ingredients);
		this.etapesPreparation = new ArrayList<>(etapesPreparation);
		this.utilisateurId = utilisateurId;
	}

	public UUID getId() { return id; }
	public String getNom() { return nom; }
	public void setNom(String nom) { this.nom = nom; }
	
	public String getDescription() { return description; }
	public void setDescription(String description) { this.description = description; }
	
	public String getImage() { return image; }
	public void setImage(String image) { this.image = image; }
	
	public List<String> getIngredients() { return ingredients; }
	public void setIngredients(List<String> ingredients) { this.ingredients = new ArrayList<>(ingredients); }
	
	public List<String> getEtapesPreparation() { return etapesPreparation; }
	public void setEtapesPreparation(List<String> etapesPreparation) { this.etapesPreparation = new ArrayList<>(etapesPreparation); }
	
	public UUID getUtilisateurId() { return utilisateurId; }
    public void setUtilisateurId(UUID utilisateurId) { this.utilisateurId = utilisateurId; }

	public Utilisateur getUtilisateur() {
		return utilisateur;
	}

	public void setUtilisateur(Utilisateur utilisateur) {
		this.utilisateur = utilisateur;
	}
    
    

}

