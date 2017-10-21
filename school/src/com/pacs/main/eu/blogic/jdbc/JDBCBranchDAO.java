package com.pacs.main.eu.blogic.jdbc;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.pacs.common.utils.Encryption;
import com.pacs.main.eu.bi.BranchDAO;
import com.pacs.main.eu.entity.Branch;




public class JDBCBranchDAO extends JDBCBaseDAO implements BranchDAO {
	
	public JDBCBranchDAO(Connection connection){
		this.connection = connection;
		
	}
	
	public Branch getuser(String userID) throws Exception {
		PreparedStatement preparedStatement = null;
		Branch branch = new Branch();
		String sql = "select id,userID,companyname,password,userType from branch where userID = ? ";
		try{
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, userID);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()){
				branch.setId(rs.getInt(1));
				branch.setUserId(rs.getString(2));
				branch.setCompanyName(rs.getString(3));
				branch.setPassword(rs.getString(4));
				branch.setUserType(rs.getInt(5));
				
				
				
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
			
			
			return branch;
		}

}
