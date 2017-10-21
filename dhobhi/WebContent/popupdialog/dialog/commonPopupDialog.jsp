<!doctype html>
<%@page import="com.apm.common.web.common.helper.LoginHelper"%>
<%@page import="com.apm.common.web.common.helper.LoginInfo"%>

<%LoginInfo loginfo = LoginHelper.getLoginInfo(request);%>

<html lang="en">
<head>
<meta charset="utf-8">

	

<script type="text/javascript" src="diarymanagement/js/addPatientTab.js"></script>
<script type="text/javascript" src="diarymanagement/js/commonAppointmentView.js"></script>

<script type="text/javascript" src="diarymanagement/js/editCompleteApmt.js"></script>
<script type="text/javascript" src="diarymanagement/js/dischargepopup.js"></script>
 <script type="text/javascript" src="thirdParties/js/nicEdit.js"></script>

 <script type="text/javascript" src="diarymanagement/js/sendsms.js"></script> 
 <script type="text/javascript" src="diarymanagement/js/addpriscription.js"></script> 
  <script type="text/javascript" src="emr/js/addInvestigation.js"></script> 
 <script type="text/javascript" src="diarymanagement/js/sendApmtAttachnment.js"></script>
 <script type="text/javascript" src="diarymanagement/js/followupsreminder.js"></script>
 <script type="text/javascript" src="diarymanagement/js/otdata.js"></script>
 <script type="text/javascript" src="tools/js/sendLetter.js"></script> 
  <script type="text/javascript" src="diarymanagement/js/takepayment.js"></script>
  
  <!-- jQuery File Upload Dependencies -->
<script src="common/assets/js/jquery.ui.widget.js"></script>
<script src="common/assets/js/jquery.iframe-transport.js"></script> 
<script src="common/assets/js/jquery.fileupload.js"></script>
<script type="text/javascript" src="accounts/js/commonaddcharge.js"></script> 
 
 
 <style>
  .modal-draggable .modal-backdrop {
             position: fixed;
         }

         .modal.modal-draggable {
             overflow: overflow-y;
         }

         .modal-draggable .modal-header:hover {
             cursor: move;
         }
         
		 
		 
 </style>
 
<script>
var remingmedurationvar = '10000';
$(document).ready(function() {
	
	$("#dateTimeLetter").datepicker({

		dateFormat : 'dd/mm/yy',
		yearRange: yearrange,
		minDate : '30/12/1880',
		changeMonth : true,
		changeYear : true

	});
	
	
	$("#priscdate").datepicker({

		dateFormat : 'dd/mm/yy',
		yearRange: yearrange,
		minDate : '30/12/1880',
		changeMonth : true,
		changeYear : true

	});



     /*$('#selecctall').click(function(event) {  //on click 
        if(this.checked) { // check select status
            $('.case').each(function() { //loop through each checkbox
                this.checked = true;  //select all checkboxes with class "checkbox1"               
            });
        }else{
            $('.case').each(function() { //loop through each checkbox
                this.checked = false; //deselect all checkboxes with class "checkbox1"                       
            });         
        }
      });*/    

 
 
 




	<%-- <%String remingmeduration = (String)session.getAttribute("remingmeduration");%>
	<%if(remingmeduration!=null){%>
		remingmedurationvar = '<%=remingmeduration%>';
	<%}%>
	
	 setInterval(function(){ $('#followupsrminderpopup').modal( "show" ); }, remingmedurationvar); --%>

	
	<%String apmuserlist = (String)session.getAttribute("apmuserlist");%>
	apmuserlist = '<%=apmuserlist%>';
//	alert(apmuserlist)
		
		currencySign = '<%=Constants.getCurrency(loginfo)%>';	
});





	
	        bkLib.onDomLoaded(function() {
	           
	        	// new nicEditor().panelInstance('emailBodyLetter');
	        	 new nicEditor({maxHeight : 2500}).panelInstance('emailBodyLetter');
	        	// $('.nicEdit-panelContain').parent().width('100%');
	        	 //$('.nicEdit-panelContain').parent().next().width('100%');
	        	 
	        	// $('.nicEdit-main').width('100%');
	        	// $('.nicEdit-main').height('800px');
	        	 
	        	// new nicEditor().panelInstance('consNote');
	        	 new nicEditor({maxHeight : 250}).panelInstance('consNote');
	        	 
	        	 $('.nicEdit-panelContain').parent().width('100%');
	        	 $('.nicEdit-panelContain').parent().next().width('98%');
	        	 
	        	 $('.nicEdit-main').width('98%');
	        	// $('.nicEdit-main').height('2500px');
	        	
	        	 //document.getElementById('templateName').disabled = 'disabled';
	        	 document.getElementById("user").disabled = 'disabled';
	        	
	      });
	        
	        //document.getElementById('saveId').style.display = '';
	        
</script>

<style><!--
/* body { font-size: 62.5%; } */
/* label, input { display:block; }
		input.text { margin-bottom:12px; width:50%; padding: .4em; }
		input.select { margin-bottom:12px; width:50%; padding: .4em; } */
fieldset {
	padding: 0;
	border: 0;
	margin-top: 25px;
}

h1 {
	font-size: 1.2em;
	margin: .6em 0;
}

div#users-contain {
	width: 350px;
	margin: 20px 0;
}

div#users-contain table {
	margin: 1em 0;
	border-collapse: collapse;
	width: 100%;
}

div#users-contain table td,div#users-contain table th {
	border: 1px solid #eee;
	padding: .6em 10px;
	text-align: left;
}

.ui-dialog .ui-state-error {
	padding: .3em;
}
.managewidhe{
margin-top: -33px;
width: 116%;
margin-left: -30px;
background-color: #efefef;
padding: 8px 5px 11px 6px !important;
border: 1px solid #ccc;
}
.validateTips {
	border: 1px solid transparent;
	padding: 0.3em;
}

.ui-tooltip,.arrow:after {
	background: black;
	border: 2px solid white;
}

.ui-tooltip {
	padding: 10px 20px;
	color: white;
	border-radius: 20px;
	font: bold 14px "Helvetica Neue", Sans-Serif;
	text-transform: uppercase;
	box-shadow: 0 0 7px black;
}

.arrow {
	width: 70px;
	height: 16px;
	overflow: hidden;
	position: absolute;
	left: 50%;
	margin-left: -35px;
	bottom: -16px;
}

.arrow.top {
	top: -16px;
	bottom: auto;
}

.arrow.left {
	left: 20%;
}

.arrow:after {
	content: "";
	position: absolute;
	left: 20px;
	top: -20px;
	width: 25px;
	height: 25px;
	box-shadow: 6px 5px 9px -9px black;
	-webkit-transform: rotate(45deg);
	-moz-transform: rotate(45deg);
	-ms-transform: rotate(45deg);
	-o-transform: rotate(45deg);
	tranform: rotate(45deg);
}

.arrow.top:after {
	bottom: -20px;
	top: auto;
}
.btn-new{
background-color: #EFEFEF;
border-color:#EFEFEF;
color: #595959;
border-radius: 0px;
}
.btn-new:hover{
background-color: #EFEFEF;
border-color:#bbbbbb;
color: #7A7A7A;
border-radius: 0px;
}
.topbarback {
    background-color: #EFEFEF;
   	margin-left: 0px;
	width: 658px;
    padding: 2px 0px 2px 10px;
    border: 1px solid #ccc;
}
.marlft37{
margin-top: -37px;
}
.marleft80{
margin-left: -80px;
}
.marleftr {
    margin-left: -25px;
}
.marlft20 {
    margin-left: -20px;
}
.marlft124{
margin-left: -124px;
}
.wellform{
border: 1px solid #000;
padding: 10px 0px;
width: 100%;
background-color: #F8F8F8;
}
.manaboxwi{
	width: 100%;
    margin-left: 0px;
    margin-top: 0px;
}
.padimp{
padding-right: 4px !important;
padding-left: 0px !important;
}
.well1 {
    min-height: 0px;
    padding: 0px 13px 0px 22px;
    margin-bottom: 0px;
    background-color: none;
    border: none;
    border-radius: 0px;
    box-shadow: none;
}
.minheaight{
    min-height: 460px;
}
.smsbora{

    margin-top: 258px;

}
.heightsetbmi{
	background-color: rgba(51, 153, 102, 0.26);
    padding-top: 7px;
    padding-left: 0px;
    padding-right: 0px;
    margin-top: -1px;
    margin-bottom: 10px;
    width: 100%;
}
.marbo10form{
	margin-bottom: 10px !important;
}
</style>


<%-- <script>
	$(document).ready(function(){
	$(function() {
		 $( "#radio" ).buttonset();
		 $( "#blockradio" ).buttonset();
		
		/*  $( document ).tooltip({
		      position: {
		        my: "center bottom-20",
		        at: "center top",
		        using: function( position, feedback ) {
		          $( this ).css( position );
		          $( "<div>" )
		            .addClass( "arrow" )
		            .addClass( feedback.vertical )
		            .addClass( feedback.horizontal )
		            .appendTo( this );
		        }
		      }
		    }); */
		
		
		
		$( "#dialog-confirm" ).dialog({
			autoOpen: false,
			resizable: false,
			height:140,
			modal: true,
			buttons: {
				"Delete all items": function() {
					$( this ).dialog( "close" );
				},
				Cancel: function() {
					$( this ).dialog( "close" );
				},
				Cancels: function() {
					//$( this ).dialog( "close" );
					$( "#dialogs-confirms" ).dialog( "open" );
				}
			}
		});
		
		
		
		$( "#createinvoiceDiv").dialog({
			autoOpen: false,
			resizable: true,
			height: 550,
			width: 850,
			modal: true,
			buttons: {
				"Pay": function() {
					
					savePaymentForInvoice();
				},
				"Preview": function() {
					
					previewPaymentInvoice();
				},
				Cancel: function() {
					$( this ).dialog( "close" );
				}
				
			}
		});
		
		
		$( "#appointment" ).dialog({
			autoOpen: false,
			resizable: true,
			height: 400,
			width: 450,
			modal: true,
			
			buttons: {
				"Save": function() {
					//$( this ).dialog( "close" );
					var starttime = read_cookie("cookieNewStarttime");
					if(editAppointId == 0){
						$(this).saveSlot('0',starttime);
						
					}else{
						$(this).saveSlot(editAppointId,editStartTime);
						
					}
				
					
				},
				Cancel: function() {
					//document.getElementById('addTreatment').disabled = true;
					$( this ).dialog( "close" );
				}
				
			}
		});
		
		$( "#blockdiv" ).dialog({
			autoOpen: false,
			resizable: true,
			height: 400,
			width: 450,
			modal: true,
			buttons: {
				"Save": function() {
					if(editAppointId == 0){
						$(this).blockSave('0',blockDivTime);
					}else{
						$(this).blockSave(editAppointId,editStartTime);
					}
					
					
					
				},
				
				Delete: function() {
					deleteBlockSlot(editAppointId);
					$( this ).dialog( "close" );
				},
				
				Cancel: function() {
					$( this ).dialog( "close" );
				}
				
			}
		});
		
		
		
		$( "#clientSearchDiv").dialog({
			autoOpen: false,
			resizable: true,
			height: 600,
			width: 550,
			modal: true,
			buttons: {
				"Save": function() {
					$( this ).dialog( "close" );
				},
				Cancel: function() {
					$( this ).dialog( "close" );
				}
				
			}
		});
		
		
		$( "#addPatientDiv" ).dialog({
			autoOpen: false,
			resizable: true,
			height: 600,
			width: 500,
			modal: true,
			buttons: {
				"Save": function() {
					savePatient();
					
				},
				Cancel: function() {
					$( this ).dialog( "close" );
				}
				
			}
		});
		
		$( "#addTreatmentEpisodeDiv" ).dialog({
			autoOpen: false,
			resizable: true,
			height: 500,
			width: 450,
			modal: true,
			buttons: {
				"Save": function() {
					saveTreatment();
					
				},
				Cancel: function() {
					$( this ).dialog( "close" );
					

				}
				
			}
		});
		
		
		$( "#modifyPopup" ).dialog({
			autoOpen: false,
			resizable: true,
			height: 400,
			width: 450,
			modal: true,
			buttons: {
				Cancel: function() {
					$( this ).dialog( "close" );
				}
				
			}
		});
		
		
		$( "#completeAppointmentDivId" ).dialog({
			autoOpen: false,
			resizable: true,
			height: 600,
			width: 850,
			modal: true,
			buttons: {
				
				
				"Create Charge & Update Account": function(){
					createChargeAndUpdateAccount('Charge');
				},
				/* "Invoice Now / Pay Later": function(){
					createInvoice('Invoice');
				},
				"Submit Invoice": function(){
					submitInvoice();
				},
				
				"Record Payment": function(){
					paynowForInvoice();
				},
				"Cash Desk": function(){
					paynowForInvoice();
					
				}, */
				"Close": function() {
					$( this ).dialog( "close" );
				}
				
			}
		});
		$( "#submitInvoicePopup" ).dialog({
			autoOpen: false,
			resizable: true,
			height: 450,
			width: 520,
			modal: true,
			buttons: {
				"Submit": function(){
					updateInvoiceStatus();
					
				},
				Cancel: function() {
					$( this ).dialog( "close" );
				}
				
			}
		});
		
		$( "#reminderPopup" ).dialog({
			autoOpen: false,
			resizable: true,
			height: 280,
			width: 420,
			modal: true,
			buttons: {
				Cancel: function() {
					$( this ).dialog( "close" );
				}
				
			}
		});
		$( "#clientdidnotattentpopup" ).dialog({
			autoOpen: false,
			resizable: true,
			height: 400,
			width: 450,
			modal: true,
			buttons: {
				"Ok": function() {
					setClientDidNotComeConfirm();
					$( this ).dialog( "close" );
				},
				Cancel: function() {
					$( this ).dialog( "close" );
				}
				
			}
		});
		
		
		$( "#checkavlbltydivpopup" ).dialog({
			autoOpen: false,
			resizable: true,
			height: 400,
			width: 700,
			modal: true,
			buttons: {
				"Ok": function() {
					setClientDidNotComeConfirm();
					$( this ).dialog( "close" );
				},
				Cancel: function() {
					$( this ).dialog( "close" );
				}
				
			}
		});
		
		$( "#addPatientThirdPartyPopup" ).dialog({
			autoOpen: false,
			resizable: true,
			height: 400,
			width: 400,
			modal: true,
			buttons: {
				"Save": function() {
					savePatientThirdPartyDetail();
					//$( this ).dialog( "close" );
				},
				Cancel: function() {
					$( this ).dialog( "close" );
				}
				
			}
		});
		
		
		$( "#thirdPartyDetailsPopup" ).dialog({
			autoOpen: false,
			resizable: true,
			height: 470,
			width: 500,
			modal: true,
			buttons: {
				"Save": function() {
					saveNewThirdPartyDetail();
					//$( this ).dialog( "close" );
				},
				Cancel: function() {
					$( this ).dialog( "close" );
				}
				
			}
		});
		
		
	});
	
	
	
	
	$(document).on('click','.ui-dialog-titlebar-close',function(){
		//document.getElementById('addTreatment').disabled = true;
		//$( "#addTreatment" ).prop( "disabled", true );
		resetTreatmentEpisodeFields();
		resetAddClientFileds();
		resetPatientThirdPartyDetails();
		resetNewThirdPartyDetails();
		
	});
});
	
	</script> --%>
