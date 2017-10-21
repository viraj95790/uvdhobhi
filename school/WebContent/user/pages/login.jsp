<%@ taglib uri="/struts-tags"  prefix="s"%>
<!doctype html>
<html class="no-js" lang="">
<!--<![endif]-->



<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>HIS</title>
    <link rel="icon" type="image/ico" href="assets/images/favicon.ico" />
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">




    <!-- ============================================
    ================= Stylesheets ===================
    ============================================= -->
    <!-- vendor css files -->
    <link rel="stylesheet" href="assets/css/vendor/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/vendor/animate.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/js/vendor/animsition/css/animsition.min.css">
    <link href="assets/css/responsive.css" rel="stylesheet" />


    <!-- project main css files -->
    <!--<link href="assets/js/colofilter.css-master/styles/main.css" rel="stylesheet" />
    <link href="assets/js/colofilter.css-master/styles/prism.css" rel="stylesheet" />-->
    <link rel="stylesheet" href="assets/css/main.css">
    <link href="assets/js/Simple-Clean-jQuery-Vertical-Product-Gallery/fancybox/jquery.fancybox.css" rel="stylesheet" />
    <!--/ stylesheets -->
    <link href="assets/js/Filterizr-master/dev_example/css/index.css" rel="stylesheet" />

   

    <!-- ==========================================
    ================= Modernizr ===================
    =========================================== -->
    <script src="assets/js/vendor/modernizr/modernizr-2.8.3-respond-1.4.2.min.js"></script>
    <!--/ modernizr -->

    <style>
        .paddset {
            padding: 22px 10px;
        }

    </style>
   
</head>





<body id="his" class="appWrapper sidebar-xs-forced">

    <div id="wrap" class="">
     
       
        <!-- ====================================================
        ================= CONTENT ===============================
        ===================================================== -->
        
        <s:form action="Login" theme="simple">
        <section id="content">
            <div class="page page-sidebar-xs-layout">

                <div class="pageheader">
                  
                    <div class="row">
                       
                        <div class=" col-lg-12 col-md-12 col-sm-12 paddingnil">
                            <!-- Mixins-->
                          <div class="col-lg-4 col-md-4"></div>
                            <div class="col-lg-4 col-md-4" style="border:1px solid">
                                <div class="text-center">
                                    <h4>School Login</h4>
                                </div>
                                <div class="paddset">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">User Name</label>
                                       <s:textfield name="userId" id="userId"/>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <s:password name="password" id="password"/>
                                    </div>
                                    <div class="form-group">
                                        <a href=""><p class="help-block">Forget Password</p></a>
                                    </div>

                                    <input  type="submit" class="btn btn-prinpimary" value="Login">
                                </div>
                             
                            </div>
                            <div class="col-lg-4 col-md-4"></div>
                        </div>
                    </div>

                    

                </div>

               
            </div>
            
        </section>
        <!--/ CONTENT -->
</s:form>
       
        
       



    </div>

    <!--/ Application Content -->
    <!-- ============================================
    ============== Vendor JavaScripts ===============
    ============================================= -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="assets/js/vendor/jquery/jquery-1.11.2.min.js"><\/script>')</script>

    <script src="assets/js/vendor/bootstrap/bootstrap.min.js"></script>

    <script src="assets/js/vendor/jRespond/jRespond.min.js"></script>

    <script src="assets/js/vendor/sparkline/jquery.sparkline.min.js"></script>

    <script src="assets/js/vendor/slimscroll/jquery.slimscroll.min.js"></script>

    <script src="assets/js/vendor/animsition/js/jquery.animsition.min.js"></script>
    <!--/ vendor javascripts -->
    <!-- ============================================
    ============== Custom JavaScripts ===============
    ============================================= -->
    <script src="assets/js/main.js"></script>
    <!--/ custom javascripts -->
   
</body>
</html>




