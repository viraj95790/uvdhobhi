 
 function getcustomer(){
	
	document.getElementById('cust1').submit();
}
 
 function showhidechargedetails(chargeinvid){
	 if(document.getElementById('charges'+chargeinvid).style.display==''){
	  document.getElementById('charges'+chargeinvid).style.display='none';
	 }else{
	  document.getElementById('charges'+chargeinvid).style.display='';
	 }
	}
 
  
 function showitem(cartinvid){
	  
	  if(document.getElementById('prod'+cartinvid).style.display==''){
		  document.getElementById('prod'+cartinvid).style.display='none';
		 }else{
		  document.getElementById('prod'+cartinvid).style.display='';
		 }
 }
 
 function confirmation(){
	 
	 var textotp = document.getElementById('textotp').value;
	 
	 var url = "confirmotpService?textotp="+textotp+" ";
	 
	 
	 if (window.XMLHttpRequest) {
			req = new XMLHttpRequest();
		}
		else if (window.ActiveXObject) {
			isIE = true;
			req = new ActiveXObject("Microsoft.XMLHTTP");
		}   
	               
	    req.onreadystatechange = confirmationRequest;
	    req.open("GET", url, true); 
	              
	    req.send(null);
	 
 }
 
 function confirmationRequest(){
	 
	 if (req.readyState == 4) {
			if (req.status == 200) {
				
		var confirmotp = req.responseText;	
		var textotp = document.getElementById('textotp').value;
		
		if(textotp == confirmotp){
			 
			 document.getElementById('orderconfirm').submit();
		 }
		 else{
			 alert("OTP is not correct!!!");
		 }
				
				/*document.getElementById('priceiddiv').innerHTML = 'Rs.' + req.responseText;*/
				
				
			}
		}
	 
 }
 
 
 function getbarcodedata(barcode){
	
	 
	 var url = "barcodeinfoAccount?selectedid="+barcode+" ";
	 
	 
	 if (window.XMLHttpRequest) {
			req = new XMLHttpRequest();
		}
		else if (window.ActiveXObject) {
			isIE = true;
			req = new ActiveXObject("Microsoft.XMLHTTP");
		}   
	               
	    req.onreadystatechange = getbarcodedataRequest;
	    req.open("GET", url, true); 
	              
	    req.send(null);
	 
 }
 
function getbarcodedataRequest(){
	 
	 if (req.readyState == 4) {
			if (req.status == 200) {
		
				document.getElementById('barcodetable').innerHTML = req.responseText;
				
				document.getElementById('barcode').value = '';
				
			}
		}
	 
 }
 
 