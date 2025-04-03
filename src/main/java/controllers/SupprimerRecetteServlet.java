package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Recette;
import models.Utilisateur;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

import dao.RecetteDAOImpl;


public class SupprimerRecetteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private RecetteDAOImpl recetteDao;

	public SupprimerRecetteServlet() {
		super();
	}


	@Override
	public void init() {
		recetteDao = new RecetteDAOImpl();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    try {
	        // Vérifier si l'utilisateur est connecté
	        Utilisateur user = (Utilisateur) request.getSession().getAttribute("user");
	        if (user == null) {
	            response.sendRedirect("/pizzaRecipe/LoginServlet");
	            return;
	        }

	        // Récupérer l'ID de la recette depuis les paramètres de la requête
	        UUID id = UUID.fromString(request.getParameter("id"));

	        // Récupérer la recette correspondante depuis le DAO
	        Recette recette = recetteDao.getRecetteParId(id); // Méthode à implémenter dans le DAO
	        if (recette == null) {
	            request.setAttribute("message", "Recette introuvable.");
	            request.getRequestDispatcher("/WEB-INF/menu.jsp").forward(request, response);
	            return;
	        }

	        // Vérifier si l'utilisateur est un administrateur
	        boolean isAdmin = "admin12345".equals(user.getPassword());

	        // Supprimer la recette
	        if (isAdmin || recette.getUtilisateurId().equals(user.getId())) {
	            boolean isDeleted = recetteDao.supprimerRecette(id);

	            // Préparer un message de retour
	            if (isDeleted) {
	                if (isAdmin) {
	                    request.setAttribute("message", "Recette supprimée avec succès par l'administrateur.");
	                } else {
	                    request.setAttribute("message", "Votre recette a été supprimée avec succès !");
	                }
	            } else {
	                request.setAttribute("message", "Échec de la suppression de la recette.");
	            }
	        } else {
	            // Si l'utilisateur n'est ni admin ni propriétaire
	            request.setAttribute("message", "Vous n'êtes pas autorisé à supprimer cette recette.");
	        }

	        // Recharger la liste des recettes
	        List<Recette> recettes = isAdmin 
	                                ? recetteDao.getToutesLesRecettes() 
	                                : recetteDao.getRecettesParUtilisateur(user.getId());
	        request.setAttribute("recettes", recettes);

	        // Rediriger vers la page appropriée
	        String dashboardPage = isAdmin ? "/WEB-INF/admin.jsp" : "/WEB-INF/user.jsp";
	        request.getRequestDispatcher(dashboardPage).forward(request, response);

	    } catch (IllegalArgumentException e) {
	        // Gestion des erreurs si l'ID est invalide
	        request.setAttribute("message", "L'ID fourni est invalide.");
	        request.getRequestDispatcher("/WEB-INF/menu.jsp").forward(request, response);
	    } catch (Exception e) {
	        // Gestion des exceptions générales
	        e.printStackTrace();
	        request.setAttribute("message", "Une erreur inattendue est survenue.");
	        request.getRequestDispatcher("/WEB-INF/menu.jsp").forward(request, response);
	    }
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
