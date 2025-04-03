<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Modifier Recette</title>
    <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
    <script>
        function ajouterChamp(className) {
            const container = document.getElementById(className);
            const input = document.createElement("input");
            input.type = "text";
            input.name = className;
            input.className = "form-control mb-2";
            container.appendChild(input);
        }
    </script>
</head>
<body>
    <div class="container">
        <h2>Modifier la recette</h2>
        <form action="ModifierRecetteServlet" method="post">
            <input type="hidden" name="id" value="${recette.id}">
            
            <div class="mb-3">
                <label class="form-label">Nom</label>
                <input type="text" class="form-control" name="nom" value="${recette.nom}" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Description</label>
                <textarea class="form-control" name="description">${recette.description}</textarea>
            </div>

            <div class="mb-3">
                <label class="form-label">Image (URL)</label>
                <input type="text" class="form-control" name="image" value="${recette.image}">
            </div>

            <div class="mb-3">
                <label class="form-label">Ingrédients</label>
                <div id="ingredients">
                    <c:forEach var="ingredient" items="${recette.ingredients}">
                        <input type="text" class="form-control mb-2" name="ingredients" value="${ingredient}">
                    </c:forEach>
                </div>
                <button type="button" class="btn btn-success btn-sm" onclick="ajouterChamp('ingredients')">Ajouter Ingrédient</button>
            </div>

            <div class="mb-3">
                <label class="form-label">Étapes de préparation</label>
                <div id="etapesPreparation">
                    <c:forEach var="etape" items="${recette.etapesPreparation}">
                        <input type="text" class="form-control mb-2" name="etapesPreparation" value="${etape}">
                    </c:forEach>
                </div>
                <button type="button" class="btn btn-success btn-sm" onclick="ajouterChamp('etapesPreparation')">Ajouter Étape</button>
            </div>

            <button type="submit" class="btn btn-primary">Enregistrer</button>
            <a href="AdminServlet" class="btn btn-secondary">Annuler</a>
        </form>
    </div>
</body>
</html>
