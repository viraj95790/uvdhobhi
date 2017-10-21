package com.laundry.Account.web.action;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.filters.CsrfPreventionFilter;
import org.apache.struts2.ServletActionContext;

import com.laundry.Account.eu.bi.AccountDAO;
import com.laundry.Account.eu.blogic.jdbc.JDBCAccountDAO;
import com.laundry.Account.eu.entity.Account;
import com.laundry.Account.web.form.AccountForm;
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
import com.laundry.main.web.common.helper.LoginHelper;
import com.laundry.main.web.common.helper.LoginInfo;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

public class AccountAction extends BaseAction implements Preparable, ModelDriven<AccountForm> {

	HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
	HttpServletResponse response = (HttpServletResponse)ActionContext.getContext().get(ServletActionContext.HTTP_RESPONSE);
	HttpSession session = request.getSession(true);
	LoginInfo loginInfo = LoginHelper.getLoginInfo(request);
	
	AccountForm accountForm = new AccountForm();
	
	public String execute() throws Exception {
		if(!verifyLogin(request)){
			return "login";
		}
		Connection connection = null;
		String customerid = accountForm.getName();
		
		String fromDate = accountForm.getFromdate();
		String toDate = accountForm.getTodate();	
		
		if(fromDate.equals("")){
			DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
			Calendar cal = Calendar.getInstance();
			cal.add(Calendar.DATE, -7); 
			fromDate = dateFormat.format(cal.getTime());
			accountForm.setFromdate(fromDate);
		}
		if(toDate.equals("")){
			DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
			Calendar cal = Calendar.getInstance();
			//cal.add(Calendar.DATE, -7); 
			toDate = dateFormat.format(cal.getTime());
			accountForm.setTodate(toDate);
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
			AccountDAO accountDAO = new JDBCAccountDAO(connection);
			
			int vendorid = loginInfo.getId();
		
			ArrayList<Account> list = accountDAO.getchargeinvoice(customerid,vendorid,loginInfo.getUserType(),fromDate,toDate);
			accountForm.setChargeinvList(list);
			
			accountForm.setVname(Integer.toString(vendorid));
			
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			connection.close();
		}
		
		return "success";
		
	}
	
	public String createinvoice() throws Exception{
		Connection connection = null;
		String selectedid = request.getParameter("selectedid");
		String customerid = request.getParameter("customerid");
		
		try{
			connection = Connection_provider.getconnection();
			AccountDAO accountDAO = new JDBCAccountDAO(connection);
			
			RegisterDAO registerDAO = new JDBCRegisterDAO(connection);
    		Register register = registerDAO.editregistration(customerid);
    		
    		accountForm.setName(register.getName()+" "+register.getSurname());
    		accountForm.setAddress(register.getAddress()+","+register.getLandmark());
    		accountForm.setCity(register.getCity()+"-"+register.getPincode());
    		accountForm.setMobile(register.getMobile());
    		
    		
    		int vendorid = loginInfo.getId();
    		Register register1 = registerDAO.editregistration(Integer.toString(vendorid));
    		
    		accountForm.setVname(register1.getName()+" "+register1.getSurname());
    		accountForm.setVaddress(register1.getAddress()+","+register1.getLandmark());
    		accountForm.setVcity(register1.getCity()+"-"+register1.getPincode());
			accountForm.setVmobile(register1.getMobile());
    		
    		
			ArrayList<Account> itemlist = accountDAO.getproductmasterlist(selectedid);
			accountForm.setMasterProductList(itemlist);
			
			Account account = itemlist.get(itemlist.size()-1);
			accountForm.setDebit(account.getDebit());
			accountForm.setGst(account.getGst());
			accountForm.setTotalcgstvalue(account.getTotalcgstvalue());
			accountForm.setTotalsgstvalue(account.getTotalsgstvalue());
			accountForm.setTotaldebit(account.getTotaldebit());
			accountForm.setDate(account.getDate());
			accountForm.setId(Integer.parseInt(selectedid));
			
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			connection.close();
		}
		return "createinvoice";
		
	} 
	
