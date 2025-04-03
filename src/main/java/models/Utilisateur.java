package models;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import org.mindrot.jbcrypt.BCrypt;

public class Utilisateur {
    private UUID id;
    private String nom;
    private String prenom;
    private String email;
    private String password;
    private boolean verified;
    private List<Recette> recettes;

    public Utilisateur() {
        this.id = UUID.randomUUID();
        this.recettes = new ArrayList<>();
    }

    public Utilisateur(String nom, String prenom, String email, String password, boolean verified) {
        this.id = UUID.randomUUID();
        this.nom = nom;
        this.prenom = prenom;
        this.email = email;
        this.setPassword(password); 
        this.verified = verified;
        this.recettes = new ArrayList<>();
    }

    public UUID getId() { return id; }
    public String getNom() { return nom; }
    public void setNom(String nom) { this.nom = nom; }

    public String getPrenom() { return prenom; }
    public void setPrenom(String prenom) { this.prenom = prenom; }

    public String getEmail() { return email; }
    public void setEmail(String email) {
        if (!email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
            throw new IllegalArgumentException("Email invalide !");
        }
        this.email = email;
    }

    public String getPassword() { return password; }
    public void setPassword(String password) {
        if (password.length() < 6) {
            throw new IllegalArgumentException("Le mot de passe doit contenir au moins 6 caractères !");
        }
        this.password = BCrypt.hashpw(password, BCrypt.gensalt());
    }

    public boolean checkPassword(String password) {
        return BCrypt.checkpw(password, this.password);
    }

    public boolean isVerified() { return verified; }
    public void setVerified(boolean verified) { this.verified = verified; }
    
    
    
    public List<Recette> getRecettes() { return recettes; }
    
    public void addRecette(Recette recette) {
        recette.setUtilisateurId(this.id);
        this.recettes.add(recette);
    }

    public void removeRecette(UUID recetteId) {
        this.recettes.removeIf(r -> r.getId().equals(recetteId));
    }
}
