package toolman.cdata.controller;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

//Eeit934
//EEITTeam04
public class javamail{
	private static final String host = "smtp.gmail.com";
	private static final int port = 587;
	private static final String username = "Eeit934@gmail.com";
	private static final String password = "EEITTeam04";// your password
	private static Session session;
	
	// 設定SMTP連線協定
	public static void getSession() {
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.port", port);
		 session = Session.getInstance(props, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(username));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("vivi068520@gmail.com"));
			message.setSubject("ToolMan 找師傅 忘記密碼!! ");
			message.setText("Dear Levin, \n\n 測試 測試 測試 測試 測試 測試 email !");

			Transport transport = session.getTransport("smtp");
			transport.connect(host, port, username, password);

			Transport.send(message);
			System.out.println("寄送email結束.");

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
}
