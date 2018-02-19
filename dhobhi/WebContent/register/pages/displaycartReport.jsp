<%@page import="com.laundry.main.web.common.helper.LoginHelper"%>
<%@page import="com.laundry.main.web.common.helper.LoginInfo"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<script type="text/javascript" src="register/js/productCateloge.js"></script>
<script src="popupdialog/dialog/js/jquery-1.10.2.js"
	type="text/javascript"></script>
	
	<%LoginInfo loginInfo = LoginHelper.getLoginInfo(request);%>

<script>
	$(document).ready(function() {

		$("#fromDate").datepicker({

			format: 'dd/mm/yyyy',
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

<!-- Register Customer -->
<section class="two miniheaight">

	<div class="container-fluid">
		<header>
			<h2 class="stephedpa text-left">Create Invoice</h2>
		</header>

		<div
			class="col-lg-12 col-sm-12 col-dm-12 text-left pagepaddingbotal60">

			<div class="">
				<div class="bs-example bs-example-tabs" role="tabpanel"
					data-example-id="togglable-tabs" style="font-size: 15px;">
					<s:form id="cd1" action="displaycartService" theme="simple" >
					<input type="hidden" name="action" id="hdnaction" value="0"/>
						<div class="col-lg-2 col-sm-1 col-dm-1" >
	                              		<s:textfield readonly="true" name="fromdate" id="fromDate" placeholder="FromDate"
							cssClass="form-control" theme="simple"></s:textfield>
                       </div>
                       <div class="col-lg-2 col-sm-1 col-dm-1" >
	                              		<s:textfield readonly="true" name="todate" id="toDate" placeholder="ToDate"
						cssClass="form-control" theme="simple"></s:textfield>
	                   </div>
	                   
	                   <% if(loginInfo.getUserType()==2){%>
	                    <div class="col-lg-2 col-sm-1 col-dm-1">
							<div>
								<s:select disabled="true" cssClass="form-control" id="vendorname" name="vendorname"
									list="vendorList" listKey="id" listValue="vendorname" headerKey="0"
									headerValue="Select Vendor" onchange="getcustomerlist()"></s:select>
							</div>
						</div> 
						<% }else{%>
							 <div class="col-lg-2 col-sm-1 col-dm-1">
							<div>
								<s:select cssClass="form-control" id="vendorname" name="vendorname"
									list="vendorList" listKey="id" listValue="vendorname" headerKey="0"
									headerValue="Select Vendor" onchange="getcustomerlist()"></s:select>
							</div>
						</div> 
						
						<% }%>
					
						<div class="col-lg-2 col-sm-1 col-dm-1">
							<div>
								<s:select cssClass="form-control" id="name" name="name"
									list="customerList" listKey="id" listValue="name" headerKey="0"
									headerValue="Select Customer" onchange="getcustomerlist()"></s:select>
							</div>
						</div>
						
						<div class="col-lg-3 col-sm-1 col-dm-1" >
							<a href="#" onclick="showcartlistpage()"><b><u>View cart Info</u></b></a>
						</div>
						
					</s:form>
					
					<s:form action="vendorBarcode" id="vbarcodefrm" target="formtarget" theme="simple">
					<div class="col-lg-3 col-sm-1 col-dm-1" >
						
						<s:hidden name="fromdate" id="vfromdate"/>
						<s:hidden name="todate" id="vtodate"/>
						<s:hidden name="actiontype" id="action"/>
						<s:hidden name="vendorname" id="vendorname"/>
						
						<div class="col-lg-3 col-sm-1 col-dm-1" >
							<a href="#" onclick="openVbarcode('v')" title="Vendor Barcode"><b><u>V</u></b></a> 
						</div>
						
						<div class="col-lg-3 col-sm-1 col-dm-1" >
							<a href="#" onclick="openVbarcode('c')" title="Customer Barcode"><b><u>C</u></b></a> 
						</div>
						<div class="col-lg-3 col-sm-1 col-dm-1" >
							<a href="#" onclick="openVbarcode('p')" title="Product Barcode"><b><u>P</u></b></a> 
						</div>
					</div>
				</s:form>	

					<div class="col-lg-12 col-md-12 col-sm-12 paddingnil">
						<div class="tile-body">
							<div class="table-responsive">
								<table class="table table-custom" id="editable-usage">
									<thead>
										<tr>
											<th
												style="background: transparent url('common/images/table_header.gif') no-repeat scroll 0 0;">Sr.CheckBox</th>
											<th
												style="background: transparent url('common/images/table_header.gif') no-repeat scroll 0 0;">OrderNo</th>
											<th
												style="background: transparent url('common/images/table_header.gif') no-repeat scroll 0 0;">Date</th>
											<th
												style="background: transparent url('common/images/table_header.gif') no-repeat scroll 0 0;">Debit</th>
										</tr>
									</thead>

									<s:iterator value="cartitemList" status="status">
										<tbody>
											<tr>
												<td style="background-color: white;"><input
													type="checkbox" id="ch<s:property value="id"/>"
													name="ch<s:property value="id"/>" class="case"
													value="<s:property value="id"/>"></td>
												<td style="background-color: white;"><s:property
														value="id" /><i class="fa fa-arrow-down"
													onclick="showhidechargedetails(<s:property value="id"/>)"></i></td>
												<td style="background-color: white;"><s:property
														value="date" /></td>
												<td style="background-color: white;"><s:property
														value="debit" /></td>
											</tr>

											<tr id="charges<s:property value="id"/>"
												style="display: none;">
												<td colspan="4">
													<table id="tblExport" cellpadding="0" cellspacing="0"
														class="table table-bordered" style="width: 100%;">
														<thead>
															<tr style="color: white;">
																<th style="background-color: gray;">Name</th>
																<th style="background-color: gray;">Quantity</th>
																<th style="background-color: gray;">price</th>
																<th style="background-color: gray;">Total</th>
															</tr>
														</thead>

														<s:iterator value="productlist" status="status">
															<tbody>
																<tr>
																	<td><s:property value="subitem" /></td>
																	<td><s:property value="qty" /></td>
																	<td><s:property value="price" /></td>
																	<td><s:property value="totalprice" /></td>
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
							<form action="createinvoiceService" id="cr8inv">
								<s:hidden name="selectedchk" id="selectedchk"></s:hidden>
								<s:hidden name="name" id="selectedcustid"></s:hidden>
								<input type="button" value="Create Invoice"
									onclick="getcreateinv()">
							</form>
						</div>
					</div>
		  </div>
	  </div>
	</div>
</div>
					
</section>











