<%@taglib uri="/struts-tags"  prefix="s"%>
<script type="text/javascript" src="user/js/pacsdetails.js"></script>
<style>
        .accountOrder1 {
            font-size: 14px;
            color: #2A435E;
            font-weight: normal;
            border: 1px solid #2A435E !important;
            padding: 5px;
            border-radius: 46%;
        }
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
        .imageborder {
            width: 100%;
            border: 1px solid #fff;
            display: inline-flex !important;
        }
        .titlehead {
            background-color: rgb(51, 153, 102);
            color: rgb(255, 255, 255);
            padding: 5px;
        }
        .img-responsive{
        	width: 49% !important;
        }
    </style>
</head>





<body id="his" class="appWrapper sidebar-xs-forced">
 <s:form action="svefindingDicom"  id="findingfrm" theme="simple">

    <div id="wrap" class="">
     
               <section id="content">
               
               <span class="actionmsg"><s:actionmessage id="server_side_error"/></span>

            <div class="page page-sidebar-xs-layout">

                <div class="pageheader padright">
                    <section class="two">
                        <div class="col-lg-2 col-md-2 col-sm-2">
                           
                        </div>
                        <div class="col-lg-8 col-md-8 col-sm-8 paddingnil marbotspace10" style="border: 1px solid #efefef;">
                            
                            <div class=" col-lg-12 col-md-12 col-sm-12" style="margin-top:15px;margin-bottom: 15px;">
                               	<div class="col-md-3">	
									<s:select onchange="showPatientName(this.value)" id="hospName" name="hospName" list="hospNameList"
										listKey="hospName" listValue="hospName" headerKey="0" headerValue="Select Hospital"
										cssClass="form-control"/>
									</div>
									<div class="col-md-3" id="patientnamedivid">	
											<select name="clientName" id="clientName" class="form-control">
												<option value="0">Select Patient</option>
											</select>
									</div>
									<div class="col-md-3" id="invsttnamedivid">	
											<select name="invstName" id="invstName" class="form-control">
												<option value="0">Select InvstigationID</option>
											</select>
		                            </div>
                                <div class="col-xs-3 col-sm-3 col-md-3" style="padding-right:0px;">
                                   <a href="#" class="btn btn-primary"><i class="fa fa-search"></i></a>
                                </div>

                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12 marbotspace10 titlehead">
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="text-left">
                                        <label for="exampleInputName2">Patient Name: Manoj Mishra</label>
                                    </div>
                                    <div class="text-left">
                                        <label for="exampleInputName2">Report Name: MRI Chest</label>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="">
                                        <div class="text-right">
                                            <label for="exampleInputEmail2"> 22 July 2016 </label>
                                        </div>
                                        <div class="text-right">
                                            <label for="exampleInputEmail2"> 17:03 PM</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <hr />
                           
                           
                            	<s:hidden name="selectedhospname" id="selectedhospname"/>
								<s:hidden name="selectedpatientname" id="selectedpatientname"/>
								<s:hidden name="selectedinvst" id="selectedinvst"/>
								
                            <div class="col-lg-12 col-md-12 col-sm-12 marbotspace10">
                                <s:textarea name="pacsFindings" id="pacsFindings" class="form-control" rows="10" placeholder="Write Findings" style="width: 100%;"></s:textarea>
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12 marbotspace10">
                                <div class="text-right">
                                    <a href="index.html" class="btn btn-primary"><i class="fa fa-arrow-left" aria-hidden="true"></i>&nbsp; Back</a>
                                    <a href="#" onclick="savefindings()" class="btn btn-primary"><i class="fa fa-hand-o-right" aria-hidden="true"></i>&nbsp; Submit</a>
                                </div>
                            </div>
                           
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-2 text-right">
                           
                        </div>
                    </section>
                    
                   
                    

                </div>

               

            </div>

        </section>
        <!--/ CONTENT -->

        




    </div>






</s:form>

</body>
</html>

