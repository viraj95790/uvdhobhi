<%@ taglib uri="/struts-tags" prefix="s"%>

<script type="text/javascript" src="register/js/productCateloge.js"></script>

 <script src="popupdialog/dialog/js/jquery-1.10.2.js"
	type="text/javascript"></script>

<script>
	$(document).ready(function() {

		$("#fromdate").datepicker({

			format: 'dd/mm/yyyy',
			//yearRange: yearrange,
			minDate : '30/12/1880',
			changeMonth : true,
			changeYear : true

		});

		$("#todate").datepicker({

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
			<h2 class="stephedpa text-left">Payment Report</h2>
		</header>

		<div
			class="col-lg-12 col-sm-12 col-dm-12 text-left pagepaddingbotal60">

			<div class="form-group fomgese">
				<div class="bs-example bs-example-tabs" role="tabpanel"
					data-example-id="togglable-tabs" style="font-size: 15px;">
					<s:form id="report" action="inputadminrecordAccount" theme="simple">
						<div class="col-lg-3 col-sm-1 col-dm-1">
							<s:select cssClass="form-control" id="name" name="name"
								list="vendorList" listKey="id" listValue="name" headerKey="0"
								headerValue="Select Vendor" onchange="getcustomer()"></s:select>
						</div>
						
						<div class="col-lg-3 col-sm-1 col-dm-1">
							<select name="howpaid" id="howpaid" class="form-control">
							                   <option value="0">Select Payment Mode</option>
                                               <option value="Cash">Cash</option>
										       <option value="Cheque">Cheque</option>
										       <option value="C/Card">C/Card</option>
										       <option value="BACS">BACS</option>
										       <option value="D/Card">D/Card</option>
                                         </select>
						</div>

						<div class="col-lg-2 col-sm-1 col-dm-1">
							<s:textfield id="fromdate" name="fromdate" cssClass="form-control" title="select from date" theme="simple"></s:textfield>
						</div>

						<div class="col-lg-2 col-sm-1 col-dm-1">
							<s:textfield id="todate" name="todate" cssClass="form-control"
								theme="simple"></s:textfield>
						</div>
						
						<div class="col-lg-2 col-sm-1 col-dm-1">
						 <button type="submit" class="btn btn-primary">Go</button>
							<!-- <input type="submit" value="Go"> -->
						</div>
					</s:form>
					
				</div>
			</div>
		</div>

		<div class="col-lg-12 col-md-12 col-sm-12 paddingnil">
			<div class="tile-body">
				<div class="table-responsive">
					<table class="table table-custom" id="editable-usage">
						<tr>

							<th
								style="background: transparent url('common/images/table_header.gif') no-repeat scroll 0 0;">InvoiceNo</th>
							<th
								style="background: transparent url('common/images/table_header.gif') no-repeat scroll 0 0;">Date</th>
							<th
								style="background: transparent url('common/images/table_header.gif') no-repeat scroll 0 0;">Customer</th>
							<th
								style="background: transparent url('common/images/table_header.gif') no-repeat scroll 0 0;">Vendor</th>
							<th
								style="background: transparent url('common/images/table_header.gif') no-repeat scroll 0 0;">Payment Mode</th>
							<th
								style="background: transparent url('common/images/table_header.gif') no-repeat scroll 0 0;">Amount
								Paid</th>

						</tr>

						<s:iterator value="paymentReportList" status="status">


							<tr>

								<td><s:property value="chargeinvid"/></td>
								<td><s:property value="date"/></td>
								<td><s:property value="name"/></td>
								<td><s:property value="vendorname"/></td>
								<td><s:property value="howpaid"/></td>
								<td><s:property value="balance"/></td>


							</tr>
							

						</s:iterator>
						
						      <tr>
						        <td></td>
						        <td></td>
						        <td></td>
						        <td></td>
						        <td style="color: navy; font:bolder; background: gray;">Total</td>
						        <td style="background: gray; color: navy;"><s:property value="totalamount"/></td>
						     
						     </tr>
						  
					</table>
				</div>
			</div>
		</div>
		
		</div>		
</section>