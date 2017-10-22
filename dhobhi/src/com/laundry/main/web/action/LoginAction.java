package com.laundry.main.web.action;





import java.sql.Connection;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;












import com.laundry.Register.eu.bi.RegisterDAO;
import com.laundry.main.eu.blogic.jdbc.Connection_provider;
import com.laundry.Register.eu.entity.Register;


import com.laundry.main.web.common.helper.LoginHelper;
import com.laundry.main.web.common.helper.LoginInfo;
import com.laundry.main.web.common.utils.Encryption;

import com.laundry.Register.eu.blogic.jdbc.JDBCRegisterDAO;
import com.laundry.Register.web.form.RegisterForm;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;




//hellp world

public class LoginAction extends BaseAction implements ModelDriven<RegisterForm> {
	
	
	RegisterForm registerForm = new RegisterForm();
	
	
	
	public String execute(){
		
		try{
			Connection connection = Connection_provider.getconnection();
		
		RegisterDAO registerDAO = new JDBCRegisterDAO(connection);
		
		Register register = registerDAO.getuser(registerForm.getEmail());
		if(!registerForm.getEmail().equals(register.getEmail()) ){
			addActionError(getText("error.userid.notexist"));
			return INPUT;
		}
		String encPassword = Encryption.encryptSHA(registerForm.getPassword());
		if(!encPassword.equals(register.getPassword())){
			addActionError(getText("error.user.authfailed"));
			return INPUT;
		}
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		HttpSession session = request.getSession(true);
		LoginInfo loginInfo = new LoginInfo();
		loginInfo.setId(register.getId());
		loginInfo.setUserId(register.getEmail());
		loginInfo.setUserType(Integer.parseInt(register.getUsertype()));
		loginInfo.setSessionid(session.getId());
		
		
		
		
		
		session.setAttribute("logininfo", loginInfo);
		LoginHelper.saveLoginInfo(request, loginInfo);
		
		if(register.getUsertype().equals("2")){
			return "adminpage";
		}
		
		if(register.getUsertype().equals("0")){
			return "adminpage";
		}
		}catch (Exception e) {
 			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	

	public void validate() {
		Connection connection = null;
	    	
    	 /* Do not use 'else if' since it will cause to show only one error at a time */
    	 // If user is null or empty add error in field errors
		 if ( registerForm.getEmail() == null || registerForm.getEmail().length() == 0) {
	            addFieldError("userId", getText("error.userid.required") );	// set error message form property file
		 }
		 // If password is null or empty add error to field errors
	     if ( registerForm.getPassword() == null ||  registerForm.getPassword().length() == 0) {
	            addFieldError("password", getText("error.password.required")); 	// set error message form property file
	     }
	     
	     try {
	    	  connection = Connection_provider.getconnection();
	    	 RegisterDAO registerDAO = new JDBCRegisterDAO(connection);
	    	 
	    	 DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
	 		Calendar cal = Calendar.getInstance();
	 		
	 		String date= dateFormat.format(cal.getTime());
	    	 
	    	 /*String afterdate = branchDAO.getdate();
	    	 
	    	 if(date.equals(afterdate)){
	    		 
	    		 addActionError("Your software is expired! please upgrade!");
	    	 }*/
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
		   try {
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
	     
    }

	public RegisterForm getModel() {
		// TODO Auto-generated method stub
		return registerForm;
	}

	

	
	
	

}
