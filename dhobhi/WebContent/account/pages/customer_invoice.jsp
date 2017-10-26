<%@ taglib uri="/struts-tags" prefix="s"%>


<style>
.accountOrder1 {
	font-size: 14px;
	color: #27a6d9;
	font-weight: normal;
	border: 1px solid #27a6d9 !important;
	padding: 5px;
	border-radius: 5%;
}

.contactlogo1 {
	width: 34%;
}

.tablebackwhit2 {
	font-size: 15px;
	color: #fff;
}

.setinfoline {
	line-height: 23px;
	background-color: #27a6d9;
	padding: 32px;
}

p {
	margin: 0 0 0px;
}

.invocetext {
	font-size: 45px;
	font-weight: normal;
}

.invotopbot {
	text-align: center;
	margin-top: 20px;
	margin-bottom: 10px;
}

.setinfoline3 {
	line-height: 23px;
	padding: 32px;
}

.section-content {
	padding-top: 25px;
	padding-bottom: 10px;
}

.panel-default {
	border-color: #ddd;
}

.paddingnil {
	padding-left: 0px;
	padding-right: 0px;
}

.tabcartfont {
	font-size: 14px;
	border-bottom: 1px solid #2A435E;
}

.table {
	font-size: 14px !important;
}

.table>tbody>tr>td,.table>tfoot>tr>td {
	padding: 8px;
	line-height: 1.42857143;
	vertical-align: top;
	border-top: none;
}

.boonote {
	padding: 0px 0px 0px 15px;
	border: none;
	margin-top: 25px;
	background-color: #f6f6f6;
	border-right: 0px;
}

.tablebackwhit3 {
	font-size: 15px;
	text-align: center;
	margin-top: 15px;
	line-height: 22px;
}

h2,.h2,h3,.h3 {
	margin-top: 5px;
	margin-bottom: 10px;
}
</style>

