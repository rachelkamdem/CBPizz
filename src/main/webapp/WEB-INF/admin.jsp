
<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>CBPIZZ - Admin</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<style>
body {
	background-color: #f8f9fa;
}

.container {
	background: white;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

h2 {
	color: #343a40;
}

.nav-tabs .nav-link {
	color: #495057;
	font-weight: bold;
}

.nav-tabs .nav-link.active {
	background-color: #007bff;
	color: white;
}

.table-hover tbody tr:hover {
	background-color: #f1f1f1;
}

.btn-sm {
	margin-right: 5px;
}

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Quicksand', sans-serif;
	scroll-behavior: smooth;
}

body {
	background-image: url('images/background-pizzaaa.jpeg');
	background-size: cover;
	background-repeat: no-repeat;
	background-attachment: fixed;
}
/* --- HEADER --- */
.header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	background: linear-gradient(90deg, #2b1055, #7597de);
	color: white;
	padding: 15px 30px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
	position: sticky;
	top: 0;
	z-index: 1000;
}

.logo {
	font-size: 38px;
	font-weight: bold;
	color: #ffe600;
	text-decoration: none;
	font-family: 'Arial', sans-serif;
}

/* --- BARRE DE RECHERCHE --- */
.search-container {
	flex: 1;
	display: flex;
	justify-content: center;
	position: relative;
	margin: 0 40px;
	max-width: 500px;
}

.search-bar {
	width: 100%;
	padding: 10px 15px;
	border-radius: 30px;
	border: none;
	font-size: 0.95rem;
	box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.2);
}

/* --- SUGGESTIONS --- */
.suggestions {
	position: absolute;
	top: 100%;
	left: 0;
	background: white;
	list-style: none;
	padding: 0;
	margin: 5px 0 0 0;
	width: 100%;
	max-height: 150px;
	overflow-y: auto;
	border: 1px solid #ccc;
	border-radius: 4px;
	z-index: 1000;
}

.suggestions li {
	padding: 8px 12px;
	cursor: pointer;
	color: black;
	font-size: 0.95rem;
}

.suggestions li:hover {
	background-color: #f0f0f0;
}

/* --- MENU --- */
.menu {
	display: flex;
	gap: 20px;
}

.menu a {
	color: white;
	text-decoration: none;
	font-weight: 600;
	position: relative;
	cursor: pointer;
}

.menu a::after {
	content: '';
	height: 2px;
	width: 0;
	background: #ffe600;
	position: absolute;
	left: 0;
	bottom: -5px;
	transition: 0.3s ease;
}

.menu a:hover::after {
	width: 100%;
}

/* --- FOOTER --- */
.footer {
	background-color: #1a1a1a;
	color: #fff;
	padding: 30px 20px;
	text-align: center;
	font-size: 1rem;
	margin-top: 50px;
}

.footer .socials {
	margin: 15px 0;
}

.footer .socials a {
	margin: 0 12px;
	display: inline-block;
}

.footer .socials img {
	width: 30px;
	height: 30px;
	transition: transform 0.3s ease;
	filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.4));
}

.footer .socials img:hover {
	transform: scale(1.2) rotate(10deg);
}

