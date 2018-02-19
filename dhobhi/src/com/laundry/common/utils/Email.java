package com.laundry.common.utils;

import java.io.IOException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import com.laundry.Register.eu.bi.RegisterDAO;
import com.laundry.Register.eu.blogic.jdbc.JDBCRegisterDAO;
import com.laundry.main.web.common.helper.LoginInfo;



public class Email {
	
	 public static void sendPrintLetterMail(String to,String cc,String subject,String bodyText, LoginInfo loginInfo,String attachFiles[]){
		 
		 	String from = loginInfo.getEmaileUsername();
	 		String host = loginInfo.getEmailhostname(); 
	 		
	 		StringBuffer str = new StringBuffer();
	    	str.append(bodyText);
	    	
	 		final String userName = loginInfo.getEmaileUsername();
			final String password = loginInfo.getEmailPassword();
	        Properties properties = new Properties();
	        properties.put("mail.smtp.host", host);
	        properties.put("mail.smtp.port", loginInfo.getEmailPortno());
	        properties.put("mail.smtp.auth", "true");
	        properties.put("mail.smtp.starttls.enable", "true");
	        properties.put("mail.user", userName);
	        properties.put("mail.password", password);
	        
	        // creates a new session with an authenticator
	        Authenticator auth = new Authenticator() {
	            public PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication(userName, password);
	            }
	        };
	        Session session = Session.getInstance(properties, auth);
	        
