<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CBPIZZ - Recette</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
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

.recettes-section {
  background: #fffaf3;
  padding: 50px 40px;
  max-width: 1200px;
  margin: auto;
  border-radius: 20px;
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
}

.recettes-section h2 {
  font-size: 2rem;
  color: #b22222;
  margin-bottom: 15px;
}

.recettes-section p {
  font-size: 1.1rem;
  color: #555;
  margin-bottom: 30px;
  font-style: italic;
}

.recettes-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
  gap: 30px;
}

.carte-recette {
  background: #fff;
  padding: 20px;
  border-radius: 20px;
  box-shadow: 0 6px 16px rgba(0, 0, 0, 0.07);
  transition: transform 0.3s ease, box-shadow 0.3s ease;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  cursor: pointer;
}

.carte-recette:hover {
  transform: translateY(-5px);
  box-shadow: 0 10px 24px rgba(0, 0, 0, 0.12);
}

.carte-recette img {
  width: 100%;
  height: 180px;
  object-fit: cover;
  border-radius: 12px;
  margin-bottom: 15px;
}

.carte-recette h3 {
  font-size: 1.3rem;
  color: #e74c3c;
  margin-bottom: 10px;
}

.carte-recette p {
  font-size: 1rem;
  color: #444;
  flex-grow: 1;
}

.btn-plus {
  margin-top: 15px;
  display: inline-block;
  padding: 10px 18px;
  background: #ffa502;
  color: white;
  border-radius: 20px;
  font-weight: bold;
  text-align: center;
  text-decoration: none;
  transition: background 0.3s;
}

.btn-plus:hover {
  background: #2c0244;
}


/* --- ANIMATIONS --- */
@
keyframes fadeIn {from { opacity:0;
	transform: translateY(20px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
@
keyframes slideInTop {from { transform:translateY(-100%);
	
}

to {
	transform: translateY(0);
}

}
@
keyframes floatImage { 0% {
	transform: translateY(0);
}

50


%
{
transform


:


translateY
(


-10px


)
;


}
100


%
{
transform


:


translateY
(


0


)
;


}
}

/* Responsive */
@media ( max-width : 768px) {
	.contenu-propos {
		flex-direction: column;
	}
}

/

.block h3 {
	color: #4a148c;
	margin-bottom: 10px;
	font-size: 1.5rem;
}

.block p {
	font-size: 1rem;
	color: #444;
	flex-grow: 1;
}

.img-actu {
	width: 100%;
	height: 180px;
	object-fit: cover;
	border-radius: 12px;
	margin-bottom: 10px;
}




/* --- Footer --- */
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

/* --- Animations --- */
@
keyframes fadeIn {from { opacity:0;
	transform: translateY(20px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
@
keyframes slideInTop {from { transform:translateY(-100%);
	
}

to {
	transform: translateY(0);
}

}
@
keyframes floatImage { 0% {
	transform: translateY(0);
}

50


%
{
transform


:


translateY
(


-10px


)
;


}
100


%
{
transform


:


translateY
(


0


)
;


}
}

/* --- Responsive --- */
@media screen and (max-width: 768px) {
	.header {
		flex-direction: column;
		text-align: center;
	}
	.search-bar {
		width: 80%;
		margin: 10px 0;
	}
	.menu a {
		margin: 10px;
	}
	.actualites {
		flex-direction: column;
		align-items: center;
	}
	.welcome h1 {
		font-size: 2.2rem;
	}
	.about h2 {
		font-size: 1.8rem;
	}
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
			<a href="/pizzaRecipe/MenuServlet">Accueil</a> 
			<a href="/pizzaRecipe/RecetteServlet">Recettes</a> 
			<a href="/pizzaRecipe/LoginServlet">Connexion</a> 
		</nav>
	</header>
	<section class="recettes-section">
		<h2>🍕 Nos Recettes Généreuses</h2>
		<p>
			Des pizzas pour tous les goûts : <strong>fromagères 🧀</strong>, <strong>végétariennes
				🌿</strong>, <strong>épicées 🌶️</strong>... Prépare-toi à saliver ! 😋
		</p>

		<div class="recettes-grid">
			<c:forEach var="pizza" items="${recettes}">
				<div class="carte-recette">
					<img src="${pageContext.request.contextPath}/${pizza.image}" alt="${pizza.nom}" class="pizza-img" />
					<h3>${pizza.nom}</h3>
					<p>${pizza.description}</p>
					<a href="/pizzaRecipe/DetailRecipeServlet?id=${pizza.id}" class="btn-plus">👀 Voir la recette</a>
				</div>
			</c:forEach>
		</div>
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


	<script>
		let currentIndex = 0;
		const slides = document.querySelectorAll('.carousel .slide');

		function showNextSlide() {
			slides[currentIndex].classList.remove('active');
			currentIndex = (currentIndex + 1) % slides.length;
			slides[currentIndex].classList.add('active');
		}
		setInterval(showNextSlide, 3000);

		$(document)
				.ready(
						function() {
							$(window)
									.on(
											'scroll',
											function() {
												$('.fade-in')
														.each(
																function() {
																	if ($(this)
																			.offset().top < $(
																			window)
																			.scrollTop()
																			+ $(
																					window)
																					.height()
																			- 100) {
																		$(this)
																				.addClass(
																						'show');
																	}
																});
											});
						});
	</script>
</body>
</html>