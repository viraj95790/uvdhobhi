import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.pacs.main.eu.blogic.jdbc.Connection_provider;

public class Hello {
	
	public static void main(String[] args) {
		Connection connection;
		String myColumnName  = "Maths1";
		try{
			connection = Connection_provider.getconnection();
			PreparedStatement preparedStatement = null;
			DatabaseMetaData md = connection.getMetaData();
			ResultSet rs = md.getColumns(null, null, "marks", "Maths1");
			boolean result = false;
			 if (rs.next()) {
			      result = true;
			    }
			 
			 if(!result){
					    String myColumnType = "VARCHAR(45)";
					    String sql = "ALTER TABLE marks ADD " + myColumnName + " " + myColumnType;
					    preparedStatement = connection.prepareStatement(sql);
					    preparedStatement.executeUpdate();
					    
					    
			 }
			System.out.println(result);
		}catch (Exception e) {
			// TODO: handle exception
		}
	}

}
