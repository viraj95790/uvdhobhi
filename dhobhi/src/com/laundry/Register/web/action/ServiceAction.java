package com.laundry.Register.web.action;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;


import com.laundry.Account.eu.bi.AccountDAO;
import com.laundry.Account.eu.blogic.jdbc.JDBCAccountDAO;
import com.laundry.Account.eu.entity.Account;
import com.laundry.Account.web.action.SmsService;
import com.laundry.Register.eu.bi.RegisterDAO;
import com.laundry.Register.eu.bi.ServiceDAO;
import com.laundry.Register.eu.blogic.jdbc.JDBCRegisterDAO;
import com.laundry.Register.eu.blogic.jdbc.JDBCServiceDAO;
import com.laundry.Register.eu.entity.Cart;
import com.laundry.Register.eu.entity.Master;
import com.laundry.Register.eu.entity.Register;
import com.laundry.Register.web.form.MasterForm;
import com.laundry.common.utils.DateTimeUtils;
import com.laundry.main.eu.blogic.jdbc.Connection_provider;
import com.laundry.main.web.action.BaseAction;
import com.laundry.main.web.action.LoginAction;
import com.laundry.main.web.common.helper.LoginHelper;
import com.laundry.main.web.common.helper.LoginInfo;
import com.laundry.main.web.utils.PopulateList;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

public class ServiceAction extends BaseAction implements ModelDriven<MasterForm>, Preparable{

	HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
	HttpServletResponse response = (HttpServletResponse)ActionContext.getContext().get(ServletActionContext.HTTP_RESPONSE);
	HttpSession session = request.getSession(true);
	LoginInfo loginInfo = LoginHelper.getLoginInfo(request);
	
	MasterForm masterForm = new MasterForm();
	
	public String execute() throws Exception{
		
		if(!verifyLogin(request)){
			return "login";
		}
		
		Connection connection = null;
		try {
			connection = Connection_provider.getconnection();
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			connection.close();
		}
		return "success";
		
	}
	
	public String email(){
		String email = request.getParameter("email");
		System.out.println("hello");
		
		String str = "false";
		
		Connection connection = null;
		try {
			connection = Connection_provider.getconnection();
			ServiceDAO serviceDAO = new JDBCServiceDAO(connection);
			
			str = serviceDAO.checkEmailIdExist(email);
			
			response.setContentType("text/html");
			response.setHeader("Cache-Control", "no-cache");
			response.getWriter().write(str);
			
			
		}catch(Exception e){
			
		}
		
		
		return null;
	}
	
