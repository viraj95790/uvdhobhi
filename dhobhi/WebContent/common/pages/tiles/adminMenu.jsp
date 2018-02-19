<%@page import="com.laundry.main.web.common.helper.LoginHelper"%>
<%@page import="com.laundry.main.web.common.helper.LoginInfo"%>
<%LoginInfo loginInfo = LoginHelper.getLoginInfo(request); %>

<div class="paddingnil">
                    <nav class="navbar navbar-default" role="navigation">
                        <div class="">
                            <!-- Brand and toggle get grouped for better mobile display -->
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-brand-centered">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                            </div>

                            <!-- Collect the nav links, forms, and other content for toggling -->
                             
                            <div class="collapse navbar-collapse" id="navbar-brand-left">
                                <ul class="nav navbar-nav navbar-left">
                                
                                <%if(loginInfo.getUserType()==2){ %>
                                    <li class="activeli">
                                        <a href="Registration">Manage Customer</a>
                                    </li>
                                    
                                      <li class="activeli">
                                        <a href="displaycartService?action=0">Create Invoice</a>
                                    </li>
                                    
                                    <li class="activeli">
                                        <a href="readbarcodeAccount">Barcode</a>
                                    </li>
                                    
                                      <li class="activeli">
                                        <a href="Account">Record Payment</a>
                                    </li>
                                    
                                   
                                    
                                    <% }else{%>
                                    
                                     <li class="activeli">
                                        <a href="Registration">Manage Customer</a>
                                    </li>
                                    
                                    <li class="activeli">
                                        <a href="displaycartService?action=0">Create Invoice</a>
                                    </li>
                                    
                                    <li class="activeli">
                                        <a href="readbarcodeAccount">Barcode</a>
                                    </li>
                                   
                                    
                                      <li class="activeli">
                                        <a href="Account">Record Payment</a>
                                    </li>
                                    
                                     <li class="activeli">
                                        <a href="vendorinvoiceAccount">Vendor Invoice</a>
                                    </li>
                                    
                                 
                                    <li class="activeli">
                                        <a href="inputadminrecordAccount">Payment Report</a>
                                    </li>
                                    
                                    <li class="activeli">
                                        <a href="Master">View / Add Service</a>
                                    </li>
                                    
                                     <li class="activeli">
                                        <a href="displayitemMaster">View / Add Category</a>
                                    </li>
                                    
                                      <li class="activeli">
                                        <a href="displaysubitemMaster">View / Add Product</a>
                                    </li>
                                    
                                    
                                   
                                  <!--   <li>
                                        <a href="Admin_ManageCust.html">Manage Booking</a>
                                    </li>
                                    <li>
                                        <a href="Admin_ManageCity.html">Manage City & Location</a>
                                    </li>
                                    <li>
                                        <a href="Admin_ManageCatamaster.html">Manage Catalogue Master</a>
                                    </li>
                                    <li>
                                        <a href="Admin_ManageCata.html">Manage Service Catalogue</a>
                                    </li>
                                    <li>
                                        <a href="Admin_ManagePartner.html">Manage Partners</a>
                                    </li>
                                    <li>
                                        <a href="Admin_ManagePromo.html">Manage Promotions</a>
                                    </li>
                                    <li>
                                        <a href="Admin_ManageReports.html">Manage Reports</a>
                                    </li> -->
                                    <%} %>
                                 
                                </ul>
                            </div><!-- /.navbar-collapse -->
                        </div><!-- /.container-fluid -->
                    </nav>
                </div>