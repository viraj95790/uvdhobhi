<%@page import="com.pacs.main.eu.blogic.jdbc.JDBCDicomDAO"%>
<%@page import="com.pacs.main.eu.bi.DicomDAO"%>
<%@page import="com.pacs.main.eu.blogic.jdbc.Connection_provider"%>
<%@taglib uri="/struts-tags" prefix="s" %>



<%@page import="java.util.ArrayList"%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<style>
			.paddniltopase{
				padding-top:35px;
			}
			p {
    margin: 0 0 0px;
    text-align: center;
}
.setimg{
    width: 100%;
    margin-left: auto;
    margin-right: auto;
        height: 300px;
     }       
		</style>
		
			

    			<% int p=1,i=0; 
    				Connection connection = Connection_provider.getconnection();
    				PreparedStatement preparedStatement = null;
    				String fname = "";
    				String id = "";
    				
    				DicomDAO dicomDAO = new JDBCDicomDAO(connection);
    				int mdbarcodecount = dicomDAO.getMultiPacsCount();
    			%>
    			
    			<%for(i=1;i<=mdbarcodecount;i=i+4) %><% {%>
    	<div class="row">
    		<div class="col-lg-12 col-xs-12 col-md-12 col-sm-12" style="margin-bottom: 15px;">
    			<% for(int j=1;j<=4;j++){%>
    			<div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
    				<%String sql = "SELECT imgid, fname FROM multipacs where id = "+p+"";
    					preparedStatement = connection.prepareStatement(sql);
    					ResultSet rs = preparedStatement.executeQuery();
    					if(rs.next()){
    						 id = rs.getString(1);
    						 fname = rs.getString(2);
    						
    					}
    				%>
    				
	    		<a href="#" onclick="showimgdicom()">	<img src="dicom/pacs<%=id %>.jpeg" class="img-responsive setimg"></img></a>
	    			<%p++; %>
    			</div>
    			<%} %>
    		</div>
    	</div>
    	<%} %>
    	
<script>
function printpage()
  {
  window.print()
  }
  
  
  function showimgdicom(){
	  
	  var url = "imgjDicom";
		
	   
		if (window.XMLHttpRequest) {
			req = new XMLHttpRequest();
		}
		else if (window.ActiveXObject) {
			isIE = true;
			req = new ActiveXObject("Microsoft.XMLHTTP");
		}   
	               
	    req.onreadystatechange = showimgdicomRequest;
	    req.open("GET", url, true); 
	              
	    req.send(null);
  }
  
  function showimgdicomRequest(){
	  
	  if (req.readyState == 4) {
			if (req.status == 200) {
				
	         
	         }
		}
  }
</script>
      	
 
		
		
	
				
				
				
				
				
				
				
       			
       			
	