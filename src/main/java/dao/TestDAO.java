package dao;

import models.Utilisateur;

public class TestDAO {

	  public static void main(String[] args) {
	        Utilisateur utilisateur = new Utilisateur("Jean", "Dupont", "jean@example.com", "password123", false);
	        Utilisateur utilisateur1 = new Utilisateur("Jeann", "Dupontt", "jean@example.comt", "password123t", false);
	        Utilisateur utilisateur2 = new Utilisateur("Jeannn", "Duponttt", "jean@example.comtt", "password123tt", false);

	        try {
	            UtilisateurDAOImpl utilisateurDAOImpl = new UtilisateurDAOImpl();
				utilisateurDAOImpl.addUtilisateur(utilisateur);
	            utilisateurDAOImpl.addUtilisateur(utilisateur2);
	            utilisateurDAOImpl.findUtilisateurByEmail("jean@example.com");
	            System.out.println("Utilisateur enregistré avec succès !");
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }

}
