package com.Lang.Master.web.action;


import java.io.StringReader;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.text.html.HTMLDocument;
import javax.swing.text.html.HTMLEditorKit;

import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.struts2.ServletActionContext;
import org.jsoup.Jsoup;

import com.Lang.Master.eu.bi.MasterDAO;
import com.Lang.Master.eu.blogic.JDBCMasterDAO;
import com.Lang.Master.eu.entity.Master;
import com.Lang.Master.web.form.MasterForm;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.pacs.main.eu.blogic.jdbc.Connection_provider;
import com.pacs.main.web.action.BaseAction;

public class MasterAction extends BaseAction implements Preparable, ModelDriven<MasterForm>{
	HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
	HttpServletResponse response = (HttpServletResponse)ActionContext.getContext().get(ServletActionContext.HTTP_RESPONSE);
	HttpSession session = request.getSession(true);

	MasterForm masterForm = new MasterForm();
	
	
	@Override
	public String execute() throws Exception {
		Connection connection = null;
		try{
			connection = Connection_provider.getconnection();
			//connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/pacs?useUnicode=true&characterEncoding=UTF-8","pranams","6qxi5x&)~XBZ");
			MasterDAO masterDAO = new JDBCMasterDAO(connection);
			
			ArrayList<Master>studentNameList = new ArrayList<Master>();
			ArrayList<Master>subjectNameList = new ArrayList<Master>();
			
			if(!masterForm.getClassid().equals("")){
				studentNameList = masterDAO.getStudeneNameList(masterForm.getClassid(),masterForm.getSearchText());
				subjectNameList = masterDAO.getSubjectNameList(masterForm.getTerms());
			}
			
			session.setAttribute("terms", masterForm.getTerms());
			session.setAttribute("classid", masterForm.getClassid());
			
			session.setAttribute("studentNameList", studentNameList);
			session.setAttribute("subjectNameList", subjectNameList);
		}catch(Exception e){
			e.printStackTrace();
		}
		return super.execute();
	}
	