</head>
<body>

	
<!-- Book Appointment Popup Modal -->
	<div class="modal fade modal-draggable" id="appointment" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					
					<div class="car-info">
						<ul>
							<li><h4 class="modal-title" id="bookApmtLbl">Book Appointment</h4></li>
							<li id="">Appointment with: <span id="apmtwithz">Fr.Machine 01</span></li>
							<li id="">Speciality: <span id="diciplinez">Nephrologist</span></li>
							<li id="">Location: <span id="locationz">Ramdaspeth</span></li>
							<li id="">Date: <span id="datez">2016-03-16</span></li>
						</ul>
					</div>
				</div>
				<div class="modal-body padd0">
					<%@ include file="/diarymanagement/pages/bookAppointment.jsp" %>
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" onclick="bookSlot(1)">Book With Payment</button>
					<button type="button" class="btn btn-primary" onclick="bookSlot(0)">Book Without Payment</button>
					<button type="button" class="btn btn-primary hidden" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- Take Payment Modal -->
	<div class="modal fade modal-draggable" id="takepaymentmodel" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					
					<div class="car-info">
						<ul>
							<li><h4 class="modal-title" id="tkepmntLbl">Take Payment</h4></li>
							<li id="">Appointment with: <span id="tkepmntwithz">Fr.Machine 01</span></li>
							<li id="">Speciality: <span id="tkepmntdiciplinez">Nephrologist</span></li>
							<li id="">Location: <span id="tkepmntlocationz">Ramdaspeth</span></li>
							<li id="">Date: <span id="tkepmntdatez">2016-03-16</span></li>
						</ul>
					</div>
				</div>
				<div class="modal-body padd0">
					<%@ include file="/diarymanagement/pages/takepayment.jsp" %>
					
				</div>
				<div class="modal-footer">
					
					<button type="button" class="btn btn-primary" onclick="saveCashDesk()">Record Payment</button>
					<button type="button" class="btn btn-primary hidden" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Appointment Availability Modal -->

	<div class="modal fade" id="checkavlbltydivpopup" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"  data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Appointment
						Availability</h4>
				</div>
				<div class="modal-body">
					<%@ include file="/diarymanagement/pages/checkAvailability.jsp"%>
				</div>
				<div class="modal-footer">

					<button type="button" class="btn btn-primary"
						onclick="setClientDidNotComeConfirm();">Ok</button>
					<button type="button" class="btn btn-primary hidden" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Confirmed Delete Modal -->
	<div class="modal fade" id="dialog-confirm" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Empty the recycle
						bin?</h4>
				</div>
				<div class="modal-body">
					<p>
						<span class=""></span>These items will be permanently deleted and
						cannot be recovered. Are you sure?
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary hidden" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>




	<!-- Modal All Client Search Div -->
	<div class="modal fade" id="clientSearchDiv" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Patient Search</h4>
				</div>
				<div class="modal-body" style="height: 600px;overflow: scroll;">
					<%@ include file="/diarymanagement/pages/allClient.jsp"%>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary hidden" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Add New Patient -->
	<div class="modal fade" id="addPatientDiv" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true" data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-lg">			
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Add New Patient</h4>
				</div>
				<div class="modal-body" style="height: 600px;overflow: scroll;">
					<%@ include file="/diarymanagement/pages/addPatientPage.jsp"%>
					<button type="button" class="btn btn-primary"
						onclick="return savePatient()">Save</button>
					<button type="button" class="btn btn-primary hidden" data-dismiss="modal" >Close</button>
				</div>
				<!-- <div class="modal-footer">
					
				</div> -->
			</div>
		</div>
	</div>
	<!-- Add New Doctor Surgery Details Modal -->
	<div class="modal fade" id="doctorSurgeryPopup" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Add New Doctor Surgery</h4>
				</div>
				<div class="modal-body">
						<%@ include file="/thirdParties/pages/addNewDoctSurgery.jsp"%>	
						
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						onclick="saveNewPopupSurgeryDetails()">Save</button>

					<button type="button" class="btn btn-primary hidden" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>			
	<!-- Add GP Details Modal -->
	<div class="modal fade" id="gpDetailsPopup" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Add New GP
						Details</h4>
				</div>
				<div class="modal-body">
						<%@ include file="/thirdParties/pages/addNewGp.jsp"%>	
						
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						onclick="saveNewGpData()">Save</button>

					<button type="button" class="btn btn-primary hidden" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Add Third Party Details Modal -->
<div class="modal fade" id="thirdPartyDetailsPopup1" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Add New Third Party</h4>
				</div>
				<div class="modal-body" style="height: 600px;overflow: scroll;">
						<%@ include file="/thirdParties/pages/addNewTp.jsp"%>	
						
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						onclick="saveTpDetails()">Save</button>

					<button type="button" class="btn btn-primary hidden" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>	
	<!-- Add Treatment Episode -->
	<div class="modal fade" id="addTreatmentEpisodeDiv" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Create Treatment
						Episode</h4>
				</div>
				<div class="modal-body">
					<%@ include file="/treatmentEpisode/pages/addTreatmentEpisode.jsp"%>
				</div>
				<div class="modal-footer">

					<button type="button" class="btn btn-primary"
						onclick="saveTreatment();">Save</button>
					<button type="button" class="btn btn-primary hidden" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Block Apmt Modal -->
	<div class="modal fade" id="blockdiv" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<div class="car-info">
						<ul>
							<li><h4 class="modal-title" id="myModalLabel">
							
								 <%String openedb = (String)session.getAttribute("openedb"); %>
		                         <% if(openedb.equals("opd")){%>
		                            Block Slot
		                          <%}else{ %>
		                         	Scheduler
		                          <% }%>
							</h4></li>
							<li>Dairy User: <span id="apmtwithbz">Fr.Machine 01</span></li>
							<li>Location: <span id="locationbz">Ramdaspeth</span></li>
							<li>Date: <span id="datebz">2016-03-16</span></li>
						</ul>
					</div>
					
				</div>
				<div class="modal-body padd0">
					<s:form action="saveNotAvailableSlot" id="notavailable_form"
						theme="simple" validate="True">
						<div class="">
						<div class="col-lg-12 booknasd" id="blockradio">
						<div class="car-info">
							<div class="">
									<ul>
										 <% if(openedb.equals("opd")){%>
											<li title="OPD"><input type="radio" id="blockradio1" name="blockradio1" onclick="showAppointmentDialogBox()" />&nbsp;<label for="radio1">OPD</label> </li>
											<li title="Block Slot"><input type="radio" id="blockradio2" name="blockradio1" checked="checked" onclick="showBlockingDialogBox()" />&nbsp;<label for="radio2">Block Slot</label></li>
										<%}else{ %>
											<li style="display: none;" title="OPD"><input type="radio" id="blockradio1" name="blockradio1" onclick="showAppointmentDialogBox()" />&nbsp;<label for="radio1">OPD</label> </li>
											<li title="Block Slot"><input type="radio" id="blockradio2" name="blockradio1" checked="checked" onclick="showBlockingDialogBox()" />&nbsp;<label for="radio2">Scheduler Slot</label></li>
										<% }%>
									</ul>
									</div>
								</div>
								
								
							</div>
						</div>
						<div class="bookapoinbac">
						<div class="row" id="repeatblockdivid">
							
							
							<%-- <div class="col-lg-12" id="apmtheading">
								<input type="checkbox" name="wholeweek" id="blockwholeweek" /> <label
									class="text-info">Repeat for <select name="weekNumber" id="blockweekNumber" >
								<option value="1">1</option>
								<option value="4">4</option>
								<option value="12">12</option>
								<option value="26">26</option>
							</select>
						 week</label>
							</div>
							
							<div id="weekNameListdiv">
								<s:checkboxlist label="What's your favor color" list="weekNameList" 
	   							name="blockWeekName"  />
	   						</div>
	   						
	   						
						</div> --%>
						
						<div class="col-lg-12 hidden-sm hidden-xs" id="apmtheading" >
						
								 <label><a data-toggle="collapse" href="#blockslotcoll" aria-expanded="false" aria-controls="collapseExample">Repeat Booking for </a><select name="weekNumber" id="blockweekNumber" >
								<%for(int i=0;i<=24;i++){ %>
									<option  value="<%=i %>"><%=i %></option>
								<%} %>	
							</select>
						 week</label>
						 <div class="collapse" id="blockslotcoll">
							  <div class="well1">
							  <input type="checkbox" name="wholeweek" id="blockwholeweek"  onclick="checkBlockAllWeek();"/> <label>Select All</label>
							  <div id="weekNameListdiv" tabindex="102" class="hidden-sm hidden-xs">
							<%-- 	<s:checkboxlist label="" list="weekNameList" 
	   							name="weekName" theme="simple"  /> --%>
	   							
	   							<input class="weekne" type="checkbox" id="blockWeekName-1" > <label>Monday</label>
	   							<input type="checkbox" id="blockWeekName-2" > <label>Tuesday</label> 
	   							<input type="checkbox" id="blockWeekName-3" > <label>Wednesday</label>
	   							<input  type="checkbox" id="blockWeekName-4" > <label>Thursday</label>
	   							<input class="weekne" type="checkbox" id="blockWeekName-5" > <label>Friday</label>
	   							<input type="checkbox" id="blockWeekName-6" > <label>Saturday</label> 
	   							<input type="checkbox" id="blockWeekName-7" > <label>Sunday</label> 
	   						</div>
							  </div>
							</div>
							</div>
	   						
						</div>
						
					</div>
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<div class="col-lg-12">
								<input type="hidden" name="blockslotId" id="blockslotId" /> <input
									type="hidden" name="blockdiaryUserId" id="blockdiaryUserId" />
								<input type="hidden" name="status" id="status" value="1" />
							</div>
						</div>
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<div class="col-lg-12" id="apmtheading"></div>
						</div>
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 hidden">
							<div class="col-lg-4 col-md-4 col-sm-4 popold">Diary User:</div>

							<div class="col-lg-8 col-md-8 col-sm-8">
								<s:textfield id="blockuser" name="blockuser" readonly="true"
									cssClass="form-control showToolTip" title="Diary User"
									placeholder="Diary User"
									 />
							</div>
						</div>
						<hr class="hidden-sm hidden-xs hidden"/>
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 hidden">
							<div class="col-lg-4 col-md-4 col-sm-4 popold">Location:</div>

							<div class="col-lg-8 col-md-8 col-sm-8">
								<s:if test="%{#locationList != 'null'}">
									<s:select id="blocklocation" name="blocklocation"
										list="locationList" listKey="locationid" listValue="location"
										disabled="true" theme="simple"
										cssClass="form-control showToolTip" title="Select Location"
										 />
								</s:if>
							</div>
						</div>
						
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 hidden">
							<div class="col-lg-3 col-md-3 col-sm-3 text-right col-md-5">Ward:</div>

							<div class="col-lg-9 col-md-9 col-sm-9 padrinil">
								<select name="blockroom" id="blockroom"
									class="form-control showToolTip" title="Select Room">
									<option value="Room1">Ward 1</option>
									<option value="Room2">Ward 2</option>
								</select>
							</div>
						</div>
						<hr class="hidden hidden-sm hidden-xs"/>
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 hidden">
							<div class="col-lg-3 col-md-3 col-sm-3 text-right popold">Date:</div>

							<div class="col-lg-9 col-md-9 col-sm-9 padrinil">
								<s:textfield name="blockdate" id="blockdate" readonly="true"
									cssClass="form-control showToolTip" title="Enter Date"
									placeholder="Enter Date"
									></s:textfield>
							</div>
						</div>
						<br />
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						
							<div class="col-lg-3 col-md-3 col-sm-3 text-right  col-md-5">Start Time:</div>

							<div class="col-lg-9 col-md-9 col-sm-9 padrinil">
								<s:if test="%{#startTimeList != 'null'}">
									<s:select id="blocksTime" name="blocksTime"
										list="startTimeList" onchange="resetBlockDivField();"
										theme="simple" cssClass="form-control showToolTip"
										title="Enter Start Time" placeholder="Enter Start Time"
										 />
								</s:if>
							</div>
						</div>


						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<div class="col-lg-3 col-md-3 col-sm-3"></div>

							<div class="col-lg-9 col-md-9 col-sm-9 padrinil">
								<label id="blocksTimeError" class = "text-danger"></label>
							</div>
						</div>

						<br />
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 marbot15">
							<div class="col-lg-3 col-md-3 col-sm-3 text-right cond">End Time:</div>

							<div class="col-lg-9 col-md-9 col-sm-9 padrinil">
								<s:if test="%{#endTimeList != 'null'}">
									<s:select id="blockendTime" name="blockendTime" onchange="setblockduration(this.value)"
										list="endTimeList"  theme="simple"
										cssClass="form-control showToolTip" title="Select End Time"
										 />
								</s:if>
							</div>
						</div>
						<br />

						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<div class="col-lg-3 col-md-3 col-sm-3 text-right">
								<label class="red">*</label>Duration:
							</div>

							<div class="col-lg-9 col-md-9 col-sm-9 padrinil">
								<s:if test="%{#apmtBlockDurationList != 'null'}">
									<s:select id="blockapmtDuration" name="blockapmtDuration"
										onchange="setBlockDivEndTime(this.value)" headerKey="0"
										headerValue="00:00" list="apmtBlockDurationList"
										theme="simple" cssClass="form-control showToolTip"
										title="Select Duration"
										/>
								</s:if>
							</div>
						</div>

						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<div class="col-lg-3 col-md-3 col-sm-3"></div>

							<div class="col-lg-9 col-md-9 col-sm-9 padrinil">
								<label id="blockapmtDurationError" class="text-danger"></label>
							</div>
						</div>
						
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 marbot15">
						
						<% if(openedb.equals("opd")){%>
											<div class="col-lg-3 col-md-3 col-sm-3 text-right">
								<label class="red">*</label>Reason for non availability: 
							</div>

							<div class="col-lg-9 col-md-9 col-sm-9 padrinil">
								<s:select name="reasonforblock" id="reasonforblock"
									list="{'Admin','Break','Lunch','Cancelation','Practice Meeting','Teaching','Teaching Session','Teaching Cources','Available'}"
									theme="simple" cssClass="form-control showToolTip"
									title="Select Reason" ></s:select>
							</div>
										<%}else{ %>
											<div class="hidden col-lg-3 col-md-3 col-sm-3 text-right">
								<label class="red">*</label>Reason for non availability: 
							</div>

							<div class="hidden col-lg-9 col-md-9 col-sm-9 padrinil">
								<s:select name="reasonforblock" id="reasonforblock"
									list="{'Admin','Break','Lunch','Cancelation','Practice Meeting','Teaching','Teaching Session','Teaching Cources','Available'}"
									theme="simple" cssClass="form-control showToolTip"
									title="Select Reason" ></s:select>
							</div>
										<% }%>
							
						</div>
						

						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<div class="col-lg-3 col-md-3 col-sm-3 text-right popold">Notes:</div>

							<div class="col-lg-9 col-md-9 col-sm-9 padrinil">
								<s:textarea name="blocknotes" id="blocknotes"
									cssClass="form-control showToolTip" title="Enter Note"
									placeholder="Enter Note"
									></s:textarea>
							</div>
						</div>

						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<div class="col-lg-4 col-md-4 col-sm-4  col-md-5"></div>

							<div class="col-lg-8 col-md-8 col-sm-8">
								<!-- <label id="blocknotesError" class="text-danger"></label> -->
							</div>
						</div>
					</s:form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						onclick="bookNotAviSlot()">Book</button>
					<button type="button" class="btn btn-primary"
						onclick="deleteNotAviSlot()">Delete</button>
					<button type="button" class="btn btn-primary hidden" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- client 	 popup  -->

	<div class="modal fade" id="modifyPopup" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true" data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<button type="button" class="close" data-dismiss="modal" onclick="movetosetCommonAction()">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Day-To-Day Admin &nbsp;&nbsp;|&nbsp;&nbsp;<span><a href="#" onclick="showLetterHead()" title="Print Letterhead"><i class="fa fa-print" aria-hidden="true"></i></a></span> &nbsp;&nbsp;|&nbsp;&nbsp;<span id="editSave1"><a href="#" style="color: yellow;" onclick="editBMI(1)" title="Edit"><i class="fa fa-pencil" aria-hidden="true"></i></a></span></h4>
				</div>
				<div class="modal-body" style="padding:0px;">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 heightsetbmi">
									<div class="row">
										<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
											<div class="col-lg-2 col-md-2 col-sm-2 col-xs-3">
												<div class="form-group marbo10form">
												    <label for="exampleInputEmail1">Height <small>cm</small></label>
												    <p id="height1"></p>
												  </div>
											</div>
											<div class="col-lg-2 col-md-2 col-sm-2 col-xs-3">
												<div class="form-group marbo10form">
												    <label for="exampleInputEmail1">Weight <small>Kg's</small></label>
												    <p id="weight1">72 kg</p>
												  </div>
											</div>
											<div class="col-lg-2 col-md-2 col-sm-2 col-xs-3">
												<div class="form-group marbo10form">
												    <label for="exampleInputEmail1">BMI</label>
												    <p id="bmi1">24.39</p>
												  </div>
											</div>
											<div class="col-lg-2 col-md-2 col-sm-2 col-xs-3">
												<div class="form-group marbo10form">
												    <label for="exampleInputEmail1">Pulse</label>
												    <p id="pulse1">70 /min</p>
												  </div>
											</div>
											<div class="col-lg-2 col-md-2 col-sm-2 col-xs-3">
												<div class="form-group marbo10form">
												    <label for="exampleInputEmail1">Sys-BP</label>
												    <p id="sysbp1">120 mm Hg</p>
												  </div>
											</div>
											<div class="col-lg-2 col-md-2 col-sm-2 col-xs-3">
												<div class="form-group marbo10form">
												    <label for="exampleInputEmail1">Dia-BP</label>
												    <p id="diabp1">80 mm Hg</p>
												  </div>
											</div>
										</div>
									</div>
								</div>
					<div id="modifyClient" style="font-size: 16px;color: rgb(61, 61, 61);">Manoj Mishra</div>
					<div class="col-lg-9 col-md-9 col-sm-9 col-xs-8 mdscr md9">
					
						<div class="col-lg-2 col-md-2 col-sm-4 col-xs-6 dtd padimp iconsizlg2" id="clientarrived" >
							<div class="thumbnail" id="clienthasarrived"  onclick="clienthasarrived(1)" style="cursor: pointer;">
						      <img  src="popicons/client_arrived.png" alt="..." class="img-responsive">
						      <div class="caption"><p align="center" class="dtdf">Patient has Arrived</p></div>
					    	</div>
						</div> 
						<div class="col-lg-2 col-md-2 col-sm-4 col-xs-6 padimp iconsizlg2" id="clientisbeingseen">
							<div class="thumbnail" id="clientseen" onclick="setClientIsBeingSeen(2)" style="cursor: pointer;">
						      <img src="popicons/client_seen.png" alt="..." class="img-responsive">
						      <div class="caption"><p align="center" class="dtdf">Patient is Being Seen</p></div>
					    	</div>
						</div>
						<div class="col-lg-2 col-md-2 col-sm-4 col-xs-6 padimp iconsizlg2">
							<div class="thumbnail" id="completeapmt" onclick="completeApmt()" style="cursor: pointer;">
						      <img src="popicons/cbs.png" alt="..." class="img-responsive">
						      <div class="caption"><p align="center" class="dtdf">Complete Appointment</p></div>
					    	</div>
						</div>
						<div class="col-lg-2 col-md-2 col-sm-4 col-xs-6 dtd padimp iconsizlg2" id="clientdidnotcome">
							<div class="thumbnail" id="dna" onclick="setClientDidNotCome()" style="cursor: pointer;">
						      <img src="popicons/cdna.png" alt="..." class="img-responsive">
						      <div class="caption"><p align="center" class="dtdf" id="dnatextid">Patient Did Not Attend</p></div>
					    	</div>
						</div>
						<div class="col-lg-2 col-md-2 col-sm-4 col-xs-6 dtd padimp iconsizlg2">
							<div class="thumbnail" id="modify" onclick="modifythisAppointment()" style="cursor: pointer;">
						      <img src="popicons/modify.png" alt="..." class="img-responsive">
						      <div class="caption"><p align="center" class="dtdf">Modify Appointment</p></div>
					    	</div>
						</div>
						<div class="col-lg-2 col-md-2 col-sm-4 col-xs-6 padimp iconsizlg2">
							<div class="thumbnail" id="deleteapmtiddiv" style="cursor: pointer;" onclick="openCancelApmtPopup()">
						      <img src="popicons/delete.png" alt="..." class="img-responsive">
						      <div class="caption"><p align="center" class="dtdf">Cancel</p></div>
					    	</div>
						</div>
						
					
						<div class="col-lg-2 col-md-2 col-sm-4 col-xs-6 padimp hidden iconsizlg2" >
						<!-- 	<div class="thumbnail" id="reminder" onclick="reminder()" style="cursor: pointer;">
						      <img src="popicons/confirmation.ico" alt="...">
						      <div class="caption"><p align="center">Confirmation & Reminders</p></div>
					    	</div> -->
					    	<div class="thumbnail " id="reset" onclick="ResetToNotArrived(0)" style="cursor: pointer;">
						      <img src="popicons/rc.png" alt="..." class="img-responsive">
						      <div class="caption"><p align="center" class="dtdf">Reverse Completion</p></div>
					    	</div>
					    	<input type="hidden" id="reminder" name="reminder"/>
					
						</div>
						<div class="col-lg-2 col-md-2 col-sm-4 col-xs-6 dtd padimp iconsizlg2">
							<div class="thumbnail" id="sendLetter" onclick="sendLetter()" style="cursor: pointer;">
							
						      <img src="popicons/send_letter.png" alt="..." class="img-responsive"> 
						      <div class="caption"><p align="center" class="dtdf">Send Email/Letter</p></div>
					    	</div>
						<!-- <input type="button" id="sendLetter"
								class="btn btn-default width-full"
								value="  Send Letter " onclick="sendLetter()"> -->
						</div>
						<div class="col-lg-2 col-md-2 col-sm-4 col-xs-6 dtd padimp iconsizlg2" >
						
							<div class="thumbnail" id="" onclick="sendsmspopupopen()" style="cursor: pointer;">
						      <img src="popicons/sms.png" alt="..." class="img-responsive">
						      <div class="caption"><p align="center" class="dtdf">Send SMS</p></div>
					    	</div>
						
						</div>
						<div class="col-lg-2 col-md-2 col-sm-4 col-xs-6 padimp iconsizlg2">
						<%-- <s:form action="Statement" id="view_acc_frm" target="blank"> --%>
						
						<s:form action="Statement" id="view_acc_frm" method="post" 
              							onsubmit="return redirectToViewAcc()" target="formtarget">
							
									<s:hidden name="clientId" id="viewAccClientid"/>
									<s:hidden name="thirdParty" id="viewAccthirdparty"/>
									<s:hidden name="transactionType" id="viewAcctransactionType"/>
									<s:hidden name="location" id="viewAccLocationid"/>
									<s:hidden name="client" id="viewAccclientname"/>
									<s:hidden name = "payby" id ="viewAccPayby"></s:hidden>
									<s:hidden name="fromDate" id="viewAccfromDateid"/>
									<s:hidden name="toDate" id="viewAcctoDateid"/>
									
							<div class="thumbnail" id="sendLetter" onclick="redirectToViewAcc()" style="cursor: pointer;">
						      <img src="popicons/view_account.png" alt="..." class="img-responsive">
						      <div class="caption"><p align="center" class="dtdf">View Account</p></div>
					    	</div>
									
									
								<!-- 	<input type="button" id="completeapmt"
								class="btn btn-default width-full"
								value="View Account" onclick="redirectToViewAcc()"> -->
								</s:form>
						</div>
						<div class="col-lg-2 col-md-2 col-sm-4 col-xs-6 padimp iconsizlg2" >
						
							<div class="thumbnail" id="sendLetter" onclick="showApptTreatment()" style="cursor: pointer;">
						      <img src="popicons/view_treatment.png" alt="..." class="img-responsive">
						      <div class="caption"><p align="center" class="dtdf">View Treatment</p></div>
					    	</div>
						
						</div>
						<div class="col-lg-2 col-md-2 col-sm-4 col-xs-6 dtd padimp iconsizlg2" >
						
							<div class="thumbnail" id="sendLetter" onclick="redirectToApmtFinder()" style="cursor: pointer;">
						      <img src="popicons/finder.png" alt="..." class="img-responsive">
						      <div class="caption"><p align="center" class="dtdf">Appointment Finder</p></div>
					    	</div>
						
						</div>
						
							
						
						<!--<div class="col-lg-2 col-md-2 col-sm-4 col-xs-6 dtd padimp iconsizlg2" >
						
							<div class="thumbnail" id="" onclick="redirectconstoemr()" style="cursor: pointer;">
						      <img src="popicons/consultation_note.png" alt="..." class="img-responsive">
						      <div class="caption"><p align="center" class="dtdf">Consultation Note</p></div>
					    	</div>
						
						</div>
						
						
						--><div class="col-lg-2 col-md-2 col-sm-4 col-xs-6 dtd padimp iconsizlg2" >
						
							<div class="thumbnail" id="" onclick="showcrddebit()" style="cursor: pointer;">
						      <img src="cicon/raise_credit.png" alt="..." class="img-responsive">
						      <div class="caption"><p align="center" class="dtdf">Advance & Refund</p></div>
					    	</div>
						
						</div>
						
						<div class="col-lg-2 col-md-2 col-sm-4 col-xs-6 dtd padimp iconsizlg2 hidden" >
						
							<div class="thumbnail" id="" onclick="modfyDiagnosis()" style="cursor: pointer;">
						      <img src="popicons/modify.png" alt="..." class="img-responsive">
						      <div class="caption"><p align="center" class="dtdf">Modify Diagnosis</p></div>
					    	</div>
						
						</div>
						
						
						<div class="col-lg-2 col-md-2 col-sm-4 col-xs-6 dtd padimp iconsizlg2" >
						
							<div class="thumbnail" id="" onclick="showopdpriscription()" style="cursor: pointer;">
						      <img src="popicons/medicine.png" alt="..." style="width: 64px; height: 64px;">
						      <div class="caption"><p align="center" class="dtdf">Add prescription</p></div>
					    	</div>
						
						</div>
						
						<div class="col-lg-2 col-md-2 col-sm-4 col-xs-6 dtd padimp iconsizlg2" >
						
							<div class="thumbnail" id="" onclick="showopdInvestigation()" style="cursor: pointer;">
						      <img src="popicons/asmnt.png" alt="..." style="width: 64px; height: 64px;">
						      <div class="caption"><p align="center" class="dtdf">Add Investigation</p></div>
					    	</div>
						
						</div>
						
						
						
					</div>
					
					
						
					
					
					
				</div>
				
				
					
				
				<div class="modal-footer">
					<!-- <button type="button" class="btn btn-primary"
						onclick="updateInvoiceStatus()">Submit</button> -->

					<button type="button" class="btn btn-primary hidden" data-dismiss="modal" onclick="movetosetCommonAction()">Close</button>
				</div>
			</div>
		</div>
	</div>
	

	

	<!-- Complete Appointment Popup  -->

	<div class="modal fade" id="completeAppointmentDivId" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="completeAmtTitle">Complete Appointment</h4>
				</div>
				<div class="modal-body">
				
					<%@ include file="/diarymanagement/pages/completeApmt.jsp"%>
				</div>
				
				<s:form action="estimateCharges" theme="simple" id="estimatefrm" target="formtarget">
					<s:hidden name="clientId" id="estimateclientid"/>
					<s:hidden name="actionType" value="0"/>
				</s:form>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" 
						onclick="createopdestimate()">View
						Estimate</button>
				
					<button type="button" class="btn btn-primary" data-dismiss="modal"
						onclick="createChargeAndUpdateAccount('Charge')">Create
						Charge</button>
					<!--  <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="createInvoice('Invoice')">Invoice Now / Pay Later</button>
      <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="submitInvoice()">Submit Invoice</button>
      <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="paynowForInvoice()">Record Payment</button>
      <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="paynowForInvoice()">Cash Desk</button> -->
					<button type="button" class="btn btn-primary hidden" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