.footer .signature {
	font-size: 0.9rem;
	color: #aaa;
	margin-top: 10px;
}
</style>
</head>
<body>
	<header class="header">
		<a href="/pizzaRecipe/MenuServlet" class="logo">CBPIZZ</a>

		<nav class="menu">
		

		</nav>
	</header>
	<div class="container mt-5">
		<h2 class="text-center">Espace Administrateur</h2>
		<ul class="nav nav-tabs" id="adminTabs">
			<li class="nav-item"><a class="nav-link active"
				data-bs-toggle="tab" href="#recettes">Recettes</a></li>
			<li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
				href="#users">Utilisateurs</a></li>
			<li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
				href="#stats">Statistiques</a></li>
			<li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
				href="#avis">Avis</a></li>
		</ul>

		<div class="tab-content mt-3">
			<!-- Gestion des Recettes -->
			<div class="tab-pane fade show active" id="recettes">
				<h3>Liste des Recettes</h3>
				<div class="search-container">
					<input type="text" placeholder="Rechercher une recette..."
						class="search-bar" />
						<a href="/pizzaRecipe/AjoutRecetteServlet" class="btn btn-success">➕Ajouter une recette</a>
				</div>
				
				<table class="table table-bordered table-hover">
					<thead class="table-dark">
						<tr>
							<th>ID</th>
							<th>Image</th>
							<th>Nom</th>
							<th>Description</th>
							<th>Créé par</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="recette" items="${recettes}">
							<tr>
								<td>${recette.id}</td>
								<td><img src="${recette.image}"
									alt="Image de ${recette.nom}" class="img-thumbnail" width="80"></td>
								<td>${recette.nom}</td>
								<td>${recette.description}</td>
								<td>${recette.utilisateur.nom}
									${recette.utilisateur.prenom}</td>
								<!-- Nom de l'utilisateur -->
								<td><a href="ModifierRecetteServlet?id=${recette.id}"
									class="btn btn-warning btn-sm">Modifier</a> <a
									href="SupprimerRecetteServlet?id=${recette.id}"
									class="btn btn-danger btn-sm"
									onclick="return confirm('Êtes-vous sûr de vouloir supprimer cette recette ?');">Supprimer</a>
									<button class="btn btn-info btn-sm" data-bs-toggle="modal"
										data-bs-target="#detailsRecette${recette.id}">Détails</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<!-- Modals pour afficher les détails de chaque recette -->
			<c:forEach var="recette" items="${recettes}">
				<div class="modal fade" id="detailsRecette${recette.id}"
					tabindex="-1" aria-labelledby="modalLabel${recette.id}"
					aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="modalLabel${recette.id}">${recette.nom}</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<img src="${recette.image}" class="img-fluid mb-3"
									alt="Image de ${recette.nom}">
								<h6>Description</h6>
								<p>${recette.description}</p>
								<h6>Ingrédients</h6>
								<ul>
									<c:forEach var="ingredient" items="${recette.ingredients}">
										<li>${ingredient}</li>
									</c:forEach>
								</ul>
								<h6>Étapes de préparation</h6>
								<ol>
									<c:forEach var="etape" items="${recette.etapesPreparation}">
										<li>${etape}</li>
									</c:forEach>
								</ol>
								<h6>Créé par</h6>
								<p>${recette.utilisateur.nom}${recette.utilisateur.prenom}</p>
								<!-- Affichage du créateur -->
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Fermer</button>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>

		<!-- Gestion des Utilisateurs -->
		<div class="tab-pane fade" id="users">
			<h3>Liste des Utilisateurs</h3>
			<div class="search-container">
				<input type="text" placeholder="Rechercher une user..."
					class="search-bar" />
			</div>
			<table class="table table-bordered table-hover">
				<thead class="table-dark">
					<tr>
						<th>ID</th>
						<th>Nom</th>
						<th>Prénom</th>
						<th>Email</th>
						<th>Statut</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="user" items="${utilisateurs}">
						<tr>
							<td>${user.id}</td>
							<td>${user.nom}</td>
							<td>${user.prenom}</td>
							<td>${user.email}</td>
							<td><c:choose>
									<c:when test="${user.verified}">
										<span class="badge bg-success">✅ Vérifié</span>
									</c:when>
									<c:otherwise>
										<span class="badge bg-warning">❌ Non vérifié</span>
									</c:otherwise>
								</c:choose></td>
							<td><a href="editUser?id=${user.id}"
								class="btn btn-warning btn-sm">Modifier</a> <a
								href="deleteUser?id=${user.id}" class="btn btn-danger btn-sm">Supprimer</a>
								<button class="btn btn-info btn-sm" data-bs-toggle="modal"
									data-bs-target="#userDetails${user.id}">Détails</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<!-- Modals pour afficher les détails des utilisateurs -->
		<c:forEach var="user" items="${users}">
			<div class="modal fade" id="userDetails${user.id}" tabindex="-1"
				aria-labelledby="modalLabel${user.id}" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="modalLabel${user.id}">${user.nom}
								${user.prenom}</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<p>
								<strong>Email :</strong> ${user.email}
							</p>
							<p>
								<strong>Statut :</strong>
								<c:choose>
									<c:when test="${user.verified}">
										<span class="badge bg-success">Vérifié ✅</span>
									</c:when>
									<c:otherwise>
										<span class="badge bg-danger">Non vérifié ❌</span>
									</c:otherwise>
								</c:choose>
							</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Fermer</button>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>


		<!-- Statistiques 
				<div class="tab-pane fade" id="stats">
					<h3>Statistiques</h3>
					<p>Statistiques sur l'utilisation de l'application.</p>
					<ul class="list-group">
						<li class="list-group-item">Nombre total de recettes :
							${statistiques.totalRecettes}</li>
						<li class="list-group-item">Nombre total d'utilisateurs :
							${statistiques.totalUsers}</li>
						<li class="list-group-item">Nombre d'avis :
							${statistiques.totalAvis}</li>
					</ul>
				</div>-->

		<!-- Gestion des Avis 
				<div class="tab-pane fade" id="avis">
					<h3>Avis des utilisateurs</h3>
					<table class="table table-bordered table-hover">
						<thead class="table-dark">
							<tr>
								<th>ID</th>
								<th>Utilisateur</th>
								<th>Commentaire</th>
								<th>Note</th>
								<th>Actions</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="avis" items="${avis}">
								<tr>
									<td>${avis.id}</td>
									<td>${avis.user.nom}</td>
									<td>${avis.commentaire}</td>
									<td>${avis.note}/5</td>
									<td><a href="deleteAvis?id=${avis.id}"
										class="btn btn-danger btn-sm">Supprimer</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>-->
				<a href="/pizzaRecipe/LogoutServlet" class="btn btn-danger mt-3">Se
			déconnecter</a>
	</div>
	
	<footer class="footer">
		<p>🍕 Suivez-nous sur les réseaux pour ne rien rater des recettes
			croustillantes :</p>
		<div class="socials">
			<a href="#"><img src="images/facebookk.jpg" alt="Facebook"></a>
			<a href="#"><img src="images/instagram.jpg" alt="Instagram"></a>
			<a href="#"><img src="images/Youtube_logo.png" alt="YouTube"></a>
			<a href="#"><img src="images/tiktokk.png" alt="TikTok"></a>
		</div>
		<p class="signature">CBPIZZ © 2025 — Fait avec ❤️, fromage 🧀 et
			une pointe d’humour 😄</p>
	</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