	        try {
	            MimeMessage message = new MimeMessage(session);
	            message.setFrom(new InternetAddress(from));
	            //message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
	            //message.addRecipient(Message.RecipientType.TO, new InternetAddress(to)); 
	           
	            Address[] toUsers = InternetAddress.parse(to);
	            message.addRecipients(Message.RecipientType.TO, toUsers);
	            
	            Address[] ccUsers = InternetAddress.parse(cc);
	            message.addRecipients(Message.RecipientType.CC, ccUsers);
	            
	            message.setSubject(subject);
	            message.setSentDate(new Date());
	            
	            MimeBodyPart messagePart = new MimeBodyPart();
	            // messagePart.setText(bodyText);
	             messagePart.setContent(str.toString(),"text/html");
	             System.out.println(bodyText);
	             
	             //
	      
	             // creates multi-part
	             Multipart multipart = new MimeMultipart();
	         
	             multipart.addBodyPart(messagePart);
	             
	             // adds attachments
	             if (attachFiles != null && attachFiles.length > 0) {
	                 for (String filePath : attachFiles) {
	                     MimeBodyPart attachPart = new MimeBodyPart();
	      
	                     try {
	                         attachPart.attachFile(filePath);
	                     } catch (IOException ex) {
	                         ex.printStackTrace();
	                     }
	      
	                     multipart.addBodyPart(attachPart);
	                 }
	             }
	             
	           
	      
	             
	             // adds inline image attachments
	         /*  if (mapInlineImages != null && mapInlineImages.size() > 0) {
	                 Set<String> setImageID = mapInlineImages.keySet();
	                  
	                 for (String contentId : setImageID) {
	                     MimeBodyPart imagePart = new MimeBodyPart();
	                     imagePart.setHeader("Content-ID", "<" + contentId + ">");
	                     imagePart.setDisposition(MimeBodyPart.INLINE);
	                      
	                     String imageFilePath = mapInlineImages.get(contentId);
	                     try {
	                         imagePart.attachFile(imageFilePath);
	                     } catch (IOException ex) {
	                         ex.printStackTrace();
	                     }
	      
	                     multipart.addBodyPart(imagePart);
	                 }
	             }
	             */
	             message.setContent(multipart);
	      
	            // sends the e-mail
	             Transport.send(message);
    			 System.out.println("Mail send");
	           
	            
	        } catch (MessagingException e) {
	            e.printStackTrace();
	           // log.debug("*******************"+e.getMessage());
	        }
	    }
	 
	 
	 
	 
	 
	 public static void sendMail(String host, String port,
	            final String userName, final String password, String toAddress,
	            String subject, String message, String[] attachFiles,String cc)
	            throws AddressException, MessagingException {
		 
		 
		 
		 
	        // sets SMTP server properties
	        Properties properties = new Properties();
	        properties.put("mail.smtp.host", host);
	        properties.put("mail.smtp.port", port);
	        properties.put("mail.smtp.auth", "true");
	        properties.put("mail.smtp.starttls.enable", "true");
	        properties.put("mail.user", userName);
	        properties.put("mail.password", password);
	 
	        // creates a new session with an authenticator
	        Authenticator auth = new Authenticator() {
	            public PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication(userName, password);
	            }
	        };
	        Session session = Session.getInstance(properties, auth);
	 
	        // creates a new e-mail message
	        Message msg = new MimeMessage(session);
	 
	        msg.setFrom(new InternetAddress(userName));
	        InternetAddress[] toAddresses = { new InternetAddress(toAddress) };
	        msg.setRecipients(Message.RecipientType.TO, toAddresses);
	        
	        
	        InternetAddress[] ccUsers = InternetAddress.parse(cc);
	        msg.addRecipients(Message.RecipientType.CC, ccUsers);
	        
	        msg.setSubject(subject);
	        msg.setSentDate(new Date());
	 
	        // creates message part
	        MimeBodyPart messageBodyPart = new MimeBodyPart();
	        messageBodyPart.setContent(message, "text/html");
	 
	        // creates multi-part
	        Multipart multipart = new MimeMultipart();
	        multipart.addBodyPart(messageBodyPart);
	 
	        // adds attachments
	       /* if (attachFiles != null && attachFiles.length > 0) {
	            for (String filePath : attachFiles) {
	                MimeBodyPart attachPart = new MimeBodyPart();
	 
	                try {
	                    attachPart.attachFile(filePath);
	                } catch (IOException ex) {
	                    ex.printStackTrace();
	                }
	 
	                multipart.addBodyPart(attachPart);
	            }
	        }
	 */
	        // sets the multi-part as e-mail's content
	        msg.setContent(multipart);
	 
	        // sends the e-mail
	        Transport.send(msg);
	 
	    }


	/*public static void setmailData(String caseno, String date, String stime,
			String courtname, String clientname, Case casedetails,laundryyer laundryyer,LoginInfo loginInfo) {
		String host = loginInfo.getEmailhostname();
        String port = loginInfo.getEmailPortno();
        String mailFrom = loginInfo.getEmaileUsername();
        String cc = "";
        String password = loginInfo.getEmailPassword();
 
        // message info
        String mailTo = "manojmishra443@gmail.com";
        String subject = "New email with attachments";
        String message = "";
        
        StringBuffer str = new StringBuffer();
        str.append("<span>Sir/Madam,<br>Your Case Number  "+caseno+" is adjourn and your<br>"
        		+ "Next Date is fixed on "+date+".</span><br><br>");
        
        str.append("<span> Sd/-<br>Registrar(Judicial)<br>"+courtname+"<span><br>");
        
        str.append("<table border='1' width='100%'>");
        str.append("<tr>");
        str.append("<td>CASE NUMBER</td>");
        str.append("<td>"+caseno+"</td>");
        str.append("</tr>");
        
     
        
        if(casedetails.getClienttype().equals("1")){
        	str.append("<tr>");
  	        str.append("<td>PETITIONER</td>");
  	        str.append("<td>"+clientname+"</td>");
  	        str.append("</tr>");
  	        
  	        str.append("<tr>");
  	        str.append("<td></td>");
  	        str.append("<td>V/S</td>");
  	        str.append("</tr>");
  	        
  	        str.append("<tr>");
  	        str.append("<td>RESPONDENT</td>");
  	        str.append("<td>"+casedetails.getClient2()+"</td>");
  	        str.append("</tr>");
  	        
        }else{
        	str.append("<tr>");
  	        str.append("<td>PETITIONER</td>");
  	        str.append("<td>"+casedetails.getClient2()+"</td>");
  	        str.append("</tr>");
  	        
  	        str.append("<tr>");
  	        str.append("<td></td>");
  	        str.append("<td>V/S</td>");
  	        str.append("</tr>");
  	        
  	        str.append("<tr>");
  	        str.append("<td>RESPONDENT</td>");
  	        str.append("<td>"+clientname+"</td>");
  	        str.append("</tr>");
        }
      
        
        str.append("</tab;e>");
       
        message = str.toString();
        
 
        // attachments
        String[] attachFiles = new String[3];
        attachFiles[0] = "e:/Test/Picture.png";
        attachFiles[1] = "e:/Test/Music.mp3";
        attachFiles[2] = "e:/Test/Video.mp4";
        
      
        
       if(laundryyer.getEmail2()!=null){
    	   cc = laundryyer.getEmail2();
       }
       if(laundryyer.getEmail3()!=null){
    	   cc = laundryyer.getEmail3();
       }
       if(laundryyer.getEmail2()!=null && laundryyer.getEmail3()!=null){
    	   cc = laundryyer.getEmail2() + "," + laundryyer.getEmail3();
       }
       
       subject = "ADV. SHRIRAM DEORAS";
       
       mailTo = laundryyer.getEmail();
       
 
        try {
        	
        	
          Email.sendMail(host, port, mailFrom, password, mailTo,
                subject, message, attachFiles, cc);
        	
            System.out.println("Email sent.");
        } catch (Exception ex) {
            System.out.println("Could not send email.");
            ex.printStackTrace();
        }

		
	}
*/	 
}
