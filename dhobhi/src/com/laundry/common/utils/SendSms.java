package com.laundry.common.utils;


import java.net.HttpURLConnection;
import java.net.URL;



public class SendSms {
	public static final String USERNAME = "arvindgadhikar";
	public static final String PASSWORD = "Advanced";
	
	public static void send(String message,String recipient){
		
		try{
			
			message = message.replaceAll(" ", "%20");
			String requestUrl = "http://www.smsjust.com/blank/sms/user/urlsms.php?username="+USERNAME+"&pass="+PASSWORD+"&senderid=SCISOC&message="+message+"&dest_mobileno="+recipient+"&response=Y";
			
			URL url = new URL(requestUrl);
			HttpURLConnection uc = (HttpURLConnection)url.openConnection();
			System.out.println(uc.getResponseMessage());
			uc.disconnect();
		} catch(Exception ex) {
			System.out.println(ex.getMessage());
		}
		
	}
}


