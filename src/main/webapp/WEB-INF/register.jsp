<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Inscription - PizzaRecipe</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-image: url('images/background-pizzaaa.jpeg');
	background-size: cover;
	background-repeat: no-repeat;
	background-attachment: fixed;
}

.register-card {
	background-color: rgba(255, 255, 255, 0.9); /* Transparence */
	border-radius: 15px;
}

.btn-custom {
	background-color: #ff4500; /* Couleur personnalisée (orange vif) */
	border: none;
}

.btn-custom:hover {
	background-color: #e63900;
}

.text-mued {
	color: white;
	font-weight: bold;
	font-size: 1.25em;
}

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
		<div class="search-container">
			<input type="text" placeholder="Rechercher une pizza..."
				class="search-bar" />
		</div>

		<nav class="menu">
			<a href="/pizzaRecipe/MenuServlet">Accueil</a> <a
				href="/pizzaRecipe/RecetteServlet">Recettes</a> <a
				href="/pizzaRecipe/LoginServlet">Connexion</a> 
		</nav>
	</header>

	<!-- Formulaire d'inscription -->
	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-md-6">
				<div class="card register-card shadow-lg p-4">
					<h3 class="card-title text-center mb-3">Créer un compte</h3>
					<c:if test="${not empty message}">
						<div class="alert alert-danger">${message}</div>
					</c:if>
					<form action="RegisterServlet" method="post"
						onsubmit="return validateForm()">
						<div class="mb-3">
							<label for="nom" class="form-label">Nom</label> <input
								type="text" class="form-control" id="nom" name="nom" required>
						</div>
						<div class="mb-3">
							<label for="prenom" class="form-label">Prénom</label> <input
								type="text" class="form-control" id="prenom" name="prenom"
								required>
						</div>
						<div class="mb-3">
							<label for="email" class="form-label">Email</label> <input
								type="email" class="form-control" id="email" name="email"
								required>
						</div>
						<div class="mb-3">
							<label for="password" class="form-label">Mot de passe</label> <input
								type="password" class="form-control" id="password"
								name="password" minlength="6" required>
						</div>
						<div class="mb-3">
							<label for="confirmPassword" class="form-label">Confirmer
								le mot de passe</label> <input type="password" class="form-control"
								id="confirmPassword" name="confirmPassword" required>
						</div>
						<div class="d-grid">
							<button type="submit" class="btn btn-custom btn-lg text-white">S'inscrire</button>
						</div>
					</form>
					<p class="text-center mt-3">
						<a href="/pizzaRecipe/LoginServlet" class="text-primary">Déjà
							un compte ? Connectez-vous</a>
					</p>
				</div>
			</div>
		</div>
	</div>

	<!-- Bouton d'action vers le menu -->
	<div class="text-center my-5">
		<a href="/pizzaRecipe/RecetteServlet" class="btn btn-warning btn-lg">Découvrez
			nos recettes</a>
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
        function validateForm() {
            let password = document.getElementById("password").value;
            let confirmPassword = document.getElementById("confirmPassword").value;
            if (password.length < 6) {
                alert("Le mot de passe doit contenir au moins 6 caractères !");
                return false;
            }
            if (password !== confirmPassword) {
                alert("Les mots de passe ne correspondent pas !");
                return false;
            }
            return true;
        }
        
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
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
