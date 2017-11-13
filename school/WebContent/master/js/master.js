
 function submitdata(){
	 
	 document.getElementById('actiontype').value = '1';
	 
	 document.getElementById('reg_form').submit();
 }
 
 function showSearch(){
		if(document.getElementById('id').value==0){
	 		alert('Please select class!')
	 	}else{
	 		document.getElementById('dis_student').submit();
	 	}
 }
 
 function getstudentinfo(){
 	 
 	 document.getElementById('actiontype').value = '0';
 	 
 	document.getElementById('classname').value =  document.getElementById('id').value;
 	
 	if(document.getElementById('id').value==0){
 		alert('Please select class!')
 	}else{
 		document.getElementById('reg_form').submit();
 	}
 	 
  }
 
 
function maintermlist(classid){
	 
	 var url = "maintermMaster?classid="+classid+" ";
	 
	 if (window.XMLHttpRequest) {
			req = new XMLHttpRequest();
		}
		else if (window.ActiveXObject) {
			isIE = true;
			req = new ActiveXObject("Microsoft.XMLHTTP");
		}   
	               
	    req.onreadystatechange = maintermlistRequest;
	    req.open("GET", url, true); 
	              
	    req.send(null);
 }
 
 function maintermlistRequest(){
	 
	 if (req.readyState == 4) {
			if (req.status == 200) {
				
				document.getElementById('maintermid').innerHTML = req.responseText;

			}
		}
 }
 
 
function showexamtype(mainterm){
	 
	 var url = "examtypeMaster?mainterm="+mainterm+" ";
	 
	 if (window.XMLHttpRequest) {
			req = new XMLHttpRequest();
		}
		else if (window.ActiveXObject) {
			isIE = true;
			req = new ActiveXObject("Microsoft.XMLHTTP");
		}   
	               
	    req.onreadystatechange = showexamtypeRequest;
	    req.open("GET", url, true); 
	              
	    req.send(null);
 }
 
 function showexamtypeRequest(){
	 
	 if (req.readyState == 4) {
			if (req.status == 200) {
				
				document.getElementById('examid').innerHTML = req.responseText;

			}
		}
 }
 
 
 
 function showdata(){
	 
	 document.getElementById('hiddenid').value = document.getElementById('terms').value;
	 
 }
 