package com.laundry.Register.web.action;




import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.laundry.Register.web.form.RegisterForm;
import com.laundry.common.utils.DateTimeUtils;
import com.laundry.Register.eu.bi.RegisterDAO;
import com.laundry.main.eu.blogic.jdbc.Connection_provider;
import com.laundry.Register.eu.blogic.jdbc.*;
import com.laundry.Register.eu.entity.Register;
import com.laundry.main.web.action.BaseAction;
import com.laundry.main.web.common.helper.LoginHelper;
import com.laundry.main.web.common.helper.LoginInfo;
import com.laundry.main.web.utils.PopulateList;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

public class RegistrationAction extends BaseAction implements ModelDriven<RegisterForm>, Preparable {
	
	
	HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
	HttpServletResponse response = (HttpServletResponse)ActionContext.getContext().get(ServletActionContext.HTTP_RESPONSE);
	HttpSession session = request.getSession(true);
	RegisterForm registerForm = new RegisterForm();
	LoginInfo loginInfo = LoginHelper.getLoginInfo(request);
	
    public String execute() throws Exception{
    	
    	if(!verifyLogin(request)){
    		return "login";
    	}
    	Connection connection = null;
    	try {
    		connection = Connection_provider.getconnection();
    		RegisterDAO registerDAO = new JDBCRegisterDAO(connection);
    		
    		ArrayList<Register> list = registerDAO.getRegisterdata(loginInfo.getUserType(),loginInfo.getId());
    		registerForm.setRegistrationDataList(list);
    		
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			connection.close();
		}
		return "success";
    }
    
    public String registerdata() throws Exception{
    	Connection connection = null;
    	try {
    		connection = Connection_provider.getconnection();
    		RegisterDAO registerDAO = new JDBCRegisterDAO(connection);
    		Register register = new Register();
    		
    		
    		
    		register.setName(registerForm.getName());
    		register.setSurname(registerForm.getSurname());
    		register.setAddress(registerForm.getAddress());
    		register.setCity(registerForm.getCity());
    		register.setEmail(registerForm.getEmail());
    		register.setMobile(registerForm.getMobile());
    		register.setLandmark(registerForm.getLandmark());
    		register.setPassword(registerForm.getPassword());
    		register.setPincode(registerForm.getPincode());
    		register.setCustomer_type(registerForm.getCustomer_type());
    		register.setUsertype(registerForm.getCustomer_type());
    		register.setModified_date(registerForm.getModified_date());
    		register.setPostname(registerForm.getPostname());
    		
    		register.setVendorid(0);
    		if(verifyLogin(request)){
    			if(loginInfo.getUserType()==2){
    				register.setVendorid(loginInfo.getId());
    			}
    		}
    		
    		int result = registerDAO.insertdata(register);
    		
    		String action = request.getParameter("action");
    		if(action.equals("r")){
    			
    			return "goforlogin";
    		}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			connection.close();
		}
    	
		return "registerdata";
    	
    }
    
    public String edit() throws Exception{
    	Connection connection  = null;
    	String selectedid = request.getParameter("selectedid");
    	
    	try {
    		connection = Connection_provider.getconnection();
    		RegisterDAO registerDAO = new JDBCRegisterDAO(connection);
    		Register register = registerDAO.editregistration(selectedid);
    		
    		registerForm.setId(register.getId());
    		registerForm.setName(register.getName());
    		registerForm.setSurname(register.getSurname());
    		registerForm.setAddress(register.getAddress());
    		registerForm.setMobile(register.getMobile());
    		registerForm.setEmail(register.getEmail());
    		registerForm.setCity(register.getCity());
    		registerForm.setLandmark(register.getLandmark());
    		registerForm.setCustomer_type(register.getCustomer_type());
    		registerForm.setPincode(register.getPincode());
    	
    		
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			connection.close();
		}
		return "edit";
    	
    }
    
    public String update() throws Exception{
    	Connection connection  = null;
    	try {
    		connection = Connection_provider.getconnection();
    		RegisterDAO registerDAO = new JDBCRegisterDAO(connection);
    		Register register = new Register();
    		
    		register.setId(registerForm.getId());
    		register.setName(registerForm.getName());
    		register.setSurname(registerForm.getSurname());
    		register.setAddress(registerForm.getAddress());
    		register.setCity(registerForm.getCity());
    		register.setEmail(registerForm.getEmail());
    		register.setMobile(registerForm.getMobile());
    		register.setLandmark(registerForm.getLandmark());
    		register.setPincode(registerForm.getPincode());
    		register.setCustomer_type(registerForm.getCustomer_type());
    		
			int result = registerDAO.updateregistration(register);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			connection.close();
		}
		return "update";
    	
    }
    
    public String delete() throws Exception{
    	Connection connection  = null;
    	String selectedid = request.getParameter("selectedid");
    	try {
    		connection = Connection_provider.getconnection();
    		RegisterDAO registerDAO = new JDBCRegisterDAO(connection);
    		
    		int result = registerDAO.deletedata(selectedid);
    		
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			connection.close();
		}
		return execute();
    	
    }
    
    public String updatestatus() throws Exception{
    	Connection connection = null;
    	String selectedid = request.getParameter("selectedid");
    	String status = request.getParameter("status");
    	try{
    		connection = Connection_provider.getconnection();
    		RegisterDAO registerDAO = new JDBCRegisterDAO(connection);
    		
    		int update = registerDAO.updateclientstatus(selectedid, status);
    		
    		
    	}catch(Exception e){
    		e.printStackTrace();
    	}finally{
    		connection.close();
    	}
		return execute();
    	
    }
    
    
    public String oursector(){
    	
		return "inputoursector";
    	
    }

	public void prepare() throws Exception {
		// TODO Auto-generated method stub
		Connection connection = null;
		try {
			connection = Connection_provider.getconnection();
			RegisterDAO registerDAO = new JDBCRegisterDAO(connection);
			
			ArrayList<Register> list = registerDAO.getcustomertypeList();
			registerForm.setCustomerTypeList(list);
			
			registerForm.setCityList(PopulateList.cityList());
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		
	}

	public RegisterForm getModel() {
		// TODO Auto-generated method stub
		return registerForm;
	}

	
}
