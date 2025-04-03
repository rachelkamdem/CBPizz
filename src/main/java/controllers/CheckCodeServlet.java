package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Utilisateur;

import java.io.IOException;

import dao.UtilisateurDAOImpl;


public class CheckCodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UtilisateurDAOImpl utilisateurDAOImpl = new UtilisateurDAOImpl();
    
    public CheckCodeServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userCode = request.getParameter("code");
        String sessionCode = (String) request.getSession().getAttribute("verificationCode");
        String email = (String) request.getSession().getAttribute("emailToVerify");

        if (sessionCode != null && sessionCode.equals(userCode)) {
            Utilisateur utilisateur = utilisateurDAOImpl.findUtilisateurByEmail(email);
            if (utilisateur != null) {
                utilisateur.setVerified(true);
                utilisateurDAOImpl.updateUtilisateur(utilisateur);
                response.getWriter().println("Email vérifié avec succès !");
            }
        } else {
            request.setAttribute("message", "Code incorrect !");
            request.getRequestDispatcher("/WEB-INF/verify_email.jsp").forward(request, response);
        }
    }

	
	/*protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userCode = request.getParameter("code");
        String sessionCode = (String) request.getSession().getAttribute("verificationCode");
        String email = (String) request.getSession().getAttribute("emailToVerify");

        if (sessionCode != null && sessionCode.equals(userCode)) {
            request.getSession().setAttribute("emailVerified", email);
            response.getWriter().println("Email vérifié avec succès !");
            // Ici, tu peux enregistrer l'email dans la base de données
        } else {
            response.getWriter().println("Code incorrect. Veuillez réessayer.");
        }
    }*/

}
