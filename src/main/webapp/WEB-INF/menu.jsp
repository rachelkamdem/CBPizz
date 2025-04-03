<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CBPIZZ - Accueil</title>
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
translateY(
-10px
);
}
100
%
{
transform
:
translateY(
0
);
}
}

/* --- Bienvenue --- */
.welcome {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 40px 60px;
	background: linear-gradient(to right, #ffe6f0, #ffe2ff);
	gap: 40px;
	flex-wrap: nowrap;
}

.welcome-text {
	flex: 1;
}

.welcome-text h1 {
	font-size: 3.5rem;
	font-weight: bold;
	color: #800000;
}

.welcome-text h1 span {
	color: #ff6600;
}

.welcome-text .intro {
	font-style: italic;
	font-size: 1.2rem;
	margin-top: 30px;
	line-height: 1.6;
	color: #333;
	max-width: 600px;
	white-space: normal;
	/* pour ce paragraphe, retour à la ligne autorisé */
}

.welcome-img {
	max-width: 500px;
	width: 150%;
	border-radius: 20px;
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
	transition: transform 1s ease, filter 0.8s ease;
	animation: float 4s ease-in-out infinite;
}

/* Animation de flottement permanent */
@
keyframes float { 0% {
	transform: translateY(0);
}

50
%
{
transform
:
translateY(
-8px
);
}
100
%
{
transform
:
translateY(
0
);
}
}

/* Effet au survol de l’image */
.welcome-img:hover {
	transform: scale(1.05);
	filter: brightness(1.05) drop-shadow(0 0 10px rgba(255, 123, 0, 0.4));
}

@media screen and (max-width: 768px) {
	.welcome {
		flex-direction: column;
		text-align: center;
		padding: 60px 20px;
	}
	.welcome h1 {
		font-size: 2.4rem;
	}
	.welcome p {
		font-size: 1.1rem;
	}
	.welcome img {
		margin-top: 25px;
		max-width: 90%;
	}
}

.transition-section {
	text-align: center;
	padding: 30px 20px;
	font-style: italic;
	font-size: 1.2rem;
	color: #444;
	background: linear-gradient(to right, #ffe6e6, #e0c3fc);
	animation: fadeIn 1.5s ease-in-out;
}

/* --- À propos --- */
.section-apropos {
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 20px;
	padding: 40px 30px;
	background: linear-gradient(to right, #fce4ec, #f3e5f5);
	flex-wrap: wrap;
}

.carousel {
	position: relative;
	width: 400px;
	height: 270px;
	border-radius: 20px;
	overflow: hidden;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
}

.carousel img {
	position: absolute;
	width: 100%;
	height: 100%;
	object-fit: cover;
	opacity: 0;
	transition: opacity 1s ease-in-out;
}

.carousel img.active {
	opacity: 1;
	z-index: 1;
}

.texte-apropos {
	max-width: 500px;
	color: #444;
	font-size: 1.1rem;
	line-height: 1.6;
}

.texte-apropos h2 {
	font-size: 2.2rem;
	color: #e53935;
	margin-bottom: 20px;
}

.about-section {
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 60px 40px;
	gap: 40px;
	background: linear-gradient(to right, #fff5f5, #f0e4ff);
	border-radius: 20px;
	margin: 40px auto;
}

.carousel {
	position: relative;
	width: 400px;
	height: 300px;
	overflow: hidden;
	border-radius: 20px;
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
}

.slide {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	object-fit: cover;
	opacity: 0;
	transition: opacity 1s ease-in-out;
	border-radius: 20px;
}

.slide.active {
	opacity: 1;
	z-index: 2;
}

.about-content {
	max-width: 800px;
}

.about-content h2 {
	font-size: 2.8rem;
	color: #e74c3c;
	margin-bottom: 20px;
}

.about-content p {
	font-size: 1.2rem;
	color: #333;
	line-height: 1.6;
}

/* Animation */
@
keyframes fadeIn {from { opacity:0;
	transform: translateY(20px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}

/* Responsive */
@media ( max-width : 768px) {
	.contenu-propos {
		flex-direction: column;
	}
}

/* --- Actualités --- */
.actualites {
	display: flex;
	justify-content: center;
	flex-wrap: wrap;
	gap: 20px;
	padding: 60px 30px;
	background: linear-gradient(135deg, #e0c3fc, #8ec5fc);
	align-items: stretch;
}

.about-conent {
	
	font-weight: bold;
	color: white;
	text-align: center;
	font-size: 2.8rem;
	margin-bottom: 20px;
	margin-top: 20px;
}

.block {
	background: white;
	padding: 25px;
	border-radius: 16px;
	box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
	max-width: 420px;
	width: 100%;
	display: flex;
	flex-direction: column;
	justify-content: flex-start;
	transition: transform 0.3s ease;
}

.block:hover {
	transform: translateY(-5px);
}

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

/* --- Astuce --- */
.astuce {
	background-color: #fffdea;
	padding: 30px;
	margin: 40px;
	border-left: 6px solid #fbc02d;
	font-size: 1.05rem;
	border-radius: 10px;
	animation: fadeIn 1.2s ease;
}

.icon-astuce {
	width: 40px;
	margin-right: 10px;
	vertical-align: middle;
}

.astuce-content {
	display: flex;
	align-items: center;
	gap: 10px;
}

/* --- Citation --- */
.citation {
	background: #fff0f0;
	padding: 40px;
	text-align: center;
	font-style: italic;
	font-size: 1.3rem;
	color: #b20000;
	margin-top: 40px;
	border-top: 2px dashed #b20000;
	border-bottom: 2px dashed #b20000;
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
translateY(
-10px
);
}
100
%
{
transform
:
translateY(
0
);
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
		
		<nav class="menu">
			<a href="/pizzaRecipe/MenuServlet">Accueil</a> <a
				href="/pizzaRecipe/RecetteServlet">Recettes</a> <a
				href="/pizzaRecipe/LoginServlet">Connexion</a> 
		</nav>
	</header>
	<main>
		<!-- Section Bienvenue -->
		<section class="welcome">
			<div class="welcome-text">
				<h1>
					Bienvenue sur <span>CBPIZZ</span>
				</h1>
				<p class="intro">La pizza, c’est la vie. Et ici, c’est votre QG
					! Découvrez, partagez et savourez les meilleures recettes maison...
					sans prise de tête et avec beaucoup d’amour !</p>
			</div>
			<img src="images/miam.jpg" alt="Pizza fondante" class="welcome-img">
		</section>
		<!-- Fin de la section Bienvenue -->


		<!-- Transition sympa -->
		<div class="transition-section">
			<p>Mais avant de plonger dans les recettes... 🍕</p>
			<p>Tu veux savoir qui se cache derrière cette avalanche de pizzas
				? 👀</p>
		</div>

		<!-- Début de la section À propos -->

		<!-- Section À propos -->
		<h2 class="about-conent">À propos de nous</h2>
		<section class="about-section">
			<div class="carousel">
				<img src="images/com.jpg" class="slide active" alt="Pizza 1">
				<img src="images/coeur.jpg" class="slide" alt="Pizza 2"> <img
					src="images/etoile.jpg" class="slide" alt="Pizza 3"> <img
					src="images/ita.jpg" class="slide" alt="Pizza 4"> <img
					src="images/corge.jpg" class="slide" alt="Pizza 5">
			</div>
			<div class="about-content">
				
				<p>CBPIZZ, c’est bien plus qu’un site de recettes. C’est une
					vraie communauté de passionné·es de pizza 🍕, de fromage fondant 🧀
					et de pâte croustillante 🫓.</p>
				<p>
					Ici, on adore la pizza sous toutes ses formes :<br> ➤ ultra
					fine comme en Italie,<br> ➤ épaisse et moelleuse comme à
					Chicago 🍽️,<br> ➤ veggie 🥦, sans gluten 🚫🌾, ou même en
					cœur ❤️ ou en étoile ✨ !
				</p>
				<p>
					Que tu sois un·e pro du rouleau à pâtisserie 🧑‍🍳, un·e débutant·e
					ou juste là pour manger (on te voit 👀)...<br> ➤ Tu es chez
					toi ici.
				</p>
			</div>
		</section>

		<!-- Section Actualités -->
		<h2 class="about-conent">Actualités</h2>
		<section class="actualites">
			<div class="block">
				<img src="images/sante.jpg" alt="Pizza équilibrée" class="img-actu">
				<h3>🍃 Santé et Équilibre</h3>
				<p>Oui, la pizza peut être saine ! 🥗 Retrouvez nos astuces pour
					équilibrer plaisir et nutrition : légumes croquants, fromages
					légers, pâtes maison... et beaucoup d’amour.</p>
			</div>
			<div class="block">
				<img src="images/chocolat.jpg" alt="Pizza dessert" class="img-actu">
				<h3>🍫 Nouvelles Recettes</h3>
				<p>Une pizza au chocolat ? Bien sûr que oui ! Chaque semaine,
					découvre les créations les plus folles de notre communauté de
					pizzaiolos en herbe !</p>
			</div>
		</section>

		<!-- Astuce du jour -->
		<section class="astuce">
			<h3>🌟 Astuce du jour</h3>
			<div class="astuce-content">
				<img src="images/astuce.jpg" alt="Astuce" class="icon-astuce">
				<p>Pour une pâte ultra croustillante, ajoute une pincée de sucre
					dans ta pâte 🍯… Et surtout, n’oublie pas de danser un peu en la
					pétrissant. Ça donne meilleur goût, c’est prouvé 😄</p>
			</div>
			<small>Par personne très sérieuse sur Internet.</small>
		</section>

		<!-- Citation -->
		<section class="citation">
			<blockquote>« Dans la vie, il y a des hauts, des bas… et
				des pizzas pour te remonter le moral. » 🍕❤️</blockquote>
		</section>
	</main>

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