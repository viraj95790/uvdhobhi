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
                    <h2 class="stephedpa text-black">ADD SERVICES</h2>
                    <s:form action="addserviceMaster" id="reg_form" name="registerfrm" theme="simple">
                     <div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-xs-12">
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="form-group">
                                    <label>Service Name :</label>
                                        <%-- <s:text type="email" class="form-control" id="exampleInputEmail1" placeholder="First Name" title="First Name" tabindex="1"/> --%>
                                        <s:textfield id="services" name="services" title="Enter Service" cssClass="form-control" theme="simple"/> 
                                    </div>
                                </div>
                                
                                </div>
                            </div>
                        </div>
                       
                       <div class="row">
                            <div class="col-lg-12 col-md-12 col-xs-12">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    
                                    <div class="text-right">
                                    
                                        <input type="submit" class="btn btn-primary" value="Save">
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        </s:form>
                        </div>
                        
                
                 <div>
                </div>
            </div>
            
            
       </div>
       
    </header>