	public String vendor(){
		
		String postcode = request.getParameter("postcode");
		Connection connection = null;
		try {
			connection = Connection_provider.getconnection();
			ServiceDAO serviceDAO = new JDBCServiceDAO(connection);
			
			ArrayList<Master>vendorList = serviceDAO.getVendorList(postcode);
			
			StringBuffer str = new StringBuffer();
			str.append("<select name='vendor' id='vendor' class='form-control'>");
			str.append("<option value='0'>Select Vendor</option>");
			
			for(Master master : vendorList){
				str.append("<option value='"+master.getId()+"'>"+master.getName()+"</option>");
			}
			
			str.append("</select>");
			
			response.setContentType("text/html");
			response.setHeader("Cache-Control", "no-cache");
			response.getWriter().write(str.toString());
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		return null;
	}
	
	public String sendotp(){
		int customerid = loginInfo.getId();	
		Connection connection = null;
		try{
			connection = Connection_provider.getconnection();
			RegisterDAO registerDAO = new JDBCRegisterDAO(connection);
    		Register register = registerDAO.editregistration(Integer.toString(customerid));
    		String mob = register.getMobile();
			
			String otp = DateTimeUtils.getOTP();
			String cc = "";
			String subject = "One Time Password";
			String notes = "One Time Password for laundry booking is "+otp+". Please use this password to confirm order.";
			
			
				SmsService s = new SmsService();
				s.sendSms(notes, mob);
				
				session.setAttribute("sessionotp", otp);
				
		}catch(Exception e){
			e.printStackTrace();
		}
			
		
		return "sendotp";
	}
	
	public String confirmotp(){
		
		String otp  = (String) session.getAttribute("sessionotp");
		response.setContentType("text/html");
		response.setHeader("Cache-Control", "no-cache");
		try {
			response.getWriter().write(otp);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		return null;
	}
	
	public String thx(){
		
		return "thx";
	}
	
	public String input() throws Exception{
		if(!verifyLogin(request)){
			return "login";
		}
		
		session.removeAttribute("cartList");
		String pickup_date = masterForm.getPickup_date();
		String deliver_date = masterForm.getDeliver_date();
		
		if(pickup_date.equals("")){
			DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
			Calendar cal = Calendar.getInstance();
			//cal.add(Calendar.DATE, -7); 
			pickup_date = dateFormat.format(cal.getTime());
			masterForm.setPickup_date(pickup_date);
		}
		if(deliver_date.equals("")){
			DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
			Calendar cal = Calendar.getInstance();
			//cal.add(Calendar.DATE, -7); 
			deliver_date = dateFormat.format(cal.getTime());
			masterForm.setDeliver_date(deliver_date);
		}
		
		session.removeAttribute("cartList");
	
		Connection connection = null;
		String action = request.getParameter("action");
		try {
			connection = Connection_provider.getconnection();
			ServiceDAO serviceDAO = new JDBCServiceDAO(connection);
			
			ArrayList<Master> list = serviceDAO.getserviceList(action);
			masterForm.setServiceList(list);
			
			ArrayList<Master> list2 = serviceDAO.getitemList(action);
			masterForm.setItemList(list2);
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			connection.close();
		}
		return "input";
	}
	
	public String id(){
		Connection connection = null;
		String selectedid = request.getParameter("id");
		try {
			connection = Connection_provider.getconnection();
			ServiceDAO serviceDAO = new JDBCServiceDAO(connection);
			
			ArrayList<Master> subitemList = serviceDAO.getsubitemList(selectedid, loginInfo.getId(), loginInfo.getUserType());
			
			StringBuffer str = new StringBuffer();
			str.append("<select class='form-control' name='subitem' id='subitem' onchange='setpriceAjax(this.value)' >");
			str.append("<option value='0'>Select Sub-Item</option>");
			
			for(Master master : subitemList){
				
				str.append("<option value='"+master.getId()+"'>"+master.getSubitem()+"</option>");
			}
			
            str.append("</select>");
			
			response.setContentType("text/html");
			response.setHeader("Cache-Control", "no-cache");
			response.getWriter().write(str.toString());
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
		
		
	}
	
	public String cart(){
		Connection connection = null;
	
		String service = request.getParameter("serviceid");
		String item = request.getParameter("id");
		String subitemid = request.getParameter("subitem");
		String qty = request.getParameter("qty");
		String pickup_date = request.getParameter("pickup_date");
		String deliver_date = request.getParameter("deliver_date");
		String ptime = request.getParameter("ptime");
		String dtime = request.getParameter("dtime");
		try {
			connection = Connection_provider.getconnection();
			ServiceDAO serviceDAO = new JDBCServiceDAO(connection);
			Cart cart = serviceDAO.getprice(subitemid);
			

			cart.setServices(service);
			cart.setItem(item);
			cart.setQty(qty);
			cart.setPickup_date(pickup_date);
			cart.setDeliver_date(deliver_date);
			cart.setPtime(ptime);
			cart.setDtime(dtime);
			
			double tp = Double.parseDouble(cart.getPrice()) * Double.parseDouble(qty);
			cart.setTotalprice(Double.toString(tp));
			
			ArrayList<Cart> cartList = new ArrayList<Cart>();
			if(session.getAttribute("cartList")!=null){
				cartList = (ArrayList<Cart>) session.getAttribute("cartList");
			}
			
			cartList.add(cart);
			session.setAttribute("cartList", cartList);
			showCartList();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return null;
		
	}
	
	private void showCartList() throws Exception {
		// TODO Auto-generated method stub
		ArrayList<Cart> cartList = (ArrayList<Cart>)session.getAttribute("cartList");
		StringBuffer str = new StringBuffer();
		int i = 0;
		
		double cartprice = 0;
		for(Cart cart : cartList){
			str.append("<li class='product'><div class='product-details'>");
			str.append("<h3><a href='#0'>"+cart.getSubitem()+"</a></h3>");
			str.append("<span class='price'>"+cart.getTotalprice()+"</span>");
			str.append("<div class='actions'>");
			str.append("<a href='#' onclick='deletecartitem("+i+")' class='delete-item'>Delete</a>");
			str.append("<div class='quantity'>");
			str.append("<label for='cd-product-'"+i+"''>Qty</label>");
			str.append("<span class='select'>");
			str.append(""+cart.getQty()+"");
			str.append("</span>");
			str.append("</div></div></div></li>");
			
			cartprice = cartprice + (Double.parseDouble(cart.getPrice())*Integer.parseInt(cart.getQty()));
			
			i++;
		}
		
		str.append("<input type='hidden' name='hdnchkoutamtid' id='hdnchkoutamtid' value='"+cartprice+"'>");
		response.setContentType("text/html");
		response.setHeader("Cache-Control", "no-cache");
		response.getWriter().write(str.toString());
		
	}
	
	public String cartinvoice() throws Exception{
		if(!verifyLogin(request)){
			return "login";
		}
		Connection connection = null;
		try {
			connection = Connection_provider.getconnection();
			ServiceDAO serviceDAO = new JDBCServiceDAO(connection);
			
			Cart cart1 = new Cart();
			cart1.setVendor(masterForm.getVendor());
			cart1.setPickup_date(DateTimeUtils.getCommencingDate(masterForm.getPickup_date()));
			cart1.setDeliver_date(DateTimeUtils.getCommencingDate(masterForm.getDeliver_date()));
			cart1.setPtime(masterForm.getPtime());
			cart1.setDtime(masterForm.getDtime());
			
			
			int invoiceid = serviceDAO.insertcartdata(loginInfo.getUserId(), cart1, loginInfo.getId());
			
		    ArrayList<Cart> cartlist = (ArrayList<Cart>) session.getAttribute("cartList");
			double total = 0, orderamt=0;
			for(Cart cart : cartlist){
				double orderamount = Double.parseDouble(cart.getTotalprice());
				orderamt = orderamt+orderamount;
				
				int r = serviceDAO.savedata(cart, invoiceid);
				
				double gst = Double.parseDouble(cart.getCgst()) + Double.parseDouble(cart.getSgst());
				double gstvalue = Double.parseDouble(cart.getTotalprice())*gst/100 ;
				double totalprice = Double.parseDouble(cart.getTotalprice()) + gstvalue;
				
				total = total + totalprice;
			}
			
			System.out.println(orderamt);
		    System.out.println(total);
		    
		    int updatedebit = serviceDAO.getdebitupdated(invoiceid, total);
		    
		    ArrayList<Master> assesementList = serviceDAO.getassesementlist(invoiceid);	    
		    masterForm.setAssessmentList(assesementList);
		    
		    Master master = assesementList.get(assesementList.size()-1);
		    
		    masterForm.setCarttotal(DateTimeUtils.changeFormat(total));
		    masterForm.setOrderamount(DateTimeUtils.changeFormat(orderamt));
		    
		    masterForm.setTotalcgstvalue(master.getTotalcgstvalue());
		    masterForm.setTotalsgstvalue(master.getTotalsgstvalue());
		    
		    ArrayList<Master> list = serviceDAO.getcustomerinfo(loginInfo.getId());
		    masterForm.setCustinfo(list);
		    masterForm.setPickup_date(cart1.getPickup_date());
		    masterForm.setPtime(cart1.getPtime());
		    masterForm.setDeliver_date(cart1.getDeliver_date());
		    masterForm.setDtime(cart1.getDtime());
		    
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			connection.close();
		}
		return "cartinvoice";
	}
	
	public String getprice(){
		Connection connection = null;
		String subitemid = request.getParameter("subitemid");
		String quantity = request.getParameter("quantity");
		try {
			connection = Connection_provider.getconnection();
			ServiceDAO serviceDAO = new JDBCServiceDAO(connection);
			
			double price = serviceDAO.Itemprice(subitemid);
			
			price = price * Integer.parseInt(quantity);
			
			
			/*StringBuffer str = new StringBuffer();
			str.append("<div>");
			str.append("<input type='text' id='price' name='text' value="+price+" readonly='readonly'>");
			str.append("</div>");*/
			
			response.setContentType("text/html");
			response.setHeader("Cache-Control", "no-cache");
			response.getWriter().write(Double.toString(price));
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
		
	}
	
	public String deletecart(){
		Connection connection = null;
		try{
			String selectedid = request.getParameter("selectedid");
			
			ArrayList<Cart> cartlist = (ArrayList<Cart>) session.getAttribute("cartList");
			cartlist.remove(Integer.parseInt(selectedid));
					
			//showCartList();		
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return null;
		
	}
	
	public String displaycart(){
		Connection connection = null;
		
		String vendor = masterForm.getVendorname();
		int vendorid = Integer.parseInt(vendor);
		String customerid = masterForm.getName();
		
	
		
		
		String fromDate = masterForm.getFromdate();
		String toDate = masterForm.getTodate();	
		
		if(fromDate.equals("")){
			DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
			Calendar cal = Calendar.getInstance();
			cal.add(Calendar.DATE, -7); 
			fromDate = dateFormat.format(cal.getTime());
			masterForm.setFromdate(fromDate);
		}
		if(toDate.equals("")){
			DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
			Calendar cal = Calendar.getInstance();
			//cal.add(Calendar.DATE, -7); 
			toDate = dateFormat.format(cal.getTime());
			masterForm.setTodate(toDate);
		}
		
		
		if(!fromDate.equals("")){
			String temp[]= fromDate.split("/");	
			fromDate = temp[2]+"-"+temp[1]+"-"+temp[0];
		}
		if(!toDate.equals("")){
			String temp1[]= toDate.split("/");
			toDate = temp1[2]+"-"+temp1[1]+"-"+temp1[0];
		}
		try{
			
			connection = Connection_provider.getconnection();
			ServiceDAO serviceDAO = new JDBCServiceDAO(connection);
			
					
			//for vendor
			if(loginInfo.getUserType()==2){
				masterForm.setVendorname(Integer.toString(loginInfo.getId()));
				vendorid = loginInfo.getId();
			}
			
			/*int vendorid = loginInfo.getId();*/
			ArrayList<Master> list = serviceDAO.getcartdata(customerid,vendorid,fromDate,toDate);
			masterForm.setCartitemList(list);

			
			ArrayList<Master> clienlist = serviceDAO.getcustomerlist(vendorid);
			masterForm.setCustomerList(clienlist);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "displaycart";
	}
	
	public String createinvoice() throws Exception{
		Connection connection = null;
		String customerid = masterForm.getName();
		String selectedid = "";
		double totaldeb = 0;
		try{
			connection = Connection_provider.getconnection();
			ServiceDAO serviceDAO = new JDBCServiceDAO(connection);
			
			int invoiceid = serviceDAO.saveinvcharge(customerid);
			
			String data = masterForm.getSelectedchk();
			/*data = data.substring(0,data.length()-1);*/
			String temp[] = data.split(",");
			for(int i =1; i<temp.length; i++){
				selectedid = temp[i];
				
				 double debit = serviceDAO.getdebitAmount(selectedid);
				 totaldeb = totaldeb + debit;
				 
				 int prodcharge = serviceDAO.savechargeproduct(invoiceid, selectedid);
			}
			
			double updatedeb = serviceDAO.updatedebit(invoiceid, totaldeb);
			session.setAttribute("customerid", customerid);
		
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			connection.close();
		}
		
		return "createinvoice";
		
	}

	public MasterForm getModel() {
		// TODO Auto-generated method stub
		return masterForm;
	}

	public void prepare() throws Exception {
		// TODO Auto-generated method stub
		Connection connection = null;
		try{
			connection = Connection_provider.getconnection();
			ServiceDAO serviceDAO = new JDBCServiceDAO(connection);
			
			ArrayList<Master> list = serviceDAO.getVendorList();
			masterForm.setVendorList(list);
			
			masterForm.setPickupTimeList(PopulateList.startTimeList());
			masterForm.setDeliverTimeList(PopulateList.endTimeList());
			
	
		}catch(Exception e){
			e.printStackTrace();
		}
		 
	}

	
}
