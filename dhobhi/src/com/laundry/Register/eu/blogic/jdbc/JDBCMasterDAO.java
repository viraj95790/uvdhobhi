package com.laundry.Register.eu.blogic.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;



import com.laundry.Register.eu.bi.MasterDAO;
import com.laundry.Register.eu.bi.RegisterDAO;
import com.laundry.Register.eu.entity.Master;
import com.laundry.Register.eu.entity.Register;





public class JDBCMasterDAO extends JDBCBaseDAO implements MasterDAO {

	     public JDBCMasterDAO(Connection connection){
	    	 
	    	 this.connection = connection;
	     }

		public int insertservices(Master master) {
			// TODO Auto-generated method stub
			PreparedStatement preparedStatement = null;
			int result = 0;
			String sql = "insert into l_services(name) values(?)";
			try {
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setString(1, master.getServices());
				preparedStatement.executeUpdate();
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return result;
		}

		public ArrayList<Master> getserviceList() {
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

		public Master editservices(String selectedid) {
			// TODO Auto-generated method stub
			PreparedStatement preparedStatement = null;
			Master master = new Master();
			String sql = "select name from l_services where id='"+selectedid+"'";
			try {
				preparedStatement = connection.prepareStatement(sql);
				ResultSet rs = preparedStatement.executeQuery();
				while(rs.next()){
					master.setId(Integer.parseInt(selectedid));
					
					master.setServices(rs.getString(1));
				}
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return master;
		}

		public int updateservice(Master master) {
			// TODO Auto-generated method stub
			PreparedStatement preparedStatement = null;
			int result = 0;
			String sql = "update l_services set name=? where id=?";
			try {
				preparedStatement = connection.prepareStatement(sql);
				
				preparedStatement.setString(1, master.getServices());
				preparedStatement.setInt(2, master.getId());
				preparedStatement.executeUpdate();
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return result;
		}

		public int deleteservice(String selectedid) {
			// TODO Auto-generated method stub
			PreparedStatement preparedStatement = null;
			int result = 0;
			String sql = "delete from l_services where id='"+selectedid+"'";
			try {
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.executeUpdate();
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return result;
		}

		public int insertItem(Master master) {
			// TODO Auto-generated method stub
			PreparedStatement preparedStatement = null;
			int result = 0;
			String sql = "insert into l_item(name, type) values(?,?)";
			try {
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setString(1, master.getItem());
				preparedStatement.setString(2, master.getServices());
				
				preparedStatement.executeUpdate();
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return result;
		}

		public ArrayList<Master> getItemList() {
			// TODO Auto-generated method stub
			PreparedStatement preparedStatement = null;
			ArrayList<Master> list = new ArrayList<Master>();
			String sql = "select id, name from l_item";	
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

		public Master edititem(String selectedid) {
			// TODO Auto-generated method stub
			PreparedStatement preparedStatement = null;
			Master master = new Master();
			String sql = "select name, type from l_item where id='"+selectedid+"'";
			try {
				preparedStatement = connection.prepareStatement(sql);
				ResultSet rs = preparedStatement.executeQuery();
				while(rs.next()){
					master.setId(Integer.parseInt(selectedid));
					master.setItem(rs.getString(1));
					master.setServices(rs.getString(2));
					
				}
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return master;
		}

		public int updateItem(Master master) {
			// TODO Auto-generated method stub
			PreparedStatement preparedStatement = null;
			int result = 0;
			String sql = "update l_item set name=?, type=? where id=?";
			try {
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setString(1, master.getItem());
				preparedStatement.setString(2, master.getServices());
				preparedStatement.setInt(3, master.getId());
				preparedStatement.executeUpdate();
				
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return result;
		}

		public int deleteItem(String selectedid) {
			// TODO Auto-generated method stub
			PreparedStatement preparedStatement = null;
			int result = 0;
			String sql = "delete from l_item where id='"+selectedid+"'";
			try {
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.executeUpdate();
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return result;
		}

		public ArrayList<Master> getSubItemList() {
			// TODO Auto-generated method stub
			PreparedStatement preparedStatement = null;
			ArrayList<Master> list = new ArrayList<Master>();
			String sql = "select id, name, price, cgst, sgst, customerid from l_subitem";	
			try {
				preparedStatement = connection.prepareStatement(sql);
				ResultSet rs = preparedStatement.executeQuery();
				while(rs.next()){
					Master master = new Master();
					master.setId(rs.getInt(1));
					master.setSubitem(rs.getString(2));
					master.setPrice(rs.getString(3));
					master.setCgst(rs.getString(4));
					master.setSgst(rs.getString(5));
					
					RegisterDAO registerDAO = new JDBCRegisterDAO(connection);
					Register register = registerDAO.editregistration(rs.getString(6));
					master.setName(register.getName());
						
					list.add(master);
				}
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return list;
		}

		public int insertsubItem(Master master) {
			// TODO Auto-generated method stub
			PreparedStatement preparedStatement = null;
			int result = 0;
			String sql = "insert into l_subitem(name, itemid, price, cgst, sgst, customerid) values(?,?,?,?,?,?)";
			try {
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setString(1, master.getSubitem());
				preparedStatement.setString(2, master.getItem());
				preparedStatement.setString(3, master.getPrice());
				preparedStatement.setString(4, master.getCgst());
				preparedStatement.setString(5, master.getSgst());
				preparedStatement.setString(6, master.getName());
				
				preparedStatement.executeUpdate();
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return result;
			
		}

		public Master editsubItem(String selectedid) {
			// TODO Auto-generated method stub
			PreparedStatement preparedStatement = null;
			Master master = new Master();
			String sql = "select name, itemid, price, cgst, sgst, customerid from l_subitem where id='"+selectedid+"'";
			try {
				preparedStatement = connection.prepareStatement(sql);
				ResultSet rs = preparedStatement.executeQuery();
				while(rs.next()){
					master.setId(Integer.parseInt(selectedid));
					master.setSubitem(rs.getString(1));
					master.setItem(rs.getString(2));
					master.setPrice(rs.getString(3));
					master.setCgst(rs.getString(4));
					master.setSgst(rs.getString(5));
					master.setName(rs.getString(6));
					
				}
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return master;
		}

		public int updatesubItem(Master master) {
			// TODO Auto-generated method stub
			PreparedStatement preparedStatement = null;
			int result = 0;
			String sql = "update l_subitem set name=?, itemid=?, price=?, cgst=?, sgst=?, customerid=? where id=?";
			try {
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setString(1, master.getSubitem());
				preparedStatement.setString(2, master.getItem());
				preparedStatement.setString(3, master.getPrice());
				preparedStatement.setString(4, master.getCgst());
				preparedStatement.setString(5, master.getSgst());
				preparedStatement.setString(6, master.getName());
				preparedStatement.setInt(7, master.getId());
				
				preparedStatement.executeUpdate();
				
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return result;
		}

		public int deletesubItem(String selectedid) {
			// TODO Auto-generated method stub
			PreparedStatement preparedStatement = null;
			int result = 0;
			String sql = "delete from l_subitem where id='"+selectedid+"'";
			try {
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.executeUpdate();
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return result;
		}

	
		public ArrayList<Master> gethospitalList() {
			// TODO Auto-generated method stub
			PreparedStatement preparedStatement = null;
			ArrayList<Master> list = new ArrayList<Master>();
			String sql = "select id, name, surname from registration where customer_type='3' ";
			try{
				preparedStatement = connection.prepareStatement(sql);
				ResultSet rs = preparedStatement.executeQuery();
				while(rs.next()){
					Master master = new Master();
					master.setId(rs.getInt(1));
					master.setName(rs.getString(2)+" "+rs.getString(3));
					
					list.add(master);
				}
				
				Master master2 = new Master();
				master2.setName("other");
				
				
			}catch(Exception e){
				e.printStackTrace();
			}
			
			return list;
		}
		
	
	}