<section class="section-content ">
	<div class="container" style="padding-bottom: 30px;">
		<div class="row">

			<div class="col-lg-1 col-sm-1 col-md-1">
				<a href="CustAccount.html"><b class="accountOrder1"><i
						class="fa fa-arrow-left" aria-hidden="true"></i> Back</b></a>

			</div>
			<div class="col-lg-10 col-md-10 col-sm-10 text-center">
				<div
					class="col-lg-12 col-md-12 col-sm-12 text-left paddingnil paddingtopbot"
					style="border: 1px solid #ddd;">

					<div
						class="col-lg-12 col-md-12 col-sm-12 paddingnil tablebackwhit2 setinfoline">
						<div class="col-lg-8 col-md-8 col-sm-8">
							<h2>INVOICE</h2>
							<h3>DHOBHITECH</h3>
							<p style="color: #fff;">GSTIN : 27AAICP903P43P1ZN
							</p>
							 <%-- <small>(Tag line come here)</small> --%>
						</div>
						
						<div class="col-lg-4 col-md-4 col-sm-4 text-right">
							<b style="color: #fff;"><!-- Vendor Information --></b>
							<p style="color: #fff;">
								<s:property value="vname" />
							</p>
							<p style="color: #fff;">
								<s:property value="vaddress" />
							</p>
							<p style="color: #fff;">
								<s:property value="vcity" />
							</p>
							<p style="color: #fff;">
								Contact No:
								<s:property value="vmobile" />
							</p>
						</div>
					</div>

					<div class="col-lg-12 col-md-12 col-sm-12 setinfoline3"
						style="font-size: 15px;">
						<div class="col-lg-4 col-md-4 col-sm-4">
							<b>Date:<s:property value="date" /></b><br /> <b>Invoice Id:
								#<s:property value="id" />
							</b><br />
							<!-- <b>Booking ID: 8622165524</b><br /> -->
							<b>Booking Status: Delivered</b><br /> <b>Payment Status:
								COD</b>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-4"></div>
						<div class="col-lg-4 col-md-4 col-sm-4">
							<b>To,</b>
							<p>
								<s:property value="name" />
							</p>
							<p>
								<s:property value="address" />
							</p>
							<p>
								<s:property value="city" />
							</p>
							<p>
								Contact No:
								<s:property value="mobile" />
							</p>
						</div>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12 text-left">

						<div class="panel panel-default">

							<div class="panel-body">
								<div class="col-lg-12 col-md-12 col-sm-12 paddingnil">
									<div class="col-lg-2 col-md-2 col-sm-2 paddingnil">
										<img src="images/washing.png" class="img-responsive" />
									</div>
									<div class="col-lg-10 col-md-10 col-sm-10 paddingnil">
										<table class="table">
											<tbody class="tabcartfont">
												<tr style="border-bottom: 1px solid #2A435E;">
													<td style="width: 65%;" class="text-left"><b>Laundry
															Service - Wash & Iron</b></td>
													<td style="width: 0%;"></td>
													<td class="text-right"></td>
												</tr>

												<s:iterator value="masterProductList" status="status">

													<s:iterator value="itemproductList" status="status">
														<tr>
															<td style="width: 65%;">
																<p>
																	<s:property value="item" />
																	:
																</p> <s:property value="subitem" />
															</td>
															<td style="width: 0%;" class="text-left"><s:property
																	value="qty" /></td>

															<%-- <td style="width: 0%;" class="text-left">
                                                            <s:property value="gst"/>
                                                        </td> --%>

															<td class="text-right">
																<div class="citemprice">

																	<span class="crate">@ Rs. <s:property
																			value="price" /></span><br /> <span class="cprice">Rs.
																		<strong id="sub97"><s:property
																				value="totalamount" /></strong>
																	</span>
																</div>
															</td>
														</tr>
													</s:iterator>
												</s:iterator>


												<tr style="border-top: 1px solid #2A435E;">
													<td style="width: 65%;" class="text-left"></td>
													<td style="width: 0%;">Handling Charge</td>
													<td class="text-right">
														<div class="citemprice">
															<span class="cprice">Rs. <strong id="sub97">0.00</strong></span>
														</div>
													</td>
												</tr>
												<tr>
													<td style="width: 65%;" class="text-left"></td>
													<td style="width: 0%;">Order Amount</td>
													<td class="text-right">
														<div class="citemprice">
															<span class="cprice">Rs. <strong id="sub97"><s:property value="orderamount"/></strong></span>
														</div>
													</td>
												</tr>

												<tr>
													<td style="width: 65%;" class="text-left"></td>
													<td style="width: 0%;"> CGST (9%)</td>
													<td class="text-right">
														<div class="citemprice">
															<span class="cprice">Rs. <strong id="sub97"><s:property
																		value="totalcgstvalue" /></strong></span>
														</div>
													</td>
												</tr>

												<tr>
													<td style="width: 65%;" class="text-left"></td>
													<td style="width: 0%;">SGST (9%)</td>
													<td class="text-right">
														<div class="citemprice">
															<span class="cprice">Rs. <strong id="sub97"><s:property
																		value="totalsgstvalue" /></strong></span>
														</div>
													</td>
												</tr>

												<tr>
													<td style="width: 65%;" class="text-left"></td>
													<td style="width: 0%;">Discount <span>(- 0%)</span></td>
													<td class="text-right">
														<div class="citemprice">
															<span class="cprice">Rs. <strong id="sub97">0.00</strong></span>
														</div>
													</td>
												</tr>
												<tr
													style="border-top: 1px solid rgb(42, 67, 94); font-size: 25px;">
													<td style="width: 65%;" class="text-left"></td>
													<td style="width: 0%;">TOTAL</td>
													<td class="text-right">
														<div class="citemprice">
															<span class="cprice">Rs. <strong id="sub97"><s:property
																		value="totaldebit" /></strong></span>
														</div>
													</td>
												</tr>
											</tbody>
										</table>



									</div>

								</div>
							</div>
						</div>

					</div>
					<div
						class="col-lg-12 col-md-12 col-sm-12 paddingnil tablebackwhit1">
						<div class="panel panel-default boonote">
							<b>Booking Note:</b>
							<p>These are the customer's booking notes that were given
								during the time the booking was placed...</p>
						</div>

					</div>
					<div
						class="col-lg-12 col-md-12 col-sm-12 paddingnil tablebackwhit3">
						<div class="">
							<b>PDDR MEDICAL PRODUCTS & SERVICES(I) PRIVATE LIMITED</b>
							<p>BALAJI NAGAR, HINGNA NAGPUR Nagpur MH 440028</p>
							<p>CIN-U74999MH2016PTC286620</p>
							<!-- <p>Ph no: 0712-854562</p>
							<p>Email: care@dhobhitech.com</p> -->
						</div>

					</div>
				</div>

			</div>
			<div class="col-lg-1 col-sm-1 col-md-1"></div>
		</div>
	</div>
