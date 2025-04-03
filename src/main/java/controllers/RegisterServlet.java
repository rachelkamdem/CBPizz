package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Utilisateur;
import java.io.IOException;

import dao.UtilisateurDAOImpl;


public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	UtilisateurDAOImpl utilisateurDAOImpl = new UtilisateurDAOImpl();
	//String realPath = getServletContext().getRealPath("/WEB-INF/data/users.json");

	/*@Override
	public void init() throws ServletException {
	    UtilisateurDAOimpl.setFilePath(realPath);
	}*/
	
	public RegisterServlet() {
		super();
	}
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	    
		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		request.setAttribute("nom", nom);

		// Validation
		if (nom.isEmpty() || prenom.isEmpty() || email.isEmpty() || password.isEmpty()) {
			request.setAttribute("message", "Tous les champs sont obligatoires !");
			request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
			return;
		}
		
		 if (password.length() < 6) {
		        request.setAttribute("message", "Le mot de passe doit contenir au moins 6 caractères !");
		        request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
		        return;
		    }

		try {
			Utilisateur utilisateur = new Utilisateur(nom, prenom, email, password, false);
			utilisateurDAOImpl.addUtilisateur(utilisateur);
			//response.sendRedirect("verify_email.jsp");
			System.out.println("ajout effectué avec succès");
			request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
		} catch (IllegalArgumentException e) {
			request.setAttribute("message", e.getMessage());
			System.out.println("ajout pas succès");
			request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
		}
	}
}

   
	