<!-- Edit Complete Appointment -->

<div class="modal fade" id="editcompleteAppointmentDivId" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="completeAmtTitle1">Complete Appointment</h4>
				</div>
				<div class="modal-body">
				
					<%@ include file="/diarymanagement/pages/editCompleteApmt.jsp"%>
				</div>
				
				
				
				<div class="modal-footer">
				
					
			
					<button type="button" class="btn btn-primary" data-dismiss="modal"
						onclick="updateChargeAccount('Charge')">Create
						Charge & Update Account</button>
			
					<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
</div>

<!-- Complete Appointment Action Popup -->
<div class="modal fade" id="completeActionPopup" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true" data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<button type="button" class="close" data-dismiss="modal" onclick="movetosetCommonAction()">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Day-To-Day Admin &nbsp;&nbsp;|&nbsp;&nbsp;<span><a href="#" onclick="showLetterHead()" title="Print Letterhead"><i class="fa fa-print" aria-hidden="true"></i></a></span> &nbsp;&nbsp;|&nbsp;&nbsp;<span id="editSave2"><a href="#" style="color: yellow;" onclick="editBMI(2)" title="Edit"><i class="fa fa-pencil" aria-hidden="true"></i></a></span></h4>
				</div>
				<div class="modal-body" style="padding:0px;">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 heightsetbmi">
									<div class="row">
										<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
											<div class="col-lg-2 col-md-2 col-sm-2 col-xs-3">
												<div class="form-group marbo10form">
												    <label for="exampleInputEmail1">Height <small>cm</small></label>
												    <p id="height2"></p>
												  </div>
											</div>
											<div class="col-lg-2 col-md-2 col-sm-2 col-xs-3">
												<div class="form-group marbo10form">
												    <label for="exampleInputEmail1">Weight <small>Kg's</small></label>
												    <p id="weight2">72 kg</p>
												  </div>
											</div>
											<div class="col-lg-2 col-md-2 col-sm-2 col-xs-3">
												<div class="form-group marbo10form">
												    <label for="exampleInputEmail1">BMI</label>
												    <p id="bmi2">24.39</p>
												  </div>
											</div>
											<div class="col-lg-2 col-md-2 col-sm-2 col-xs-3">
												<div class="form-group marbo10form">
												    <label for="exampleInputEmail1">Pulse</label>
												    <p id="pulse2">70 /min</p>
												  </div>
											</div>
											<div class="col-lg-2 col-md-2 col-sm-2 col-xs-3">
												<div class="form-group marbo10form">
												    <label for="exampleInputEmail1">Sys-BP</label>
												    <p id="sysbp2">120 mm Hg</p>
												  </div>
											</div>
											<div class="col-lg-2 col-md-2 col-sm-2 col-xs-3">
												<div class="form-group marbo10form">
												    <label for="exampleInputEmail1">Dia-BP</label>
												    <p id="diabp2">80 mm Hg</p>
												  </div>
											</div>
										</div>
									</div>
								</div>
					<div id="modifyClient1" style="font-size: 16px;color: rgb(61, 61, 61);">Manoj Mishra</div>
					
						<div class="col-lg-9 col-md-9 col-sm-9 col-xs-8 mdscr md9">
							<div class="col-lg-2 col-md-2 col-sm-4 col-xs-6 dtd padimp iconsizlg2">
								<div class="thumbnail" style="cursor: pointer;" onclick="openOtNotes()">
							      <img  src="popicons/otnote.png" alt="..." class="img-responsive">
							      <div class="caption"><p align="center" class="dtdf">OT Notes</p></div>
						    	</div>
							</div>  
						
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 padimp iconsizlg2">
							<div class="thumbnail" id="completeapmt" onclick="editCompleteApmt()" style="cursor: pointer;">
						      <img src="popicons/modify.png" alt="..." class="img=responsive">
						      <div class="caption"><p align="center">Modify Appointment</p></div>
					    	</div>
						</div>
						
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 dtd padimp iconsizlg2">
							<div class="thumbnail" id="completeapmt" onclick="checkAppointmentInvoiced()" style="cursor: pointer;">
						      			<img src="popicons/reset.png" alt="..." class="img=responsive">
						      		<div class="caption"><p align="center">Reset To Not Complete</p></div>
					    			</div>
					    		</div>
						
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 padimp iconsizlg2">
						<%-- <s:form action="Accounts" id="accountchargefrm" target="blank"> --%>
						
						<s:form action="Accounts" id="accountchargefrm" method="post" 
              							onsubmit="return redirectToCreateCharge()" target="formtarget">
              							
									<s:hidden name="clientId" id="accountChargeClientid"/>
									<s:hidden name="thirdParty" id="accountchargethirdparty"/>
									<s:hidden name="transactionType" id="accountchargetransactionType"/>
									<s:hidden name="location" id="accountsLocationid"/>
									<s:hidden name="client" id="accountclientid"/>
									<s:hidden name = "payby" id ="accountpayby"></s:hidden>
									<s:hidden name="appointmentid" id="crtchargeapmtid"/>
									
										<div class="thumbnail" id="completeapmt" onclick="redirectToCreateCharge()" style="cursor: pointer;">
						      <img src="popicons/invoice.png" alt="..." class="img=responsive">
						      <div class="caption"><p align="center">Create Invoice</p></div>
					    	</div>
									
								
								</s:form>
							</div>
							
							
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 dtd padimp iconsizlg2">
							<s:form action="Statement" id="view_acc_frm" target="blank">
									<s:hidden name="clientId" id="viewAccClientid"/>
									<s:hidden name="thirdParty" id="viewAccthirdparty"/>
									<s:hidden name="transactionType" id="viewAcctransactionType"/>
									<s:hidden name="location" id="viewAccLocationid"/>
									<s:hidden name="client" id="viewAccclientname"/>
									<s:hidden name = "payby" id ="viewAccPayby"></s:hidden>
									<s:hidden name="fromDate" id="viewAccfromDateid"/>
									<s:hidden name="toDate" id="viewAcctoDateid"/>
									
										<div class="thumbnail" id="completeapmt" onclick="redirectToViewAcc()" style="cursor: pointer;">
						      <img src="popicons/view_account.png" alt="..." class="img=responsive">
						      <div class="caption"><p align="center">View Accounts</p></div>
					    	</div>
								</s:form>
						</div>
						
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 padimp iconsizlg2">
							<div class="thumbnail" id="sendLetter" onclick="sendLetter()" style="cursor: pointer;">
						      <img src="popicons/send_letter.png" alt="..." class="img=responsive">
						      <div class="caption"><p align="center">Send Email/Letter</p></div>
					    	</div>
						
						</div>
						
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 dtd padimp iconsizlg2">
						
							
							
								<div class="thumbnail" id="sendLetter" onclick="setInstantCashDesk()" style="cursor: pointer;">
							      <img src="popicons/cash_desk.png" alt="..." class="img=responsive">
							      <div class="caption"><p align="center">Cash Desk</p></div>
						    	</div>
						   
						
						</div>
						
					
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 padimp iconsizlg2">
							<div class="thumbnail" id="sendLetter" onclick="redirectToApmtFinder()" style="cursor: pointer;">
							      <img src="popicons/finder.png" alt="..." class="img=responsive">
							      <div class="caption"><p align="center">Appointment Finder</p></div>
						    	</div>
						    </div>
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 dtd padimp iconsizlg2">
					
							<div class="thumbnail" id="updatereport" onclick="updatestatusreportpopup()" style="cursor: pointer;">
						      <img src="popicons/report.png" alt="..." class="img=responsive">
						      <div class="caption"><p align="center">Update Report Status</p></div>
					    	</div>
					
						</div>
						
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 padimp iconsizlg2">
						
							<div class="thumbnail" id="sendLetter" onclick="showApptTreatment()" style="cursor: pointer;">
						      <img src="popicons/view_treatment.png" alt="..." class="img=responsive">
						      <div class="caption"><p align="center">View Treatment</p></div>
					    	</div>
						
						</div>
					
					
						<!--<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 dtd padimp iconsizlg2">
						
							<div class="thumbnail" id="" onclick="redirectconstoemr()" style="cursor: pointer;">
						      <img src="popicons/consultation_note.png" alt="..." class="img=responsive">
						      <div class="caption"><p align="center">Consultation Note</p></div>
					    	</div>
						
						</div>
						
						--><div class="col-lg-2 col-md-2 col-sm-4 col-xs-6 dtd padimp iconsizlg2" >
						
							<div class="thumbnail" id="" onclick="showcrddebit()" style="cursor: pointer;">
						      <img src="cicon/raise_credit.png" alt="..." class="img=responsive">
						      <div class="caption"><p align="center" class="dtdf">Advance & Refund</p></div>
					    	</div>
						
						</div>
						
						<div class="col-lg-2 col-md-2 col-sm-4 col-xs-6 dtd padimp iconsizlg2" >
						
							<div class="thumbnail" id="" onclick="adddebitchargess()" style="cursor: pointer;">
						      <img src="cicon/addcharge.png" alt="..." class="img=responsive">
						      <div class="caption"><p align="center" class="dtdf">Add Charge</p></div>
					    	</div>
						
						</div>
						
						
						<div class="col-lg-2 col-md-2 col-sm-4 col-xs-6 dtd padimp iconsizlg2 hidden" >
						
							<div class="thumbnail" id="" onclick="modfyDiagnosis()" style="cursor: pointer;">
						      <img src="popicons/modify.png" alt="..." class="img-responsive">
						      <div class="caption"><p align="center" class="dtdf">Modify Diagnosis</p></div>
					    	</div>
						
						</div>
						
						 <div class="col-lg-2 col-md-2 col-sm-4 col-xs-6 dtd padimp iconsizlg2">
						
							<div class="thumbnail" id="" onclick="sendsmspopupopen()" style="cursor: pointer;">
						      <img src="popicons/sms.png" alt="..." class="img-responsive">
						      <div class="caption"><p align="center" class="dtdf">Send SMS</p></div>
					    	</div>
						
						</div>
						
						
						<div class="col-lg-2 col-md-2 col-sm-4 col-xs-6 dtd padimp iconsizlg2" >
					
						<div class="thumbnail" id="" onclick="showopdpriscription()" style="cursor: pointer;">
					      <img src="popicons/medicine.png" alt="..." style="width: 64px; height: 64px;">
					      <div class="caption"><p align="center" class="dtdf">Add priscription</p></div>
				    	</div>
					
						</div>
					
					<div class="col-lg-2 col-md-2 col-sm-4 col-xs-6 dtd padimp iconsizlg2" >
					
						<div class="thumbnail" id="" onclick="showopdInvestigation()" style="cursor: pointer;">
					      <img src="popicons/asmnt.png" alt="..." style="width: 64px; height: 64px;">
					      <div class="caption"><p align="center" class="dtdf">Add Investigation</p></div>
				    	</div>
					
						</div>	
						
						
						
					</div>


					
					
				
					
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-primary hidden" data-dismiss="modal" onclick="movetosetCommonAction()">Close</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- modify dna Popup -->
<div class="modal fade" id="modifydnapopup" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true" data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<button type="button" class="close" data-dismiss="modal" onclick="movetosetCommonAction()">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Day-To-Day Admin &nbsp;&nbsp;|&nbsp;&nbsp;<span><a href="#" onclick="showLetterHead()" title="Print Letterhead"><i class="fa fa-print" aria-hidden="true"></i></a></span> &nbsp;&nbsp;|&nbsp;&nbsp;<span id="editSave3"><a href="#" style="color: yellow;" onclick="editBMI(3)" title="Edit"><i class="fa fa-pencil" aria-hidden="true"></i></a></span></h4>
				</div>
				<div class="modal-body" style="padding:0px;">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 heightsetbmi">
									<div class="row">
										<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
											<div class="col-lg-2 col-md-2 col-sm-2 col-xs-3">
												<div class="form-group marbo10form">
												    <label for="exampleInputEmail1">Height <small>cm</small></label>
												    <p id="height3"></p>
												  </div>
											</div>
											<div class="col-lg-2 col-md-2 col-sm-2 col-xs-3">
												<div class="form-group marbo10form">
												    <label for="exampleInputEmail1">Weight <small>Kg's</small></label>
												    <p id="weight3">72 kg</p>
												  </div>
											</div>
											<div class="col-lg-2 col-md-2 col-sm-2 col-xs-3">
												<div class="form-group marbo10form">
												    <label for="exampleInputEmail1">BMI</label>
												    <p id="bmi3">24.39</p>
												  </div>
											</div>
											<div class="col-lg-2 col-md-2 col-sm-2 col-xs-3">
												<div class="form-group marbo10form">
												    <label for="exampleInputEmail1">Pulse</label>
												    <p id="pulse3">70 /min</p>
												  </div>
											</div>
											<div class="col-lg-2 col-md-2 col-sm-2 col-xs-3">
												<div class="form-group marbo10form">
												    <label for="exampleInputEmail1">Sys-BP</label>
												    <p id="sysbp3">120 mm Hg</p>
												  </div>
											</div>
											<div class="col-lg-2 col-md-2 col-sm-2 col-xs-3">
												<div class="form-group marbo10form">
												    <label for="exampleInputEmail1">Dia-BP</label>
												    <p id="diabp3">80 mm Hg</p>
												  </div>
											</div>
										</div>
									</div>
								</div>
					<div id="modifydnaClient1" style="font-size: 16px;color: rgb(61, 61, 61);">Manoj Mishra</div>
				
					
					
						<div class="row manaboxwi">
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 padimp">
						<s:form action="Accounts" id="accountchargefrm" target="blank">
									<s:hidden name="clientId" id="accountChargeClientid"/>
									<s:hidden name="thirdParty" id="accountchargethirdparty"/>
									<s:hidden name="transactionType" id="accountchargetransactionType"/>
									<s:hidden name="location" id="accountsLocationid"/>
									<s:hidden name="client" id="accountclientid"/>
									<s:hidden name = "payby" id ="accountpayby"></s:hidden>
									
										<div class="thumbnail" id="completeapmt" onclick="redirectToCreateCharge()" style="cursor: pointer;">
						      <img src="popicons/invoice.png" alt="..." class="img=responsive">
						      <div class="caption"><p align="center">Create Invoice</p></div>
					    	</div>
									
								
								</s:form>
							</div>
							
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 dtd padimp">
							<s:form action="Statement" id="view_acc_frm" target="blank">
									<s:hidden name="clientId" id="viewAccClientid"/>
									<s:hidden name="thirdParty" id="viewAccthirdparty"/>
									<s:hidden name="transactionType" id="viewAcctransactionType"/>
									<s:hidden name="location" id="viewAccLocationid"/>
									<s:hidden name="client" id="viewAccclientname"/>
									<s:hidden name = "payby" id ="viewAccPayby"></s:hidden>
									<s:hidden name="fromDate" id="viewAccfromDateid"/>
									<s:hidden name="toDate" id="viewAcctoDateid"/>
									
										<div class="thumbnail" id="completeapmt" onclick="redirectToViewAcc()" style="cursor: pointer;">
						      <img src="popicons/view_account.png" alt="..." class="img=responsive">
						      <div class="caption"><p align="center">View Accounts</p></div>
					    	</div>
								
					    	
								</s:form>
						</div>
						
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 padimp" id="clientdidnotcome">
							<div class="thumbnail" id="dna" onclick="setModifyClientDidNotCome()" style="cursor: pointer;">
						      <img src="popicons/reset.png" alt="..." class="img=responsive">
						      <div class="caption"><p align="center" id="dnatextid">Modify DNA</p></div>
					    	</div>
						
						
						</div>
						
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 dtd padimp">
							<div class="thumbnail" id="sendLetter" onclick="sendLetter()" style="cursor: pointer;">
						      <img src="popicons/send_letter.png" alt="..." class="img=responsive">
						      <div class="caption"><p align="center">Send Email/Letter</p></div>
					    	</div>
						<!-- <input type="button" id="sendLetter"
								class="btn btn-default width-full"
								value="  Send Letter " onclick="sendLetter()"> -->
						</div>
					
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 padimp" >
						
							<div class="thumbnail" id="sendLetter" onclick="redirectToApmtFinder()" style="cursor: pointer;">
						      <img src="popicons/finder.png" alt="..." class="img=responsive">
						      <div class="caption"><p align="center">Appointment Finder</p></div>
					    	</div>
						
						</div>
						
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 dtd padimp">
					
							<div class="thumbnail" id="updatereport" onclick="updatestatusreportpopup()" style="cursor: pointer;">
						      <img src="popicons/report.png" alt="..." class="img=responsive">
						      <div class="caption"><p align="center">Update Report Status</p></div>
					    	</div>
					
						</div>
						
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 dtd padimp" >
						
							<div class="thumbnail" id="sendLetter" onclick="showApptTreatment()" style="cursor: pointer;">
						      <img src="popicons/view_treatment.png" alt="..." class="img=responsive">
						      <div class="caption"><p align="center">View Treatment</p></div>
					    	</div>
						
						</div>
						
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 dtd padimp">
						
							<div class="thumbnail" id="" onclick="sendsmspopupopen()" style="cursor: pointer;">
						      <img src="popicons/sms.png" alt="..." class="img-responsive">
						      <div class="caption"><p align="center" class="dtdf">Send SMS</p></div>
					    	</div>
						
						</div>
						
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 padimp" >
						
							<div class="thumbnail" id="" onclick="showcrddebit()" style="cursor: pointer;">
						      <img src="popicons/consultation_note.png" alt="..." class="img=responsive">
						      <div class="caption"><p align="center">Advance & Refund</p></div>
					    	</div>
						
						</div>
						
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 padimp" >
							<div class="thumbnail" id="" onclick="adddebitchargess()" style="cursor: pointer;">
						      <img src="cicon/addcharge.png" alt="..." class="img=responsive">
						      <div class="caption"><p align="center">Add Charge</p></div>
					    	</div>
						</div>
						
					</div>
					
				
					
					
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-primary hidden" data-dismiss="modal" onclick="movetosetCommonAction()">Close</button>
				</div>
			</div>
		</div>
	</div>	
	
	
