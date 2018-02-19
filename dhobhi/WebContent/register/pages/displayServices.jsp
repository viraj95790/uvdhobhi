 
 <%@ taglib uri="/struts-tags" prefix="s" %>
 
 
 
  <header class="bg-slider center">
        <div class="section-overlay"></div>
        <div class="container top-element">
            <div class="col-lg-12 col-sm-12 col-dm-12">
                
                
                <!-- start table here -->
                
              <a href="inputMaster"><h2 class="stephedpa text-black">Add Services</h2></a>
               <table id="datatable-buttons"
						class="table table-striped table-bordered" width="100%">
						<thead>
							<tr>
							    <th>Services</th>
								<th>Edit</th>
								<th>Delete</th>
							</tr>
						</thead>
						
						
						<tbody>
						   <s:iterator value="serviceList" status="rowstatus">
						   
						   <tr>
						   
						          <td><s:property value="services" /></td>
						          
						          <s:url action="editservicesMaster" id="edit">
										<s:param name="selectedid" value="%{id}"></s:param>
									</s:url>
									<td><s:a href="%{edit}">Edit</s:a></td>
										
										
									<s:url action="deleteservicesMaster" id="delete">
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