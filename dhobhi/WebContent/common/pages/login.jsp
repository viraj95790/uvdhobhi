<%@ taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE html>
<html lang="en-US">
 <script src="https://apis.google.com/js/platform.js" async defer></script>
   <meta name="google-signin-client_id" content="607113469426-voa66djjm1ng4essa99vevg3pbu7i4q0.apps.googleusercontent.com">
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
                   
                    
                     <div class="g-signin2" data-onsuccess="onSignIn" id="myP"></div>
   <div style="display: none;">
      <img id="myImg"><br>
      <p id="name"></p>
      <div id="status"></div>
 </div>
   <script type="text/javascript">
      function onSignIn(googleUser) {
      // window.location.href='success.jsp';
      var profile = googleUser.getBasicProfile();
      var imagurl=profile.getImageUrl();
      var name=profile.getName();
      var email=profile.getEmail();
      document.getElementById("myImg").src = imagurl;
      document.getElementById("name").innerHTML = name;
      document.getElementById("myP").style.visibility = "hidden";
      // document.getElementById("status").innerHTML = 'Welcome <a href=success.jsp?email='+email+'&name='+name+'/>Continue with Google login</a></p>'
    		   
       window.location.href='/dhobhitech/Gmailslogin?email='+email+'&name='+name+'';
   }
   </script>
   <!--  <button onclick="myFunction()">Sign Out</button>  -->
   <script>
      function myFunction() {
      gapi.auth2.getAuthInstance().disconnect();
      location.reload();
   }
   </script>
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





