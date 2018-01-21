package com.laundry.Register.eu.blogic.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import com.laundry.Register.eu.bi.ServiceDAO;
import com.laundry.Register.eu.entity.Cart;
import com.laundry.Register.eu.entity.Master;
import com.laundry.common.utils.DateTimeUtils;
import com.laundry.main.eu.blogic.jdbc.JDBCBaseDAO;

public class JDBCServiceDAO extends JDBCBaseDAO implements ServiceDAO {

	public JDBCServiceDAO(Connection connection){
		
		this.connection = connection;
	}

	public ArrayList<Master> getserviceList(String action) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		ArrayList<Master> list = new ArrayList<Master>();
		
		String sql = "select id, name from l_services";
		try {
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()){
				Master master = new Master();
				master.setId(rs.getInt(1));
				master.setServices(rs.getString(2));
				
				list.add(master);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}

	public ArrayList<Master> getitemList(String action) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		ArrayList<Master> list = new ArrayList<Master>();
		String a = "";
		if(action.equals("d")){
			a = "2";
		}else{
			a = "1";
		}
		
		String sql = "select id, name from l_item where type='"+a+"'";
		try {
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()){
				Master master = new Master();
				master.setId(rs.getInt(1));
				master.setItem(rs.getString(2));
				
				list.add(master);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}

	public ArrayList<Master> getsubitemList(String selectedid, int id) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		ArrayList<Master> list = new ArrayList<Master>();
		String sql = "select id, name from l_subitem where itemid='"+selectedid+"' and customerid="+id+"  ";
		try {
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()){
				Master master = new Master();
				
				master.setId(rs.getInt(1));
				master.setSubitem(rs.getString(2));
				
				list.add(master);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return list;
	}

	
	public Cart getprice(String subitemid) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		Cart cart = new Cart();
		String sql = "select name, price, cgst, sgst from l_subitem where id='"+subitemid+"'";
		try {
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()){
				
				cart.setSubitem(rs.getString(1));
				cart.setPrice(rs.getString(2));
				cart.setCgst(rs.getString(3));
				cart.setSgst(rs.getString(4));
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return cart;
	}

	
	public int insertcartdata(String userId, Cart cart1, int id) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		int result = 0;
		int invoiceid = 0;
		String sql = "insert into cart_invoice(userid, date, debit, pickup_date, pick_time, deliver_date, deliver_time, customerid, vendor) values(?,?,?,?,?,?,?,?,?)";
		try {
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, userId);
			preparedStatement.setString(2, DateTimeUtils.getLastModifiedDate(new Date()));
			preparedStatement.setString(3, "500");
			preparedStatement.setString(4, cart1.getPickup_date());
			preparedStatement.setString(5, cart1.getPtime());
			preparedStatement.setString(6, cart1.getDeliver_date());
			preparedStatement.setString(7, cart1.getDtime());
			preparedStatement.setInt(8, id);
			preparedStatement.setString(9, cart1.getVendor());
			
			  result = preparedStatement.executeUpdate();
			
