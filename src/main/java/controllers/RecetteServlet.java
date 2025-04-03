package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Recette;

import java.io.IOException;
import java.util.List;

import dao.RecetteDAOImpl;


public class RecetteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private RecetteDAOImpl recetteDao = new RecetteDAOImpl();
       
    
    public RecetteServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Recette> recettes = recetteDao.getToutesLesRecettes();
		System.out.println("Recettes dans le DAO : " + recettes.size());
        request.setAttribute("recettes", recettes);
		request.getRequestDispatcher("/WEB-INF/recette.jsp").forward(request, response);		}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
