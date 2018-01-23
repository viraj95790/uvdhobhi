<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

    
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>School</title>
    <link rel="icon" type="image/ico" href="assets/images/favicon.ico" />
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">


		 <script src="popupdialog/dialog/js/jquery-1.10.2.js" type="text/javascript"></script>
			<!--  <script src="common/js/validation-common.js" type="text/javascript"></script>
			 <script src="common/js/jquery/jquery.validate.js" type="text/javascript"></script>
			 <script src="common/js/jquery/jquery.timers-1.2.js" type="text/javascript"></script>
			 <script src="common/js/jquery/jquery.tools.min.js" type="text/javascript"></script>
			 <script src="common/js/jquery/additional-validation-methods.js" type="text/javascript"></script> -->
			 
			 <script type="text/javascript" src="user/js/fullscreen.js"></script>
	


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
        .padright {
            padding-left: 40px;
        }
        .table.table {
            color: RGBA(85, 85, 85, 0.85);
            background-color: #fff;
        }

        .comtitle {
            font-size: 13px;
            background: rgb(102, 153, 204) none repeat scroll 0% 0% !important;
            color: rgb(255, 255, 255);
        }

        .marbot25 {
            margin-bottom: 25px;
        }

        .editcompany {
            float: right;
            font-size: 17px;
            color: #fff;
        }

        .borright {
            border-right: 1px dashed rgb(192, 192, 192);
        }

        .buildinglogo {
            width: 60%;
            margin-top: 30px;
        }
        #sidebar .panel-group .panel > .panel-heading + .panel-collapse > .panel-body {
            border-top: 0;
            min-height: 650px;
        }
        .miheight {
            min-height: 650px;
        }
        .my-table th {
            background-color: #424A5D;
            color: #fff !important;
            border-bottom: 1px solid #DFD8D4;
            border-right: 1px solid #DFD8D4;
            border-top: 1px solid #DFD8D4;
            padding: 3px 3px 4px 5px;
            text-align: left;
            font-weight: bold;
            font-size: 11px;
            background-size: 100% 100%;
        }
        .table > tbody > tr > td, .table > tbody > tr > th, .table > tfoot > tr > td, .table > tfoot > tr > th, .table > thead > tr > td, .table > thead > tr > th {
            padding: 5px 7px 7px 7px !important;
            font-size: 11px;
        }
        .sidebar-xs #header .branding > a {
            background-position: 6px 10px;
            width: 100% !important;
            font-size: 21px;
            padding: 0px 1px 2px 15px;
            text-align: center;
            color: #fff;
        }
            .sidebar-xs #header .branding > a > span {
                display: inline-block;
            }
        .sidebar-xs #header .branding {
            width: 100%;
            padding-top: 7px;
            text-align: center;
        }
        .theight {
            height: 21px;
        }

        .topheadbaxck {
            background-color: rgb(239, 239, 239);
            padding: 2px 0px;
            margin-bottom: 10px;
            margin-top: -15px;
        }
        .red{
            color:red;
        }
        .addcatego {
            float: right;
            margin-top: -40px;
            margin-right: 30px;
        }
        .btn-radio {
            width: 100%;
        }

        .img-radio {
            opacity: 1.5;
            margin-top: 0px;
            margin-bottom: 0px;
        }

        .border-box-blue {
            border: 4px solid #219803;
            padding: 0px 0px 0px 0px;
        }

        .border-box-black {
            border-bottom: 1px solid #f5f5f5;
            padding: 0px 0px 0px 0px;
        }

        .space-20 {
            margin-top: 20px;
        }

        .btm-space-10 {
            margin-bottom: 5px;
        }

        .uploaddbtn {
            float: right;
            margin-bottom: 15px;
            margin-right: 31px;
        }

        .fancybox-custom .fancybox-skin {
            box-shadow: 0 0 50px #222;
        }

        .marbotspace10 {
            margin-bottom: 10px;
        }
        .martop6 {
            margin-top: 6px;
        }
        .paddingnil {
            padding-left: 0px !important;
            padding-right: 0px;
        }
        .paddingleft0 {
            padding-left: 0px;
        }
        .inputtextboheight {
            margin-left: 15px !important;
            width: 27% !important;
            height: 29px !important;
            padding: 3px 3px 3px 3px !important;
        }
        .inputtextboheight2 {
            width: 100% !important;
            height: 29px !important;
            padding: 3px 3px 3px 3px !important;
        }
        .panel-body {
            padding: 8px;
        }
        .form-group {
            margin-bottom: 6px;
        }
        .modal-footer {
            padding: 8px;
            text-align: right;
            border-top: 1px solid #e5e5e5;
        }
        .modal-body {
            position: relative;
            padding: 8px;
        }
        .panel-heading {
            padding: 5px 10px !important;
            border-bottom: 1px solid transparent;
            border-top-left-radius: 3px;
            border-top-right-radius: 3px;
        }
        .checback {
            position: absolute !important;
            margin-top: -18px !important;
            margin-left: 5px !important;
        }
        .setcanvas {
            width:985px;
            height:600px;
        }
        #omyFileInput {
            display: none;
        }
        .imageborder {
            width: 100%;
            border: 1px solid #fff;
        }
        .edit_hover_class {
            width: 100%;
        }

            .edit_hover_class i {
                display: none;
            }

            .edit_hover_class:hover i {
                display: block;
            }
        .iconedit {
            position: absolute;
            font-size: 25px;
            background-color: rgb(255, 255, 255);
            margin-top: 10px;
            margin-left: 10px;
            padding: 11px;
            border-radius: 50%;
            color: #424A5D;
        }
        .logoutde{
            color: #fff;
    text-decoration: none;
    font-size: 16px;
    margin-left: 15px;
        }
        
        .actionmsg{
        	font-weight: bold;
		    color: green;
		    font-size: 16px;
}
        }

    </style>
