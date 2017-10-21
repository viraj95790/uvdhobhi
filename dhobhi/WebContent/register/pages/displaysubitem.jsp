 
 <%@ taglib uri="/struts-tags" prefix="s" %>
 
 
 
  <header class="bg-slider center">
        <div class="section-overlay"></div>
        <div class="container top-element">
            <div class="col-lg-12 col-sm-12 col-dm-12">
                
                
                <!-- start table here -->
                
              <a href="inputsubitemMaster"><h2 class="stephedpa text-black">Add Sub_Item</h2></a>
               <table id="datatable-buttons"
						class="table table-striped table-bordered" width="100%">
						<thead>
							<tr>
							    <th>SubItem</th>
							    <th>Price</th>
							    <th>CGST</th>
							    <th>SGST</th>
							    <th>Hospital</th>
								<th>Edit</th>
								<th>Delete</th>
							</tr>
						</thead>
						
						
						<tbody>
						   <s:iterator value="subitemList" status="rowstatus">
						   
						   <tr>
						   
						          <td><s:property value="subitem" /></td>
						          <td><s:property value="price" /></td>
						          <td><s:property value="cgst" /></td>
						          <td><s:property value="sgst" /></td>
						          <td><s:property value="name" /></td>
						          
						          <s:url action="editsubitemMaster" id="edit">
										<s:param name="selectedid" value="%{id}"></s:param>
									</s:url>
									<td><s:a href="%{edit}">Edit</s:a></td>
										
									  <s:url action="deletesubitemMaster" id="delete">
										<s:param name="selectedid" value="%{id}"></s:param>
									</s:url>
									<td><s:a href="%{delete}">Delete</s:a></td>	
						   
						   </tr>
						   
						   
						   
						   
						   </s:iterator>
						
					</tbody>
              
              </table>
              
             
            </div>
            
            
        </div>
       
    </header>