			if(result == 1){
				ResultSet rs = preparedStatement.getGeneratedKeys();
				if(rs.next()){
					invoiceid = rs.getInt(1);
				}
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return invoiceid;
	}

	
	public int savedata(Cart cart, int invoiceid) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		int result = 0;
		String sql = "insert into cart_product(invoiceid, service, item, subitem, quantity, price, pick_date, del_date, pick_time, del_time, cgst, sgst) values(?,?,?,?,?,?,?,?,?,?,?,?) ";
		try {
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setInt(1, invoiceid);
			preparedStatement.setString(2, cart.getServices());
			preparedStatement.setString(3, cart.getItem());
			preparedStatement.setString(4, cart.getSubitem());
			preparedStatement.setString(5, cart.getQty());
			preparedStatement.setString(6, cart.getPrice());
			preparedStatement.setString(7, cart.getPickup_date());
			preparedStatement.setString(8, cart.getDeliver_date());
			preparedStatement.setString(9, cart.getPtime());
			preparedStatement.setString(10, cart.getDtime());
			preparedStatement.setString(11, cart.getCgst());
			preparedStatement.setString(12, cart.getSgst());
			
			preparedStatement.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}

	
	public int getdebitupdated(int invoiceid, double total) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		int debit = 0;
		String sql = "update cart_invoice set debit=? where id='"+invoiceid+"'";
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, Double.toString(total));
			
			preparedStatement.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return debit;
	}

	
	public double Itemprice(String subitemid) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		double price = 0;
		String sql = "select price from l_subitem where id ='"+subitemid+"';";
		try {
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()){
				price = rs.getDouble(1);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return price;
	}

	
	public ArrayList<Master> getassesementlist(int invoiceid) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		ArrayList<Master> list = new ArrayList<Master>();
		String sql = "select item from cart_product where invoiceid="+invoiceid+" group by item";
		try {
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()){
				Master master = new Master();
				master.setItem(rs.getString(1));
				String item = getitemname(master.getItem());
				
				master.setItem(item);
				ArrayList<Cart> productlist = getproductlist(invoiceid,item,rs.getString(1));
				Cart cart = productlist.get(productlist.size()-1);
				master.setTotalcgstvalue(cart.getTotalcgstvalue());
				master.setTotalsgstvalue(cart.getTotalsgstvalue());
				
				master.setProductlist(productlist);
				list.add(master);
				
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}

	private ArrayList<Cart> getproductlist(int invoiceid,String item,String itemid) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		ArrayList<Cart> productlist = new ArrayList<Cart>();
		double totalcgstvalue = 0, totalsgstvalue = 0; 
		
		String sql = "select subitem, quantity, price, cgst, sgst from cart_product where invoiceid="+invoiceid+" and item = "+itemid+" ";
		try {
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()){
				Cart cart = new Cart();
				
				cart.setSubitem(rs.getString(1));
				cart.setQty(rs.getString(2));
				cart.setPrice(rs.getString(3));
				cart.setCgst(rs.getString(4));
				cart.setSgst(rs.getString(5));
				cart.setItem(item);
				
				double gst = Double.parseDouble(cart.getCgst()) + Double.parseDouble(cart.getSgst());
				double tp = Double.parseDouble(cart.getPrice())*Integer.parseInt(cart.getQty());
				
				double cgstvalue = tp * Integer.parseInt(cart.getCgst())/100 ;
				Double sgstvalue = tp * Integer.parseInt(cart.getSgst())/100 ;
				
				totalcgstvalue = totalcgstvalue + cgstvalue;
				totalsgstvalue = totalsgstvalue + sgstvalue;
				
				cart.setTotalcgstvalue(DateTimeUtils.changeFormat(totalcgstvalue));
				cart.setTotalsgstvalue(DateTimeUtils.changeFormat(totalsgstvalue));
				cart.setGst(gst);
				cart.setTotalprice(Double.toString(tp));
				productlist.add(cart);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return productlist;
	}

	public String getitemname(String item) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		String item1 = "";
		String sql = "select name from l_item where id='"+item+"' ";
		try {
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()){
				item1 = rs.getString(1);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return item1;
	}

	
	public ArrayList<Master> getcartdata(String customerid,int vendorid,String fromdate,String  todate) {
		
		todate = todate + " 23:55:55";
		
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		ArrayList<Master> list = new ArrayList<Master>();
		String sql = "";
		 if(!customerid.equals("0")){
			 sql = "select id, date, debit from cart_invoice where customerid='"+customerid+"' and vendor = "+vendorid+" "
			 		+ " and date between '"+fromdate+"' and '"+todate+"' ";
		 }else{
			 sql = "select id, date, debit from cart_invoice where vendor = "+vendorid+" and "
			 		+ " date between '"+fromdate+"' and '"+todate+"' ";
		 }
		
		try{
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()){
				Master master = new Master();
				
				master.setId(rs.getInt(1));	
				master.setDate(rs.getString(2));
				master.setDebit(rs.getString(3));
				
				String date = master.getDate();
				String temp[] = date.split(" ");
				date = DateTimeUtils.getCommencingDate1(temp[0])+" "+temp[1];
				master.setDate(date);
				
				ArrayList<Cart> cartprodlist = getcartproductlist(master.getId());
				master.setProductlist(cartprodlist);
				
				boolean checkchargeinvoiced = checkChargeInvoiced(master.getId());
				
				if(!checkchargeinvoiced){
					list.add(master);
				}
				
				
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}

	private boolean checkChargeInvoiced(int id) {
		PreparedStatement preparedStatement = null;
		boolean result = false;
		String sql = "SELECT * FROM cartcharge_product where invoiceid = "+id+" ";
		
		try{
			
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next()){
				result = true;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		
		return result;
	}

	private ArrayList<Cart> getcartproductlist(int id) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		ArrayList<Cart> cartprodlist = new ArrayList<Cart>();
		String sql = "select subitem, quantity, price, invoiceid from cart_product where invoiceid ="+id+" ";
		
		try{
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()){
				Cart cart = new Cart();
	            
				cart.setSubitem(rs.getString(1));
				cart.setQty(rs.getString(2));
				cart.setPrice(rs.getString(3));
				cart.setInvoiceid(rs.getString(4));
				
				double tprice = Integer.parseInt(cart.getQty()) * Double.parseDouble(cart.getPrice());
				cart.setTotalprice(DateTimeUtils.changeFormat(tprice));
				
				cartprodlist.add(cart);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return cartprodlist;
	}

	
	public double getdebitAmount(String selectedid) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		double debit = 0;
		String sql = "select debit from cart_invoice where id ='"+selectedid+"' ";
		try{
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()){
				debit = rs.getDouble(1);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return debit;
	}

	
	public ArrayList<Master> getcustomerlist(int vendorid) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		ArrayList<Master> list = new ArrayList<Master>();
		String sql = "select registration.id, name, surname from registration inner join cart_invoice "
				+ " on cart_invoice.customerid = registration.id "
				+ " where vendor = "+vendorid+" group by cart_invoice.customerid ";
		try{
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs =  preparedStatement.executeQuery();
			while(rs.next()){
				Master master = new Master();
				master.setId(rs.getInt(1));
				master.setName(rs.getString(2)+" "+rs.getString(3));
				
				list.add(master);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}

	
	public int saveinvcharge(String customerid) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		int result = 0 ;
		int invoiceid = 0;
		String sql = "insert into cartcharge_invoice(customerid, date, debit, discount) values(?,?,?,?)";
		try{
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, customerid);
			preparedStatement.setString(2, DateTimeUtils.getLastModifiedDate(new Date()));
			preparedStatement.setString(3, "0");
			preparedStatement.setString(4, "0");
			
			result = preparedStatement.executeUpdate();
			
			if(result == 1){
				ResultSet rs = preparedStatement.getGeneratedKeys();
				if(rs.next()){
					invoiceid = rs.getInt(1);
				}
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return invoiceid;
	}

	
	public int savechargeproduct(int invoiceid, String selectedid) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		int result = 0;
		String sql = "insert into cartcharge_product(invoiceid, charge_invoiceid) values(?,?)";
		try{
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, selectedid);
			preparedStatement.setInt(2, invoiceid);
			
			preparedStatement.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}

	
	public double updatedebit(int invoiceid, double totaldeb) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		double debit  = 0;
		String sql = "update cartcharge_invoice set debit="+totaldeb+" where id="+invoiceid+" ";
		try{
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return debit;
	}

	public ArrayList<Master> getVendorList(String postcode) {
		PreparedStatement preparedStatement = null;
		ArrayList<Master>list = new ArrayList<Master>();
		String sql = "SELECT id, name, postname,customer_type FROM registration where pincode = "+postcode+" and customer_type = 2 and custstatus = 0 ";
		
		try{
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()){
				Master master = new Master();
				master.setId(rs.getInt(1));
				master.setName(rs.getInt(1) +"-"+(rs.getString(2))+"("+(rs.getString(3))+")");
				
				list.add(master);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}

	
	public ArrayList<Master> getVendorList() {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		ArrayList<Master>list = new ArrayList<Master>();
		String sql = "SELECT id, concat(name,' ',surname) FROM registration where customer_type = 2 ";
		
		try{
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()){
				Master master = new Master();
				master.setId(rs.getInt(1));
				master.setVendorname(rs.getString(2));
				
				list.add(master);
			}
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	
	public ArrayList<Master> getcustomerinfo(int id) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		ArrayList<Master> list = new ArrayList<Master>();
		String sql = "select id,  concat(name,' ',surname), mobile, email, address, landmark, city, pincode from registration where id="+id+" ";
		try{
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()){
				Master master = new Master();
				master.setId(rs.getInt(1));
				master.setName(rs.getString(2));
				master.setMobile(rs.getString(3));
				master.setEmail(rs.getString(4));
				master.setAddress(rs.getString(5)+", "+rs.getString(6)+", "+rs.getString(7)+", "+rs.getString(8));
				
				list.add(master);
				
			}
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}

	public String checkEmailIdExist(String email) {
		PreparedStatement preparedStatement = null;
		String reslt = "false";
		String sql = "SELECT * FROM registration where email = '"+email+"' ";
		
		try{
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next()){
				reslt = "true";
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return reslt;
	}

	
}
