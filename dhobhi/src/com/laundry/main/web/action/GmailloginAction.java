package com.laundry.main.web.action;


import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.laundry.Register.eu.bi.RegisterDAO;
import com.laundry.Register.eu.blogic.jdbc.JDBCRegisterDAO;
import com.laundry.Register.eu.entity.Register;
import com.laundry.Register.web.form.RegisterForm;
import com.laundry.main.eu.blogic.jdbc.Connection_provider;
import com.laundry.main.web.common.helper.LoginHelper;
import com.laundry.main.web.common.helper.LoginInfo;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

public class GmailloginAction extends BaseAction implements ModelDriven<RegisterForm> {
	
	HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
	HttpSession session = request.getSession(true);
	LoginInfo loginInfo = new LoginInfo();
	RegisterForm registerForm = new RegisterForm();
	
	
	
	public String execute(){
		
		try{
			Connection connection = Connection_provider.getconnection();
			RegisterDAO registerDAO = new JDBCRegisterDAO(connection);
			
			String email = request.getParameter("email");
			String name = request.getParameter("name");
			
			boolean checkemailidExisit = registerDAO.checkEmailIdExist(email);
			if(!checkemailidExisit){
				int r = registerDAO.saveGmailFBInfo(email,name,"","","1");
			}
			
			Register register = registerDAO.getuser(email);
			
		    loginInfo.setId(register.getId());
			loginInfo.setUserId(email);
			loginInfo.setUserType(Integer.parseInt(register.getUsertype()));
			loginInfo.setSessionid(session.getId());
			loginInfo.setName(register.getName());
			
			
			
			
			
			session.setAttribute("logininfo", loginInfo);
			LoginHelper.saveLoginInfo(request, loginInfo);

			
		}catch(Exception e){
			e.printStackTrace();
		}
		return SUCCESS;
		
	}



	public RegisterForm getModel() {
		// TODO Auto-generated method stub
		return registerForm;
	}

}