<!--Block Appointment Popup -->

<div class="modal fade" id="blockapmtdaytodsypopup" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Day-To-Day Admin &nbsp;&nbsp;|&nbsp;&nbsp;<span><a href="#" onclick="showLetterHead()" title="Print Letterhead"><i class="fa fa-print" aria-hidden="true"></i></a></span> &nbsp;&nbsp;|&nbsp;&nbsp;<span id="editSave4"><a href="#" style="color: yellow;" onclick="editBMI(4)" title="Edit"><i class="fa fa-pencil" aria-hidden="true"></i></a></span></h4>
				</div>
				<div class="modal-body" style="padding:0px;">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 heightsetbmi">
									<div class="row">
										<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
											<div class="col-lg-2 col-md-2 col-sm-2 col-xs-3">
												<div class="form-group marbo10form">
												    <label for="exampleInputEmail1">Height <small>cm</small></label>
												    <p id="height4"></p>
												  </div>
											</div>
											<div class="col-lg-2 col-md-2 col-sm-2 col-xs-3">
												<div class="form-group marbo10form">
												    <label for="exampleInputEmail1">Weight <small>Kg's</small></label>
												    <p id="weight4">72 kg</p>
												  </div>
											</div>
											<div class="col-lg-2 col-md-2 col-sm-2 col-xs-3">
												<div class="form-group marbo10form">
												    <label for="exampleInputEmail1">BMI</label>
												    <p id="bmi4">24.39</p>
												  </div>
											</div>
											<div class="col-lg-2 col-md-2 col-sm-2 col-xs-3">
												<div class="form-group marbo10form">
												    <label for="exampleInputEmail1">Pulse</label>
												    <p id="pulse4">70 /min</p>
												  </div>
											</div>
											<div class="col-lg-2 col-md-2 col-sm-2 col-xs-3">
												<div class="form-group marbo10form">
												    <label for="exampleInputEmail1">Sys-BP</label>
												    <p id="sysbp4">120 mm Hg</p>
												  </div>
											</div>
											<div class="col-lg-2 col-md-2 col-sm-2 col-xs-3">
												<div class="form-group marbo10form">
												    <label for="exampleInputEmail1">Dia-BP</label>
												    <p id="diabp4">80 mm Hg</p>
												  </div>
											</div>
										</div>
									</div>
								</div>
								<!-- 	<div id="modifyClient2" style="font-size: 16px;">Manoj Mishra</div> -->
				
					<div class="row manaboxwi">
						<div class="col-lg-12">
				
								
								<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 padimp">
								<div class="thumbnail" id="modify" onclick="modifythisAppointment()" style="cursor: pointer;">
						      <img src="popicons/modify.png" alt="..." class="img=responsive">
						      <div class="caption"><p align="center" class="dtdf">Modify Blocked Slot</p></div>
					    	</div>
								</div>
								
							<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 padimp">
								<div class="thumbnail" id="deleteapmtiddiv" onclick="delOnlyBlockSlot()" style="cursor: pointer;">
						         <img src="popicons/delete.png" alt="..." class="img=responsive">
						        <div class="caption"><p align="center" class="dtdf">Cancel</p></div>
					    	</div>
					    	</div>
					    	<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 padimp">
								<div class="thumbnail" id="deleteapmtiddiv" onclick="setworkcompleted(1)" style="cursor: pointer;">
						         <img src="popicons/cbs.png" alt="..." class="img=responsive">
						        <div class="caption"><p align="center" class="dtdf">Completed</p></div>
					    	</div>
					    	</div>
					    	
					    	<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 padimp">
								<div class="thumbnail" id="deleteapmtiddiv" onclick="setworkcompleted(0)" style="cursor: pointer;">
						         <img src="popicons/cdna.png" alt="..." class="img=responsive">
						        <div class="caption"><p align="center" class="dtdf">Not Completed</p></div>
					    	</div>
					    	</div>
					    	
					    	<!--
					    	<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 padimp">
								<div class="thumbnail" id="deleteapmtiddiv" onclick="setworkcompleted(1)" style="cursor: pointer;">
						         <img src="popicons/delete.png" alt="..." class="img=responsive">
						        <div class="caption"><p align="center" class="dtdf">Completed</p></div>
					    	</div>
					    	
					    	<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 padimp">
								<div class="thumbnail" id="deleteapmtiddiv" onclick="setworkcompleted(0)" style="cursor: pointer;">
						         <img src="popicons/delete.png" alt="..." class="img=responsive">
						        <div class="caption"><p align="center" class="dtdf">Not Completed</p></div>
					    	</div>
						
						
						-->
							
						
							
						
								
								
						</div>
					</div>
					
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-primary hidden" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
<!-- End -->


<!--OT Popup -->

