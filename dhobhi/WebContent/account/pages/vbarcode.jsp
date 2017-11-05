<%@page import="com.laundry.Register.eu.entity.Master"%>
<%@taglib uri="/struts-tags" prefix="s" %>



<%@page import="java.util.ArrayList"%>

		<style>
		p {
    margin: 0 0 0px;
    text-align: center;
    font-size: 10px;
}
			.paddniltopase{
				padding-top:5px;
			}
			p {
    margin: 0 0 0px;
    text-align: center;
    
}
.setimg{
    width: 100%;
    margin-left: auto;
    margin-right: auto;
        height: 40px;
     }       
		</style>
		
		<%if(session.getAttribute("totalBarcodeList")!=null)%><% {%>
    			<%ArrayList<Master>totalBarcodeList = (ArrayList<Master>)session.getAttribute("totalBarcodeList"); %>
    			
    			<%for(Master barcode : totalBarcodeList) %><% {%>
    			<div class="row">
    				<div class="col-lg-12 col-xs-12 col-md-12 col-sm-12" style="margin-bottom: 0px;">
    					<div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
			    			<img src="livedata/vbarcode/<%=barcode.getImageName() %>" class="img-responsive setimg"></img>
			    			<p><%=barcode.getName() %></p>	
	    				</div>
		    			<%-- <div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
			    			<img src="livedata/vbarcode/<%=barcode.getImageName() %>" class="img-responsive setimg"></img>
			    			<p><%=barcode.getName() %></p>	
	    				</div>
		    			<div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
			    			<img src="livedata/vbarcode/<%=barcode.getImageName() %>" class="img-responsive setimg"></img>
			    			<p><%=barcode.getName() %></p>	
	    				</div>
		    			<div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
			    			<img src="livedata/vbarcode/<%=barcode.getImageName() %>" class="img-responsive setimg"></img>
			    			<p><%=barcode.getName() %></p>	
	    				</div> --%>
    				</div>
    			</div>
    			
    			<%} %>
    	
    	<%} %>		