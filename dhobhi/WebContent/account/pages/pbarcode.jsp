<%@page import="com.laundry.main.web.common.helper.LoginHelper"%>
<%@page import="com.laundry.main.web.common.helper.LoginInfo"%>
<%@page import="com.laundry.Register.eu.entity.Master"%>
<%@taglib uri="/struts-tags" prefix="s" %>




<%@page import="java.util.ArrayList"%>
<% LoginInfo loginInfo = LoginHelper.getLoginInfo(request);%>
			

<style>
			.paddniltopase{
				padding-top:5px;
			}
			p {
    margin: 0 0 0px;
    text-align: center;
    font-size: 11px;
    line-height: 12px;
}
.setimg{
  	width:500px;
    margin-left: auto;
    margin-right: auto;
        height: 40px;
     } 
           
		</style>
    
  
    
    		<%if(session.getAttribute("totalBarcodeList")!=null)%><% {%>
    		<%int t=0; %>
    			<%ArrayList<Master>totalBarcodeList = (ArrayList<Master>)session.getAttribute("totalBarcodeList"); %>
    			<% int count=0;String tdpadding = "padding-top:0%"; int lenght = totalBarcodeList.size()-1; %>
    			
	    				
	    			<%for(int z=0;z<lenght;z++) %><% {%>
	    				<% if(t==totalBarcodeList.size())
    						{
    							break;
    							}%>
	    				
    				
    				<div class="row">
    					<div class="col-lg-12 col-xs-12 col-md-12 col-sm-12" style="margin-bottom: -25px;">
    					
    					<% for(int j=1;j<=1;j++){%>
    					<% if(t==totalBarcodeList.size())
    						{
    							break;
    							}%>
    						<% Master b = totalBarcodeList.get(t);%>
    						
    						<div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
    					
    							<img  src="livedata/pbarcode/<%=b.getImageName() %>" class="img-responsive setimg" ></img>
    							<p>V-<%=loginInfo.getUserId() %>  </p>
    							<p>C-<%=b.getName() %></p>	
	    						<p>P-<%=b.getSubitem() %></p>
    						</div>
    						
							<%t++; %>			
											
    						
	            		<%} %>
	            	</div>	 
	            	 </div>            	
    			<%} %>
	          	
	            	
    			<%} %>
    	
    		
    		
    		
    	
    		
    		<!--<input type="button" name="print" value="Print" onclick="printpage();">
    
    
    --><script>
function printpage()
  {
  window.print()
  }
</script>
      	
 
		
		
	
				
				
				
				
				
				
				
       			
       			
	