</section>




















<%-- <div id="login_main" class="main_layout_content">
	<h2 class="heading" >INVOICE</h2>
	
	<div id="login" class="block_div">
		
		<span class="error"><s:actionerror id="server_side_error"/></span>
		
		
		<s:form action="" theme="simple" id="product_form">
			<s:hidden name="" id=""/>
			
			<%int count = 1; %>
					<table width="70%" align="center" style="border: none; height: auto; padding: 1em; font-size:14px; font-family: Arial,Helvetica,sans-serif; table-layout: fixed;">
						<col width="50%"/>
						<col width="50%"/>
						<tr>
							<td style="padding-left: 100px;">INVOICE NO : <s:property value=""/></td>
							<td align="right" style="padding-right: 100px;">Date : <s:property value=""/></td>
						</tr>
						<tr>
							<td style="padding-left: 100px;">CUSTOMER NAME : <s:property value="name"/></td>
							<td align="right" style="padding-right: 100px;">MOBLE NO. : <s:property value=""/></td>
						</tr>
						<tr>
							<td colspan="5" style="padding-left: 100px; padding-right: 100px;"><hr/></td>
						</tr>
						
						<tr>
							<td colspan="5" style="padding-left: 100px; padding-right: 100px;" >
								<table id="tblExport" cellpadding="0" cellspacing="0" class="my-table" style="width: 100%;">
									
									<tr>
									    <th style="background: transparent url('common/images/table_header.gif') no-repeat scroll 0 0;">Type</th>
						
								</tr>	
								
								<s:iterator value="masterProductList" status="status">
								    <tr>
								      <td><s:property value="name"/></td>
	
								     </tr>
								     <tr>
									        <td colspan="5">
									            <table id="tblExport1" cellpadding="0" cellspacing="0" class="my-table" style="width: 100%;">
									              <tr>
									                <th style="background: transparent url('common/images/table_header.gif') no-repeat scroll 0 0;">Date</th>
									                
									                <th style="background: transparent url('common/images/table_header.gif') no-repeat scroll 0 0;">Item</th>
									                
									                <th style="background: transparent url('common/images/table_header.gif') no-repeat scroll 0 0;">Rate</th>
									                
									                <th style="background: transparent url('common/images/table_header.gif') no-repeat scroll 0 0;">Qty</th>
									                
									                <th style="background: transparent url('common/images/table_header.gif') no-repeat scroll 0 0;">Discount</th>
									            
									            </tr>
									            
									            <s:iterator value="itemproductList" status="status">
									                <tr>
									                     <td><s:property value="date"/></td>
									                     <td><s:property value="subitem"/></td>
									                     <td><s:property value="price"/></td>
									                     <td><s:property value="qty"/></td>
									                     <td><s:property value="discount"/></td>
									                
									                </tr>
									            
									            </s:iterator>
									         </table>
								          </td>
								     </tr>
								   
								</s:iterator>
			
			</table>
			
			</td>
			</tr>
			</table>
			
			</s:form>
			
			</div>
	</div>	 --%>
