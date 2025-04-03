package controllers;

import java.io.IOException;
import java.net.PasswordAuthentication;
import java.util.Properties;
import java.util.Random;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class VerifyEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public VerifyEmailServlet() {
        super();
    }

    private static final String EMAIL_SENDER = "kamdemm.rachel@gmail.com"; 
    private static final String EMAIL_PASSWORD = "rmqqsxgaiasjubju"; 

    /*protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");

        // Générer un code de vérification
        String verificationCode = generateVerificationCode();
        request.getSession().setAttribute("verificationCode", verificationCode);
        request.getSession().setAttribute("emailToVerify", email);

        // Envoyer l'email avec le code
        boolean emailSent = sendVerificationEmail(email, verificationCode);

        if (emailSent) {
            response.sendRedirect("verify_email.jsp"); 
        } else {
            response.getWriter().println("Erreur lors de l'envoi de l'email.");
        }
    }

    private String generateVerificationCode() {
        Random random = new Random();
        int code = 100000 + random.nextInt(900000); // Code à 6 chiffres
        return String.valueOf(code);
    }

    private boolean sendVerificationEmail(String recipientEmail, String code) {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props, new jakarta.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(EMAIL_SENDER, EMAIL_PASSWORD);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(EMAIL_SENDER));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            message.setSubject("Email Verification Code");
            message.setText("Votre code de vérification est : " + code);

            Transport.send(message);
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }*/
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");

        // Génération du code de vérification
        String verificationCode = generateVerificationCode();
        request.getSession().setAttribute("verificationCode", verificationCode);
        request.getSession().setAttribute("emailToVerify", email);

        // Envoi de l'email
        boolean emailSent = sendVerificationEmail(email, verificationCode);

        if (emailSent) {
            response.sendRedirect("verify_email.jsp"); // Redirection après succès
        } else {
            request.setAttribute("message", "Erreur lors de l'envoi de l'email !");
            request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
        }
    }

    private String generateVerificationCode() {
        Random random = new Random();
        int code = 100000 + random.nextInt(900000); // Code à 6 chiffres
        return String.valueOf(code);
    }

    private boolean sendVerificationEmail(String recipientEmail, String code) {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(EMAIL_SENDER, EMAIL_PASSWORD);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(EMAIL_SENDER));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            message.setSubject("Code de vérification d'email");
            message.setText("Votre code de vérification est : " + code);

            Transport.send(message);
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	

}
