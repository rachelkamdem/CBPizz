package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Recette;
import models.Utilisateur;

import java.io.IOException;
import java.util.UUID;

import dao.RecetteDAOImpl;
import dao.UtilisateurDAOImpl;


public class DetailRecipeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private RecetteDAOImpl recetteDAO = new RecetteDAOImpl();
	private UtilisateurDAOImpl userDAO = new UtilisateurDAOImpl(); 
    
    public DetailRecipeServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  String id  = request.getParameter("id");

	        if (id == null || id.isEmpty()) {
	            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID de recette manquant !");
	            return;
	        }

	        Recette recette = recetteDAO.getRecetteParId(UUID.fromString(id)); 

	        if (recette == null) {
	            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Recette introuvable !");
	            return;
	        }

	       
	        Utilisateur auteur = userDAO.findUtilisateurById(recette.getUtilisateurId());
	        
	        request.setAttribute("recette", recette);
	        request.setAttribute("auteur", auteur);
	        request.getRequestDispatcher("/WEB-INF/recetteDetail.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
