package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import models.Recette;
import models.Utilisateur;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

import dao.RecetteDAOImpl;

public class ModifierRecetteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    String uploadPath = "C:/uploads/";

    private RecetteDAOImpl recetteDao;

    @Override
    public void init() {
        recetteDao = new RecetteDAOImpl(); 
    }

    public ModifierRecetteServlet() {
        super();
    }

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Vérifier si l'utilisateur est connecté
        Utilisateur user = (Utilisateur) request.getSession().getAttribute("user");
        if (user == null) {
            response.sendRedirect("/pizzaRecipe/LoginServlet");
            return;
        }

        // Récupérer l'ID de la recette
        UUID id = UUID.fromString(request.getParameter("id"));
        Recette recette = recetteDao.getRecetteParId(id);

        // Si la recette n'existe pas, rediriger
        if (recette == null) {
            request.setAttribute("message", "La recette demandée est introuvable.");
            response.sendRedirect("/pizzaRecipe/MenuServlet");
            return;
        }

        // Vérifier les permissions
        boolean isAdmin = "admin12345".equals(user.getPassword());
        if (!isAdmin && !recette.getUtilisateurId().equals(user.getId())) {
            request.setAttribute("message", "Vous n'êtes pas autorisé à modifier cette recette.");
            String dashboardPage = isAdmin ? "/WEB-INF/admin.jsp" : "/WEB-INF/user.jsp";
	        request.getRequestDispatcher(dashboardPage).forward(request, response);
            //response.sendRedirect("/pizzaRecipe/MenuServlet");
            return;
        }

        // Afficher la recette pour modification
        request.setAttribute("recette", recette);
        request.getRequestDispatcher("/WEB-INF/editRecette.jsp").forward(request, response);
    }

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Vérifier si l'utilisateur est connecté
        Utilisateur user = (Utilisateur) request.getSession().getAttribute("user");
        if (user == null) {
            response.sendRedirect("/pizzaRecipe/LoginServlet");
            return;
        }

        // Récupérer l'ID de la recette
        UUID id = UUID.fromString(request.getParameter("id"));
        Recette recetteExistante = recetteDao.getRecetteParId(id);

        // Si la recette n'existe pas, rediriger
        if (recetteExistante == null) {
            request.setAttribute("message", "La recette demandée est introuvable.");
            response.sendRedirect("/pizzaRecipe/MenuServlet");
            return;
        }

        // Vérifier les permissions
        boolean isAdmin = "admin12345".equals(user.getPassword());
        if (!isAdmin && !recetteExistante.getUtilisateurId().equals(user.getId())) {
            request.setAttribute("message", "Vous n'êtes pas autorisé à modifier cette recette.");
            String dashboardPage = isAdmin ? "/WEB-INF/admin.jsp" : "/WEB-INF/user.jsp";
	        request.getRequestDispatcher(dashboardPage).forward(request, response);
            //response.sendRedirect("/pizzaRecipe/MenuServlet");
            return;
        }

        // Récupérer les nouvelles valeurs du formulaire
        String nom = request.getParameter("nom");
        String description = request.getParameter("description");
        
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs(); 
            System.out.println("Dossier 'uploads' créé : " + uploadPath);
        }
        
        Part filePart = request.getPart("image");
        String fileName = UUID.randomUUID().toString() + "_" + filePart.getSubmittedFileName(); 
        if (filePart == null || filePart.getSize() == 0) {
            request.setAttribute("message", "Aucune image sélectionnée.");
        } else {
            try {
                filePart.write(uploadPath + File.separator + fileName);
                System.out.println("Image sauvegardée sous : " + uploadPath + File.separator + fileName);
            } catch (IOException e) {
                e.printStackTrace();
                request.setAttribute("message", "Erreur lors de la sauvegarde de l'image.");
            }
        }
        
        String imagePath = "uploads/" + fileName; 
        
        

        // Récupération des ingrédients
        String[] ingredientsArray = request.getParameterValues("ingredients");
        List<String> ingredients = (ingredientsArray != null) ? Arrays.asList(ingredientsArray) : new ArrayList<>();

        // Récupération des étapes de préparation
        String[] etapesArray = request.getParameterValues("etapesPreparation");
        List<String> etapesPreparation = (etapesArray != null) ? Arrays.asList(etapesArray) : new ArrayList<>();

        // Mise à jour de la recette
        recetteExistante.setNom(nom);
        recetteExistante.setDescription(description);
        recetteExistante.setImage(imagePath);
        recetteExistante.setIngredients(ingredients);
        recetteExistante.setEtapesPreparation(etapesPreparation);

        // Enregistrer les modifications
        recetteDao.mettreAJourRecette(recetteExistante);

        // Rediriger avec message de succès
        request.setAttribute("message", "La recette a été modifiée avec succès !");
        String dashboardPage = isAdmin ? "/pizzaRecipe/AdminServlet" : "/pizzaRecipe/UserServlet";
        response.sendRedirect(dashboardPage);
       // request.getRequestDispatcher(dashboardPage).forward(request, response);
        //response.sendRedirect("/pizzaRecipe/UserServlet");
    }
}