<div class="modal fade" id="otmodifypopup" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Day-To-Day Admin &nbsp;&nbsp;|&nbsp;&nbsp;<span><a href="#" onclick="showLetterHead()" title="Print Letterhead"><i class="fa fa-print" aria-hidden="true"></i></a></span> &nbsp;&nbsp;|&nbsp;&nbsp;<span id="editSave5"><a href="#" style="color: yellow;" onclick="editBMI(5)" title="Edit"><i class="fa fa-pencil" aria-hidden="true"></i></a></span></h4>
				</div>
				<div class="modal-body" style="padding:0px;">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 heightsetbmi">
									<div class="row">
										<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
											<div class="col-lg-2 col-md-2 col-sm-2 col-xs-3">
												<div class="form-group marbo10form">
												    <label for="exampleInputEmail1">Height <small>cm</small></label>
												    <p id="height5"></p>
												  </div>
											</div>
											<div class="col-lg-2 col-md-2 col-sm-2 col-xs-3">
												<div class="form-group marbo10form">
												    <label for="exampleInputEmail1">Weight <small>Kg's</small></label>
												    <p id="weight5">72 kg</p>
												  </div>
											</div>
											<div class="col-lg-2 col-md-2 col-sm-2 col-xs-3">
												<div class="form-group marbo10form">
												    <label for="exampleInputEmail1">BMI</label>
												    <p id="bmi5">24.39</p>
												  </div>
											</div>
											<div class="col-lg-2 col-md-2 col-sm-2 col-xs-3">
												<div class="form-group marbo10form">
												    <label for="exampleInputEmail1">Pulse</label>
												    <p id="pulse5">70 /min</p>
												  </div>
											</div>
											<div class="col-lg-2 col-md-2 col-sm-2 col-xs-3">
												<div class="form-group marbo10form">
												    <label for="exampleInputEmail1">Sys-BP</label>
												    <p id="sysbp5">120 mm Hg</p>
												  </div>
											</div>
											<div class="col-lg-2 col-md-2 col-sm-2 col-xs-3">
												<div class="form-group marbo10form">
												    <label for="exampleInputEmail1">Dia-BP</label>
												    <p id="diabp5">80 mm Hg</p>
												  </div>
											</div>
										</div>
									</div>
								</div>
								<!-- 	<div id="modifyClient2" style="font-size: 16px;">Manoj Mishra</div> -->
				
					<div class="row manaboxwi">
						<div class="col-lg-12">
							<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 padimp">
								<div class="thumbnail" id="modify" onclick="adddebitchargess()" style="cursor: pointer;">
						      <img src="cicon/addcharge.png" alt="..." class="img=responsive">
						      <div class="caption"><p align="center" class="dtdf">Add Charge</p></div>
					    	</div>
						</div>
						
							<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 padimp">
								<div class="thumbnail" id="modify" onclick="showcrddebit()" style="cursor: pointer;">
						      <img src="cicon/raise_credit.png" alt="..." class="img=responsive">
						      <div class="caption"><p align="center" class="dtdf">Advance & Refund</p></div>
					    	</div>
						</div>
						
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 padimp">
							<div class="thumbnail" id="deleteapmtiddiv" onclick="checkotcharge()" style="cursor: pointer;">
					      		<img src="popicons/delete.png" alt="..." class="img=responsive">
					      		<div class="caption"><p align="center" class="dtdf">Cancel</p></div>
						    </div>
						</div>
							
						
								<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 padimp">
				
								
								<%-- <s:form action="ProcessingAccount" id="accountpaymentfrm" target="blank"> --%>
								
								<s:form action="ProcessingAccount" id="accountpaymentfrm" method="post" 
              							onsubmit="return redirectToRecordPayment()" target="formtarget">
              							
									<s:hidden name="clientId" id="accountpaymentClientid"/>
									<s:hidden name="thirdParty" id="accountpaymentthirdparty"/>
									<s:hidden name="transactionType" id="accountpaymenttransactionType"/>
									<s:hidden name="location" id="accountspaymentLocationid"/>
									<s:hidden name="client" id="accountpaymentclientid"/>
									<s:hidden name="fromDate" id="accountspaymentfromDateid"/>
									<s:hidden name="toDate" id="accountspaymenttoDateid"/>
									<s:hidden name = "payby" id ="accountPaymentPayby"></s:hidden>
									
									
										<div class="thumbnail" id="completeapmt" onclick="redirectToRecordPayment()" style="cursor: pointer;">
									      <img src="popicons/raise_credit.png" alt="..." class="img=responsive">
									      <div class="caption"><p align="center">Record Payment</p></div>
					    				</div>
					    			
									
							<!-- <input type="button" id="completeapmt"
								class="btn btn-default width-full"
								value="Record Payment" onclick="redirectToRecordPayment()"> -->
								</s:form>
							</div>
							
							<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 dtd padimp">
							<div class="thumbnail" id="sendLetter" onclick="sendLetter()" style="cursor: pointer;">
						      <img src="popicons/send_letter.png" alt="..." class="img=responsive">
						      <div class="caption"><p align="center">Send Email/Letter</p></div>
					    	</div>
					    </div>
								
					<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 padimp">
						
						<s:form action="Statement" id="view_acc_frm" target="blank">
							<s:hidden name="clientId" id="viewAccClientid"/>
							<s:hidden name="thirdParty" id="viewAccthirdparty"/>
							<s:hidden name="transactionType" id="viewAcctransactionType"/>
							<s:hidden name="location" id="viewAccLocationid"/>
							<s:hidden name="client" id="viewAccclientname"/>
							<s:hidden name = "payby" id ="viewAccPayby"></s:hidden>
							<s:hidden name="fromDate" id="viewAccfromDateid"/>
							<s:hidden name="toDate" id="viewAcctoDateid"/>
							
							
							<div class="thumbnail" id="completeapmt" onclick="redirectToViewAcc()" style="cursor: pointer;">
						      <img src="popicons/view_account.png" alt="..." class="img=responsive">
						      <div class="caption"><p align="center">View Accounts</p></div>
					    	</div>
			   
					    
							
							</s:form>
						  </div>
						  
						 <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 dtd padimp">
						<%-- <s:form action="Accounts" id="accountchargefrm" target="blank"> --%>
						
						<s:form action="Accounts" id="accountchargefrm" method="post" 
              							onsubmit="return redirectToCreateCharge()" target="formtarget">
              							
									<s:hidden name="clientId" id="accountChargeClientid"/>
									<s:hidden name="thirdParty" id="accountchargethirdparty"/>
									<s:hidden name="transactionType" id="accountchargetransactionType"/>
									<s:hidden name="location" id="accountsLocationid"/>
									<s:hidden name="client" id="accountclientid"/>
									<s:hidden name = "payby" id ="accountpayby"></s:hidden>
									<s:hidden name="appointmentid" id="crtchargeapmtid"/>
									
										<div class="thumbnail" id="completeapmt" onclick="redirectToCreateCharge()" style="cursor: pointer;">
						      <img src="popicons/invoice.png" alt="..." class="img=responsive">
						      <div class="caption"><p align="center">Create Invoice</p></div>
					    	</div>
						  </s:form>
						 </div>
						
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 dtd padimp">
						
							<div class="thumbnail" id="" onclick="sendsmspopupopen()" style="cursor: pointer;">
						      <img src="popicons/sms.png" alt="..." class="img-responsive">
						      <div class="caption"><p align="center" class="dtdf">Send SMS</p></div>
					    	</div>
						
						</div>
						
						
						
						
								
								
						</div>
					</div>
					
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-primary hidden" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>


<!-- End -->


	
	
	
	<!--Record Payment Action Popup -->
<div class="modal fade" id="recordpaymentpopup" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true" data-keyboard="false" data-backdrop="static" >
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<button type="button" class="close" data-dismiss="modal" onclick="movetosetCommonAction()">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Day-To-Day Admin &nbsp;&nbsp;|&nbsp;&nbsp;<span><a href="#" onclick="showLetterHead()" title="Print Letterhead"><i class="fa fa-print" aria-hidden="true"></i></a></span> &nbsp;&nbsp;|&nbsp;&nbsp;<span id="editSave6"><a href="#" style="color: yellow;" onclick="editBMI(6)" title="Edit"><i class="fa fa-pencil" aria-hidden="true"></i></a></span></h4>
				</div>
				<div class="modal-body" style="padding:0px;">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 heightsetbmi">
									<div class="row">
										<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
											<div class="col-lg-2 col-md-2 col-sm-2 col-xs-3">
												<div class="form-group marbo10form">
												    <label for="exampleInputEmail1">Height <small>cm</small></label>
												    <p id="height6"></p>
												  </div>
											</div>
											<div class="col-lg-2 col-md-2 col-sm-2 col-xs-3">
												<div class="form-group marbo10form">
												    <label for="exampleInputEmail1">Weight <small>Kg's</small></label>
												    <p id="weight6">72 kg</p>
												  </div>
											</div>
											<div class="col-lg-2 col-md-2 col-sm-2 col-xs-3">
												<div class="form-group marbo10form">
												    <label for="exampleInputEmail1">BMI</label>
												    <p id="bmi6">24.39</p>
												  </div>
											</div>
											<div class="col-lg-2 col-md-2 col-sm-2 col-xs-3">
												<div class="form-group marbo10form">
												    <label for="exampleInputEmail1">Pulse</label>
												    <p id="pulse6">70 /min</p>
												  </div>
											</div>
											<div class="col-lg-2 col-md-2 col-sm-2 col-xs-3">
												<div class="form-group marbo10form">
												    <label for="exampleInputEmail1">Sys-BP</label>
												    <p id="sysbp6">120 mm Hg</p>
												  </div>
											</div>
											<div class="col-lg-2 col-md-2 col-sm-2 col-xs-3">
												<div class="form-group marbo10form">
												    <label for="exampleInputEmail1">Dia-BP</label>
												    <p id="diabp6">80 mm Hg</p>
												  </div>
											</div>
										</div>
									</div>
								</div>
									<div id="modifyClient2" style="font-size: 16px;color: rgb(61, 61, 61);">Manoj Mishra</div>
				
					<div class="row manaboxwi">
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 padimp">
				
								
								<%-- <s:form action="ProcessingAccount" id="accountpaymentfrm" target="blank"> --%>
								
								<s:form action="ProcessingAccount" id="accountpaymentfrm" method="post" 
              							onsubmit="return redirectToRecordPayment()" target="formtarget">
              							
									<s:hidden name="clientId" id="accountpaymentClientid"/>
									<s:hidden name="thirdParty" id="accountpaymentthirdparty"/>
									<s:hidden name="transactionType" id="accountpaymenttransactionType"/>
									<s:hidden name="location" id="accountspaymentLocationid"/>
									<s:hidden name="client" id="accountpaymentclientid"/>
									<s:hidden name="fromDate" id="accountspaymentfromDateid"/>
									<s:hidden name="toDate" id="accountspaymenttoDateid"/>
									<s:hidden name = "payby" id ="accountPaymentPayby"></s:hidden>
									
									
										<div class="thumbnail" id="completeapmt" onclick="redirectToRecordPayment()" style="cursor: pointer;">
									      <img src="popicons/raise_credit.png" alt="..." class="img=responsive">
									      <div class="caption"><p align="center">Record Payment</p></div>
					    				</div>
					    			
									
							<!-- <input type="button" id="completeapmt"
								class="btn btn-default width-full"
								value="Record Payment" onclick="redirectToRecordPayment()"> -->
								</s:form>
							</div>
							
							
								<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 padimp">
						<%-- <s:form action="Accounts" id="accountchargefrm" target="blank"> --%>
						
						<s:form action="Accounts" id="accountchargefrm" method="post" 
              							onsubmit="return redirectToCreateCharge()" target="formtarget">
              							
									<s:hidden name="clientId" id="accountChargeClientid"/>
									<s:hidden name="thirdParty" id="accountchargethirdparty"/>
									<s:hidden name="transactionType" id="accountchargetransactionType"/>
									<s:hidden name="location" id="accountsLocationid"/>
									<s:hidden name="client" id="accountclientid"/>
									<s:hidden name = "payby" id ="accountpayby"></s:hidden>
									<s:hidden name="appointmentid" id="crtchargeapmtid"/>
									
										<div class="thumbnail" id="completeapmt" onclick="redirectToCreateCharge()" style="cursor: pointer;">
						      <img src="popicons/invoice.png" alt="..." class="img=responsive">
						      <div class="caption"><p align="center">Create Invoice</p></div>
					    	</div>
									
								
								</s:form>
							</div>
							
							
							<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 dtd padimp">
							<div class="thumbnail" id="sendLetter" onclick="sendLetter()" style="cursor: pointer;">
						      <img src="popicons/send_letter.png" alt="..." class="img=responsive">
						      <div class="caption"><p align="center">Send Email/Letter</p></div>
					    	</div>
					    </div>
								
							<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 padimp">
								
								<s:form action="Statement" id="view_acc_frm" target="blank">
									<s:hidden name="clientId" id="viewAccClientid"/>
									<s:hidden name="thirdParty" id="viewAccthirdparty"/>
									<s:hidden name="transactionType" id="viewAcctransactionType"/>
									<s:hidden name="location" id="viewAccLocationid"/>
									<s:hidden name="client" id="viewAccclientname"/>
									<s:hidden name = "payby" id ="viewAccPayby"></s:hidden>
									<s:hidden name="fromDate" id="viewAccfromDateid"/>
									<s:hidden name="toDate" id="viewAcctoDateid"/>
									
									
									<div class="thumbnail" id="completeapmt" onclick="redirectToViewAcc()" style="cursor: pointer;">
								      <img src="popicons/view_account.png" alt="..." class="img=responsive">
								      <div class="caption"><p align="center">View Accounts</p></div>
							    	</div>
					   
					    
								
								</s:form>
							  </div>
								
					
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 dtd padimp" >
						
							<div class="thumbnail" id="sendLetter" onclick="redirectToApmtFinder()" style="cursor: pointer;">
						      <img src="popicons/finder.png" alt="..." class="img=responsive">
						      <div class="caption"><p align="center">Appointment Finder</p></div>
					    	</div>
						
						</div>
						
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 padimp" >
						
							<div class="thumbnail" id="updatereport" onclick="updatestatusreportpopup()" style="cursor: pointer;">
						      <img src="popicons/report.png" alt="..." class="img=responsive">
						      <div class="caption"><p align="center" class="dtdf">Update Report Status</p></div>
					    	</div>
						
						</div>
						
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 dtd padimp" >
						
							<div class="thumbnail" id="sendLetter" onclick="showApptTreatment()" style="cursor: pointer;">
						      <img src="popicons/view_treatment.png" alt="..." class="img=responsive">
						      <div class="caption"><p align="center">View Treatment</p></div>
					    	</div>
						
						</div>
					
						<!--<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 padimp" >
						
							<div class="thumbnail" id="" onclick="redirectconstoemr()" style="cursor: pointer;">
						      <img src="popicons/consultation_note.png" alt="..." class="img=responsive">
						      <div class="caption"><p align="center">Consultation Note</p></div>
					    	</div>
						
						</div>
						
						--><div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 padimp" >
						
							<div class="thumbnail" id="" onclick="showcrddebit()" style="cursor: pointer;">
						      <img src="popicons/consultation_note.png" alt="..." class="img=responsive">
						      <div class="caption"><p align="center">Advance & Refund</p></div>
					    	</div>
						
						</div>
						
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 padimp" >
						
							<div class="thumbnail" id="" onclick="adddebitchargess()" style="cursor: pointer;">
						      <img src="cicon/addcharge.png" alt="..." class="img=responsive">
						      <div class="caption"><p align="center">Add Charge</p></div>
					    	</div>
						
						</div>
						
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 padimp hidden">
						
							<div class="thumbnail" id="" onclick="modfyDiagnosis()" style="cursor: pointer;">
						      <img src="popicons/modify.png" alt="..." class="img-responsive">
						      <div class="caption"><p align="center" class="dtdf">Modify Diagnosis</p></div>
					    	</div>
						
						</div>
						 
						 <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 dtd padimp">
						
							<div class="thumbnail" id="" onclick="sendsmspopupopen()" style="cursor: pointer;">
						      <img src="popicons/sms.png" alt="..." class="img-responsive">
						      <div class="caption"><p align="center" class="dtdf">Send SMS</p></div>
					    	</div>
						
						</div>
						
						 <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 dtd padimp">
						
							<div class="thumbnail" id="" onclick="showopdpriscription()" style="cursor: pointer;">
						      <img src="popicons/medicine.png" alt="..." class="img-responsive">
						      <div class="caption"><p align="center" class="dtdf">Add priscription</p></div>
					    	</div>
						
						</div>
						
						
						 <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 dtd padimp">
						
							<div class="thumbnail" id="" onclick="showopdInvestigation()" style="cursor: pointer;">
						      <img src="popicons/asmnt.png" alt="..." class="img-responsive">
						      <div class="caption"><p align="center" class="dtdf">Add Investigation</p></div>
					    	</div>
						
						</div>
					   
					   <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 padimp">
							<div class="thumbnail" id="completeapmt" onclick="withpaymentCompleteAppointment()" style="cursor: pointer;">
						      <img src="popicons/cbs.png" alt="..." class="img-responsive">
						      <div class="caption"><p align="center" class="dtdf">Complete Appointment</p></div>
					    	</div>
						</div>	
					 	
					
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-primary hidden" data-dismiss="modal" onclick="movetosetCommonAction()">Close</button>
				</div>
			</div>
		</div>
	</div>
	

