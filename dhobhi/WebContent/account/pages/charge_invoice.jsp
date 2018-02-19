<%@page import="com.laundry.main.web.common.helper.LoginHelper"%>
<%@page import="com.laundry.main.web.common.helper.LoginInfo"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<script type="text/javascript" src="account/js/custaccount.js"></script>

 <script src="popupdialog/dialog/js/jquery-1.10.2.js"
	type="text/javascript"></script>
<%-- <script src="popupdialog/dialog/js/jquery-ui.min.js"
	type="text/javascript"></script>
<script src="popupdialog/dialog/js/jquery.ui.core.js"></script>
<script src="popupdialog/dialog/js/jquery.ui.widget.js"></script>
 <script src="popupdialog/dialog/js/jquery.ui.datepicker.js"></script>
<script src="popupdialog/dialog/js/jquery.ui.dialog.js"></script>
<script src="popupdialog/dialog/js/jquery.ui.draggable.js"></script>
<script src="popupdialog/dialog/js/jquery.ui.droppable.js"></script>
<script src="popupdialog/dialog/js/jquery.ui.sortable.js"></script> --%>


<%@ taglib uri="/struts-tags" prefix="s" %>

<%LoginInfo loginInfo = LoginHelper.getLoginInfo(request); %>

<script>
$(document).ready(function() {

	$("#fromDate").datepicker({

		format : 'dd/mm/yyyy',
		//yearRange: yearrange,
		minDate : '30/12/1880',
		changeMonth : true,
		changeYear : true

	});

	$("#toDate").datepicker({

		format : 'dd/mm/yyyy',
		//yearRange: yearrange,
		minDate : '30/12/1880',
		changeMonth : true,
		changeYear : true
	});
});

</script>

 <script type="text/javascript" src="register/js/productCateloge.js"></script>
 
 <!-- Register Customer -->
                <section class="two miniheaight">

                    <div class="container-fluid">
                        <header>
                            <h2 class="stephedpa text-left">Record Payment</h2>
                        </header>

                        <div class="col-lg-12 col-sm-12 col-dm-12 text-left pagepaddingbotal60">

                            <div class="">
                                <div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs" style="font-size:15px;">
                                
                               
                                   <s:form id="cust1" action="Account" theme="simple">
                                   <div class="col-lg-3 col-sm-1 col-dm-1" >
                                   		<s:textfield readonly="true" name="fromdate" id="fromDate" placeholder="FromDate"
											cssClass="form-control" theme="simple" ></s:textfield>
                                   </div>
                                   <div class="col-lg-3 col-sm-1 col-dm-1" >
                                   		<s:textfield readonly="true" name="todate" id="toDate" placeholder="ToDate"
										cssClass="form-control" theme="simple"></s:textfield>
                                   </div>
									<div class="col-lg-3 col-sm-1 col-dm-1" >
									 <%if(loginInfo.getUserType()==2) {%>
										<s:select cssClass="form-control" id="name" name="name" list="customerList" listKey="id"
										listValue="name" headerKey="0" headerValue="Select Customer"
										onchange="getcustomer()"></s:select>
										
										<%}else{ %>
											<s:select cssClass="form-control" id="name" name="name" list="vendorList" listKey="id"
										listValue="name" headerKey="0" headerValue="Select Vendor"
										onchange="getcustomer()"></s:select>
										
										<%} %>
									</div>
								</s:form>
								
                                  
                                   <div class="col-lg-12 col-md-12 col-sm-12 paddingnil">
                                      <div class="tile-body">
                                          <div class="table-responsive">
                                            <table class="table table-custom" id="editable-usage">
                                              <tr>

			<th
			
				style="background: transparent url('common/images/table_header.gif') no-repeat scroll 0 0;">InvoiceNo</th>
			
			<th
				style="background: transparent url('common/images/table_header.gif') no-repeat scroll 0 0;">Payment</th>
				
			<th
			
				style="background: transparent url('common/images/table_header.gif') no-repeat scroll 0 0;">Date</th>
			<th
				style="background: transparent url('common/images/table_header.gif') no-repeat scroll 0 0;">Debit</th>
			<th
				style="background: transparent url('common/images/table_header.gif') no-repeat scroll 0 0;">discount</th>
			<th
				style="background: transparent url('common/images/table_header.gif') no-repeat scroll 0 0;">Credit</th>
			<th
				style="background: transparent url('common/images/table_header.gif') no-repeat scroll 0 0;">Balance</th>		

		</tr>

		<s:iterator value="chargeinvList" status="status">


			<tr>

				<td style="background-color: white;"><a href ="createinvoiceAccount?selectedid=<s:property value="chargeinvid"/>&customerid=<s:property value="customerid"/>">invoice</a>(<s:property value="chargeinvid" />)<i class="fa fa-arrow-down"
					onclick="showhidechargedetails(<s:property value="chargeinvid"/>)"></i></td>
				
				  <s:if test="balance>0">
				     <td><a href="inputpaymentAccount?selectedid=<s:property value="chargeinvid"/>&customerid=<s:property value="customerid"/>&vendorid=<s:property value="vname"/>&balance=<s:property value="balance"/>">RecordPayment</a></td>
				  </s:if>
				  <s:else>
				       <td>Paid</td>
				  </s:else>
				
				<td style="background-color: white;"><s:property
						value="billdate" /></td>
				<td style="background-color: white;"><s:property value="debit" /></td>
				<td style="background-color: white;"><s:property value="discount" /></td>
				<td style="background-color: white;"><s:property value="credit" /></td>
				<td style="background-color: white;"><s:property value="balance" /></td>


			</tr>

			<tr id="charges<s:property value="chargeinvid"/>"
				style="display: none;">
				<td colspan="3">
					<table id="tblExport" cellpadding="0" cellspacing="0"
						class="my-table" style="width: 100%;">
						<tr style="color: white;">
							<th style="background-color: gray;">Invoice</th>
							<th style="background-color: gray;">Date</th>
							<th style="background-color: gray;">Debit</th>
							
						</tr>
						<s:iterator value="chargeslist" status="status">
							<tr>
								<td><s:property
									 value="cartinvid" /><i class="fa fa-arrow-down"
									onclick="showitem(<s:property value="cartinvid"/>)"></i></td>
								<td><s:property
										value="date" /></td>
								<td><s:property
										value="debit" /></td>


							</tr>

							<tr id="prod<s:property value="cartinvid"/>"
								style="display: none;">
								<td colspan="3">
									<table id="tblExport" cellpadding="0" cellspacing="0"
										class="my-table" style="width: 100%;">
										<tr style="color: white;">
											<th style="background-color: gray;">S.No</th>
											<th style="background-color: gray;">Item</th>
											<th style="background-color: gray;">Quantity</th>
											<th style="background-color: gray;">Price</th>

										</tr>
										<s:iterator value="productlist" status="status">
											<tr>
												<td><s:property value="id" /></td>
												<td><s:property value="subitem" /></td>
												<td><s:property value="qty" /></td>
												<td><s:property value="price" /></td>

											</tr>
										</s:iterator>
									</table>

								</td>


							</tr>

						</s:iterator>
					</table>

				</td>


			</tr>




		</s:iterator>
                                                      </table>
                                          </div>


                </section>
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 











