package com.laundry.Account.eu.blogic.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.laundry.Account.eu.bi.AccountDAO;
import com.laundry.Account.eu.entity.Account;
import com.laundry.Register.eu.bi.MasterDAO;
import com.laundry.Register.eu.bi.RegisterDAO;
import com.laundry.Register.eu.bi.ServiceDAO;
import com.laundry.Register.eu.blogic.jdbc.JDBCMasterDAO;
import com.laundry.Register.eu.blogic.jdbc.JDBCRegisterDAO;
import com.laundry.Register.eu.blogic.jdbc.JDBCServiceDAO;
import com.laundry.Register.eu.entity.Cart;
import com.laundry.Register.eu.entity.Master;
import com.laundry.Register.eu.entity.Register;
import com.laundry.common.utils.DateTimeUtils;
import com.laundry.main.eu.blogic.jdbc.JDBCBaseDAO;
import com.laundry.main.web.common.helper.LoginInfo;

public class JDBCAccountDAO extends JDBCBaseDAO implements AccountDAO {

	public JDBCAccountDAO(Connection connection){
		 this.connection = connection;
	}

	
	public ArrayList<Account> getchargeinvoice(String customerid,int vendorid,int usertype,String fromdate,String todate) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		ArrayList<Account> list = new ArrayList<Account>();
		StringBuffer sql = new StringBuffer();
		
		todate = todate + " 23:55:55";
		
		sql.append("SELECT cartcharge_invoice.id, cartcharge_invoice.date, cartcharge_invoice.debit, discount ");
		sql.append("FROM cartcharge_invoice ");
		sql.append("inner join cartcharge_product on cartcharge_product.charge_invoiceid = cartcharge_invoice.id ");
		sql.append("inner join cart_invoice on ");
		sql.append("cart_invoice.id = cartcharge_product.invoiceid ");
		sql.append("where cartcharge_invoice.date between '"+fromdate+"' and '"+todate+"' ");
		
		if(usertype==2){
			sql.append("and cart_invoice.customerid = "+customerid+" and vendor = "+vendorid+" ");
		}else{
			vendorid = Integer.parseInt(customerid);
			sql.append("and vendor = "+vendorid+" ");
		}
		
		sql.append("group by cartcharge_invoice.id ");
		
		
	    try{ 
	    	preparedStatement = connection.prepareStatement(sql.toString());
	    	ResultSet rs = preparedStatement.executeQuery();
	    	while(rs.next()){
	    		Account account = new Account();
	    		
	    		account.setChargeinvid(rs.getString(1));
	    		account.setBilldate(rs.getString(2));
	    		account.setDebit(rs.getString(3));
	    		account.setDiscount(rs.getString(4));
	    		
	    		double discount = Double.parseDouble(account.getDebit())*Integer.parseInt(account.getDiscount())/100 ;
	    		double debit = Double.parseDouble(account.getDebit()) - discount;
	    		
	    		double credit = getcreditamount(account.getChargeinvid());
	    		double balance = debit - credit;
	    		
	    		account.setDebit(DateTimeUtils.changeFormat(debit));
	    		account.setCredit(DateTimeUtils.changeFormat(credit));
	    		account.setBalance(DateTimeUtils.changeFormat(balance));
	    		
	    		String bildate = account.getBilldate();
	    		String temp[] = bildate.split(" ");
	    		bildate = DateTimeUtils.getCommencingDate1(temp[0]);
	    		account.setBilldate(bildate);
	    		
	    		ArrayList<Master> chargelist = getchargelist(rs.getInt(1));
	    		account.setChargeslist(chargelist);
	    		account.setCustomerid(customerid);
	    		list.add(account);
	    	}
	    	
	    }catch(Exception e){
	    	e.printStackTrace();
	    }
	
