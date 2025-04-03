package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Utilisateur;
import org.mindrot.jbcrypt.BCrypt;
import dao.UtilisateurDAOImpl;

import java.io.IOException;

public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UtilisateurDAOImpl utilisateurDAOImpl = new UtilisateurDAOImpl();
    private static final String ADMIN_PASSWORD = "admin12345";
    private static final String ADMIN_HASHED_PASSWORD = BCrypt.hashpw(ADMIN_PASSWORD, BCrypt.gensalt());

    public LoginServlet() {
        super();
    }

    // Gérer la requête GET pour afficher la page de connexion
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Si l'utilisateur est déjà connecté, redirige vers la page appropriée
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("role") != null) {
            String role = (String) session.getAttribute("role");
            if ("admin".equals(role)) {
                response.sendRedirect("/pizzaRecipe/AdminServlet");
            } else {
                response.sendRedirect("/pizzaRecipe/UserServlet");
            }
            return;
        }
        request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
    }

    // Gérer la requête POST pour authentifier l'utilisateur
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Utilisateur utilisateur = utilisateurDAOImpl.findUtilisateurByEmail(email);
        if (utilisateur != null && utilisateur.checkPassword(password)) {
            // Création d'une session utilisateur
            HttpSession session = request.getSession(true); // true permet de créer une nouvelle session si elle n'existe pas
            session.setAttribute("user", utilisateur);
            session.setMaxInactiveInterval(15 * 60); // Session active pendant 15 minutes

            // Vérification si c'est un administrateur
            if (BCrypt.checkpw(password, ADMIN_HASHED_PASSWORD)) {
                session.setAttribute("role", "admin");
                response.sendRedirect("/pizzaRecipe/AdminServlet");  // Redirection vers la page admin
            } else {
                session.setAttribute("role", "user");
                response.sendRedirect("/pizzaRecipe/UserServlet");  // Redirection vers la page utilisateur
            }
        } else {
            request.setAttribute("message", "Email ou mot de passe incorrect.");
            request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
        }
    }
}