	public String inputpayment(){
		Connection connection = null;
		String vendorid = request.getParameter("vendorid");
		String customerid = request.getParameter("customerid");
		String chargeid = request.getParameter("selectedid");
		String balance = request.getParameter("balance");
		
		try{
			connection = Connection_provider.getconnection();
			AccountDAO accountDAO = new JDBCAccountDAO(connection);
			
			RegisterDAO registerDAO = new JDBCRegisterDAO(connection);
    		Register register = registerDAO.editregistration(customerid);
    		
    		accountForm.setName(register.getName()+" "+register.getSurname());
    		accountForm.setVname(vendorid);
    		accountForm.setChargeinvid(chargeid);
    		accountForm.setDebit(balance);
    		
    		String date = DateTimeUtils.getLastModifiedDate(new Date());
    		String temp[] = date.split(" ");
    		date = DateTimeUtils.getCommencingDate1(temp[0]);
    		accountForm.setDate(date);
    
    		session.setAttribute("customerid", customerid);
			session.setAttribute("vendorid", vendorid);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "inputpayment";
		
	}
	
	public String customerpayment() throws Exception{
		Connection connection = null;
		String customerid = (String) session.getAttribute("customerid");  
		String vendorid = (String) session.getAttribute("vendorid");
		try{
			connection = Connection_provider.getconnection();
			AccountDAO accountDAO = new JDBCAccountDAO(connection);
			
			Account account = new Account();
			
			account.setCustomerid(customerid);
			account.setVendorname(vendorid);
			account.setChargeinvid(accountForm.getChargeinvid());
			account.setDebit(accountForm.getDebit());
			account.setCredit(accountForm.getCredit());
			account.setHowpaid(accountForm.getHowpaid());
			account.setDiscount(accountForm.getDiscount());
			account.setPaynote(accountForm.getPaynote());
			account.setDate(accountForm.getDate());
			
			double balance = Double.parseDouble(account.getDebit()) - Double.parseDouble(account.getCredit());
			accountForm.setBalance(DateTimeUtils.changeFormat(balance));
			
			int savepayment = accountDAO.savecustpayment(account);
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			connection.close();
		}
		return execute();
		
	}
	
	public String inputadminrecord() throws Exception{
		if(!verifyLogin(request)){
			return "login";
		}
		
		Connection connection = null;
		String vendorid = accountForm.getName();
		String howpaid = accountForm.getHowpaid();
		
		String fromdate = accountForm.getFromdate();
		String todate = accountForm.getTodate();
		
		if(fromdate.equals("")){
			DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
			Calendar cal = Calendar.getInstance();
			cal.add(Calendar.DATE, -7); 
			fromdate = dateFormat.format(cal.getTime());
			accountForm.setFromdate(fromdate);
		}
		if(todate.equals("")){
			DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
			Calendar cal = Calendar.getInstance();
			//cal.add(Calendar.DATE, -7); 
			todate = dateFormat.format(cal.getTime());
			accountForm.setTodate(todate);
		}
		
		if(!fromdate.equals("")){
			String temp[]= fromdate.split("/");
			fromdate = temp[2]+"-"+temp[1]+"-"+temp[0];
		}
		if(!todate.equals("")){
			String temp1[]= todate.split("/");
			todate = temp1[2]+"-"+temp1[1]+"-"+temp1[0];
		
		try{
			connection = Connection_provider.getconnection();
			AccountDAO accountDAO = new JDBCAccountDAO(connection);
			
	        ArrayList<Account> list = accountDAO.getpaymentList(fromdate, todate, vendorid, howpaid);
	        accountForm.setPaymentReportList(list);
	        
	        Account account = list.get(list.size()-1);
	        accountForm.setTotalamount(account.getTotalamount());
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			connection.close();
		}
		
		}
		return "inputadminrecord";
		
	}
	
	public String vendorinvoice() throws Exception{
		if(!verifyLogin(request)){
			return "login";
		}
		
		Connection connection = null;
		String vendorid = accountForm.getName();
		
		try{
			connection = Connection_provider.getconnection();
			AccountDAO accountDAO = new JDBCAccountDAO(connection);
			
			ArrayList<Account> list = accountDAO.getvendorinvoiceList();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			connection.close();
		}
		
		return "vendorinvoice";
	}
	
	
	public String readbarcode(){
		Connection connection = null;
		try{
			connection = Connection_provider.getconnection();
			AccountDAO accountDAO = new JDBCAccountDAO(connection);
			
			int delete = accountDAO.deletebarcodedata(loginInfo);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "readbarcode";
	}
	
	
	public String barcodeinfo() throws Exception{
		Connection connection = null;
		
		String selectedid = request.getParameter("selectedid");
		
		try{
			connection = Connection_provider.getconnection();
			AccountDAO accountDAO = new JDBCAccountDAO(connection);
			
			Cart cart = accountDAO.getbarcodeinfo(selectedid);
			
			int result = accountDAO.insertbarcodedata(cart, selectedid, loginInfo);
			
			ArrayList<Cart> vendorlist = accountDAO.getvendor(loginInfo);
			
			for(Cart cart2 : vendorlist){
				
				ArrayList<Cart> productlist = accountDAO.displaycabrcodeinf(cart2.getVendor(), loginInfo);
				
				RegisterDAO registerDAO = new JDBCRegisterDAO(connection);
				Register register = registerDAO.editregistration(cart2.getVendor());
				String vendor = register.getName()+" "+register.getSurname();
				
				StringBuffer str = new StringBuffer();
				str.append("<h4>"+vendor+"</h4>");
				str.append("<table class='table table-custom' border='1'>");
				str.append("<tr>"); 
				str.append("<th>Productid</th>");
				str.append("<th>Customer</th>");
				str.append("<th>Item</th>");
				str.append("<th>Subitem</th>");
				str.append("<th>Quantity</th>");
				str.append("<th>Price</th>");
				
				for(Cart cproduct : productlist ){
					str.append("<tr>");
					
					str.append("<td>"+cproduct.getBarcodeid()+"</td>");
					str.append("<td>"+cproduct.getCustomerid()+"</td>");
					str.append("<td>"+cproduct.getItem()+"</td>");
					str.append("<td>"+cproduct.getSubitem()+"</td>");
					str.append("<td>"+cproduct.getQty()+"</td>");
					str.append("<td>"+cproduct.getPrice()+"</td>");
					
					str.append("</tr>");
				}
				
				str.append("</tr>");
				str.append("<table>");
				
				response.setContentType("text/html");
				response.setHeader("Cache-Control", "no-cache");
				response.getWriter().write(str.toString());
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			connection.close();
		}
		
		return null;
	}

	
	public AccountForm getModel() {
		// TODO Auto-generated method stub
		return accountForm;
	}

	
	public void prepare() throws Exception {
		// TODO Auto-generated method stub
		Connection connection = null;
		try{
			connection = Connection_provider.getconnection();
			ServiceDAO serviceDAO = new JDBCServiceDAO(connection);
			AccountDAO accountDAO = new JDBCAccountDAO(connection);
			
			int vendorid = loginInfo.getId();
			ArrayList<Master> customerlist = serviceDAO.getcustomerlist(vendorid);
			accountForm.setCustomerList(customerlist);
			
			ArrayList<Master>vendorList = accountDAO.getVendorList();
			accountForm.setVendorList(vendorList);
			
			/*ArrayList<Account> custlist = accountDAO.getcustomerlist();
			accountForm.setCustomerList(custlist);*/
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
}
