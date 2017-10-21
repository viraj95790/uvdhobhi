package com.Lang.Master.web.action;










import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;



public final class SmsService {


	/** SMS Account User Id */
	//private final String SMS_ACC_USER_ID = "5611";
	private final String SMS_ACC_USER_ID = "kurveys01617";
	
	/** SMS Account Password */
	private final String SMS_ACC_PASSWORD = "$@n@y@123";
	
	/** SMS Account Sender Id */
	private final String SMS_ACC_SENDER_ID = "KNMPSN";

	/** SMS URL Host */
	private final String SMS_URL_HOST = "http://www.smsjust.com/blank/sms/user/urlsms.php?";
	//private final String SMS_URL_HOST = "http://localhost:8080/api/pushsms.php?";
	
	/** SMS Sending URL Query string
	{0} - Recipients Mobile Number (multiple number can be added by separating with comma)
	{1} - Message Text  */
	private final String SMS_URL_QUERY = "username="+ SMS_ACC_USER_ID +
										 "&pass="+ SMS_ACC_PASSWORD +
										 "&senderid="+ SMS_ACC_SENDER_ID+
										 "&dest_mobileno={0}&message={1}&response=Y"; 
	
	/** SMS Url */
	private final String SMS_URL = SMS_URL_HOST + SMS_URL_QUERY;
	
	/** URL Encoder for white space */
	private final String ENCODE_SPACE = "%20";
	
	/** URL Encoder for comma */
	private final String ENCODE_COMMA = "%2C";
	
	/** URL Encoder for line feed (new line) */
	private final String ENCODE_LF = "%0A";
	
	
	/**
	 * Default constructor, Don't make it public or private
	 * It should be visible only within package so keep visibility default
	 */
	public SmsService(){ }
	
	/**
	 * Send sms by using sms provider
	 * 
	 * @param mobileNo mobile number to send sms
	 * @param messageText message text
	 * @return true if sms sent successfully, else false
	 */
	public synchronized boolean sendSms( String messageText, String  mobileNo){
		
		boolean isSmsSent = false;		// initially sms sent is false
		
		// replace query parameters with actual mobile number and message text
		String smsUrl = SMS_URL.replace("{0}", mobileNo).replace("{1}", messageText);
		
		// encode url by replacing space, comma and new line with corresponding encoding code
		smsUrl = smsUrl.replace(" ", ENCODE_SPACE).replace(",", ENCODE_COMMA).replace("\n", ENCODE_LF);
		
		try{
			
			URL url = new URL(smsUrl);	// get url from url string
			
			URLConnection urlConnection = url.openConnection();	// open url connection
			urlConnection.connect();	// connect to url
			
			HttpURLConnection httpConnection = (HttpURLConnection) urlConnection;	// get http url connection object from url connection
			
			int responseCode = httpConnection.getResponseCode();	// get response code
         			
			if(responseCode == HttpURLConnection.HTTP_OK){	// if response code is HTTP+OK then message sent successfully 
				isSmsSent = true;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return isSmsSent;
		
	}
	
	/*public static void main(String[] args) {
		SmsService s = new SmsService();
		String msg = "Appointment Cancelled on 01-10-2015 at 10:05 AM with MyClinic 3 Bond Street Bond Gate BondStreet 02476641214 ";
		s.sendSms(msg, "9156248809", new LoginInfo(),new EmailLetterLog());
	}*/
	
}
