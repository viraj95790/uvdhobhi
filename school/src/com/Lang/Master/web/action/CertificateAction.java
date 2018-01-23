package com.Lang.Master.web.action;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.Lang.Master.eu.bi.CertificateDAO;
import com.Lang.Master.eu.blogic.JDBCCertificateDAO;
import com.Lang.Master.eu.entity.Certificate;
import com.Lang.Master.web.form.CertificateForm;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.pacs.main.eu.blogic.jdbc.Connection_provider;
import com.pacs.main.web.action.BaseAction;

public class CertificateAction extends BaseAction implements Preparable, ModelDriven<CertificateForm> {

	HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
	HttpServletResponse response = (HttpServletResponse)ActionContext.getContext().get(ServletActionContext.HTTP_RESPONSE);
	HttpSession session = request.getSession(true);

	CertificateForm certificateForm = new CertificateForm();
	
	
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		Connection connection = null;
		/*request.setCharacterEncoding("UTF-8");response.setCharacterEncoding("UTF-8");*/
		String searchText = request.getParameter("searchText");
		try{
			connection = Connection_provider.getconnection();
			CertificateDAO certificateDAO = new JDBCCertificateDAO(connection);
			
			ArrayList<Certificate> certinfolist = certificateDAO.getleaveinfolist(searchText);
			session.setAttribute("certinfolist", certinfolist);
			
			String searchtxt = certificateForm.getSearchText();
		    session.setAttribute("searchtxt", searchtxt);
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			connection.close();
		}
		return "success";
	}
	

	public String input() throws Exception {
		// TODO Auto-generated method 
		
		/*request.setCharacterEncoding("UTF-8");response.setCharacterEncoding("UTF-8");*/
		return "input";
	}
	
     public String addleavinginfo() throws Exception{
    	 Connection connection = null;
    	/* request.setCharacterEncoding("UTF-8");response.setCharacterEncoding("UTF-8");*/
 		try{
 			connection = Connection_provider.getconnection();
 			CertificateDAO certificateDAO = new JDBCCertificateDAO(connection);
 			Certificate certificate = new Certificate();
 			
 			
 			certificate.setRegister_number(certificateForm.getRegister_number());
 			certificate.setStudentid(certificateForm.getStudentid());
 			certificate.setUid(certificateForm.getUid());
 			certificate.setStudentname(certificateForm.getStudentname());
 			certificate.setFathername(certificateForm.getFathername());
 			certificate.setMothername(certificateForm.getMothername());
 			certificate.setNationality(certificateForm.getNationality());
 			certificate.setMothertongue(certificateForm.getMothertongue());
 			certificate.setReligion(certificateForm.getReligion());
 			certificate.setCast(certificateForm.getCast());
 			certificate.setSubcast(certificateForm.getSubcast());
 			certificate.setTaluka(certificateForm.getTaluka());
 			certificate.setDistrict(certificateForm.getDistrict());
 			certificate.setCountry(certificateForm.getCountry());
 			certificate.setBirthplace(certificateForm.getBirthplace());
 			certificate.setNation(certificateForm.getNation());
 			certificate.setDob(certificateForm.getDob());
 			certificate.setDob_letters(certificateForm.getDob_letters());
 			certificate.setPrestandard(certificateForm.getPrestandard());
 			certificate.setProgress(certificateForm.getProgress());
 			certificate.setBehavior(certificateForm.getBehavior());
 			certificate.setReasonofleaving(certificateForm.getReasonofleaving());
 			certificate.setAdmissiondate(certificateForm.getAdmissiondate());
 			certificate.setLeavingdate(certificateForm.getLeavingdate());
 			certificate.setLastname(certificateForm.getLastname());
 			certificate.setPreschool(certificateForm.getPreschool());
 			certificate.setShera(certificateForm.getShera());
 			certificate.setAcademicyr(certificateForm.getAcademicyr());
 			
 			
 			int result = certificateDAO.savecertificateinfo(certificate);
    
 			
 		}catch(Exception e){
 			e.printStackTrace();
 		}finally{
 			connection.close();
 		}
		return "addleavinginfo";
		
	}
     
    public String generateleaving(){
    	Connection connection = null;
    	String selectedid = request.getParameter("selectedid");
    	try{
    		connection = Connection_provider.getconnection();
    		CertificateDAO certificateDAO = new JDBCCertificateDAO(connection);
    		
    		request.setCharacterEncoding("UTF-8");response.setCharacterEncoding("UTF-8");
    		
    		Certificate certificate = certificateDAO.getstudentleaving(selectedid);
    		session.setAttribute("certificate", certificate);
    		
    		
    	}catch(Exception e){
    		e.printStackTrace();
    	}
		return "generateleaving";

    }
    
    
    public String generatecharacter(){
    	Connection connection = null;
    	String selectedid = request.getParameter("selectedid");
    	try{
    		connection = Connection_provider.getconnection();
    		CertificateDAO certificateDAO = new JDBCCertificateDAO(connection);
    		
    		request.setCharacterEncoding("UTF-8");response.setCharacterEncoding("UTF-8");
    		
    		Certificate certificate = certificateDAO.getstudentleaving(selectedid);
    		session.setAttribute("certificate", certificate);
    		
    		
    	}catch(Exception e){
    		e.printStackTrace();
    	}
		return "generatecharacter";

    }
    
    public String editleaving() throws Exception{
    	Connection connection = null;
    	String selectedid = request.getParameter("selectedid");
    	/*request.setCharacterEncoding("UTF-8");response.setCharacterEncoding("UTF-8");*/
    	try{
    		connection = Connection_provider.getconnection();
    		CertificateDAO certificateDAO = new JDBCCertificateDAO(connection);
    		
    		Certificate editcertificate = certificateDAO.editinfo(selectedid);
    		session.setAttribute("editcertificate", editcertificate);
    		
    		certificateForm.setId(editcertificate.getId());
    		
    	}catch(Exception e){
    		e.printStackTrace();
    	}finally{
    		connection.close();
    	}
		return "editleaving";
    	
    }
    
    
     public String update() throws Exception{
    	 Connection connection = null;
    	  request.setCharacterEncoding("UTF-8");response.setCharacterEncoding("UTF-8");
     	try{
     		connection = Connection_provider.getconnection();
     		CertificateDAO certificateDAO = new JDBCCertificateDAO(connection);
     		Certificate certificate = new Certificate();
     		
     		certificate.setRegister_number(certificateForm.getRegister_number());
 			certificate.setStudentid(certificateForm.getStudentid());
 			certificate.setUid(certificateForm.getUid());
 			certificate.setStudentname(certificateForm.getStudentname());
 			certificate.setFathername(certificateForm.getFathername());
 			certificate.setMothername(certificateForm.getMothername());
 			certificate.setNationality(certificateForm.getNationality());
 			certificate.setMothertongue(certificateForm.getMothertongue());
 			certificate.setReligion(certificateForm.getReligion());
 			certificate.setCast(certificateForm.getCast());
 			certificate.setSubcast(certificateForm.getSubcast());
 			certificate.setTaluka(certificateForm.getTaluka());
 			certificate.setDistrict(certificateForm.getDistrict());
 			certificate.setCountry(certificateForm.getCountry());
 			certificate.setBirthplace(certificateForm.getBirthplace());
 			certificate.setNation(certificateForm.getNation());
 			certificate.setDob(certificateForm.getDob());
 			certificate.setDob_letters(certificateForm.getDob_letters());
 			certificate.setPrestandard(certificateForm.getPrestandard());
 			certificate.setProgress(certificateForm.getProgress());
 			certificate.setBehavior(certificateForm.getBehavior());
 			certificate.setReasonofleaving(certificateForm.getReasonofleaving());
 			certificate.setAdmissiondate(certificateForm.getAdmissiondate());
 			certificate.setLeavingdate(certificateForm.getLeavingdate());
 			certificate.setLastname(certificateForm.getLastname());
 			certificate.setPreschool(certificateForm.getPreschool());
 			certificate.setShera(certificateForm.getShera());
 			certificate.setAcademicyr(certificateForm.getAcademicyr());
 			certificate.setId(certificateForm.getId());
 			
 			int update = certificateDAO.updateinfo(certificate);
     		
     		
     	}catch(Exception e){
     		e.printStackTrace();
     	}finally{
     		connection.close();
     	}
		return "update";
    	 
     }

    public String delete() throws Exception{
    	Connection connection = null;
    	String selectedid = request.getParameter("selectedid");
    	try{
    		connection = Connection_provider.getconnection();
    		CertificateDAO certificateDAO = new JDBCCertificateDAO(connection);
    		
    		int delete = certificateDAO.deleteinfo(selectedid);
    		
    		
    	}catch(Exception e){
    		e.printStackTrace();
    	}finally{
    		connection.close();
    	}
		return execute();

    }
    
    
	
	public CertificateForm getModel() {
		// TODO Auto-generated method stub
		return certificateForm;
	}

	public void prepare() throws Exception {
		// TODO Auto-generated method stub
		
	}

}
