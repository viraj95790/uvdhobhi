 
 <%@ taglib uri="/struts-tags" prefix="s" %>
 
 
 
  <header class="bg-slider center">
        <div class="section-overlay"></div>
        <div class="container top-element">
            <div class="col-lg-12 col-sm-12 col-dm-12">
                
                
                <!-- start table here -->
                
              <a href="inputitemMaster"><h2 class="stephedpa text-black">Add Item</h2></a>
               <table id="datatable-buttons"
						class="table table-striped table-bordered" width="100%">
						<thead>
							<tr>
							    <th>Item</th>
								<th>Edit</th>
								<th>Delete</th>
							</tr>
						</thead>
						
						
						<tbody>
						   <s:iterator value="itemList" status="rowstatus">
						   
						   <tr>
						   
						          <td><s:property value="item" /></td>
						          
						          <s:url action="edititemMaster" id="edit">
										<s:param name="selectedid" value="%{id}"></s:param>
									</s:url>
									<td><s:a href="%{edit}">Edit</s:a></td>
										
									  <s:url action="deleteitemMaster" id="delete">
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