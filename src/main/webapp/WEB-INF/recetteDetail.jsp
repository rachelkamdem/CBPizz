<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Details</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
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
	background-image: url('images/background-pizzaaa.jpeg');
	background-size: cover;
	background-repeat: no-repeat;
	background-attachment: fixed;
}

.fiche-recette {
	background: #fffaf3;
	padding: 40px;
	border-radius: 20px;
	max-width: 1000px;
	margin: 40px auto;
	box-shadow: 0 8px 30px rgba(0, 0, 0, 0.1);
	font-family: 'Segoe UI', sans-serif;
	color: #333;
	animation: fadeIn 1s ease-in-out;
}

.titre-recette {
	font-size: 2rem;
	color: #b22222;
	margin-bottom: 20px;
	display: flex;
	align-items: center;
	gap: 10px;
}

.img-principale {
	width: 100%;
	max-height: 360px;
	object-fit: cover;
	border-radius: 20px;
	margin-bottom: 20px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
}

.intro {
	font-style: italic;
	font-size: 1.1rem;
	margin-bottom: 30px;
	color: #444;
}

/* Ingrédients */
.ingredients-container {
	display: flex;
	align-items: center;
	justify-content: space-between;
	gap: 20px;
	margin: 30px 0;
	background: #fffaf3;
	padding: 25px;
	border-radius: 20px;
	box-shadow: 0 6px 18px rgba(0, 0, 0, 0.06);
}

.ingredients-text {
	flex: 1;
	min-width: 280px;
}

.ingredients-text h3 {
	font-size: 1.4rem;
	color: #c0392b;
	margin-bottom: 15px;
	display: flex;
	align-items: center;
	gap: 10px;
}

.ingredients-text ul {
	padding-left: 20px;
	font-size: 1rem;
	line-height: 1.6;
}

.img-ingredients {
	max-width: 280px;
	border-radius: 20px;
	object-fit: cover;
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
}

/* Préparation */
.section h3 {
	color: #8e44ad;
	margin-bottom: 12px;
	display: flex;
	align-items: center;
	gap: 8px;
}

.etapes {
	counter-reset: step;
	list-style: none;
	padding-left: 0;
}

.etapes li {
	counter-increment: step;
	margin-bottom: 12px;
	padding-left: 40px;
	position: relative;
	line-height: 1.6;
}

.etapes li::before {
	content: counter(step);
	position: absolute;
	left: 0;
	top: 0;
	background: #f08080;
	color: white;
	font-weight: bold;
	border-radius: 50%;
	width: 28px;
	height: 28px;
	text-align: center;
	line-height: 28px;
	font-size: 1rem;
}

/* Bonus */
.bonus {
	padding-left: 20px;
	margin-top: 10px;
	margin-bottom: 30px;
	color: #444;
	list-style-type: square;
}

.bonus li::marker {
	color: #27ae60;
}

/* Infos utiles */
.infos {
	padding-left: 20px;
	margin-top: 10px;
	list-style: none;
	color: #555;
}

/* Bouton retour */
.btn-retour {
	display: inline-block;
	margin-top: 40px;
	padding: 10px 18px;
	background-color: #f39c12;
	color: white;
	border: none;
	border-radius: 20px;
	text-decoration: none;
	font-weight: bold;
	transition: background 0.3s ease;
}

.btn-retour:hover {
	background-color: #1e044e;
}

@
keyframes fadeIn {from { opacity:0;
	transform: translateY(30px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

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

	<section class="fiche-recette">
		<div class="header-recette">
			<div class="titre-et-image">
				<div class="titre-block">
					<h2 class="titre-recette">${recette.nom}</h2>
					<p class="auteur-recette">
						<strong>Créée par :</strong> ${auteur.nom} ${auteur.prenom}
					</p>
					<!-- Ajout de l'auteur -->
					<img
						src="${pageContext.request.contextPath}/uploads/${recette.image}"
						alt="${recette.nom}" class="img-principale">
					<p class="intro">${recette.description}</p>
				</div>
			</div>
		</div>
	</section>

	<section class="fiche-recette">
		<div class="ingredients-container">
			<div class="ingredients-text">
				<h3>Ingrédients :</h3>
				<ul>
					<c:forEach var="ing" items="${recette.ingredients}">
						<li>${ing}</li>
					</c:forEach>
				</ul>
			</div>
		</div>

		<div class="section">
			<h3>Préparation</h3>
			<ol class="etapes">
				<c:forEach var="step" items="${recette.etapesPreparation}">
					<li>${step}</li>
				</c:forEach>
			</ol>
		</div>

		<a href="/pizzaRecipe/RecetteServlet" class="btn-retour">Retour
			aux recettes</a>
	</section>

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

</body>
</html>