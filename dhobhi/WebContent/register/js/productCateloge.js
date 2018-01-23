
 function setItemAjax(id){
	 
	 var url = "idService?id="+id+" ";
	 
	 if (window.XMLHttpRequest) {
			req = new XMLHttpRequest();
		}
		else if (window.ActiveXObject) {
			isIE = true;
			req = new ActiveXObject("Microsoft.XMLHTTP");
		}   
	               
	    req.onreadystatechange = setItemAjaxRequest;
	    req.open("GET", url, true); 
	              
	    req.send(null);
 }
 
 function setItemAjaxRequest(){
	 
	 if (req.readyState == 4) {
			if (req.status == 200) {
				
				document.getElementById('subitemdivid').innerHTML = req.responseText;

			}
		}
 }
 
 function setpriceAjax(){
	 
	var subitemid = document.getElementById('subitem').value;
	var quantity =  document.getElementById('qty').value;
	
	 var url = "getpriceService?subitemid="+subitemid+"&quantity="+quantity+" ";
	 
	 
	 if (window.XMLHttpRequest) {
			req = new XMLHttpRequest();
		}
		else if (window.ActiveXObject) {
			isIE = true;
			req = new ActiveXObject("Microsoft.XMLHTTP");
		}   
	               
	    req.onreadystatechange = setpriceAjaxRequest;
	    req.open("GET", url, true); 
	              
	    req.send(null);
	 
 }
 
 function setpriceAjaxRequest(){
	 
	 if (req.readyState == 4) {
			if (req.status == 200) {
				
				document.getElementById('priceiddiv').innerHTML = 'Rs.' + req.responseText;
				
				
			}
		}
 }
 
 
 function savecartform(){
	 document.getElementById('servicefrm').submit(); 
 
 }
 


var selectedcartid = 0;
function getselectedchk(){
	
	
    $('.case').each(function() { //loop through each checkbox
       // this.checked = true;  //select all checkboxes with class "checkbox1" 
       if(this.checked==true){
    	   selectedcartid = selectedcartid + ',' + this.value;
       }
        
    });
}

function getcreateinv(){
	
	getselectedchk();
	
	document.getElementById('selectedchk').value = selectedcartid;
	document.getElementById('selectedcustid').value = document.getElementById('name').value;
	
	if(document.getElementById('name').value==0){
		alert('Please select customer!!');
	}else{
		document.getElementById('cr8inv').submit();
	}
	
}
 
function getcustorder(){
	
	document.getElementById('cd1').submit();
}

 function getcustomerlist(){
	 document.getElementById('cd1').submit();
 }


function showhidechargedetails(id){
	 if(document.getElementById('charges'+id).style.display==''){
	  document.getElementById('charges'+id).style.display='none';
	 }else{
	  document.getElementById('charges'+id).style.display='';
	 }
	}


function showVendorList(postcode){

	var url = "vendorService?postcode="+postcode+" ";
	 
	 if (window.XMLHttpRequest) {
			req = new XMLHttpRequest();
		}
		else if (window.ActiveXObject) {
			isIE = true;
			req = new ActiveXObject("Microsoft.XMLHTTP");
		}   
	               
	    req.onreadystatechange = showVendorListRequest;
	    req.open("GET", url, true); 
	              
	    req.send(null);
	
}

function showVendorListRequest(){
	 if (req.readyState == 4) {
			if (req.status == 200) {
				
				document.getElementById('vendorlistdiv').innerHTML =  req.responseText;

			}
		}
}


function openVbarcode(action){
	
	var t = 'formtarget';

	document.getElementById('vfromdate').value = document.getElementById('fromDate').value;
	document.getElementById('vtodate').value = document.getElementById('toDate').value;
	document.getElementById('action').value = action;

	/* document.getElementById('getPatientRecord').submit(); */

	var left = (screen.width / 2) - (700 / 2);
	var top = (screen.height / 2) - (550 / 2);
	
	var oldwindow = window.open("", t,
			"status = 1,height = "+openpopupheight +",width = "+openpopupwidth +",resizable = 1,scrollbars=yes,left=" + 0
					+ ",top=" + 50);
	
	oldwindow.focus();

	document.getElementById('vbarcodefrm').submit();
}


 function userinfo(){
	 
	 $( "#newotchargepopupid" ).modal( "show" );
 }

 
 function showUserProfileData(id){

	 var url = "pinfoService?id="+id+" ";
	 
	 
	 if (window.XMLHttpRequest) {
			req = new XMLHttpRequest();
		}
		else if (window.ActiveXObject) {
			isIE = true;
			req = new ActiveXObject("Microsoft.XMLHTTP");
		}   
	               
	    req.onreadystatechange = showUserProfileDataRequest;
	    req.open("GET", url, true); 
	              
	    req.send(null); 

	 
 }
 
 function showUserProfileDataRequest(){
	  if (req.readyState == 4) {
			if (req.status == 200) {
				
				var data = req.responseText;	
				var tmp = data.split("~");
				
				document.getElementById('paddress').value = tmp[0];
				document.getElementById('plandmark').value = tmp[1];
				document.getElementById('pcity').value = tmp[2];
				document.getElementById('ppincode').value = tmp[3];
			//	document.getElementById('pmobile').value = tmp[1];
		
			}
	  }
 }
 
 
 function saveuserInfo(){
	 var address = document.getElementById('paddress').value;
	 var mob = document.getElementById('pmobile').value;
	 var landmark = document.getElementById('plandmark').value;
	 var city = document.getElementById('pcity').value;
	 var pincode = document.getElementById('ppincode').value;
	 
	 if(address==''){
		 alert('Please Enter Address');
	 }
	 
	 else if(landmark==''){
		 alert('Please Enter landmark');
	 }
	 else if(city==''){
		 alert('Please Enter city');
	 }
	 else if(pincode==''){
		 alert('Please Enter pincode');
	 }
	 else if(mob==''){
		 alert('Please Enter mobile number');
	 }
	 
	 else{
 var url = "saveuinfoService?address="+address+"&mob="+mob+"&landmark="+landmark+"&city="+city+"&pincode="+pincode+" ";
	 
	 
	 if (window.XMLHttpRequest) {
			req = new XMLHttpRequest();
		}
		else if (window.ActiveXObject) {
			isIE = true;
			req = new ActiveXObject("Microsoft.XMLHTTP");
		}   
	               
	    req.onreadystatechange = saveuserInfoRequest;
	    req.open("GET", url, true); 
	              
	    req.send(null); 
	    
	 }

 }
	 
 
 
 function saveuserInfoRequest(){
	  if (req.readyState == 4) {
			if (req.status == 200) {
				window.location.reload();
			}
	  }
}
 
 function goforot(){
	 if(document.getElementById('pmobile').value==''){
		 $( "#newotchargepopupid" ).modal( "show" );
		 alert('Please update address and mobile number!!');
	 }else{
		 window.location.href='sendotpService';
	 }
	 
 }
