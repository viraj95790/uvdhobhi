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


<%@ taglib uri="/struts-tags" prefix="s"%>

<%
	LoginInfo loginInfo = LoginHelper.getLoginInfo(request);
%>

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
			<h2 class="stephedpa text-left">Vendor Invoices</h2>
		</header>

		<div
			class="col-lg-12 col-sm-12 col-dm-12 text-left pagepaddingbotal60">

			<div class="">
				<div class="bs-example bs-example-tabs" role="tabpanel"
					data-example-id="togglable-tabs" style="font-size: 15px;">


					<s:form id="cust1" action="vendorinvoiceAccount" theme="simple">
						<div class="col-lg-3 col-sm-1 col-dm-1">
							<s:textfield readonly="true" name="fromdate" id="fromDate"
								placeholder="FromDate" cssClass="form-control" theme="simple"></s:textfield>
						</div>
						<div class="col-lg-3 col-sm-1 col-dm-1">
							<s:textfield readonly="true" name="todate" id="toDate"
								placeholder="ToDate" cssClass="form-control" theme="simple"></s:textfield>
						</div>
						<div class="col-lg-3 col-sm-1 col-dm-1">
							<%
								if (loginInfo.getUserType() == 2) {
							%>
							<s:select cssClass="form-control" id="name" name="name"
								list="customerList" listKey="id" listValue="name" headerKey="0"
								headerValue="Select Customer" onchange="getcustomer()"></s:select>

							<%
								} else {
							%>
							<s:select cssClass="form-control" id="name" name="name"
								list="vendorList" listKey="id" listValue="name" headerKey="0"
								headerValue="Select Vendor" onchange="getcustomer()"></s:select>

							<%
								}
							%>
						</div>
					</s:form>


					<div class="col-lg-12 col-md-12 col-sm-12 paddingnil">
						<div class="tile-body">
							<div class="table-responsive">
								<table class="table table-custom" id="editable-usage">
									<tr>

										<th
											style="background: transparent url('common/images/table_header.gif') no-repeat scroll 0 0;">Sr.CheckBox</th>
										<th
											style="background: transparent url('common/images/table_header.gif') no-repeat scroll 0 0;">Invoice
											No</th>
										<th
											style="background: transparent url('common/images/table_header.gif') no-repeat scroll 0 0;">Date</th>
										<th
											style="background: transparent url('common/images/table_header.gif') no-repeat scroll 0 0;">Debit</th>


									</tr>

									<s:iterator value="" status="status">

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


										</tbody>



									</s:iterator>
								</table>
								</div>
								</div>
								</div>
						</div>
						</div>
						</div>
						
							</div>
</section>





