		return list;
	}


	private double getcreditamount(String chargeinvid) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		double c = 0;
		String sql = "select sum(payment) from customer_payment where charge_invoice="+chargeinvid+" ";
		try{
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs= preparedStatement.executeQuery();
			while(rs.next()){
				c = rs.getDouble(1);
			}
			
		}catch(Exception e){	
			e.printStackTrace();
		}
		
		return c;
	}


	private ArrayList<Master> getchargelist(int chargeinvoiceid) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		ArrayList<Master> list1 = new ArrayList<Master>();
		//String sql = "select id, date, debit from cart_invoice where customerid='"+customerid+"' and vendor="+vendorid+" ";
		
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT cart_invoice.id, cart_invoice.date, cart_invoice.debit FROM cart_invoice  inner join cartcharge_product on ");
		sql.append("cartcharge_product.invoiceid = cart_invoice.id ");
		sql.append("where cartcharge_product.charge_invoiceid = "+chargeinvoiceid+" ");
		
		try{
			preparedStatement = connection.prepareStatement(sql.toString());
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()){
				Master master = new Master();
				
				master.setCartinvid(rs.getString(1));
				master.setDate(rs.getString(2));
				master.setDebit(rs.getString(3));
				
				ArrayList<Cart> productlist = getproductlist(master.getCartinvid());
				master.setProductlist(productlist);
				
				String d = master.getDate();
				String temp[] = d.split(" ");
				d = DateTimeUtils.getCommencingDate1(temp[0])+" "+temp[1];
				master.setDate(d);
				
				list1.add(master);
			}	
		}catch(Exception e){
			e.printStackTrace();
		}
		return list1;
	}


	private ArrayList<Cart> getproductlist(String cartinvid) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		ArrayList<Cart> productlist = new ArrayList<Cart>();
		String sql = "select id, subitem, quantity, price from cart_product where invoiceid='"+cartinvid+"' ";
		try{
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()){
				Cart cart = new Cart();
				
				cart.setId(rs.getInt(1));
				cart.setSubitem(rs.getString(2));
				cart.setQty(rs.getString(3));
				cart.setPrice(rs.getString(4));
				
				productlist.add(cart);
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return productlist;
	}


	public ArrayList<Account> getproductmasterlist(String selectedid) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		ArrayList<Account> list = new ArrayList<Account>();
		String sql = "SELECT  l_item.name,cart_product.item from cartcharge_invoice inner join cartcharge_product" +
                     " on cartcharge_product.charge_invoiceid = cartcharge_invoice.id inner join cart_invoice on cart_invoice.id = cartcharge_product.invoiceid" +
                      " inner join cart_product on cart_invoice.id = cart_product.invoiceid inner join l_item on cart_product.item =  l_item.id" +
                        " where cartcharge_invoice.id ='"+selectedid+"' group by cart_product.item";
		try{
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()){
				Account account = new Account();
				account.setName(rs.getString(1));
				account.setItem(rs.getString(2));
				
				ArrayList<Cart> itemprodlist = getitemproductlist(selectedid, account.getItem());
				account.setItemproductList(itemprodlist);
				
				Cart cart = itemprodlist.get(itemprodlist.size()-1);
				account.setDebit(cart.getDebit());
				account.setGst(DateTimeUtils.changeFormat(cart.getGst()));
				account.setTotalcgstvalue(cart.getTotalcgstvalue());
				account.setTotalsgstvalue(cart.getTotalsgstvalue());
				
				
				account.setTotaldebit(account.getDebit());
				
				account.setDate(cart.getDate());
				
				list.add(account);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return list;
	}


	private ArrayList<Cart> getitemproductlist(String selectedid, String item) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		ArrayList<Cart> list = new ArrayList<Cart>();
		double totalcgstvalue = 0, totalsgstvalue = 0, totaldebit=0;
		
		String sql = "SELECT  cartcharge_invoice.customerid, cartcharge_invoice.date, cartcharge_invoice.debit, discount, subitem, quantity, price"
				     +" from cartcharge_invoice inner join cartcharge_product on cartcharge_product.charge_invoiceid = cartcharge_invoice.id"
				      +" inner join cart_invoice on cart_invoice.id = cartcharge_product.invoiceid inner join cart_product on cart_invoice.id = cart_product.invoiceid"
				     +" where cartcharge_invoice.id ='"+selectedid+"' and cart_product.item ='"+item+"'";
		try{
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			ServiceDAO serviceDAO = new JDBCServiceDAO(connection);
			while(rs.next()){
				Cart cart = new Cart();
				
				String itemname = serviceDAO.getitemname(item);
				cart.setItem(itemname);
				cart.setCustomerid(rs.getString(1));
				cart.setDate(rs.getString(2));
				cart.setDebit(rs.getString(3));
				cart.setDiscount(rs.getString(4));
				cart.setSubitem(rs.getString(5));
				cart.setQty(rs.getString(6));
				cart.setPrice(rs.getString(7));
				
				double total = rs.getDouble(7) * rs.getInt(6);
				cart.setTotalamount(DateTimeUtils.changeFormat(total));
				
				double cgst = getcgst(cart.getSubitem(), item);
				double sgst = getsgst(cart.getSubitem(), item);
				
				double gst = cgst+sgst;
				
				double cgstvalue = total * cgst/100 ;
				double sgstvalue = total * sgst/100 ;
				
				totalcgstvalue = totalcgstvalue + cgstvalue;
				totalsgstvalue = totalsgstvalue + sgstvalue;
				
				
				cart.setGst(gst);
				cart.setTotalcgstvalue(DateTimeUtils.changeFormat(totalcgstvalue));
				cart.setTotalsgstvalue(DateTimeUtils.changeFormat(totalsgstvalue));
				
				String d = cart.getDate();
				String temp[] = d.split(" ");
				d = DateTimeUtils.getCommencingDate1(temp[0]);
				cart.setDate(d);
				
				list.add(cart);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}


	private double getsgst(String subitem, String item) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		double sgst = 0;
		String sql = "select sgst from l_subitem where name='"+subitem+"' and itemid="+item+" ";
		
		try{
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()){
				sgst = rs.getDouble(1);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return sgst;
	}


	private double getcgst(String subitem, String item) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		double cgst = 0;
		String sql = "select cgst from l_subitem where name='"+subitem+"' and itemid="+item+" ";
		
		try{
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()){
				cgst = rs.getDouble(1);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return cgst;
	}


	
	public int savecustpayment(Account account) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		int result = 0;
		String sql = "insert into customer_payment(customerid, charge_invoice, payment, paymode, paynote, date, deliver_status, vendorid) values(?,?,?,?,?,?,?,?)";
		
		try{
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, account.getCustomerid());
			preparedStatement.setString(2, account.getChargeinvid());
			preparedStatement.setString(3, account.getCredit());
			preparedStatement.setString(4, account.getHowpaid());
			preparedStatement.setString(5, account.getPaynote());
			preparedStatement.setString(6, DateTimeUtils.getCommencingDate(account.getDate()));
			preparedStatement.setString(7, "paid");
			preparedStatement.setString(8, account.getVendorname());
			
			preparedStatement.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}


	
	public ArrayList<Master> getVendorList() {
		PreparedStatement preparedStatement = null;
		ArrayList<Master>list = new ArrayList<Master>();
		String sql = "SELECT id, concat(name,' ',surname) FROM registration where customer_type = 2 ";
		
		try{
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()){
				Master master = new Master();
				master.setId(rs.getInt(1));
				master.setName(rs.getString(2));
				
				list.add(master);
			}
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}




	public String getBvendorName(int id) {
		PreparedStatement preparedStatement = null;
		String result = "";
		String sql = "SELECT concat(name,' ',surname) FROM registration where id = "+id+" ";
		
		try{
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next()){
				result = rs.getString(1);
			}
			
		}catch (Exception e) {
			// TODO: handle exception
		}
			
		return result;
	}


	
	public ArrayList<Account> getpaymentList(String fromdate, String todate, String vendorid, String howpaid) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		ArrayList<Account> list = new ArrayList<Account>();
	    double totalamount = 0;
		StringBuffer sql = new StringBuffer();
		
		sql.append("select id, customerid, charge_invoice, payment, paymode, date, vendorid from customer_payment");
		sql.append(" where date between '"+fromdate+"' and '"+todate+"'  ");
		if(!vendorid.equals("0")){
			sql.append(" and vendorid='"+vendorid+"' ");
		}if(!howpaid.equals("0")){
			sql.append(" and paymode='"+howpaid+"'  ");
		}
		
		try{
			preparedStatement = connection.prepareStatement(sql.toString());
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()){
				Account account = new Account();
				
				account.setId(rs.getInt(1));
				account.setCustomerid(rs.getString(2));
				
				RegisterDAO registerDAO = new JDBCRegisterDAO(connection);
				Register register = registerDAO.editregistration(account.getCustomerid());
				account.setName(register.getName()+" "+register.getSurname());
				
				account.setChargeinvid(rs.getString(3));
				account.setBalance(rs.getString(4));
				account.setHowpaid(rs.getString(5));
				account.setDate(DateTimeUtils.getCommencingDate1(rs.getString(6)));
				
				account.setVendorname(rs.getString(7));
				Register register1 = registerDAO.editregistration(account.getVendorname());
				account.setVendorname(register1.getName()+" "+register1.getSurname());
				
				totalamount = totalamount + Double.parseDouble(account.getBalance());
				account.setTotalamount(DateTimeUtils.changeFormat(totalamount));
				
				list.add(account);
				
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}


	
	public ArrayList<Master> getcuustBarcodeList(String fromDate, String toDate) {
		PreparedStatement preparedStatement = null;
		ArrayList<Master>list = new ArrayList<Master>();
		toDate = toDate + " 23:55:55";
		String sql = "SELECT customerid, concat(name,' ',surname) FROM cart_invoice inner join registration on "
				+ " registration.id = cart_invoice.customerid "
				+ " where date between '"+fromDate+"' and '"+toDate+"' "
				+ " group by customerid ";
		
		try{
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()){
				Master master = new Master();
				master.setId(rs.getInt(1));
				master.setName(rs.getString(2));
				
				list.add(master);
			}
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}


	
	public ArrayList<Master> getProdBarcodeList(String fromDate, String toDate) {
		PreparedStatement preparedStatement = null;
		ArrayList<Master>list = new ArrayList<Master>();
		toDate = toDate + " 23:55:55";
		String sql = "SELECT cart_product.id, concat(name,' ',surname),subitem,quantity FROM cart_product inner join cart_invoice on "
				+ " cart_invoice.id = cart_product.invoiceid "
				+ " inner join registration on registration.id = cart_invoice.customerid "
				+ " where date between '"+fromDate+"' and '"+toDate+"' ";
		
		try{
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()){
				Master master = new Master();
				master.setId(rs.getInt(1));
				master.setName(rs.getString(2));
				master.setSubitem(rs.getString(3));
				int qty = rs.getInt(4);
				list.add(master);
				
				if(qty>1){
					for(int i=1;i<qty;i++){
						list.add(master);
					}
				}
			}
			
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}


	
	public ArrayList<Account> getvendorinvoiceList() {
		// TODO Auto-generated method stub
		return null;
	}


	
	public Cart getbarcodeinfo(String selectedid) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		Cart cart = new Cart();
		String sql = "SELECT cart_invoice.id, customerid, vendor, item, subitem, quantity, price FROM cart_invoice "
		         		+ "inner join cart_product on cart_product.invoiceid = cart_invoice.id "
		         		+ "where cart_product.id ="+selectedid+" ";
		try{
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()){
				
				cart.setId(rs.getInt(1));
				cart.setCustomerid(rs.getString(2));
				cart.setVendor(rs.getString(3));
				cart.setItem(rs.getString(4));
				cart.setSubitem(rs.getString(5));
				cart.setQty(rs.getString(6));
				cart.setPrice(rs.getString(7));

			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return cart;
	}


	
	public int insertbarcodedata(Cart cart, String selectedid, LoginInfo loginInfo) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
	    int result = 0;
	    String logid = loginInfo.getId() + loginInfo.getSessionid();
	    String sql = "insert into barcode_reader (item, subitem, quantity, price, customerid, vendor, barcodeid, logsessionid) values(?,?,?,?,?,?,?,?)";
	    try{
	    	preparedStatement = connection.prepareStatement(sql);
	    	
	    	preparedStatement.setString(1, cart.getItem());
	    	preparedStatement.setString(2, cart.getSubitem());
	    	preparedStatement.setString(3, "1");
	    	preparedStatement.setString(4, cart.getPrice());
	    	preparedStatement.setString(5, cart.getCustomerid());
	    	preparedStatement.setString(6, cart.getVendor());
	    	preparedStatement.setString(7, selectedid);
	    	preparedStatement.setString(8, logid);
	    	
	    	preparedStatement.executeUpdate();
	    	
	    }catch(Exception e){
	    	e.printStackTrace();
	    }
		return result;
	}


	
	public ArrayList<Cart> getvendor(LoginInfo loginInfo) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		ArrayList<Cart> vendorlist = new ArrayList<Cart>();
		String logid = loginInfo.getId()+loginInfo.getSessionid();
		String sql = "select vendor from barcode_reader where logsessionid='"+logid+"'  group by vendor";
		try{
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()){
				Cart cart = new Cart();
				cart.setVendor(rs.getString(1));
				
				vendorlist.add(cart);
				
		}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return vendorlist;
	}


	
	public ArrayList<Cart> displaycabrcodeinf(String vendor, LoginInfo loginInfo) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		ArrayList<Cart> list = new ArrayList<Cart>();
		String logid = loginInfo.getId()+loginInfo.getSessionid();
		String sql = "select id, item, subitem, quantity, price, customerid, vendor, barcodeid from barcode_reader where vendor='"+vendor+"' and logsessionid='"+logid+"' "; 
		try{
			
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()){
				Cart cart = new Cart();
				
				cart.setId(rs.getInt(1));
				
				MasterDAO masterDAO = new JDBCMasterDAO(connection);
				Master master = masterDAO.edititem(rs.getString(2));
				cart.setItem(master.getItem());
				
			    cart.setSubitem(rs.getString(3));
			    cart.setQty(rs.getString(4));
			    cart.setPrice(rs.getString(5));
			    
			    RegisterDAO registerDAO = new JDBCRegisterDAO(connection);
			    Register register = registerDAO.editregistration(rs.getString(6));
			    cart.setCustomerid(register.getName()+" "+register.getSurname());
			    register = registerDAO.editregistration(rs.getString(7));
			    cart.setVendor(register.getName()+" "+register.getSurname());
			    cart.setBarcodeid(rs.getString(8));
			    
				list.add(cart);
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return list;
	}


	
	public int deletebarcodedata(LoginInfo loginInfo) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		int result = 0;
		String logid = loginInfo.getId()+loginInfo.getSessionid();
		String sql = "delete from barcode_reader where logsessionid='"+logid+"' ";
		try{
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}



	}
