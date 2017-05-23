package toolman.cdata.controller;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
//寄信
//Eeit934
//EEITTeam04
//收信
//Eeit93401
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
		 StringBuilder str = new StringBuilder();
		 System.out.println();
		try {
			MimeMessage message = new MimeMessage(session);
			try {
				message.setFrom(new InternetAddress(username,"Toolman"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("Eeit93401@gmail.com"));
			message.setSubject("ToolMan找師傅   忘記密碼!! ","UTF-8");
			str.append("<br>要使用新的密碼, 請點選下列網址密碼<br>");
			str.append("<br>http://tool.southeastasia.cloudapp.azure.com:8081/ToolMan/cdata/updatepassword.jsp <br>");
//			message.setText("Dear Levin, \n\n 測試 測試 測試 測試 測試 測試 email !","UTF-8");
//			str.append("<br>http://localhost:8081/ToolMan/cdata/updatepassword.jsp<br>"); //test
			message.setContent(str.toString(),"text/html;charset=UTF-8");
			Transport transport = session.getTransport("smtp");
			transport.connect(host, port, username, password);

			Transport.send(message);//送信
			System.out.println("寄送email結束....");

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
}
