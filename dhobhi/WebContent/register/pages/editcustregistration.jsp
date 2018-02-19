  <%@ taglib uri="/struts-tags" prefix="s" %>
  
  <header class="bg-slider center">
        <div class="section-overlay"></div>
        <div class="container top-element">
            <div class="col-lg-12 col-sm-12 col-dm-12">
                
                <div class="col-lg-6 col-sm-12 col-xs-12 col-md-6 text-left text-white">
                    <b class="text-white ourfeature">Our Features</b>
                    <p class="textreg"><i class="fa fa-check-circle text-white iconset" aria-hidden="true"></i> Refer and earn Credit points.</p>
                    <p class="textreg"><i class="fa fa-check-circle text-white iconset" aria-hidden="true"></i> Quality Service at your door step.</p>
                    <p class="textreg"><i class="fa fa-check-circle text-white iconset" aria-hidden="true"></i> Choose from a Variety of Services.</p>
                    <p class="textreg"><i class="fa fa-check-circle text-white iconset" aria-hidden="true"></i> Express Delivery.</p>
                    <p class="textreg"><i class="fa fa-check-circle text-white iconset" aria-hidden="true"></i> Track your Order.</p>

                </div>
                
                
                <div class="col-lg-6 col-sm-12 col-xs-12 col-md-6 formregn">
                    <h2 class="stephedpa text-white">Edit Your Account</h2>
                    <s:form action="updateRegistration" id="register" theme="simple">
                      <s:hidden id="id" name="id"></s:hidden>
                         <div class="row">
                            <div class="col-lg-12 col-md-12 col-xs-12" style="padding-bottom: 15px;">
                                <div class="col-lg-6 col-md-6 col-sm-6">
                          
                                   <%--  <select class="form-control">
                                        <option value="Select Cutomer Type">Select Customer Type</option>
                                        <option value="Retail">Retail</option>
                                        <option value="Corporate">Corporate</option>
                                    </select> --%>
                                    <label>Customer Type :</label>
                                    <s:select list="customerTypeList" id="id" name="customer_type" listKey="id" listValue="customer_type" headerKey="0" headerValue="Select Type" theme="simple"></s:select>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 stscutreg">

                                </div>
                            </div>  
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-xs-12">
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="form-group">
                                    <label>First Name :</label>
                                        <%-- <s:text type="email" class="form-control" id="exampleInputEmail1" placeholder="First Name" title="First Name" tabindex="1"/> --%>
                                        <s:textfield id="name" name="name" title="First Name" cssClass="form-control" theme="simple"/> 
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="form-group">
                                    <label>Last Name :</label>
                                        <!-- <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Last Name" title="Last Name" tabindex="2"> -->
                                        <s:textfield id="surname" cssClass="form-control" name="surname" title="Last Name" theme="simple" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-xs-12">
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="form-group">
                                    <label>Mobile No :</label>
                                        <!-- <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Mobile No" title="Mobile No" tabindex="3"> -->
                                        <s:textfield id="mobile" name="mobile" title="Mobile No" cssClass="form-control"/>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="form-group">
                                      <label>Email :</label>
                                        <!-- <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Email ID" title="Email ID" tabindex="8"> -->
                                        <s:textfield id="email" name="email" title="Email ID" cssClass="form-control"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%-- <div class="row">
                            <div class="col-lg-12 col-md-12 col-xs-12">
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="form-group">
                                    <label>Password :</label>
                                        <!--<label for="exampleInputPassword1">Password</label>-->
                                        <!-- <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" title="Password" tabindex="9"> -->
                                        <s:password id="password" name="password" title="Password" theme="simple" cssClass="form-control" />
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="form-group">
                                    <label>Confirm Password :</label>
                                        <!--<label for="exampleInputPassword1">Password</label>-->
                                        <!-- <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Confirm Password" title="Confirm Password" tabindex="10"> -->
                                        <s:password id="c_password" name="c_password" title="Confirm Password" theme="simple" cssClass="form-control" />
                                    </div>
                                </div>
                            </div>
                        </div> --%>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-xs-12">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <div class="form-group">
                                    <label>Address :</label>
                                        <!-- <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter Full Address" title="Enter Full Address" tabindex="4"> -->
                                        <s:textfield id="address" name="address" title="Enter Full Address" theme="simple" cssClass="form-control"/>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="form-group">
                                    <label>Landmark :</label>
                                        <!-- <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Near Landmark (optional)" title="Near Landmark (optional)" tabindex="5"> -->
                                        <s:textfield id="landmark" name="landmark" title="Near Landmark (optional)" theme="simple" cssClass="form-control"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-xs-12">
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="form-group">
                                    <label>City :</label>
                                        <!-- <input type="email" class="form-control" id="exampleInputEmail1" placeholder="City" title="City" tabindex="6"> -->
                                        <s:select list="cityList" id="city" name="city" listKey="city" listValue="city" headerKey="0" headerValue="Select City" theme="simple" cssClass="form-control"></s:select>
                                      
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="form-group">
                                    <label>Pin Code :</label>
                                        <!-- <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Pin Code" title="Pin Code" tabindex="7"> -->
                                        <s:textfield id="pincode" name="pincode" title="Pin Code" theme="simple" cssClass="form-control"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-xs-12">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    
                                    <div class="text-right">
                                    <s:submit value="save"></s:submit>
                                        <!-- <button type="submit" class="btn btn-primary">Submit</button> -->
                                    </div>
                                </div>
                            </div>
                        </div>
                        

                    </s:form>
                </div>
            </div>
            
            
        </div>
       
    </header>