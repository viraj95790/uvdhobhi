 <%@page import="com.laundry.main.web.common.helper.LoginHelper"%>
<%@page import="com.laundry.main.web.common.helper.LoginInfo"%>
<%@taglib uri="/struts-tags"  prefix="s"%>  
    
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
                             		<a href="inputLogin">Login</a>
                        		 </li>
                            
                             <%}else{ %>
                               	 <li>
                             		<a href="Logout">Logout</a>
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