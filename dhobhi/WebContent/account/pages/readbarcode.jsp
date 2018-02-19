<%@ taglib uri="/struts-tags" prefix="s" %>

<script type="text/javascript" src="account/js/custaccount.js"></script>

<section class="two miniheaight">

                    <div class="container-fluid">
                        <header>
                            <h2 class="stephedpa text-left">Order Receive/Deliver</h2>
                        </header>
                        
                        <s:form action="" id="reg_form" name="registerfrm" theme="simple">
                           <div class="row">
                               <div class="col-lg-12 col-md-12 col-sm-12">
                                     
                                     <div class="col-lg-2 col-md-6 col-sm-6">
                                       <div class="form-group"> 
                                         <input type="text" id="barcode" name="barcode" title="barcode no" placeholder="Enter Barcode No." onchange="getbarcodedata(this.value)" class="form-control" />
                                       </div>
                                     </div>
                            	
                            	</div>
                           </div> 
                           
                     	    	
                        </s:form>
                        
                        
                        <div id="barcodetable">
                        
                        </div>
                        
                    </div>    
                        
                        
                    
 </section>                       