
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
 
 