<!-- End -->
	
	<!-- Create Invoice Div -->
	<div class="modal fade" id="createinvoiceDiv" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Record Payment</h4>
				</div>
				<div class="modal-body">
					<%@ include file="/diarymanagement/pages/createInvoice.jsp"%>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						onclick="savePaymentForInvoice()">Pay</button>
					<button type="button" class="btn btn-primary"
						onclick="previewPaymentInvoice()">Preview</button>

					<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Submit Invoice Modal -->
	<div class="modal fade" id="submitInvoicePopup" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Submit Invoice</h4>
				</div>
				<div class="modal-body">
					<%@ include file="/diarymanagement/pages/submitInvoice.jsp"%>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						onclick="updateInvoiceStatus()">Submit</button>

					<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Reminder Modal -->
	<div class="modal fade" id="reminderPopup" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Appointment
						Confirmation and Reminder</h4>
				</div>
				<div class="modal-body">
					<div id="remiderClient" style="font-size: 16px;">
						<font color="white">Manoj Mishra</font>
					</div>

					<s:hidden name="practitionersName" id="practitionersName" />
					<s:hidden name="practitionersId" id="practitionersId" />
					<s:hidden name="clientName" id="clientName"></s:hidden>
					<s:hidden name="patientId" id="patientId" />
					<s:hidden name="aptmStartTime" id="aptmStartTime" />
					<s:hidden name="aptmDuration" id="aptmDuration" />
					<s:hidden name="practitionersEmail" id="practitionersEmail"></s:hidden>
					<s:hidden name="clientEmail" id="clientEmail"></s:hidden>
					<s:hidden name="aptmlocation" id="aptmlocation"></s:hidden>

					<div class="row">
						<div class="col-lg-12">
							<input type="button" class="btn btn-default width-full"
								value="Send Booking Confirmation (SMS)...Done!">
						</div>
					</div>
					<div class="row">
						<div class="col-lg-12">
							<input type="button" class="btn btn-default width-full"
								value="Send Booking Confirmation (SMS)...Done!">
						</div>
					</div>
					<div class="row">
						<div class="col-lg-12">
							<input type="button" class="btn btn-default width-full"
								value="Appointment Reminder (E-mail)...Scheduled!"
								onclick="emailSend()">
						</div>
					</div>
					<div class="row">
						<div class="col-lg-12">
							<input type="button" class="btn btn-default width-full"
								value="Follow-Up Reminder (Email)...Scheduled!">
						</div>
					</div>

				</div>
				<div class="modal-footer">

					<button type="button" class="btn btn-primary hidden" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>



	<!-- client did not attend popup  -->

	<div class="modal fade" id="clientdidnotattentpopup" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<button type="button" class="close" data-dismiss="modal" onclick="movetosetCommonAction()">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Patient Did Not
						Attend</h4>
				</div>
				<div class="modal-body" id="cdna">
				<div class="row" style="margin-top: 5px;">
					<div class="col-lg-12 col-md-12">
						<label>	Appointment Details :</label>
					</div>
				</div>
				<div class="row" style="margin-top: 5px;">
						<div class="col-lg-4 col-md-4 col-sm-4  col-md-5">Patient Name :</div>
						<div class="col-lg-8 col-md-7">
							<input type="text" class="form-control"
								id="dnaclinentname" name="dnaclinentname"
								size="30" disabled="disabled" />
						</div>
					</div>
					
					
					<div class="row" style="margin-top: 5px;">
						<div class="col-lg-4 col-md-4 col-sm-4  col-md-5">Practitioner Name :</div>
						<div class="col-lg-8 col-md-7">
							<input type="text" class="form-control"
								id="missedappointmentwith" name="missedappointmentwith"
								size="30" disabled="disabled" />
						</div>
					</div>
					


					<div class="row" style="margin-top: 5px;">
						<div class="col-lg-4 col-md-4 col-sm-4  col-md-5">Date :</div>
						<div class="col-lg-8 col-md-7">
							<input type="text" class="form-control" id="didnotattendDate"
								name="didnotattendDate" readonly="readonly" disabled="disabled">
						</div>
					</div>


					<div class="row" style="margin-top: 5px;">
						<div class="col-lg-4 col-md-4 col-sm-4  col-md-5">Time :</div>
						<div class="col-lg-8 col-md-7">
							<input type="text" class="form-control" name="didnotattentTime"
								id="didnotattentTime" disabled="disabled" size="5">
						</div>
					</div>

					<div class="row" style="margin-top: 5px;">
						<div class="col-lg-4 col-md-4 col-sm-4  col-md-5">Location :</div>
						<div class="col-lg-8 col-md-7">
							<input type="text" class="form-control"
								name="didnotattentDuration" id="didnotattentDuration"
								disabled="disabled" size="5">
						</div>
					</div>
					
					<div class="row" style="margin-top: 5px;">
						<div class="col-lg-4 col-md-4 col-sm-4  col-md-5">Pay By :</div>
						<div class="col-lg-8 col-md-7">
						
						<input type="text" class="form-control"
								name="dnapayby" id="dnapayby" disabled="disabled" size="5">
						</div>
					</div>
					
						<div class="row" style="margin-top: 5px;">
						<div class="col-lg-4 col-md-4 col-sm-4  col-md-5">Appointment Name :</div>
						<div class="col-lg-8 col-md-7">
							<input type="text" class="form-control"
								name="dnaAppointmentName" id="dnaAppointmentName" disabled="disabled" size="5">
							</div>
							
						</div>
						
							<div class="row" style="margin-top: 5px;" id="dnatpnotesdiv">
						<div class="col-lg-4 col-md-4 col-sm-4  col-md-5">TP Notes :</div>
						<div class="col-lg-8 col-md-7">
							
								<textarea name="dnatpnotes" id="dnatpnotes"  rows="3" cols="60" readonly="readonly"></textarea>
							</div>
							
						</div>
					
					


					<hr/>
					
					<div class="row" style="margin-top: 5px;">
						<div class="col-lg-12 col-md-12">
							<label>	DNA Charge Details :</label>
						</div>
					</div>
					
					<div class="row" style="margin-top: 5px;" id="offsetdiv">
						<div class="col-lg-4 col-md-4">
							<label>	Offset Treatment Session for DNA  :</label>
						</div>
						<div  class="col-lg-1 col-md-1">
							<input type="checkbox" name="dnaOffset" id="dnaOffset"/>
						</div>
						
					</div>
					
					<div class="row" style="margin-top: 5px;">
						<div class="col-lg-4 col-md-4 col-sm-4  col-md-5">Who will Pay :</div>
						<div class="col-lg-8 col-md-7">
							<input type="radio" name="dnawhopayradio" id="dnaclientrdo"  value="0"> Client(Self)
							<input type="radio" name=dnawhopayradio id="dnatprdo" value="1" >Third Party
							</div>
						</div>
						
						<div class="row" style="margin-top: 5px;" id="defineddnachargeid">
						<div class="col-lg-4 col-md-4 col-sm-4  col-md-5">TP Predefined DNA Charge :</div>
						<div class="col-lg-8 col-md-7">
							<span id="predefindtpcharge"></span>
							
							</div>
							
						</div>
						
						
						
						<div class="row" style="margin-top: 5px;" id="enterdnachargeid">
						<div class="col-lg-4 col-md-4 col-sm-4  col-md-5">Enter DNA Charge:</div>
						<div class="col-lg-8 col-md-7">
							<span id="dnaChargespanid"><%=Constants.getCurrency(loginfo) %> <input type="text" name="dnaCharge" id="dnaCharge" value="0"  size="5" style="text-align: center;" title="Enter DNA Charge"></span>
							</div>
							
						</div>
						
						<div class="row" style="margin-top: 5px;" id="showdnachargeid">
						<div class="col-lg-4 col-md-4 col-sm-4  col-md-5"> DNA Charge <%=Constants.getCurrency(loginfo) %> :</div>
						<div class="col-lg-8 col-md-7">
							
							<span id="dnaammtid">
								<%=Constants.getCurrency(loginfo) %> <input type="text" name="editdnaCharge" id="editdnaCharge" value="0"  size="5" style="text-align: center;" title="Enter DNA Charge">
							</span>
								
							</div>
							
						</div>
						
						<div class="row" style="margin-top: 5px;">
						<div class="col-lg-4 col-md-4 col-sm-4  col-md-5">Why :</div>
						<div class="col-lg-8 col-md-7">
							<select name="why" id="why"
								class="form-control"
								style="width: 55%; padding: .4em;">
								<option value="0">Select Reason</option>
								<option value="NO REASON">No Reason</option>
								<option value="DNA">No Money</option>
								<option value="NO REASON">No Care Given</option>
								<option value="NO REASON">No Transport</option>
								<option value="UNWELL">Unwell</option>
								<option value="LATE CANCELATION">Late Cancelation</option>
								<option value="NO REASON">Unsuitable Timing</option>								
							</select>
						</div>
					</div>
					
					
					<hr />
					
					<!-- <div class="row" id="tepisodednadiv">
						
						<div class="col-lg-12 col-md-12">
							<span><input type="radio" name="countrd" id="countrd1">Yes,Increase Treatment Episode Count</span>
							<span> <input type="radio" name="countrd" id="countrd2">No,Do Not Increase Treatment Episode Count</span>
						</div>
					</div> -->

					<div class="row">
						<div class="col-lg-4 col-md-4 col-sm-4  col-md-5">Please Confirm :</div>
						<div class="col-lg-8 col-md-8">
							<input type="checkbox" name="dnachk" id="dnachk" onclick="increaseTreatmentEpisodeCnt()"> <label
								for="dnachk">D.N.A.</label>
								
								
								<%-- <s:select id="dnaCharge"  name="dnaCharge" list="dnaChargesList" style="display: none;" title="Select DNA %" theme="simple"  data-toggle="tooltip" listKey="id" listValue="dnaCharges" headerValue="Select % " headerKey="0" /> --%>
						</div>
					</div>

					<div class="row" style="margin-top: 5px;">
						<div class="col-lg-4 col-md-4 col-sm-4  col-md-5">Notes :</div>
						<div class="col-lg-8 col-md-7">
							<textarea rows="3" cols="40" class="form-control" name="didnotattendNotes"
								id="didnotattendNotes"></textarea>
							
						</div>
					</div>
					


					

				</div>
				<div class="modal-footer">

					<button type="button" class="btn btn-primary"
						onclick="setClientDidNotComeConfirm()">Ok</button>
					<button type="button" class="btn btn-primary hidden" data-dismiss="modal" onclick="movetosetCommonAction()">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Add Patient Third Party Pop Up -->

	<div class="modal fade" id="addPatientThirdPartyPopup" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"  data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Select Third Party</h4>
				</div>
				<div class="modal-body">


					<%@ include file="/thirdParties/pages/addThirdPartyOfClient.jsp"%>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						onclick="savePatientThirdPartyDetail()">Save</button>
					<button type="button" class="btn btn-primary hidden" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Add Third Party Details Modal -->
	<div class="modal fade" id="thirdPartyDetailsPopup" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Add New Third Party</h4>
				</div>
				<div class="modal-body" style="height: 600px;overflow: scroll;">
						<%@ include file="/thirdParties/pages/addPopupNewTp.jsp"%>	
						
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						onclick="saveNewTP4()">Save</button>

					<button type="button" class="btn btn-primary hidden" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>


	<!-- Send Letter Details Modal -->
		<s:form id="upload" method="post" action="uploadSendMailInstantMsg"
					enctype="multipart/form-data" theme="simple">

	<div class="modal fade" id="sendLetterPopup" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
			
     
				<div class="modal-header bg-primary">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Send Email/Letter</h4>
				</div>
				<div class="modal-body" style="height: 500px;overflow: scroll;">
						<div class="row">
         <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
         <div class="col-lg-4 col-md-4 col-xs-4 col-sm-4">
				<label> User</label>
		 </div>
		 <div class="col-lg-8 col-md-8 col-xs-8 col-sm-8">
				<%-- <s:select id="userNameletter" name="userName"  
				list="{'Client'}" cssClass="form-control  showToolTip chosen" 
				value="userName" onchange="setNameLetter(this.value)"></s:select>
				<label  id = "unameError" class="text-danger"></label>	 --%>
				<s:textfield name="userName" id="userNameletter" readonly="true" cssClass="form-control"  value="Client"  />
				<label  id = "unameError" class="text-danger"></label>	
		</div>
		</div>
		
		
		
		 <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12 dtd bookav">
         <div class="col-lg-4 col-md-4 col-xs-4 col-sm-4">
				<label>Select Template</label>
		</div>
			 <div class="col-lg-8 col-md-8 col-xs-8 col-sm-8">
				<select id = "templateName" name = "templateName" onchange="showTemplateDetails(this.id)" class="form-control showToolTip chosen" data-toggle="tooltip">
						<option value="0">Select Template Name</option>
				</select>					
			</div>
		</div>
		
					
	
		<s:hidden name="id" id="id"></s:hidden>
		<s:hidden name="user" id="userletter"></s:hidden>
		<%-- <div class="col-lg-12">
		 <div class="col-lg-3">
			<label>User Name</label>
		</div>
		 <div class="col-lg-8">
			<s:textfield name="user" id="userletter" readonly="true" cssClass="form-control" />
				     <label  id = "userError" class="text-danger"></label>	
		<s:hidden name="id" id="id"></s:hidden>
		<s:hidden name="user" id="userletter"></s:hidden>
		</div>
		</div> --%>
		
		
		
		<div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
		 <div class="col-lg-4 col-md-4 col-xs-4 col-sm-4">
			<label>Email ID</label>
		</div>
		 <div class="col-lg-8 col-md-8 col-xs-8 col-sm-8">
			<s:textfield name="email" id="gpLetterEmail" cssClass="form-control showToolTip" title="Enter EmailId"
								data-toggle="tooltip" placeholder="Enter EmailId"/>
			<label  id = "emailError" class="text-danger"></label>	
		</div>
		</div>
		
		
		
		<div class="col-lg-12 col-md-12 col-xs-12 col-sm-12 dtd bookav">
		 <div class="col-lg-4 col-md-4 col-xs-4 col-sm-4">
			<label>Cc</label>
		</div>
		 <div class="col-lg-8 col-md-8 col-xs-8 col-sm-8">
			<s:textfield theme="simple" id = "gpLetterccEmail" name = "ccEmail"	cssClass="form-control showToolTip" title="Enter Cc"
								data-toggle="tooltip" placeholder="Enter Cc" />			
		</div>
		</div>
		
		
		
		<div class="col-lg-12 col-md-12 col-xs-12 col-sm-12 dtd bookav">
		 <div class="col-lg-4 col-md-4 col-xs-4 col-sm-4">
			<label>Subject</label>
		</div>
		 <div class="col-lg-8 col-md-8 col-xs-8 col-sm-8">
			<input type="text" name= "subject" id = "gpLettersubject" class="form-control showToolTip"
								data-toggle="tooltip" title="Enter Subject" placeholder="Enter Subject">			
		</div>
		</div>
		
			<div class="col-lg-6 col-md-6 col-xs-6 col-sm-6">
				<label>Attachments:</label>
				<input type="hidden" id="fileUpload" name = "fileUploadd" />
 				 <div id = "drop">
 					
      			  <!--FileUpload Controls will be added here -->
      			  <div id="upload"></div>
      			  <div id = "draftAttachments"></div>
    			</div>
    			
    			<br/>
 				  <input id="Button1" class="btn btn-default"  type="button" value="Attach Files" onclick = "AddFileUpload()" />
    			
   			</div>
		
       <br/>
			<div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
			 <div class="col-lg-4 col-md-4 col-xs-4 col-sm-4">
				<label>Body:</label>
				</div>
				<div class="col-lg-8 col-md-8 col-xs-8 col-sm-8">
				<s:textarea cssStyle="height:2500px;" class="form-control showToolTip textarea"  data-toggle="tooltip" title="Write content" placeholder="Write content" name="body" id="emailBodyLetter" />
			</div>
			</div>
			
			
			   			
		</div>
		
      </div>
						
			<div class="modal-footer">
			<div class="row">
			<div class="col-lg-2 col-md-2 col-xs-2 col-sm-2"></div>
			<div class="col-lg-2 col-md-2 col-xs-2 col-sm-2">
			<div id="pdfFileIdLetter">
			</div></div>
			<div class="col-lg-2 col-md-2 col-xs-2 col-sm-2">
			<div id="sendmail">
			</div></div>
			<div class="col-lg-2 col-md-2 col-xs-2 col-sm-2">
			<div id="printId">
			</div></div>
		<div class="col-lg-4 col-md-4 col-xs-4 col-sm-4">
		<!-- <button type="button" id="saveId" class="btn btn-primary" onclick="return createPdf()">Save as pdf</button> -->
		<button type="button" id="saveId" class="btn btn-primary"  onClick="fileUpload1(this.form,'sendLetterEmailInstantMsg','upload'); return false;">Send Mail</button>
		<button type="button" class="btn btn-primary"  onclick="return createPdf()">Print</button>
		<button type="button" class="btn btn-primary hidden" data-dismiss="modal">Close</button>
      </div></div></div>
     
    </div>
  </div>
