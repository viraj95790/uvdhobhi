package com.laundry.Register.web.action;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.laundry.Register.eu.bi.MasterDAO;
import com.laundry.Register.eu.bi.ServiceDAO;
import com.laundry.Register.eu.blogic.jdbc.JDBCMasterDAO;
import com.laundry.Register.eu.blogic.jdbc.JDBCServiceDAO;
import com.laundry.Register.eu.entity.Master;
import com.laundry.Register.web.form.MasterForm;
import com.laundry.main.eu.blogic.jdbc.Connection_provider;
import com.laundry.main.web.action.BaseAction;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

public class MasterAction extends BaseAction implements ModelDriven<MasterForm>, Preparable {
	
	HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
	HttpServletResponse response = (HttpServletResponse)ActionContext.getContext().get(ServletActionContext.HTTP_RESPONSE);
	HttpSession session = request.getSession(true);
	MasterForm masterForm = new MasterForm();
	
	
	public String execute() throws Exception{
		if(!verifyLogin(request)){
			return "login";
		}
		Connection connection = null;
		try {
			connection = Connection_provider.getconnection();
			MasterDAO masterDAO = new JDBCMasterDAO(connection);
			
			ArrayList<Master> list = masterDAO.getserviceList();
			masterForm.setServiceList(list);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			connection.close();
		}
		return "success";
	}
	
	public String addservice() throws Exception{
		if(!verifyLogin(request)){
			return "login";
		}
		Connection connection = null;
		try {
			connection = Connection_provider.getconnection();
			MasterDAO masterDAO = new JDBCMasterDAO(connection);
			Master master = new Master();
			
			master.setServices(masterForm.getServices());
			int result = masterDAO.insertservices(master);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			connection.close();
		}
		return execute();
	}
	
	public String editservices() throws Exception{
		if(!verifyLogin(request)){
			return "login";
		}
		String selectedid = request.getParameter("selectedid");
		Connection connection = null;
		try {
			connection = Connection_provider.getconnection();
			MasterDAO masterDAO = new JDBCMasterDAO(connection);
			Master master = masterDAO.editservices(selectedid);
			
			masterForm.setId(master.getId());
			masterForm.setServices(master.getServices());
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			connection.close();
		}
		return "editservices";
	}
	
	public String updateservices() throws Exception{
		if(!verifyLogin(request)){
			return "login";
		}
		Connection connection = null;
		try {
			connection = Connection_provider.getconnection();
			MasterDAO masterDAO = new JDBCMasterDAO(connection);
			Master master = new Master();
			
			master.setId(masterForm.getId());
			master.setServices(masterForm.getServices());
			
			int result = masterDAO.updateservice(master);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			connection.close();
		}
		return execute();
	}
	
	public String deleteservices() throws Exception{
		String selectedid = request.getParameter("selectedid");
		Connection connection = null;
		try {
			connection = Connection_provider.getconnection();
			MasterDAO masterDAO = new JDBCMasterDAO(connection);
			
			int result = masterDAO.deleteservice(selectedid);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			connection.close();
		}
		return execute();
	}
	
	public String displayitem() throws Exception{
		Connection connection = null;
		try {
			connection = Connection_provider.getconnection();
			MasterDAO masterDAO = new JDBCMasterDAO(connection);
			
		    ArrayList<Master> list = masterDAO.getItemList();
			masterForm.setItemList(list);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			connection.close();
		}
		return "displayitem";
	}
	
	public String inputitem(){
		
		return "inputitem";
	}
	
	public String additem() throws Exception{
		Connection connection = null;
		try {
			connection = Connection_provider.getconnection();
			MasterDAO masterDAO = new JDBCMasterDAO(connection);
			ArrayList<Master> list = masterDAO.getserviceList();
			masterForm.setServiceList(list);
			
			Master master = new Master();
			
			master.setServices(masterForm.getServices());
			master.setItem(masterForm.getItem());
			int result = masterDAO.insertItem(master);
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			connection.close();
		}
		return displayitem();
	}
	
	public String edititem() throws Exception{
		String selectedid = request.getParameter("selectedid");
		Connection connection = null;
		try {
			connection = Connection_provider.getconnection();
			MasterDAO masterDAO = new JDBCMasterDAO(connection);
			Master master = masterDAO.edititem(selectedid);
			
			masterForm.setId(master.getId());
			masterForm.setServices(master.getServices());
			masterForm.setItem(master.getItem());
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			connection.close();
		}
		return "edititem";
		
	}
	
