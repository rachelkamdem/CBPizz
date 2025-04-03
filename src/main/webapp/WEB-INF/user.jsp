<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>Tableau de bord utilisateur</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Quicksand:wght@400;700&display=swap')
	;

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Quicksand', sans-serif;
	scroll-behavior: smooth;
}

body {
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
	<div class="container mt-3">
		<!-- Vérification de l'utilisateur -->
		<c:if test="${user == null}">
			<script>
                window.location.href = "/pizzaRecipe/LoginServlet";
            </script>
		</c:if>

		<h1 class="text-center">Bienvenue, ${user.prenom} !</h1>

		<!-- Gestion des Recettes -->
		<div class="tab-content mt-3">
			<div class="tab-pane fade show active" id="recettes">
				<h3 class="mb-3">Vos Recettes</h3>

				<div class="d-flex justify-content-between mb-3">
					<input type="text" placeholder="Rechercher une recette..."
						class="form-control w-50"> <a
						href="/pizzaRecipe/AjoutRecetteServlet" class="btn btn-success">➕Ajouter
						une recette</a>
				</div>
				<table class="table table-bordered table-hover">
					<thead class="table-dark">
						<tr>
							<th>ID</th>
							<th>Image</th>
							<th>Nom</th>
							<th>Description</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="recette" items="${userRecettes}">
							<tr>
								<td>${recette.id}</td>
								<td><img
									src="${pageContext.request.contextPath}/${recette.image}"
									alt="Image de ${recette.nom}" class="img-thumbnail" width="80">
								</td>
								<td>${recette.nom}</td>
								<td>${recette.description}</td>
								<td><a
									href="/pizzaRecipe/ModifierRecetteServlet?id=${recette.id}"
									class="btn btn-warning btn-sm">Modifier</a>
									<button class="btn btn-info btn-sm" data-bs-toggle="modal"
										data-bs-target="#detailsRecette${recette.id}">Détails</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<!-- Modals pour afficher les détails de chaque recette -->
			<c:forEach var="recette" items="${userRecettes}">
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
								<img src="${pageContext.request.contextPath}/${recette.image}"
									class="img-fluid mb-3" alt="Image de ${recette.nom}">
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


	<script>
		let currentIndex = 0;
		const slides = document.querySelectorAll('.carousel .slide');

		function showNextSlide() {
			slides[currentIndex].classList.remove('active');
			currentIndex = (currentIndex + 1) % slides.length;
			slides[currentIndex].classList.add('active');
		}
		setInterval(showNextSlide, 3000);
		$(document).ready(function () {
		    $(window).on('scroll', function () {
		        $('.fade-in').each(function () {
		            if ($(this).offset().top < $(window).scrollTop() + $(window).height() - 100) {
		                $(this).addClass('show');
		            }
		        });
		    });
		});
	</script>
</body>
</html>


