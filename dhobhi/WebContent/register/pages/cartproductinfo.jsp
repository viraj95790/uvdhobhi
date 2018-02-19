 
 <%@ taglib uri="/struts-tags" prefix="s" %>
 
 
 
  <header class="bg-slider center">
        <div class="section-overlay"></div>
        <div class="container top-element">
            <div class="col-lg-12 col-sm-12 col-dm-12">
                
                
                <!-- start table here -->
                
             <h2 class="stephedpa text-black">Cart Info</h2>
               <table id="datatable-buttons"
						class="table table-striped table-bordered" width="100%">
						<thead>
							<tr>
							    <th>Name</th>
							    <th>Mobile</th>
							    <th>Address</th>
							    <th>TotalQuantity</th>
							    <th>TotalPrice</th>
							</tr>
						</thead>
	
						
						   <s:iterator value="custprodinfoList" status="rowstatus">
						   <tbody>
						   <tr style="background-color: graytext; font-size: larger; ">
						   
						          <td><s:property value="name" /></td>
						          <td><s:property value="mobile" /></td>
						          <td><s:property value="address" /></td>
						          <td><s:property value="totalqty" /></td>
						          <td><s:property value="totalprice" /></td>

						   </tr>     
						      
						         
					
					<tr>
					<td colspan="5">
					 <table id="prodinfo" class="table table-striped table-bordered" width="100%">
						<thead>
							<tr>
							    <th>Product</th>
							    <th>Quantity</th>
							    <th>Price</th>
							</tr>
						</thead>
						
						
						   <s:iterator value="productlist" status="rowstatus">
						   <tbody>
						      <tr>
						          <td><s:property value="subitem" /></td>
						          <td><s:property value="qty" /></td>
						          <td><s:property value="price" /></td>
						      </tr>
						  </tbody>
						   </s:iterator>
						
						  </table> 
					 </td>
					</tr>
						         
				  
						  
					  
						   </tbody>
						   
						   </s:iterator>
              
              </table>
              
             
            </div>
            
            
        </div>
       
    </header>