</div> 

</s:form>

<!-- Modal User Search-->

<div class="modal fade" id="userSearch" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">User Search</h4>
      </div>
      <div class="modal-body">
        <%@ include file="/tools/pages/allSendLetter.jsp"%>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default hidden" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div> 
	

	<!-- Modal Email-->
	
<div class="modal fade" id="sendEmailLetterPopup" tabindex="-1" role="dialog"
	aria-labelledby="lblsendEmailPopUp" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title">Send Email</h4>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-lg-12">
					<div class="row">
					<div class="col-lg-1 col-md-1">	
					</div>
				
					</div>
						<%-- <div class="form-group">
							<label>To:</label>
							<s:textfield theme="simple" id = "gpLetterEmail" name = "email" cssClass="form-control showToolTip"
								placeholder="Enter email address of receiver" title="Enter Email Id" data-toggle="tooltip" />
						</div>
						<div class="form-group">
							<label>Cc:</label>
							<s:textfield theme="simple" id = "gpLetterccEmail" name = "ccEmail"	cssClass="form-control showToolTip" title="Enter Cc"
								data-toggle="tooltip" placeholder="Enter Cc" />
						</div>
						<div class="form-group">
							<label>Subject:</label> <input type="text" name= "subject" id = "gpLettersubject" class="form-control showToolTip"
								data-toggle="tooltip" title="Enter Subject" placeholder="Enter Subject">
						</div>
						<div class="form-group">
							<label>Body:</label>
							<textarea class="form-control showToolTip" data-toggle="tooltip" rows="20" cols="60"
								title="Enter Body" name="emailBody"  id="gpLetterEmailBody" ></textarea>
						</div>
						<div class="form-group" id="pdfMailId">
							
						</div>
						<div class="form-group">
						<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="sendPdfLetterMail();">Send</button>
						<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
						</div> --%>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<!-- Auto send Email -->
	<div class="modal fade" id="autosendemailpopup" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Send Booked Appointment Email
						</h4>
				</div>
				<div class="modal-body">
					<label>Do You Want To Send Email For Booked Appointment?</label>
				</div>
				<div class="modal-footer">

					<button type="button" class="btn btn-primary"
						onclick="openSendEmailPopup();" data-dismiss="modal">Yes</button>
					  <button type="button" class="btn btn-primary" data-dismiss="modal">No</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- Print Invoice of Booking with Payment -->
	
	<div class="modal fade" id="vieworprintnvoice" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Payment Received 
						</h4>
				</div>
				<div class="modal-body">
					<label>Do You Want To Print Invoice?</label>
				</div>
				<div class="modal-footer">

					<button type="button" class="btn btn-primary"
						onclick="openprintOpdInvoice()" data-dismiss="modal">Yes</button>
					  <button type="button" class="btn btn-primary" data-dismiss="modal">No</button>
				</div>
			</div>
		</div>
	</div>
	
	
	
	
	
	
		<!--pure seva client details popup  -->
	 <%LoginInfo info = LoginHelper.getLoginInfo(request); %>
	<div class="modal fade" id="puresevaclientdetailsdiv" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-keyboard="false" data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header bg-primary">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">Please confirm your details
					</h4>
			</div>
			<div class="modal-body">
				<div class="row">
						<div class="col-lg-3">
							<label>Enter Email:</label>
						</div>
						<div class="col-lg-9">
							
							<input type="text" id = "pureemail" name = "pureemail" class="form-control showToolTip" onblur="setPuresevaExistingClientData()"
								placeholder="Enter Email" title="Enter Email" data-toggle="tooltip " value="<%=info.getEmail() %>" />
						</div>
					</div>
			<br>
			<div class="row">
						<div class="col-lg-3">
							<label>Enter First Name:</label>
						</div>
						<div class="col-lg-9">
							
							<input type="text" id = "purefname" name = "purefname" class="form-control showToolTip"
								placeholder="Enter First Name" title="Enter First Name" data-toggle="tooltip" value="<%=info.getFirstName() %>" />
						</div>
					</div>
			<br>
			<div class="row">
						<div class="col-lg-3">
							<label>Enter Last Name:</label>
						</div>
						<div class="col-lg-9">
							
							<input type="text" id = "purelname" name = "purelname" class="form-control showToolTip"
								placeholder="Enter Last name" title="Enter Last Name" data-toggle="tooltip" value="<%=info.getLastName() %>" />
						</div>
					</div>
			<br>
			<div class="row">
						<div class="col-lg-3">
							<label>Enter Mob:</label>
						</div>
						<div class="col-lg-9">
							
							<input type="text" id = "puremob" name = "puremob" class="form-control showToolTip"
								placeholder="Enter Mobile Number" title="Enter Mobile Number" data-toggle="tooltip" value="<%=info.getMob() %>" />
						</div>
					</div>
			<br>
			<div class="row">
						<div class="col-lg-3">
							<label>Enter Dob:</label>
						</div>
						<div class="col-lg-4">
							
							<input type="text" id = "puredob" name = "puredob" class="form-control showToolTip"
								placeholder="Enter Date of Birth" title="Enter Date of Birth" data-toggle="tooltip" value="<%=info.getDob() %>" />
						</div>
					</div>
				</div>
			
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" onclick="sendClientOtpAjax()">OK</button>
				 <button type="button" class="btn btn-primary hidden" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
	
	<!--OTP popup  -->
	
	<div class="modal fade" id="atppopup" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-keyboard="false" data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header bg-primary">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">Enter OTP sent to your email id
					</h4>
			</div>
			<div class="modal-body">
				<div class="row">
						<div class="col-lg-3">
							<label>Enter OTP:</label>
						</div>
						<div class="col-lg-9">
							
							<input type="text" id = "otptxt" name = "otptxt" class="form-control showToolTip"
								placeholder="Enter OTP" title="Enter OTP" data-toggle="tooltip" />
						</div>
					</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" onclick="otpConfirmed()">OK</button>
				 <button type="button" class="btn btn-primary hidden" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
	
<!--update report status popup  -->


<div class="modal fade" id="updatereportstatusdiv" tabindex="-1" role="dialog"
	aria-labelledby="lblsendEmailPopUp" aria-hidden="true" data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Assesment Report Status</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-lg-12 col-md-12">	
							Patient : <span id="usclientdetailsid"> Mr. Tim Court, 302, High Street, COVENTRY, CV110JJ, DOB: 13/04/1977 </span>
						</div>
					</div>
					
					<div class="row">
						<div class="col-lg-4 col-md-4">	
							Third Party
						</div>
						<div class="col-lg-1 col-md-1">
							:
						</div>
						<div class="col-lg-7 col-md-7" id="ustpnamediv">	
							Bupa
						</div>
					</div>
					
					<div class="row">
						<div class="col-lg-4 col-md-4">	
							Treatment Episode Name
						</div>
						<div class="col-lg-1 col-md-1">
							:
						</div>
						<div class="col-lg-7 col-md-7" id="ustpsession">	
							Back pain 10 session
						</div>
					</div>
					<br>
					<div class="">
					
					</div>
					<div class="row" style="font-weight: bold;background-color: rgb(144, 169, 247);width: 102%;    margin-left: -5px;" >
						<div class="col-lg-2 col-md-2">Date</div>
						<div class="col-lg-3 col-md-3">Appointment Name</div>
						<div class="col-lg-1 col-md-1">Sent</div>
						<div class="col-lg-2 col-md-2">Sent Date</div>
						<div class="col-lg-4 col-md-4">Note (Max 50 Char)</div>
					</div>
					<div class="row" id="statusrordajaxdiv" style="background-color: rgb(202, 197, 197);height: 377px;overflow: scroll;width: 102%;    margin-left: -5px;">
					
					</div>
					
				</div>
				
				
				
				<div class="modal-footer">
				
					<span style="float: left;"><input type="checkbox" name="treatmentepisodereportsent" id="treatmentepisodereportsent"/>
					Select Checkbox for Report Sent</span>
					<button type="button" class="btn btn-primary"
						onclick="saveAssesmentReportStatus();" >Save</button>
					  <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
				</div>
			</div>
		</div>
	</div>
	
	
	

<!--Treatment Episode Counter View  -->


