          
    <!-- =================================================
        ================= CONTROLS Content ===================
        ================================================== -->
        <div class="container body">
      <div class="main_container">


            <!-- ================================================
            ================= SIDEBAR Content ===================
            ================================================= -->
          <!--   <aside id="sidebar" class="miheight">


                <div id="sidebar-wrap">

                    <div class="panel-group slim-scroll" role="tablist">
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" href="#sidebarNav">
                                        Navigation <i class="fa fa-angle-up"></i>
                                    </a>
                                </h4>
                            </div>
                            <div id="sidebarNav" class="panel-collapse collapse in" role="tabpanel">
                                <div class="panel-body">


                                    ===================================================
                            ================= NAVIGATION Content ===================
                            ====================================================
                                    <ul id="navigation" class="simplefilter">

                                        <li><a href="AppointmentDiary" title="View Schedule" ><i class="fa fa-folder-open-o" aria-hidden="true"></i> <span>Open</span></a><input type="file" id="omyFileInput" /></li>
                                        <li data-filter="1"><a href="#" title="One"><i class="fa fa-square" aria-hidden="true"></i> <span>One</span></a></li>
                                        <li data-filter="2"><a href="#" title="Two"><i class="fa fa-pause" aria-hidden="true"></i> <span>Two</span></a></li>
                                        <li data-filter="3"><a href="#" title="Four"><i class="fa fa-th-large" aria-hidden="true"></i> <span>Four</span></a></li>
                                        <li><a href="Register" title="View Client"><i class="fa fa-file-image-o" aria-hidden="true"></i> <span>View Client</span></a></li>
                                        <li><a href="Case" title="View Cases"><i class="fa fa-file-image-o" aria-hidden="true"></i> <span>View Cases</span></a></li>
                                        <li>
                                                <a href="#" title="Master"><i class="fa fa-plane"></i> <span>Master</span></a>
                                                <ul>
                                                    <li><a href="Master" onclick="openPopup('ExpenceManagement')"><i class="fa fa-caret-right"></i> View Case_Stage </a></li>
                                                    <li><a href="displaycasetypeMaster" onclick="openPopup('viewreportExpenceManagement')"><i class="fa fa-caret-right"></i>View Case_Type</a></li>
                                                    <li><a href="displayactMaster" onclick="openPopup('viewreportExpenceManagement')"><i class="fa fa-caret-right"></i>View Applicable_Act</a></li>
                                                    <li><a href="displayjudicialMaster" onclick="openPopup('viewreportExpenceManagement')"><i class="fa fa-caret-right"></i>View Judicial Details</a></li>
                                                    <li><a href="displaycourtMaster" onclick="openPopup('viewreportExpenceManagement')"><i class="fa fa-caret-right"></i>View Court Names</a></li>
                                                    
                                                </ul>
                                            </li>

                                    </ul>

                                </div>
                            </div>
                        </div>
                    </div>

                </div>


            </aside> -->
       <div class="col-md-3 left_col">
        <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
                <a href="index.html" class="site_title"><i class="fa fa-graduation-cap"></i> <span>laundry Reach</span></a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile">
                <div class="profile_pic">
                    <img src="images/img.jpg" alt="..." class="img-circle profile_img">
                </div>
                <div class="profile_info">
                    <span>Welcome,</span>
                    <h2>Prateek Raut</h2>
                </div>
            </div>
            <!-- /menu profile quick info -->

            <br>

            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                <div class="menu_section active">
                    <h3>General</h3>
                    <ul class="nav side-menu" style="">
                        <li class="current-page"><a href="Dashboard"><i class="fa fa-home"></i> Dashboard </a></li>
                        <li>
                            <a><i class="fa fa-group"></i> Client <span class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">
                                <li><a href="AddClient.html">Add Client</a></li>
                                <li><a href="Register">View Client</a></li>
                            </ul>
                        </li>

                        <li>
                            <a><i class="fa fa-gavel"></i> Cases <span class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">
                                <li><a href="EnterCase.html">Add New Case</a></li>
                                <li><a href="Case.html">View All Cases</a></li>
                                <li><a href="#">Running Cases</a></li>
                                <li><a href="#">Decided/Close Cases</a></li>
                                <li><a href="#">Todays Cases</a></li>
                            </ul>
                        </li>
                        <li><a href="AppointmentDiary"><i class="fa fa-archive"></i> View Case Diary </a></li>
                        <li>
                            <a><i class="fa fa-gear"></i> Settings <span class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">
                                <li><a href="AddCourtName.html">Manage Court Name</a></li>
                                <li><a href="AddCaseType.html">Manage Case Type</a></li>
                                <li><a href="AddCaseStages.html">Manage Case Stages</a></li>
                                <li><a href="AddApplicableAct.html">Manage Applicable Act</a></li>
                                <li><a href="AddJudicialDetails.html">Manege Judicial Details</a></li>
                            </ul>
                        </li>
                        <li>
                            <a><i class="fa fa-file-word-o"></i> Reports <span class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">
                                <li><a href="ViewApplicableAct.html">View Applicable Act</a></li>
                                <li><a href="ViewCourtName.html">View Court Name</a></li>
                                <li><a href="ViewJudicialDetails.html">View Judicial Details</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>


            </div>
            <!-- /sidebar menu -->
            <!-- /menu footer buttons -->
            <div class="sidebar-footer hidden-small">
                <a data-toggle="tooltip" data-placement="top" title="" data-original-title="Settings">
                    <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
                </a>
                <a data-toggle="tooltip" data-placement="top" title="" data-original-title="FullScreen">
                    <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
                </a>
                <a data-toggle="tooltip" data-placement="top" title="" data-original-title="Lock">
                    <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
                </a>
                <a data-toggle="tooltip" data-placement="top" title="" data-original-title="Logout">
                    <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
                </a>
            </div>
            <!-- /menu footer buttons -->
        </div>
    </div>
        </div>
        <!--/ CONTROLS Content -->       
          
        </div>