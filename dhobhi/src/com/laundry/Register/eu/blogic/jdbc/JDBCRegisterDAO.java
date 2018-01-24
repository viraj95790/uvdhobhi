package com.laundry.Register.eu.blogic.jdbc;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import com.laundry.common.utils.DateTimeUtils;
import com.laundry.Register.eu.bi.RegisterDAO;
import com.laundry.Register.eu.entity.Register;
import com.laundry.main.web.common.utils.Encryption;

public class JDBCRegisterDAO extends JDBCBaseDAO implements RegisterDAO {
	
	public JDBCRegisterDAO(Connection connection){
		
		this.connection = connection;
	}
	
	public int insertdata(Register register) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		int result = 0;
		String sql = "insert into registration(name, surname, mobile, email, password, address, landmark, city, pincode, customer_type, usertype, modified_date,postname,vendorid) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			 String encPassword = Encryption.encryptSHA(register.getPassword());
			 register.setPassword(encPassword);
			
			
			
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, register.getName());
			preparedStatement.setString(2, register.getSurname());
			preparedStatement.setString(3, register.getMobile());
			preparedStatement.setString(4, register.getEmail());
			preparedStatement.setString(5, register.getPassword());
			preparedStatement.setString(6, register.getAddress());
			preparedStatement.setString(7, register.getLandmark());
			preparedStatement.setString(8, register.getCity());
			preparedStatement.setString(9, register.getPincode());
			preparedStatement.setString(10, register.getCustomer_type());
			preparedStatement.setString(11, register.getUsertype());
			preparedStatement.setString(12, DateTimeUtils.getLastModifiedDate(new Date()));
			preparedStatement.setString(13, register.getPostname());
			preparedStatement.setInt(14, register.getVendorid());
			
			preparedStatement.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}

	public ArrayList<Register> getRegisterdata(int usertype,int vendorid) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		ArrayList<Register> list = new ArrayList<Register>();
		String sql = "select id, name, surname, mobile, email, password, address, landmark, city, pincode, customer_type, usertype, modified_date, custstatus from registration";
		
		if(usertype==2){
			sql = "select id, name, surname, mobile, email, password, address, landmark, city, pincode, customer_type, usertype, modified_date, custstatus  "
					+ " from registration where vendorid = "+vendorid+" ";
		}
		
		try {
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()){
				Register register = new Register();
				
				register.setId(rs.getInt(1));
				register.setName(rs.getString(2)+" "+rs.getString(3));
				register.setMobile(rs.getString(4));
				register.setEmail(rs.getString(5));
				register.setPassword(rs.getString(6));
				register.setAddress(rs.getString(7));
				register.setLandmark(rs.getString(8));
				register.setCity(rs.getString(9));
				register.setPincode(rs.getString(10));
				register.setCustomer_type(rs.getString(11));
				register.setUsertype(rs.getString(12));
				register.setModified_date(rs.getString(13));
				register.setCuststatus(rs.getString(14));
				
				list.add(register);
				
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}

	public ArrayList<Register> getcustomertypeList() {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		ArrayList<Register> list = new ArrayList<Register>();
		String sql = "select id, name from customertype";
		try {
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()){
				Register register = new Register();
				
				register.setId(rs.getInt(1));
				register.setCustomer_type(rs.getString(2));
				
				list.add(register);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return list;
	}

	
	public Register editregistration(String selectedid) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		Register register = new Register();
		String sql = "select name, surname, mobile, email, address, landmark, city, pincode, customer_type from registration where id='"+selectedid+"'";
		try {
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()){
				register.setId(Integer.parseInt(selectedid));
				
				register.setName(rs.getString(1));
				register.setSurname(rs.getString(2));
				register.setMobile(rs.getString(3));
				register.setEmail(rs.getString(4));
				register.setAddress(rs.getString(5));
				register.setLandmark(rs.getString(6));
				register.setCity(rs.getString(7));
				register.setPincode(rs.getString(8));
				register.setCustomer_type(rs.getString(9));
				
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return register;
	}

	public int updateregistration(Register register) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		int result = 0;
		String sql = "update registration set name=?, surname=?, mobile=?, email=?, address=?, landmark=?, city=?, pincode=?, customer_type=?, modified_date=? where id=?";
		try {
            preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, register.getName());
			preparedStatement.setString(2, register.getSurname());
			preparedStatement.setString(3, register.getMobile());
			preparedStatement.setString(4, register.getEmail());
			preparedStatement.setString(5, register.getAddress());
			preparedStatement.setString(6, register.getLandmark());
			preparedStatement.setString(7, register.getCity());
			preparedStatement.setString(8, register.getPincode());
			preparedStatement.setString(9, register.getCustomer_type());
			preparedStatement.setString(10, DateTimeUtils.getLastModifiedDate(new Date()));
			preparedStatement.setInt(11, register.getId());
			
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}

	public int deletedata(String selectedid) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		int result = 0;
		String sql = "delete from registration where id='"+selectedid+"' ";
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}

	public Register getuser(String email) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		Register register = new Register();
		String sql = "select id, email, password, customer_type, name from registration where email = ? ";
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, email);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()){
				
				register.setId(rs.getInt(1));
				register.setEmail(rs.getString(2));
				register.setPassword(rs.getString(3));
				register.setUsertype(rs.getString(4));
				register.setName(rs.getString(5));
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return register;
	}

	
	public int updateclientstatus(String selectedid, String status) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		int cstatus = 0;
		String sql = "update registration set custstatus=? where id='"+selectedid+"' ";
		try{
			preparedStatement = connection.prepareStatement(sql);
			
			if(status.equals("0")){
				preparedStatement.setString(1, "1");
			}else{
				preparedStatement.setString(1, "0");
			}
			
			preparedStatement.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return cstatus;
	}
	
	
	public boolean checkEmailIdExist(String email) {
		PreparedStatement preparedStatement = null;
		boolean result = false;
		
		String sql = "select * from registration where email='"+email+"' ";
			
			
		
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

	public int saveGmailFBInfo(String email, String name, String fbId, String googleId, String userType) {
		PreparedStatement preparedStatement = null;
		int result = 0;
		String sql = "insert into registration (name,email,customer_type, usertype) values(?,?,?,?) ";
		
		try{
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, name);
			preparedStatement.setString(2, email);
			preparedStatement.setString(3, userType);
			preparedStatement.setString(4, userType);
			
			result = preparedStatement.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}

}
