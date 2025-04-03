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
import dao.UtilisateurDAOImpl;


public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private RecetteDAOImpl recetteDao = new RecetteDAOImpl();
	private UtilisateurDAOImpl utilisateurDao = new UtilisateurDAOImpl();
    public AdminServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Recette> recettes = recetteDao.getToutesLesRecettes();
		List<Utilisateur> utilisateurs = utilisateurDao.loadUtilisateurs();
        request.setAttribute("utilisateurs", utilisateurs);
        request.setAttribute("recettes", recettes);

        request.getRequestDispatcher("/WEB-INF/admin.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
