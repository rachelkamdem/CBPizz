<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CBPIZZ - Ajouter -recette</title>
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

.formulaire-recette {
	max-width: 700px;
	margin: 40px auto;
	background: #fff8e6;
	padding: 30px 40px;
	border-radius: 18px;
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
	font-family: 'Segoe UI', sans-serif;
}

.formulaire-recette h2 {
	font-size: 1.8rem;
	margin-bottom: 25px;
	color: #b22222;
	text-align: center;
}

.formulaire-recette label {
	display: block;
	margin-bottom: 15px;
	font-weight: 600;
	color: #333;
}

.formulaire-recette input[type="text"], .formulaire-recette input[type="number"],
	.formulaire-recette textarea {
	width: 100%;
	padding: 10px;
	font-size: 1rem;
	border: 1px solid #ccc;
	border-radius: 8px;
	box-sizing: border-box;
	margin-top: 5px;
	background-color: #fff;
}

.formulaire-recette textarea {
	resize: vertical;
	min-height: 80px;
}

.formulaire-recette button {
	margin-top: 25px;
	padding: 12px 20px;
	font-size: 1rem;
	background-color: #f39c12;
	border: none;
	border-radius: 25px;
	color: white;
	font-weight: bold;
	cursor: pointer;
	transition: background 0.3s ease;
}

.formulaire-recette button:hover {
	background-color: #2a012e;
}



@
keyframes fadeIn {from { opacity:0;
	
}

to {
	opacity: 1;
}

}
.message-success {
    background-color: #d4edda;
    color: #155724;
    border: 1px solid #c3e6cb;
    border-radius: 5px;
    padding: 15px;
    position: relative;
    margin: 15px 0;
    font-family: Arial, sans-serif;
    font-size: 16px;
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
}

.message-success .close-btn {
    position: absolute;
    top: 10px;
    right: 10px;
    background: transparent;
    border: none;
    font-size: 18px;
    color: #155724;
    cursor: pointer;
    outline: none;
}

.message-error {
    background-color: #f8d7da;
    color: #721c24;
    border: 1px solid #f5c6cb;
    border-radius: 5px;
    padding: 15px;
    position: relative;
    margin: 15px 0;
    font-family: Arial, sans-serif;
    font-size: 16px;
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
}

.message-error .close-btn {
    position: absolute;
    top: 10px;
    right: 10px;
    background: transparent;
    border: none;
    font-size: 18px;
    color: #721c24;
    cursor: pointer;
    outline: none;
}


/* Responsive */
@media ( max-width : 600px) {
	.formulaire-recette {
		padding: 20px;
	}
	.formulaire-recette h2 {
		font-size: 1.5rem;
	}
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

		<nav class="menu"></nav>
	</header>
	<section class="formulaire-recette">
		<h2>➕ Ajouter une nouvelle recette</h2>

		<form action="AjoutRecetteServlet" method="post"
			enctype="multipart/form-data">
			<label> Nom de la recette : <input type="text" name="nom"
				value="${recette.nom}" required />
			</label> <label> Description : <textarea name="description" required>${recette.description}</textarea>
			</label> <label> Image : <input type="file" name="image"
				accept="image/*" required />
			</label> <label> Ingrédients (séparés par une virgule) : <input
				type="text" name="ingredients"
				value="<c:forEach var='ing' items='${recette.ingredients}'>${ing},</c:forEach>"
				required />
			</label> <label> Étapes de préparation (séparées par un
				point-virgule) : <textarea name="etapesPreparation" required>
            <c:forEach var="etape" items="${recette.etapesPreparation}">${etape};</c:forEach>
        </textarea>
			</label>

			<button type="submit">Ajouter la recette</button>
			<c:choose>
				<c:when test="${sessionScope.role == 'admin'}">
					<a href="/pizzaRecipe/AdminServlet" class="btn btn-dark">Retour</a>
				</c:when>
				<c:otherwise>
					<a href="/pizzaRecipe/UserServlet" class="btn btn-dark">Retour</a>
				</c:otherwise>
			</c:choose>
		</form>
		<!-- Message succes -->
		<c:if test="${not empty sessionScope.messageSuccess}">
		    <div class="alert alert-success alert-dismissible fade show" role="alert">
		        <strong>Succès !</strong> ${sessionScope.messageSuccess}
		        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		    </div>
		    <c:remove var="messageSuccess" scope="session" />
		</c:if>
		<!-- Message d'erreur -->
		<c:if test="${not empty sessionScope.messageError}">
		    <div class="alert alert-danger alert-dismissible fade show" role="alert">
		        <strong>Erreur :</strong> ${sessionScope.messageError}
		        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		    </div>
		    <c:remove var="messageError" scope="session" />
		</c:if>
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
	
    // Disparition automatique après un délai
    setTimeout(() => {
        const messageDiv = document.querySelector('.message-error');
        if (messageDiv) {
            messageDiv.style.transition = "opacity 0.5s ease-out";
            messageDiv.style.opacity = "0";
            setTimeout(() => messageDiv.style.display = "none", 500); // Cache complètement après l'animation
        }
    }, 5000); // Le message disparaît après 5 secondes

 // Ajoute un délai pour faire disparaître le message automatiquement
    setTimeout(() => {
        const messageDiv = document.querySelector('.message-success');
        if (messageDiv) {
            messageDiv.style.transition = "opacity 0.5s ease-out";
            messageDiv.style.opacity = "0";
            setTimeout(() => messageDiv.style.display = "none", 500); // Cache complètement après l'animation
        }
    }, 5000); // Le message disparaît après 5 secondes
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