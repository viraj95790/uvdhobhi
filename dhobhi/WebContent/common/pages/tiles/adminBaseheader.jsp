	<!-- Main -->
			<%@page import="com.laundry.main.web.common.helper.LoginHelper"%>
<%@page import="com.laundry.main.web.common.helper.LoginInfo"%>
<div id="main" style="margin-left:0px;">
                <div class="">
                    <nav class="navbar navbar-inverse">
                        <div class="navbar-header">
                            <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".js-navbar-collapse">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" href="#"><img src="images/logocolor.jpg" class="img-responsive" /></a>
                        </div>

                        <div class="collapse navbar-collapse js-navbar-collapse">
                            <ul class="nav navbar-nav navbar-left hidden">
                             
                                <select class="form-control dropselect" id='search' onchange="OnSelectedIndexChange()">
                                    <option value="1">Manage Customer</option>
                                    <option value="2">Manage Delco Team</option>
                                </select>
                            </ul>
                             <%if(session.getAttribute("logininfo")!=null){ %>
                             <%LoginInfo loginInfo = LoginHelper.getLoginInfo(request); %>
                            <ul class="nav navbar-nav navbar-right">
                                <li>
                                    <a href="#">Hello Admin</a>
                                </li>
                                <li>
                                    <a href="Logout"><i class="fa fa-sign-out" aria-hidden="true"></i> Logout</a>
                                </li>
                               
                            </ul>
                            <%}else{ %>
                            <ul class="nav navbar-nav navbar-right">
                                <li>
                                    <a href="inputLogin"><i class="fa fa-sign-out" aria-hidden="true"></i> Login</a>
                                </li>
                               
                            </ul>
                            <%} %>
                        </div><!-- /.nav-collapse -->
                    </nav>
                </div>
             
                