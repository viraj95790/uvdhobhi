

  <%@ taglib uri="/struts-tags" prefix="s" %>
  


  
 <!-- Begin Content Discover App -->
    <section class="section-content section-drawing bg-gray-light border-bottom p-t-60 p-b-0">
        <div class="container regsittop">
            <div class="row">

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
                        <h2 class="stephedpa text-white">Create Your Account</h2>
                            <s:form action="registerdataRegistration?action=r" id="reg_form" name="registerfrm" theme="simple">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-xs-12" style="padding-bottom: 15px;">
                                <div class="col-lg-6 col-md-6 col-sm-6 selectContainer">
                                <s:if test="customer_type=0">
                                    <s:select cssClass="form-control selectpicker" list="customerTypeList" id="customer_type" name="customer_type" listKey="id" listValue="customer_type" headerKey=" " headerValue="Select Type"></s:select>
                                </s:if>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 stscutreg">

                                </div>
                            </div>  
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-xs-12">
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <s:textfield id="name" name="name" title="First Name" placeholder="First Name" cssClass="form-control" /> 
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="form-group">
                                         <s:textfield id="surname" cssClass="form-control" placeholder="Last Name" name="surname" title="Last Name" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-xs-12">
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <s:textfield id="mobile" name="mobile" title="Mobile No" placeholder="Mobile No"  cssClass="form-control"/>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <s:textfield onchange="checkEmailExist(this.value)" id="email" name="email" title="Email ID" placeholder="Email ID" cssClass="form-control"/>
                                        <label  style="display: none; color: red;" id="chkemailerror">Email already exist</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-xs-12">
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <!--<label for="exampleInputPassword1">Password</label>-->
                                        <s:password id="password" name="password" title="Password" theme="simple" placeholder="Password" cssClass="form-control" data-minlength="5" data-error="some error"/>
                                        <span class="help-block with-errors"></span>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <!--<label for="exampleInputPassword1">Password</label>-->
                                        <s:password id="c_password" title="Confirm Password" theme="simple" placeholder="Confirm Password" cssClass="form-control {$borderColor}" name="confirmPassword" data-match="#confirmPassword" data-minlength="5" data-match-error="some error 2"/>
                                        <span class="help-block with-errors"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
          
                        
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-xs-12">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <div class="form-group">
                                       <s:textfield placeholder="Enter Address" id="address" name="address" title="Enter Full Address" theme="simple" cssClass="form-control"/>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <s:textfield id="landmark" name="landmark" title="Near Landmark (optional)" theme="simple" placeholder="Near Landmark (optional)" cssClass="form-control"/>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <s:textfield id="postname" name="postname" title="Enter Code" theme="simple" placeholder="Code" cssClass="form-control"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-xs-12">
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="form-group">
                                          <s:select list="cityList" id="city" name="city"  headerKey=" " headerValue="Select City" theme="simple" cssClass="form-control"></s:select>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <s:textfield id="pincode" name="pincode" title="Pin Code" theme="simple" placeholder="Pin Code" cssClass="form-control"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-xs-12">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <div class="form-group hidden">
                                       <%--  <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Referral Code (Optional)" title="Referral Code" tabindex="11">
                                        <small>Enter referral code &amp; earn 100 eLaundry Cash </small> --%>
                                    </div>
                                    <div class="form-group text-left">
                                            <p class="right">By clicking register you agree to our <a target="_blank" href="#">policy</a>.</p>
                                        </div>
                                    <div class="text-right">
                                        <input type="submit" class="btn btn-primary" value="Save"/>
                                          <!-- <button type="submit" class="btn btn-primary">Register</button> -->
                                    </div>
                                </div>
                            </div>
                        </div>
                        

                    </s:form>


                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Content Discover App -->
    <!-- Begin Call to Action Contact -->
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
 
     
    
   <script src="register/js/registeration.js"></script> 
  