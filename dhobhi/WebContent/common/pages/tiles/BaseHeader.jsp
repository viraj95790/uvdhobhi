 <%@page import="com.laundry.main.web.common.helper.LoginHelper"%>
<%@page import="com.laundry.main.web.common.helper.LoginInfo"%>
<%@taglib uri="/struts-tags"  prefix="s"%>  
    <script src="https://apis.google.com/js/platform.js" async defer></script>
   <meta name="google-signin-client_id" content="607113469426-voa66djjm1ng4essa99vevg3pbu7i4q0.apps.googleusercontent.com">
    <style>
    	.logoset{
    		width: 16%;
		    position: absolute;
		    margin-top: -17px
    	}
    	.topnav ul.nav>li>a {
    color: #000;
    text-transform: uppercase;
    font-size: 11px;
    letter-spacing: 2px;
    padding: 0 20px;
}
    </style>
    
 <!--  Begin Topbar simple -->
    <div class="topnav fixed-topnav transparent">
     
        <div class="section othertoback">
            <div id="topbar-hold" class="nav-hold container">
                <nav class="navbar" role="navigation">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <!-- Site Name -->
                        <a class="site-name navbar-brand" title="DhobhiTech" href="Default"><img class="img-responsive logoset" src="images/logocolor.jpg"></img></a>
                    
                    </div>
                    <!-- Main Navigation menu Starts -->
                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <li>
                                <a href="Default">Home</a>
                            </li>
                            <li>
                                <a href="oursectorRegistration">Our Sectors</a>
                            </li>
                            <li>
                                <a href="#">Packages</a>
                            </li>
                            <li>
                                <a href="#">Offers</a>
                            </li>
                            <li>
                                <a href="#">Contact Us</a>
                            </li><!--
                            <li>
                                <a href="displaycartService">Cart Report</a>
                            </li>
                            <li>
                                <a href="Account">Account Report</a>
                            </li>
                            <li>
                                <a href="inputRegistration">Register</a>
                            </li>
                           --><%if(session.getAttribute("logininfo")==null){ %>
                                	<%LoginInfo loginInfo = LoginHelper.getLoginInfo(request); %>
                           
                          <li>
                          <%--   <li class="dropdown">
                               <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span>Login</span> <span class="caret"></span></a>
                                <ul id="login-dp" class="dropdown-menu setpadlogin">
                                	
                                    <li>
                                        <div class="row">
                                            <div class="col-md-12">
                                                Login via
                                                <div class="social-buttons">
                                                    <a href="#" class="btn btn-fb"><i class="fa fa-facebook"></i> Facebook</a>
                                                    <a href="#" class="btn btn-tw"><i class="fa fa-twitter"></i> Twitter</a>
                                                </div>
                                                or
                                                 <s:form action="Login" theme="simple">
                                                    <div class="form-group">
                                                        <label class="sr-only" for="exampleInputEmail2">Email address</label>
                                                        <s:textfield name="email"  cssClass="form-control" id="email" placeholder="Email address" />
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="sr-only" for="exampleInputPassword2">Password</label>
                                                        <s:password name="password" cssClass="form-control" id="password" placeholder="Password" />
                                                        <div class="help-block text-right"><a href="forgetpwd.html">Forget the password ?</a></div>
                                                    </div>
                                                    <div class="form-group">
                                                        <button type="submit" class="btn btn-primary btn-block" onclick="location.href = 'Afterlogin.html';">Sign in</button>
                                                    </div>

                                               </s:form>
                                            </div>

                                        </div>
                                    </li>
                                   
                                </ul>

                            </li> --%>
                            
                                <li>
                             		<a href="inputLogin">Login</a>
                        		 </li>
                            
                             <%}else{ %>
                               	 
                        		  <% LoginInfo loginInfo =(LoginInfo) session.getAttribute("logininfo"); %>
                        		 <li>
                             		<a><%=loginInfo.getName() %></a> 
                        		 </li>
                        		 <li>
                             		<a href="Logout" onclick="myFunction()">Logout</a>
                        		 </li>
                                
                              <%} %>
                            
                            <li class="hidden">
                                <a href="#"><img src="images/ico-cart.png" class="img-responsive cart" /></a>
                            </li>

                        </ul>
                    </div>
                    <!-- Main Navigation menu ends-->
                </nav>
            </div>
        </div>
    </div>
    
    
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
    		   
      // window.location.href='success.jsp?email='+email+'&name='+name+'';
   }
   </script>
   <!--  <button onclick="myFunction()">Sign Out</button>  -->
   <script>
   
   window.onload =function(){
	   gapi.load('auth2', function() {
	        gapi.auth2.init();
	      });
   }
      function myFunction() {
      gapi.auth2.getAuthInstance().disconnect();
      //location.reload();
   }
   </script>
