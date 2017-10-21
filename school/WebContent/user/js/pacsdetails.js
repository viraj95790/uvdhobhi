var selectedimgseriesid = 0;
function showMultiPicView(){
	document.getElementById('multipicdivid1').innerHTML = '';
	document.getElementById('multipicdivid2').innerHTML = '';
	document.getElementById('multipicdivid4').innerHTML = '';
	 var str = '';
	 selectedimgseriesid = 0;
	 var chsize = $(".checback:checked").length;
	 $('.checback').each(function() { //loop through each checkbox
           //select all checkboxes with class "checkbox1"  
		
         if(this.checked == true){
        	 //alert(this.value)
        	 selectedimgseriesid = selectedimgseriesid + ',' + this.value ;
        	 if(chsize==1){
        		 str = str+'<div class="col-xs-12 col-sm-12 col-md-12 paddingnil"><a href="#" onclick="setSelectedImageToEditor('+this.value+')" data-toggle="modal" data-target="#edit" style="position:absolute;z-index:9;"><i  class="fa fa-edit iconedit" aria-hidden="true"></i></a><img class="img-responsive imageborder" src="dicom/dimage'+this.value+'.png"></div>';
        	 }
        	 else if(chsize==2){
        		 str = str+'<div class="col-xs-6 col-sm-6 col-md-6 paddingnil"><a href="#" onclick="setSelectedImageToEditor('+this.value+')" data-toggle="modal" data-target="#edit" style="position:absolute;z-index:9;"><i  class="fa fa-edit iconedit" aria-hidden="true"></i></a><img class="img-responsive imageborder" src="dicom/dimage'+this.value+'.png"></div>';
        	 }else{
        		 str = str+'<div class="col-xs-4 col-sm-4 col-md-4 paddingnil"><a href="#" onclick="setSelectedImageToEditor('+this.value+')" data-toggle="modal" data-target="#edit" style="position:absolute;z-index:9;"><i  class="fa fa-edit iconedit" aria-hidden="true"></i></a><img class="img-responsive imageborder" src="dicom/dimage'+this.value+'.png"></div>'; 
        	 }	 
        	 
         }
         
        
     });
	/* var temp = chsize.split(',');
	 var size = temp.length -1;*/
	 var size = chsize;
	 var data = '';
	 if(size==1){
		 document.getElementById('multipicdivid1').innerHTML = str;
	 }
	 else if(size==2){
		document.getElementById('multipicdivid2').innerHTML = str;
	 }else{
		 document.getElementById('multipicdivid4').innerHTML = str;
	 }
	
    // alert(chsize);
} 

function showFolderImage(){
	 $( '#baselayout1loaderPopup' ).modal( "show" );
	document.getElementById('folderfrm').submit();
}

function updateImageData(){
	
	var imageData = "";
	
	 for(var i in LAYERS){
		 imageData = document.getElementById(LAYERS[i].name).toDataURL("image/png");
		
	}
	 document.getElementById('clientImageData').value = imageData;
	 document.getElementById('editorfrm').submit();

}

function showPatientName(clinicid){
	 $( '#baselayout1loaderPopup' ).modal( "show" );
	
var url = "clientDicom?clinicid="+clinicid+" ";
	
	if (window.XMLHttpRequest) {
		req = new XMLHttpRequest();
	}
	else if (window.ActiveXObject) {
		isIE = true;
		req = new ActiveXObject("Microsoft.XMLHTTP");
	}   
               
    req.onreadystatechange = showPatientNameRequest;
    req.open("GET", url, true); 
    
    req.send(null);

}

function showPatientNameRequest(){
	if (req.readyState == 4) {
		if (req.status == 200) {
			
			document.getElementById('patientnamedivid').innerHTML = req.responseText;
			 $( '#baselayout1loaderPopup' ).modal( "hide" );
		}
	}

}

function showInvestigation(clientid){
	 $( '#baselayout1loaderPopup' ).modal( "show" );
var clinicid = document.getElementById('hospName').value;
var url = "invstDicom?clientid="+clientid+"&clinicid="+clinicid+" ";
	
	if (window.XMLHttpRequest) {
		req = new XMLHttpRequest();
	}
	else if (window.ActiveXObject) {
		isIE = true;
		req = new ActiveXObject("Microsoft.XMLHTTP");
	}   
               
    req.onreadystatechange = showInvestigationRequest;
    req.open("GET", url, true); 
    
    req.send(null);

}
function showInvestigationRequest(){
	if (req.readyState == 4) {
		if (req.status == 200) {
			
			document.getElementById('invsttnamedivid').innerHTML = req.responseText;
			 $( '#baselayout1loaderPopup' ).modal( "hide" );
		}
	}
	
}

function savetoserver(){
	var chsize = $(".checback:checked").length;
	var hospName = document.getElementById('hospName').value;
	var clientName = document.getElementById('clientName').value;
	var invstName = document.getElementById('invstName').value;
	
	
	if(chsize==0){
		alert('Please select atlist one image!!');
	}else if(hospName==0){
		alert('Please select hospital!!');
	}else if(clientName==0){
		alert('Please select Patient!!');
	}else if(invstName==0){
		alert('Pleaes select Investigation!!');
	}else{
		document.getElementById('selectedimgids').value = selectedimgseriesid;
		document.getElementById('selectedhospname').value = hospName;
		document.getElementById('selectedpatientname').value = clientName;
		document.getElementById('selectedinvst').value = invstName;
		
		 $( '#baselayout1loaderPopup' ).modal( "show" );
		
		//alert(selectedimgseriesid);
		
		document.getElementById('savefrmid').submit();
	}
	
}


function showReport(){
	var chsize = $(".checback:checked").length;
	var hospName = document.getElementById('hospName').value;
	var clientName = document.getElementById('clientName').value;
	var invstName = document.getElementById('invstName').value;
	
	var patientname = $("#clientName option:selected").text();
	document.getElementById('selectedpname').value = patientname;
	
	document.getElementById('crselectedimgids').value = selectedimgseriesid;
	document.getElementById('crselectedhospname').value = hospName;
	document.getElementById('crselectedpatientname').value = clientName;
	document.getElementById('crselectedinvst').value = invstName;
	
	var t = 'formtarget';


	
	var left = (screen.width / 2) - (700 / 2);
	var top = (screen.height / 2) - (550 / 2);
	var oldwindow = window.open("", t,
			"status = 1,height = "+openpopupheight +",width = "+openpopupwidth +",resizable = 1,scrollbars=yes,left=" + 0
					+ ",top=" + 50);
	
	oldwindow.focus();
	
	document.getElementById('reportfrm').submit();
	
}

function savefindings(){
	var hospName = document.getElementById('hospName').value;
	var clientName = document.getElementById('clientName').value;
	var invstName = document.getElementById('invstName').value;
	
	document.getElementById('selectedhospname').value = hospName;
	document.getElementById('selectedpatientname').value = clientName;
	document.getElementById('selectedinvst').value = invstName;
	
	document.getElementById('findingfrm').submit();
	
}

function createDicomPdf(){

	
	document.getElementById('pdfdicomfrm').submit();
}

