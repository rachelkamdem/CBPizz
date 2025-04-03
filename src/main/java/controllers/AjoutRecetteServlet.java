package controllers;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import models.Recette;
import models.Utilisateur;
import dao.RecetteDAOImpl;
import dao.UtilisateurDAOImpl;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import org.mindrot.jbcrypt.BCrypt;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)
public class AjoutRecetteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String ADMIN_PASSWORD = "admin12345";
    //private static final String ADMIN_HASHED_PASSWORD = BCrypt.hashpw(ADMIN_PASSWORD, BCrypt.gensalt());
    private static final String ADMIN_HASHED_PASSWORD = "$2a$10$ZREXHbAZiHmUnGk6iZD73Onj4FXmPMYydYsuNIh0W7PiObbnGvLYm";


    private RecetteDAOImpl recetteDao = new RecetteDAOImpl();
    private UtilisateurDAOImpl utilisateurDao = new UtilisateurDAOImpl();

    public AjoutRecetteServlet() {
        super();
    }

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        recetteDao.loadRecettes();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Afficher la page d'ajout de recette
        request.getRequestDispatcher("/WEB-INF/ajoutRecette.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Récupérer les paramètres du formulaire
            String nom = request.getParameter("nom");
            String description = request.getParameter("description");
            Part filePart = request.getPart("image");

            // Vérification de la session pour s'assurer que l'utilisateur est connecté
            Utilisateur utilisateur = (Utilisateur) request.getSession().getAttribute("user");
            if (utilisateur == null) {
                request.setAttribute("messageError", "Vous devez être connecté pour ajouter une recette.");
                response.sendRedirect(request.getContextPath() + "/LoginServlet");
                return;
            }

            // Créer le chemin pour enregistrer l'image dans le répertoire 'uploads'
            String uploadDirPath = getServletContext().getRealPath("/uploads");
            String uploadDirPathReal = "/pizzaRecipe/images";
            File uploadDir = new File(uploadDirPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();  // Créer le répertoire si nécessaire
            }

            // Gérer le fichier image
            String fileName = UUID.randomUUID().toString() + "_" + Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String imagePath = uploadDirPath + File.separator + fileName;
            filePart.write(imagePath); // Sauvegarder l'image sur le serveur

            // Récupérer les ingrédients et les étapes de préparation
            String[] ingredientsArray = request.getParameter("ingredients").split(",");
            String[] etapesArray = request.getParameter("etapesPreparation").split(";");

            // Créer la recette avec les données récupérées et l'ID de l'utilisateur
            Recette nouvelleRecette = new Recette(nom, description, "/uploads/" + fileName, List.of(ingredientsArray), List.of(etapesArray), utilisateur.getId());

            // Ajouter la recette au DAO
            recetteDao.ajouterRecette(nouvelleRecette, utilisateurDao);
            // Redirection après ajout réussi
            request.setAttribute("messageSuccess", "Recette ajoutée avec succès !");
         // Vérification si c'est un administrateur
            if (BCrypt.checkpw(utilisateur.getPassword(), ADMIN_HASHED_PASSWORD)) {   
                response.sendRedirect("/pizzaRecipe/AdminServlet");  // Redirection vers la page admin
            } else {
                response.sendRedirect("/pizzaRecipe/UserServlet");  // Redirection vers la page utilisateur
            }
        
           // response.sendRedirect(request.getContextPath() + "/RecetteServlet");

        } catch (Exception e) {
            // Gestion des erreurs lors de l'ajout de la recette
            e.printStackTrace();
            request.setAttribute("messageError", "Erreur lors de l'ajout de la recette : " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/ajoutRecette.jsp").forward(request, response);
        }
    }
}