	public String updateitem() throws Exception{
		Connection connection = null;
		try {
			connection = Connection_provider.getconnection();
			MasterDAO masterDAO = new JDBCMasterDAO(connection);
			Master master = new Master();
			
			master.setId(masterForm.getId());
			master.setServices(masterForm.getServices());
			master.setItem(masterForm.getItem());
			
			int result = masterDAO.updateItem(master);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			connection.close();
		}
		return displayitem();
	}
	
	public String deleteitem() throws Exception{
		String selectedid = request.getParameter("selectedid");
		Connection connection = null;
		try {
			connection = Connection_provider.getconnection();
			MasterDAO masterDAO = new JDBCMasterDAO(connection);
			
			int result = masterDAO.deleteItem(selectedid);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			connection.close();
		}
		return displayitem();
	}
	
	public String displaysubitem() throws Exception{
		Connection connection = null;
		try {
			connection = Connection_provider.getconnection();
			MasterDAO masterDAO = new JDBCMasterDAO(connection);
			
		    ArrayList<Master> list = masterDAO.getSubItemList();
			masterForm.setSubitemList(list);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			connection.close();
		}
		return "displaysubitem";
	}
	
	public String inputsubitem(){
		
		return "inputsubitem";
	}
	
	public String addsubitem() throws Exception{
		Connection connection = null;
		try {
			connection = Connection_provider.getconnection();
			MasterDAO masterDAO = new JDBCMasterDAO(connection);
			
			Master master = new Master();
			
			master.setItem(masterForm.getItem());
			master.setName(masterForm.getName());
			master.setSubitem(masterForm.getSubitem());
			master.setPrice(masterForm.getPrice());
			master.setCgst(masterForm.getCgst());
			master.setSgst(masterForm.getSgst());
			
			int result = masterDAO.insertsubItem(master);
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			connection.close();
		}
		return displaysubitem();
	}
	
	public String editsubitem() throws Exception{
		String selectedid = request.getParameter("selectedid");
		Connection connection = null;
		try {
			connection = Connection_provider.getconnection();
			MasterDAO masterDAO = new JDBCMasterDAO(connection);
			Master master = masterDAO.editsubItem(selectedid);
			
			masterForm.setId(master.getId());
			masterForm.setItem(master.getItem());
			masterForm.setSubitem(master.getSubitem());
			masterForm.setPrice(master.getPrice());
			masterForm.setCgst(master.getCgst());
			masterForm.setSgst(master.getSgst());
			masterForm.setName(master.getName());
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			connection.close();
		}
		return "editsubitem";
		
	}
	
	public String updatesubitem() throws Exception{
		Connection connection = null;
		try {
			connection = Connection_provider.getconnection();
			MasterDAO masterDAO = new JDBCMasterDAO(connection);
			Master master = new Master();
			
			master.setId(masterForm.getId());
			master.setSubitem(masterForm.getSubitem());
			master.setItem(masterForm.getItem());
			master.setPrice(masterForm.getPrice());
			master.setCgst(masterForm.getCgst());
			master.setSgst(masterForm.getSgst());
			master.setName(masterForm.getName());
			
			int result = masterDAO.updatesubItem(master);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			connection.close();
		}
		return displaysubitem();
	}
	
	public String deletesubitem() throws Exception{
		String selectedid = request.getParameter("selectedid");
		Connection connection = null;
		try {
			connection = Connection_provider.getconnection();
			MasterDAO masterDAO = new JDBCMasterDAO(connection);
			
			int result = masterDAO.deletesubItem(selectedid);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			connection.close();
		}
		return displaysubitem();
	}


	public MasterForm getModel() {
		// TODO Auto-generated method stub
		return masterForm;
	}

	public void prepare() throws Exception {
		// TODO Auto-generated method stub
		Connection connection = null;
		try {
			connection = Connection_provider.getconnection();
			MasterDAO masterDAO = new JDBCMasterDAO(connection);
			ArrayList<Master> list = masterDAO.getserviceList();
			masterForm.setServiceList(list);
			
			ArrayList<Master> list2 = masterDAO.getItemList();
			masterForm.setItemList(list2);
			
			ArrayList<Master> list3 = masterDAO.gethospitalList();
			masterForm.setHospitallist(list3);
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			connection.close();
		}
	}

}
