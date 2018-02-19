<%@ taglib uri="/struts-tags" prefix="s" %>


  


  
 <!-- Begin Content Discover App --><!--<%@ taglib uri="/struts-tags" prefix="s" %>

 <script type="text/javascript" src="register/js/productCateloge.js"></script>
 
 <!-- Register Customer -->
                <%-- <section class="two miniheaight">

                    <div class="container-fluid">
                        <header>
                            <h2 class="stephedpa text-left">Payment</h2>
                        </header>

                        <div class="col-lg-12 col-sm-12 col-dm-12 text-left pagepaddingbotal60">

                            <div class="">
                                <div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs" style="font-size:15px;">
                                   <s:form id="cd1" action="displaycartService" theme="simple">
				                        <div class="col-lg-3 col-sm-1 col-dm-1" >
				                        <div style="color: red;">
				                        	Work in process.....
				                        </div>
				                        </div>
			                       </s:form> 
                                  
                                          </div>


                </section>
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
  --%>
 

    <section class="section-content section-drawing bg-gray-light border-bottom p-t-60 p-b-0">
        <div class="container regsittop">
            <div class="row">

                <div class="col-lg-12 col-sm-12 col-dm-12">

                    <div class="col-lg-6 col-sm-12 col-xs-12 col-md-6 formregn">
                        <h4 class="stephedpa text-black" style="font: bolder;">PAYMENT</h4>
                            <s:form action="customerpaymentAccount" id="reg_form" name="registerfrm" theme="simple">
                         <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12">
                           
                             <div class="col-lg-6 col-md-6 col-sm-6">
                                 <div class="form-group">
                                     <s:textfield id="name" name="name" title="First Name" placeholder="" cssClass="form-control" /> 
                                 </div>
                               </div>
                                
                              <div class="col-lg-6 col-md-6 col-sm-6">
                                 <div class="form-group">
                                     <s:textfield id="chargeinvid" name="chargeinvid" title="ChargeId" placeholder="" cssClass="form-control" /> 
                                 </div>
                              </div>   
                            </div>
                          </div>
                        
                        <div class="row">
                           <div class="col-lg-12 col-md-12 col-sm-12">
                                 <div class="col-lg-6 col-md-6 col-sm-6">
                                      <div class="form-group">
                                       <label>Date :</label> 
                                         <s:textfield id="date" name="date" placeholder="" cssClass="form-control"/>
                                      </div>
                                 </div>
                           </div>
                     	</div>
                     	 <div><hr></div>
                     	
                     	<div class="row">
                           <div class="col-lg-12 col-md-12 col-sm-12">
                                 <div class="col-lg-6 col-md-6 col-sm-6">
                                      <div class="form-group" > 
                                        <label for="name">Select Payment Mode :</label>
                                         <select name="howpaid" id="howpaid" class="form-control">
                                               <option value="BACS">BACS</option>
										       <option value="Cheque">Cheque</option>
										       <option value="C/Card">C/Card</option>
										       <option value="Cash">Cash</option>
										       <option value="D/Card">D/Card</option>
                                         </select>
                                      </div>
                                 </div>
                           </div>
                     	</div>
                     	
                     	<div class="row">
                           <div class="col-lg-12 col-md-12 col-sm-12">
                                 <div class="col-lg-6 col-md-6 col-sm-6">
                                      <div class="form-group"> 
                                      <label>Balance :</label>
                                         <s:textfield id="debit" name="debit" title="Balance Amount" cssClass="form-control"/>
                                      </div>
                                 </div>
                           </div>
                     	</div>
                     	
                     	<div class="row">
                           <div class="col-lg-12 col-md-12 col-sm-12">
                                 <div class="col-lg-6 col-md-6 col-sm-6">
                                      <div class="form-group"> 
                                      <label>Discount (if any...)</label>
                                        <s:textfield id="discount" name="discount" title="discount" cssClass="form-control"/>
                                      </div>
                                 </div>
                           </div>
                     	</div>
                     	
                     	<div class="row">
                           <div class="col-lg-12 col-md-12 col-sm-12">
                                 <div class="col-lg-6 col-md-6 col-sm-6">
                                      <div class="form-group"> 
                                      <label for="name">Payment</label>
                                         <s:textfield id="credit" name="credit" title="Amount Paid" cssClass="form-control"/>
                                      </div>
                                 </div>
                           </div>
                     	</div>
                     	
                     	<div class="row">
                           <div class="col-lg-12 col-md-12 col-sm-12">
                                 <div class="col-lg-6 col-md-6 col-sm-6">
                                      <div class="form-group"> 
                                         <label for="name">PayNote</label>
                                         <s:textarea id="paynote" name="paynote" title="PayNote" cssClass="form-control"/>
                                      </div>
                                 </div>
                           </div>
                     	</div>
                     	
                     	<div class="ln_solid"></div>
                     	    <div class="form-group">
                     	         <div class="col-lg-12 col-md-6 col-sm-6" align="center">
                     	             <%-- <s:submit value="Payment"></s:submit> --%>
                     	            <!-- <button type="submit" class="btn btn-primary">Payment</button> -->
                     	            <input type="submit" value="Payment">
                     	         </div>
                     	    </div>
        
                    </s:form>


                    </div>
                </div>
            </div>
        </div>
    </section>
     <%-- End Content Discover App 
     Begin Call to Action Contact 
    <section class="section-call-action action-sm bg-dark" style="background-color: #32c6f4;">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <h2 style="color: #555;">Free pickup and delivery for all orders above Rs. 500.</h2>
                </div>
                <div class="col-md-4 text-right m-t-0 hidden">
                    <a href="#" class="btn btn-white btn-rounded hover-effect m-b-0">Book a pickup</a>
                </div>
            </div>
        </div>
    </section>
  --%>
     
    
   -->			