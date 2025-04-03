package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Recette;
import models.Utilisateur;

import java.io.IOException;
import java.util.List;

import dao.RecetteDAOImpl;


public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public UserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Vérifie si l'utilisateur est connecté
        Utilisateur user = (Utilisateur) request.getSession().getAttribute("user");
        if (user == null) {
            response.sendRedirect("/pizzaRecipe/LoginServlet");
            return;
        }

        // Récupère les recettes de l'utilisateur
        RecetteDAOImpl recetteDAO = new RecetteDAOImpl();
        List<Recette> userRecettes = recetteDAO.getRecettesParUtilisateur(user.getId());

        
        request.setAttribute("userRecettes", userRecettes);
        request.setAttribute("user", user);
        request.getRequestDispatcher("/WEB-INF/user.jsp").forward(request, response);
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