</head>





<body id="his" class="appWrapper sidebar-xs-forced">

    <div id="wrap" class="">
        
       <tiles:insertAttribute name="header" />
       <tiles:insertAttribute name="menu" />
       <tiles:insertAttribute name="body" />
       



    </div>





   
   

    <!--/ Application Content -->
    <!-- ============================================
    ============== Vendor JavaScripts ===============
    ============================================= -->
   <!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
    <!-- <script>window.jQuery || document.write('<script src="assets/js/vendor/jquery/jquery-1.11.2.min.js"><\/script>')</script> -->

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
   
   <!--  <script src="assets/js/Filterizr-master/dev_example/filterizr/jquery.filterizr.js"></script> -->
    <script src="assets/js/Filterizr-master/dev_example/js/controls.js"></script>
    <!-- Kick off Filterizr -->

    <!--<script src="assets/js/colofilter.css-master/scripts/clipboard.min.js"></script>
    <script src="assets/js/colofilter.css-master/scripts/main.js"></script>-->

    <script src="assets/js/Simple-Clean-jQuery-Vertical-Product-Gallery/fancybox/jquery.fancybox.js"></script>
  
    <script>
      /*   $(function () {

            // We can attach the `fileselect` event to all file inputs on the page
            $(document).on('change', ':file', function () {
                var input = $(this),
                    numFiles = input.get(0).files ? input.get(0).files.length : 1,
                    label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
                input.trigger('fileselect', [numFiles, label]);
            });

            // We can watch for our custom `fileselect` event like this
            $(document).ready(function () {
                $(':file').on('fileselect', function (event, numFiles, label) {

                    var input = $(this).parents('.input-group').find(':text'),
                        log = numFiles > 1 ? numFiles + ' files selected' : label;

                    if (input.length) {
                        input.val(log);
                    } else {
                        if (log) alert(log);
                    }

                });
            });

        }); */
    </script>
    <script type="text/javascript">
        
            function save() {
               alert("You are saving this image to your destination folder!!")
            }
           /*  document.getElementById('get_file').onclick = function () {
                document.getElementById('my_file').click();
            }; */
    </script>


</body>
</html>


  <div class="modal fade" id="baselayout1loaderPopup" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog" style="width: 100px;">
			<div class="modal-content">
				
				<div class="modal-body" style="background-color: rgb(245, 178, 34)">
					<span style="font-weight:bold">Processing....</span>
					
				</div>
				
			</div>
		</div>
	</div>	
  


			 	 	 
   

   