<div class="modal fade" id="treatmentEpisodeCounterViewPopup" tabindex="-1" role="dialog"
	aria-labelledby="lblsendEmailPopUp" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Treatment Session</h4>
				</div>
				<div class="modal-body" style="height: 500px; overflow: scroll;">
					<div class="row">
						<div class="col-lg-12 col-md-12" id="showtptitlediv">	
							Treatment Episode Name 
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-lg-12 col-md-12" id="showtpcountdiv">	
							Show view
						</div>
					</div>
				</div>
				
				
				
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
				</div>
			</div>
		</div>
	</div>
	
	
 <!--Add Consultation Note Model-->
 <div  id="addConsultationNote"/>
     <div class="modal fade" id="" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-keyboard="false" data-backdrop="static">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Consultation Note</h4>
                </div>
                 <s:form action = "addConsultationNoteEmr" method="post" theme="simple" id="addconsultationFrm">
                
                <div class="modal-body" style="">
                <div class="col-lg-12 topbarback">
                 <input type="button" value="SOAP" onclick="setSOS('consNote')" class="btn btn-new">
                 <input type="button" value="Initial" onclick="setInitial('consNote')" class="btn btn-new">
                 <input type="button" value="Problem" onclick="setProblem('consNote')" class="btn btn-new">
                 <input type="button" value="Examination" onclick="setExamination('consNote')" class="btn btn-new">
                 <input type="button" value="Assessment" onclick="setAssessment('consNote')" class="btn btn-new">
                 <input type="button" value="Treatment" onclick="setTreatment('consNote')" class="btn btn-new">
                 <input type="button" value="Plan" onclick="setPlan('consNote')" class="btn btn-new">
                <!--  <input type="button" value="Date/Time" onclick="setDateTime('consNote')" class="btn btn-new"> -->
                
                	<div  style="width: 23%;float: right;">
								<s:select  theme="simple" cssStyle="width:22%" id="consCondition" name="consCondition" listKey="id" onchange="showdignosistxt('consNote')"
									listValue="treatmentName"  headerKey="0" headerValue="Select Condition / Diagnosis"
									list="treatmentTypeList" cssClass="form-control showToolTip chosen"></s:select>
								</div>
                
                <!--  <span class="hidden-xs hidden-sm" style="margin-left: 92px;font-weight: bold;font-size: 15px;"> select</span> -->
                </div>
                
               
                
                 
                <br> <br>
                <div class="row marlft37">	
                	<div class="col-lg-9 col-md-9">
                		<s:textarea cssStyle="height:250px;" cssClass="form-control showToolTip" placeholder="Enter Note For Todays Appointment" data-toggle="tooltip" rows="10" cols="30" name="consNote"  id="consNote" onmouseup="showOffset()"></s:textarea>
	               		 <s:hidden id= "apmtId" name="apmtId"/> 
                	</div>
	 				 
	 				 
	 				 <div class="col-lg-3 col-md-3">
						
							 <div class="panel-group managewidhe" id="accordion" role="tablist" aria-multiselectable="true">
						  <div class="panel panel-default">
						    <div class="panel-heading" role="tab" id="headingOne">
						       <h4 class="panel-title">
						      <span>
						      <a role="button" data-toggle="collapse" data-parent="#accordion" href="#addcon1" aria-expanded="true" aria-controls="addcon1" style="color:#fff;">
						        	 Prescription 
						        </a>
						      </span>
						        
						        <a href="#"><i onclick="showopdpriscription()" title="Add Prescription" class="fa fa-plus-square fa-2x aadpres"></i></a>
						      </h4>
						    </div>
						    <div id="addcon1" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
						      <div class="panel-body">
						      
						        <div id="alldataprisctable" class="row rowblank">
						      <!--    <div class="row">
						        <span><p class="pdatpree">23/11/2015 <a href="" title="View Prescription" class="editpricon"><i class="fa fa-eye"></i></a> <a href="" title="Edit Prescription" class="editpricon"><i class="fa fa-edit"></i></a></p> </span>
						        </div>
						        <div class="row">
						        <span><p class="pdatpree">24/11/2015 <a href="" title="View Prescription" class="editpricon"><i class="fa fa-eye"></i></a> <a href="" title="Edit Prescription" class="editpricon"><i class="fa fa-edit"></i></a></p> </span>
						        </div>
						        <div class="row">
						        <span><p class="pdatpree">25/11/2015 <a href="" title="View Prescription" class="editpricon"><i class="fa fa-eye"></i></a> <a href="" title="Edit Prescription" class="editpricon"><i class="fa fa-edit"></i></a></p> </span> 
						        </div>
						        <div class="row">
						        <span><p class="pdatpree">26/11/2015 <a href="" title="View Prescription" class="editpricon"><i class="fa fa-eye"></i></a> <a href="" title="Edit Prescription" class="editpricon"><i class="fa fa-edit"></i></a></p> </span>
						        </div> -->
						        	 
                                   <!--  <tbody id="alldataprisctable">
                                        <tr>
                                            <td>6/11/2015</td>
                                            <td>Rosavel 10</td>
                                           

                                        </tr>
                                      


                                    </tbody> -->
                                </table>
                                 </div>
						      </div>
						    </div>
						  </div>
						  <div class="panel panel-default">
						    <div class="panel-heading" role="tab" id="headingTwo">
						      <h4 class="panel-title">
						        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#addcon2" aria-expanded="false" aria-controls="addcon2">
						           Symbols <small style="color:#fff;">(Drag & Drop)</small>
						        </a>
						      </h4>
						    </div>
						    <div id="addcon2" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
						      <div class="panel-body" style="padding: 5px !important;">
						        <img src="emr/img/downarow.png" name="image1" />
							 <img src="emr/img/leftarow.png" name="image2" />
		 				 	<img src="emr/img/linea-arrows-10_e000(0)_48.png" name="image3" />
							 <img src="emr/img/linea-arrows-10_e013(1)_48.png" name="image4" />
							  <img src="emr/img/linedownarow.png" name="image5" />
							 <img src="emr/img/linedownarowright.png" name="image6" />
							 <img src="emr/img/linedownbreakleft.png" name="image7" />
							 <img src="emr/img/linedownbreakright.png" name="image8" />
							 <img src="emr/img/lineupdownarow.png" name="image9" />
							 <img src="emr/img/rightarow.png" name="image10" />
							 <img src="emr/img/southpoll.png" name="image11" /> 
							 <img src="emr/img/uparow.png" name="image12" />
						      </div>
						    </div>
						  </div>
						 
						  <div class="panel panel-default">
						    <div class="panel-heading" role="tab" id="headingfour">
						      <h4 class="panel-title">
						        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#addcon4" aria-expanded="false" aria-controls="addcon4">
						           Investigation
						        </a>
						      </h4>
						    </div>
						    <div id="addcon4" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingfour">
						      <div class="panel-body">
						       
						      </div>
						    </div>
						  </div>
						  <div class="panel panel-default">
						    <div class="panel-heading" role="tab" id="headingfive">
						      <h4 class="panel-title">
						        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#addcon5" aria-expanded="false" aria-controls="addcon5">
						           Templates & Forms
						        </a>
						      </h4>
						    </div>
						    <div id="addcon5" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingfive">
						      <div class="panel-body">
						       
						      </div>
						    </div>
						  </div>
					</div>
	 				 
		 				 
		 				 </div>  	
					<br><br>	
				</div>
				
                                
                 
                </div>
                
                
                <div class="modal-footer">
                      <div id="addconbtnsdiv">
                    	
                    	<input type="button" style="width: 115px;float:left;" value="Save" class="btn btn-primary" onclick="saveWithoutDischarge()"><br><br>
                    </div>       
                     <div class="row" id="dischargeclientdiv">
                     <div class="col-lg-3 col-md-3 marleft80">
                     	 <a href="#" onclick="toggleDischarge()"> Discharge Patient </a> 
                     </div>
                     </div>
                     
                     <br>
                    <div class="wellform" style="display:none; " id="toggleDischargediv">
                    <div class="row">
	                     <div class="col-lg-2 col-md-2 col-xs-4">
	                     	<label>Outcome</label>
	                     </div>
	                   	<div class="col-lg-1 col-md-1 col-xs-1 marleftr">
	                   		:
	                   	</div>
	                    <div class="col-lg-3 col-md-3 col-xs-7 marlft20">
	                   		<s:select cssClass="form-control" name="dischrgeOutcomes" id="dischrgeOutcomes" list="dischargeOutcomeList" listKey="id" listValue="name" headerKey="0" headerValue="Select Outcomes"/>
	                    </div>
                   	</div>
                   	
                   	<br>
                   	
                   	 <div class="row">
	                     <div class="col-lg-2 col-md-2 col-xs-4">
	                     	<label>Discharge Status</label>
	                     </div>
	                   	<div class="col-lg-1 col-md-1 col-xs-1 marleftr">
	                   		:
	                   	</div>
	                    <div class="col-lg-3 col-md-3 col-xs-7 marlft20">
	                  		 <s:select cssClass="form-control" name="dischargeStatus" id="dischargeStatus" list="dischargeStatusList" listKey="id" listValue="name" headerKey="0" headerValue="Select Status"/>
	                    </div>
                   	</div>
                   	
                   	<br>
                   	 <div class="row">
	                     <div class="col-lg-2 col-md-2 col-xs-4">
	                     	<label>Discharge</label>
	                     </div>
	                   	<div class="col-lg-1 col-md-1 col-xs-1 marleftr">
	                   		:
	                   	</div>
	                    <div class="col-lg-2 col-md-2 col-xs-7 marlft124">
	                  		 <s:checkbox  name="chkDischarge" id="chkDischarge" checked="true"/>
	                    </div>
                   	</div>
                   	
                   	<br>
                   	  <div class="row">
                     <div class="col-lg-4 col-md-4">
                    	
                     	 <button style="width: 100px;"  type="button" class="btn btn-primary" onclick="saveOnlyConsultationNote()"> Save </button> 
                     </div>
                     </div>
                    
                    </div>
                    
                </div>
                </s:form>	
            </div>
        </div>
    </div>
    
    <%-- </s:form> --%>
    
    <div class="modal fade" id="puremodifyPopup" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true" data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<button type="button" class="close" data-dismiss="modal" onclick="movetosetCommonAction()">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Day-To-Day Admin &nbsp;&nbsp;|&nbsp;&nbsp;<span><a href="#" onclick="showLetterHead()" title="Print Letterhead"><i class="fa fa-print" aria-hidden="true"></i></a></span> &nbsp;&nbsp;|&nbsp;&nbsp;<span id="editSave7"><a href="#" style="color: yellow;" onclick="editBMI(7)" title="Edit"><i class="fa fa-pencil" aria-hidden="true"></i></a></span></h4>
				</div>
				<div class="modal-body" style="padding:0px;">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 heightsetbmi">
									<div class="row">
										<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
											<div class="col-lg-2 col-md-2 col-sm-2 col-xs-3">
												<div class="form-group marbo10form">
												    <label for="exampleInputEmail1">Height <small>cm</small></label>
												    <p id="height1"></p>
												  </div>
											</div>
											<div class="col-lg-2 col-md-2 col-sm-2 col-xs-3">
												<div class="form-group marbo10form">
												    <label for="exampleInputEmail1">Weight <small>Kg's</small></label>
												    <p id="weight1">72 kg</p>
												  </div>
											</div>
											<div class="col-lg-2 col-md-2 col-sm-2 col-xs-3">
												<div class="form-group marbo10form">
												    <label for="exampleInputEmail1">BMI</label>
												    <p id="bmi1">24.39</p>
												  </div>
											</div>
											<div class="col-lg-2 col-md-2 col-sm-2 col-xs-3">
												<div class="form-group marbo10form">
												    <label for="exampleInputEmail1">Pulse</label>
												    <p id="pulse1">70 /min</p>
												  </div>
											</div>
											<div class="col-lg-2 col-md-2 col-sm-2 col-xs-3">
												<div class="form-group marbo10form">
												    <label for="exampleInputEmail1">Sys-BP</label>
												    <p id="sysbp1">120 mm Hg</p>
												  </div>
											</div>
											<div class="col-lg-2 col-md-2 col-sm-2 col-xs-3">
												<div class="form-group marbo10form">
												    <label for="exampleInputEmail1">Dia-BP</label>
												    <p id="diabp1">80 mm Hg</p>
												  </div>
											</div>
										</div>
									</div>
								</div>
					<div id="puremodifyClient" style="font-size: 16px; margin-bottom: 12px;color: rgb(61, 61, 61);">Manoj Mishra</div>
					<div class="row">
						
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 dtd">
							<div class="thumbnail" id="modify" onclick="modifythisAppointment()" style="cursor: pointer;">
						      <img src="popicons/modify.png" alt="..." style="width: 64px; height: 64px;">
						      <div class="caption"><p align="center" class="dtdf">Modify Appointment</p></div>
					    	</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
							<div class="thumbnail" id="deleteapmtiddiv" style="cursor: pointer;" onclick="openCancelApmtPopup()">
						      <img src="popicons/delete.png" alt="..." class="img=responsive">
						      <div class="caption"><p align="center" class="dtdf">Cancel Appointment</p></div>
					    	</div>
						</div>
					
						
						
					</div>
					
					
				</div>
				
					
				
				<div class="modal-footer">
					<!-- <button type="button" class="btn btn-primary"
						onclick="updateInvoiceStatus()">Submit</button> -->

					<button type="button" class="btn btn-primary hidden" data-dismiss="modal" onclick="movetosetCommonAction()">Close</button>
				</div>
			</div>
		</div>
	</div>
    
    
    	<!-- Cancel Appointment Note Popup  -->

	<div class="modal fade" id="cancelApmtNoteDiv" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">Cancel Appointment Note</h4>
				</div>
				<div class="modal-body">
				
				<label>Note:</label>
				<textarea id = "cancelApmtNote" name="cancelApmtNote" class="form-control showToolTip" placeholder="Enter Cancellation Note"></textarea>
				
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" 
						onclick="deleteNotAviSlot()">Cancel Appointment </button>
					<button type="button" class="btn btn-primary hidden" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
	
	 <!--Symbol Popup Model-->
    <div class="modal fade" id="symbolPopup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title"><i class="fa fa-plus"></i>Select Symbol</h4>
                </div>
                
                <div class="modal-body">
                <div class="row">
                 <div id= "imagebrowser" onclick="imageAdder();" class="col-lg-6 col-md-6">
						 <img src="emr/img/downarow.png" name="image1" />
						 <img src="emr/img/leftarow.png" name="image2" />
						 <img src="emr/img/linea-arrows-10_e000(0)_48.png" name="image3" />
						 <img src="emr/img/linea-arrows-10_e013(1)_48.png" name="image4" />
						 <img src="emr/img/linedownarow.png" name="image5" />
						 <img src="emr/img/linedownarowright.png" name="image6" />
						 <img src="emr/img/linedownbreakleft.png" name="image7" />
						 <img src="emr/img/linedownbreakright.png" name="image8" />
						 <img src="emr/img/lineupdownarow.png" name="image9" />
						 <img src="emr/img/rightarow.png" name="image10" />
						 <img src="emr/img/southpoll.png" name="image11" /> 
						 <img src="emr/img/uparow.png" name="image12" />
				</div>
                 </div>
                </div>
                
                <div class="modal-footer">
                    <button type="button" class="btn btn-default hidden" data-dismiss="modal">Close</button>
                    
                </div>
            </div>
        </div>
    </div>
   
   
   
   	<!-- followups reminder Modal -->
	 <div class="modal fade" id="followupsrminderpopup" tabindex="-1" role="dialog"
	aria-labelledby="lblsemdsmspopup" aria-hidden="true" data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<button  type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h5 class="modal-title" id="">Followups Reminder</h5>
				</div>
				<div class="modal-body">
						
						
					<div class="row">
						<div class="col-lg-2">
							<label>Remind Me : </label>
						</div>
						<div class="col-lg-4">
							<select class="form-control" name="remingmeduration" id="remingmeduration">
								<option value="0">Select Duration</option>
								<option value="900000">After 15 Minute</option>
								<option value="3600000">After 1 Hour</option>
								<option value="1800000">After 30 Minute</option>
								<option value="7200000">After 2 Hour</option>
								<option value="14400000">After 2 Hour</option>
								<option value="1">Don't show this message again</option>
							</select>
						</div>
					</div>
				    
					
				</div>
				<div class="modal-footer">
					
					<button type="button" class="btn btn-primary"
						onclick="saveReminderDuration()">Save</button>
						
						

					<button  type="button" class="btn btn-primary hidden" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
   
   
   
   
   
   
    	<!-- modify diagnosis -->
	 <div class="modal fade" id="modfydiagnosispopup" tabindex="-1" role="dialog"
	aria-labelledby="lblsemdsmspopup" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Modify Diagnosis for <span id="modfydiagnosisforid"></span></h4>
				</div>
				<div class="modal-body" style="min-height: 125px;">
						
						
					
				         <div class="col-lg-12">
				         	<div class="col-lg-6">
				         	<div class="form-group">
							    <label for="email">Condition / Diagnosis</label>
							    <s:form action="updateconNotAvailableSlot" method="post" id="demoform" theme="simple">
								 <s:select id = "modffycondition" name = "treatmentType" list="condtitionList" tabindex="115" headerValue="Select Condition" headerKey="0" listKey="id" listValue="treatmentType" cssClass="form-control showToolTip chosen-select amber"
								   data-toggle="tooltip" theme="simple" ></s:select> 
			                       <br><br> 
									<div class="" style="margin-bottom: 15px;">
									  <div class="">
									   <div id="scroll">
									       <table id="innertable" width="100%"></table>
									       
						 				</div>
						 				
									  </div>
									  
									</div>
									<input type="button" class="btn btn-primary" value="Add More" onclick="addnewCondition('innertable')" >
									<s:hidden id="edtapmtid" name="apmtSlotId"></s:hidden>
									<s:hidden id="edtconid" name="conditionid"></s:hidden>
									<s:hidden id="edtpatientId" name="clientid"></s:hidden>
							    </s:form>
							  </div>
						 	</div>
						 	<div class="col-lg-6">
						 	
						 	</div>
						
						</div>
						
						 
					
					
				</div>
				<div class="modal-footer smsbora">
					<button type="button" class="btn btn-primary"
						onclick="updatediagnosis()">Update</button>

					<button type="button" class="btn btn-primary hidden" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
   
   	<!-- create Prescription -->
		 <div class="modal fade" id="priscriptionpopup" tabindex="-1" role="dialog"
	aria-labelledby="lblsemdsmspopup" aria-hidden="true" data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<button  type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h5 class="modal-title" id="priscmyModalLabel">Create Prescription For <b class="pname">NAME: Mr.Pratik Raut  | AGE:34 / Male</b></h5>
				</div>
				<div class="modal-body" id="precriptionpopup">
					<jsp:include page="/diarymanagement/pages/addpriscription.jsp" /> 
				</div>
				<div class="modal-footer">
					
					<button type="button" class="btn btn-primary"
						onclick="saveTemplae(0)">Save Template</button>
					
					<button type="button" class="btn btn-primary"
						onclick="addIpdPrisc(0)">Save</button>
						
						<!-- <button type="button" class="btn btn-primary"
						onclick="insertEmrPriscription(1)">Save & Print</button>
 -->
					<button  type="button" class="btn btn-primary hidden" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
		<!-- add invesgtigation Modal -->
	 <div class="modal fade" id="investigationpopup" tabindex="-1" role="dialog"
	aria-labelledby="lblsemdsmspopup" aria-hidden="true" data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<button  type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h5 class="modal-title" id="">Create Investigation For <b class="pname" id="invstcmyModalLabel">NAME: Mr.Pratik Raut  | AGE:34 / Male</b></h5>
				</div>
				<div class="modal-body" id="investipopup">
						
						
					<jsp:include page="/emr/pages/addInvestigation.jsp" /> 
				    
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						onclick="saveIpdInvestigation(0)">Save</button>
						
						<!-- <button type="button" class="btn btn-primary"
						onclick="insertEmrPriscription(1)">Save & Print</button> -->

					<button  type="button" class="btn btn-primary hidden" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
   
   
  
   	<!-- Send sms Details Modal -->
	 <div class="modal fade" id="semdsmspopup" tabindex="-1" role="dialog"
	aria-labelledby="lblsemdsmspopup" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Send Sms</h4>
				</div>
				<div class="modal-body">
						
						
					
				         <div class="col-lg-12">
				         	<div class="col-lg-4">
								<label> User</label>
						 	</div>
						 	<div class="col-lg-8">
							
								<s:textfield name="smsuserName" id="smsuserNameletter" readonly="true" cssClass="form-control"  value="Client"  />
								<label  id = "smsunameError" class="text-danger"></label>	
							</div>
						</div>
						
						 <div class="col-lg-12 dtd bookav">
        					 <div class="col-lg-4 ">
								<label>Select Template</label>
							</div>
							 <div class="col-lg-8">
								<s:select onchange="getsmstemplatetxt(this.value)" cssClass="form-control showToolTip chosen" name="smstmlate" id="smstmlate" list="smsTemplateList" listKey="id" listValue="templateName" headerKey="0" headerValue="Select Template"/>
								<label  id = "smstmplateError" class="text-danger"></label>		
							</div>
						</div>
		
						 
				         <div class="col-lg-12">
				         	<div class="col-lg-4">
								<label>Mobile No</label>
						 	</div>
						 	<div class="col-lg-8">
							
								<s:textfield name="smsmobile" id="smsmobile"  cssClass="form-control"   />
								<label  id = "smsmobileError" class="text-danger"></label>	
							</div>
						</div>
						
						  <div class="col-lg-12">
				         	<div class="col-lg-4">
								<label>Enter Text</label>
						 	</div>
						 	<div class="col-lg-8">
							
								<s:textarea placeholder="Max 160 character" maxlength="160" cols="60" rows="5" name="smstxt" id="smstxt"  cssClass="form-control"   />
									
							</div>
						</div>
					
				</div>
				<div class="modal-footer smsbora">
					<button type="button" class="btn btn-primary"
						onclick="sendsms()">Send</button>

					<button type="button" class="btn btn-primary hidden" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
   
	
	
<!-- redirct to new emr -->

<%--  <s:form action = "getPatientRecordEmr" id = "getPatientRecord" target="blank"> --%>

<s:form action="getPatientRecordEmr" id="getPatientRecord" method="post" 
              							 target="formtarget">
            
           <s:hidden name="diaryUser" id="diaryUserApmt"/>
             <s:hidden id = "conditionsApmt"  name = "conditionsApmt"></s:hidden>
             <s:hidden id="clientnameApmt" name="clientname"/>
              <s:hidden name="action" id="hdnaction"/>
            <s:hidden name="caldate" id="caldate"/>
             <s:hidden name="apmtId" id="emrapmtId"/>
             
   </s:form>
   
   
   <s:form action="instantcashAdditional" id="cashdeskfrm" method="post" target="formtarget"> 
									
									<s:hidden name="clientId" id="cashClientid"/>
									<s:hidden name="thirdParty" id="cashthirdparty"/>
									<s:hidden name="location" id="cashLocationid"/>
									<s:hidden name="client" id="cashclientname"/>
									<s:hidden name = "payby" id ="cashPayby"></s:hidden>
									<s:hidden name="creditDebitCharge" id="creditDebitCharge" value="0"/>
									<s:hidden name="appointmentid" id="cashAppointmentid"/>
									
							
							
								
						    </s:form>
						    
				   <s:form action="Finder" id="finderfrm" method="post" target="formtarget"> 
				   		<s:hidden name="clientId" id="finderClientid"/>
				   </s:form>		    
	
	
	
	<script>
	$(".modal-draggable .modal-dialog").draggable({
        handle: ".modal-header"
    });
    $(function() {
  $('#cdna').slimScroll({
        height: '450px'
  });
   $('#scrollpan').slimScroll({
        height: '250px'
  });
 });
 
 
 /*Modal Dropdown Choosen Call*/						
      $('#modfydiagnosispopup').on('shown.bs.modal', function () {
	  $('.chosen-select', this).chosen();
	});
	</script>
	
</body>


</html>


<s:if test="(#session.LOGIN_INFO != null)&&(#session.LOGGED_IN)">
	<%@ include file="/application.jsp"%>

</s:if>