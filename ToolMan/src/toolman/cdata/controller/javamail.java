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
public class javamail {
	private static final String host = "smtp.gmail.com";
	private static final int port = 587 ;
	private static final String Username = "Eeit934@gmail.com"; //gmail
	private static final String Password = "EEITTeam04";//gmail
	private Session session;
	
	public void SendEmail() {		
		Properties props = new Properties();  
		props.put("mail.smtp.host", host);  
		props.put("mail.smtp.auth", "true");  
		props.put("mail.smtp.starttls.enable", "true");  
		props.put("mail.smtp.port", port); 
		 Session session = Session.getInstance(props,new Authenticator() {
             protected PasswordAuthentication getPasswordAuthentication() {
                 return new PasswordAuthentication(Username, Password);
             }
         });
	}
	
	public void forgetpassword(String c_email){
		try{
			MimeMessage message = new MimeMessage(session);
	            message.setFrom(new InternetAddress(Username));
	            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(c_email));//send to email
	            message.setSubject("測試信件");
	            message.setText("Dear Levin, \n\n 測試 測試 測試 測試 測試 測試 email !");

	            Transport transport = session.getTransport("smtp");
	            
	            transport.connect(host, port, Username, Password);
            Transport.send(message);//send email
            System.out.println("成功寄送email....");			
		}catch(MessagingException e){
			throw new RuntimeException(e);
		}
	}
}