	public String report(){
		
		Connection connection = null;
		try{
			String terms = request.getParameter("terms");
			String classid = request.getParameter("classid");
			connection = Connection_provider.getconnection();
			//connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/pacs?useUnicode=true&characterEncoding=UTF-8","pranams","6qxi5x&)~XBZ");
			MasterDAO masterDAO = new JDBCMasterDAO(connection);
			
			
			session.setAttribute("sessionterms", terms);
			session.setAttribute("sessionclassid", classid);
			
			ArrayList<Master>termnameList = masterDAO.getTermNameList(terms);
			session.setAttribute("termnameList", termnameList);
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		return "report";
	}
	
	
	public String nondani(){
		
		return "nondani";
	}
	
	public MasterForm getModel() {
		// TODO Auto-generated method stub
		return masterForm;
	}
	
	public String save() throws Exception{
		
		Connection connection = null;
		try{
			connection = Connection_provider.getconnection();
			MasterDAO masterDAO = new JDBCMasterDAO(connection);
			
			
			ArrayList<Master>studentNameList = (ArrayList<Master>)session.getAttribute("studentNameList");
			ArrayList<Master>subjectNameList = (ArrayList<Master>)session.getAttribute("subjectNameList");
			
			String terms = masterForm.getTerms();
			String classid = masterForm.getClassid();
			
			int i = 1;
			for(Master student : studentNameList){
				for(Master subject : subjectNameList){
					String reqid = "n0min" + i + "-" + subject.getId() + "-" + student.getId(); 
					String marks = request.getParameter(reqid);
					
					String subjectname = subject.getName();
					boolean checkcolumnexist = masterDAO.checkColumnExist(subjectname);
					if(!checkcolumnexist){
						int r = masterDAO.createColumnName(subjectname);
					}
					
					boolean checktermexist = masterDAO.checkTermExist(student.getId(),terms,classid);
					int saveid = 0;
					if(!checktermexist){
						saveid = masterDAO.saveMarks(student.getId(),terms,classid);
						int update = masterDAO.updateMarks(marks,subjectname,saveid);
					}else{
						saveid = masterDAO.getSavedId(student.getId(),terms,classid);
						int update = masterDAO.updateMarks(marks,subjectname,saveid);
					}
					 
					
					
					System.out.println(marks);
					i++;
				}
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return execute();
	}
	
	
	public String mainterm() throws Exception{
		Connection connection = null;
		String classid = request.getParameter("classid");
		try {
			connection = Connection_provider.getconnection();
			MasterDAO masterDAO = new JDBCMasterDAO(connection);
			
			ArrayList<Master> maintermList = masterDAO.getmasterTermlist(classid);
			StringBuffer str = new StringBuffer();
			str.append("<select name='mainterm' id='mainterm' onchange='showexamtype(this.value)' class='form-control'>");
			str.append("<option value='0'>Select Terms</option>");
			
			for(Master master : maintermList){
				str.append("<option value='"+master.getId()+"'>"+master.getMainterm()+"</option>");
			}
			
			str.append("</select>");
			
			response.setContentType("text/html");
			response.setHeader("Cache-Control", "no-cache");
			response.getWriter().write(str.toString());
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			connection.close();
		}
		return null;
		
	}
	
	public String examtype() throws Exception{
		Connection connection = null;
		String mainterm = request.getParameter("mainterm");
		try {
			connection = Connection_provider.getconnection();
			MasterDAO masterDAO = new JDBCMasterDAO(connection);
			
			ArrayList<Master> maintermList = masterDAO.showtermlist(mainterm);
			StringBuffer str = new StringBuffer();
			str.append("<select name='name' id='terms' class='form-control'>");
			str.append("<option value='0'>Select Exam Type</option>");
			
			for(Master master : maintermList){
				str.append("<option value='"+master.getId()+"'>"+master.getName()+"</option>");
			}
			
			str.append("</select>");
			
			response.setContentType("text/html");
			response.setHeader("Cache-Control", "no-cache");
			response.getWriter().write(str.toString());
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			connection.close();
		}
		return null;
		
	}
	
	
	public String inputstandard() {

		return "inputstandard";
	}

	public String addstandard() throws Exception {
		Connection connection = null;

		try {
			connection = Connection_provider.getconnection();
			MasterDAO masterDAO = new JDBCMasterDAO(connection);
			Master master = new Master();

			master.setClassname(masterForm.getClassname());

			int result = masterDAO.insertclasname(master);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			connection.close();
		}
		return displaystandard();
	}

	public String displaystandard() throws Exception {
		Connection connection = null;

		try {
			connection = Connection_provider.getconnection();
			MasterDAO masterDAO = new JDBCMasterDAO(connection);

			ArrayList<Master> list = masterDAO.getstandardlist();
			masterForm.setGetclasslist(list);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			connection.close();
		}
		return "displaystandard";

	}
	
	
	public String editstandard() throws Exception {
		Connection connection = null;
		String selectedid = request.getParameter("selectedid");
		try {
			connection = Connection_provider.getconnection();
			MasterDAO masterDAO = new JDBCMasterDAO(connection);
		
			Master master = masterDAO.editstandard(selectedid);
			
	        masterForm.setClassname(master.getClassname());
	       	masterForm.setId(master.getId());
			

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			connection.close();
		}
		return "editstandard";
	}
	
	
	public String inputsubject() {

		return "inputsubject";
	}

	public String displaysubject() throws Exception {
		Connection connection = null;

		try {
			connection = Connection_provider.getconnection();
			MasterDAO masterDAO = new JDBCMasterDAO(connection);

			ArrayList<Master> list = masterDAO.getSubjectlist();
			masterForm.setGetsubjectlist(list);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			connection.close();
		}
		return "displaysubject";

	}

	public String addsubject() throws Exception {
		Connection connection = null;

		try {
			connection = Connection_provider.getconnection();
			MasterDAO masterDAO = new JDBCMasterDAO(connection);
			Master master = new Master();

			master.setSubjectname(masterForm.getSubjectname());
			master.setDisplayname(masterForm.getDisplayname());

			int result = masterDAO.insertsubject(master);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			connection.close();
		}
		return displaysubject();
	}
	
	
      public String inputstudentinfo() throws Exception{
	    Connection connection = null;
	    String clasid = masterForm.getName();
	    if(clasid==null){
	    	clasid = (String)session.getAttribute("saveclassname");
	    	masterForm.setName(clasid);
	    }
	    try {
	    	connection = Connection_provider.getconnection();
	    	MasterDAO masterDAO = new JDBCMasterDAO(connection);
	    	
	    	ArrayList<Master> list = masterDAO.getstudentdata(clasid, masterForm.getSearchText());
			masterForm.setStudentinfoList(list);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			connection.close();
		}
		
		return "inputstudentinfo";
	}

	
	public String addstudent() throws Exception{
		Connection connection = null;
		/*String clasid = masterForm.getName();*/
		try {
			connection = Connection_provider.getconnection();
			MasterDAO masterDAO = new JDBCMasterDAO(connection);
			
			if(masterForm.getActiontype().equals("0")){
				
			Master master = new Master();
			master.setClassname(masterForm.getName());
			session.setAttribute("saveclassname", masterForm.getName());
			master.setFirstname(masterForm.getFirstname());
			master.setFathername(masterForm.getFathername());
			master.setLastname(masterForm.getLastname());
			master.setMothername(masterForm.getMothername());
			master.setRollno(masterForm.getRollno());
			master.setDob(masterForm.getDob());
			master.setMob(masterForm.getMob());
			master.setAddress(masterForm.getAddress());
			master.setAdmissiondate(masterForm.getAdmissiondate());
			master.setGrnum(masterForm.getGrnum());
			master.setCast(masterForm.getCast());
			master.setCategory(masterForm.getCategory());
			master.setOnlychild(masterForm.getOnlychild());
			master.setHandicap(masterForm.getHandicap());
			master.setOldschool(masterForm.getOldschool());
			master.setHousedress(masterForm.getHousedress());
			master.setUidseno(masterForm.getUidseno());
			master.setAadhar(masterForm.getAadhar());
			master.setPhone(masterForm.getPhone());
			
			
			int result = masterDAO.insertstudentinfo(master);
			
			/*masterForm.setFirstname("");
			masterForm.setFathername("");
			masterForm.setLastname("");
			masterForm.setMothername("");
			masterForm.setRollno("");
			masterForm.setDob("");
			masterForm.setMob("");
			masterForm.setAddress("");
			masterForm.setAdmissiondate("");
			masterForm.setGrnum("");
			masterForm.setCast("");
			masterForm.setCategory("");
			masterForm.setOnlychild("");
			masterForm.setHandicap("");
			masterForm.setOldschool("");
			masterForm.setHousedress("");
			masterForm.setUidseno("");
			masterForm.setAadhar("");
			masterForm.setPhone("");*/
			
			}
		
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			connection.close();
		}
		
		return "addstudent";
	}
	
	
	
	
	
	public String editstudent() throws Exception{
		Connection connection = null;
		String selectedid = request.getParameter("selectedid");
		try {
			connection = Connection_provider.getconnection();
			MasterDAO masterDAO = new JDBCMasterDAO(connection);
			
			Master master = masterDAO.editstudentdata(selectedid);
			
			masterForm.setId(master.getId());
			masterForm.setFirstname(master.getFirstname());
			masterForm.setFathername(master.getFathername());
			masterForm.setLastname(master.getLastname());
			masterForm.setMothername(master.getMothername());
			masterForm.setMob(master.getMob());
			masterForm.setAdmissiondate(master.getAdmissiondate());
			masterForm.setAddress(master.getAddress());
			masterForm.setAadhar(master.getAadhar());
			masterForm.setCast(master.getCast());
			masterForm.setCategory(master.getCategory());
			masterForm.setRollno(master.getRollno());
			masterForm.setGrnum(master.getGrnum());
			masterForm.setName(master.getName());
			masterForm.setPhone(master.getPhone());
			masterForm.setOnlychild(master.getOnlychild());
			masterForm.setHandicap(master.getHandicap());
			masterForm.setHousedress(master.getHousedress());
			masterForm.setOldschool(master.getOldschool());
			masterForm.setUidseno(master.getUidseno());
			masterForm.setDob(master.getDob());
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			connection.close();
		}
		return"editstudent";
	}
	
	public String updatestudent() throws Exception{
		Connection connection = null;
		try {
			connection = Connection_provider.getconnection();
			MasterDAO masterDAO = new JDBCMasterDAO(connection);
				
			Master master = new Master();
			master.setId(masterForm.getId());
			master.setClassname(masterForm.getName());
			master.setFirstname(masterForm.getFirstname());
			master.setFathername(masterForm.getFathername());
			master.setLastname(masterForm.getLastname());
			master.setMothername(masterForm.getMothername());
			master.setRollno(masterForm.getRollno());
			master.setDob(masterForm.getDob());
			master.setMob(masterForm.getMob());
			master.setAddress(masterForm.getAddress());
			master.setAdmissiondate(masterForm.getAdmissiondate());
			master.setGrnum(masterForm.getGrnum());
			master.setCast(masterForm.getCast());
			master.setCategory(masterForm.getCategory());
			master.setOnlychild(masterForm.getOnlychild());
			master.setHandicap(masterForm.getHandicap());
			master.setOldschool(masterForm.getOldschool());
			master.setHousedress(masterForm.getHousedress());
			master.setUidseno(masterForm.getUidseno());
			master.setAadhar(masterForm.getAadhar());
			master.setPhone(masterForm.getPhone());
			
			
			int update = masterDAO.updatestudentinfo(master);
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			connection.close();
		}
		
		return "updatestudent";
	}

	public String deletestudent() throws Exception{
		Connection connection = null;
		String selectedid = request.getParameter("selectedid");
		try {
			
			connection = Connection_provider.getconnection();
			MasterDAO masterDAO = new JDBCMasterDAO(connection);
			int result = masterDAO.deletestudent(selectedid);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			connection.close();
		}
		
		return inputstudentinfo();
		
	}

	
	

	public void prepare() throws Exception {
		Connection connection = null;
		try{
			connection = Connection_provider.getconnection();
			MasterDAO masterDAO = new JDBCMasterDAO(connection);
			ArrayList<Master>classNameList = masterDAO.getClasssNameList();
			masterForm.setClassNameList(classNameList);
			
			ArrayList<Master>termList = masterDAO.getTermList();
			masterForm.setTermList(termList);
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		
	}

}
