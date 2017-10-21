<%@ taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE html>
<html lang="en-US">
<body>
   
    <div class="container setpaddregst">
       
        <div class="col-lg-12 col-sm-12 col-dm-12">
            <div class="col-lg-3 col-sm-3 col-md-3 text-left"></div>
            <div class="col-lg-6 col-sm-6 col-md-6 formregn" style="border: 4px double rgb(42, 67, 94);">
                <header>
                    <h2 class="stephedpa text-center">Welcome To Admin Login Panel</h2>
                </header>
                <s:form action="Login" theme="simple">
                    <a href="index.html"><img src="images/logocolor.jpg" class="img-responsive adminlogo" /></a>
                    <div class="form-group text-left">
                        <label>Email</label>
                        <s:textfield name="email"  cssClass="form-control" id="email" placeholder="Enter Your Email" title="Email ID" tabindex="1"/>
                    </div>
                    <div class="form-group text-left">
                        <label>Password</label>
                        <s:password name="password" cssClass="form-control" id="password" placeholder="Enter Your Email" title="Email ID" tabindex="1"/>
                    </div>
                    <div class="text-right">
                        <input type="submit" class="btn btn-primary" value="Submit">
                    </div>
                    <div class="text-left">
                        <p style="font-size: 14px; color: red;"><a href="inputRegistration">Register</a></p>
                    </div>
                </s:form>
            </div>
            <div class="col-lg-3 col-sm-3 col-md-3 text-left"></div>

        </div>
    </div>

   
  

   
    
   




</body>
</html>





