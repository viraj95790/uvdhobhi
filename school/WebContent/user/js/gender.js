//set barcode dropdown value

function setBarocdeGenderAjax(gender){
	
	var url = "genderCategory?gender="+gender+" ";  
	if (window.XMLHttpRequest) {
		req = new XMLHttpRequest();
	}
	else if (window.ActiveXObject) {
		isIE = true;
		req = new ActiveXObject("Microsoft.XMLHTTP");
	}   
               
    req.onreadystatechange = setBarocdeGenderAjaxRequest;
    req.open("GET", url, true); 
              
    req.send(null);

}

function setBarocdeGenderAjaxRequest(){
	if (req.readyState == 4) {
		if (req.status == 200) {
			
			document.getElementById('gendercategory').innerHTML = req.responseText;
			document.getElementById('categoryID').value = gbarcodecategory;
			setBarcodeCategoryID(gbarcodecategory);
			
		}
	}
}


/*barcode dropdown value end*/


function setGenderAjax(gender){
	
	var url = "genderCategory?gender="+gender+" ";  
	if (window.XMLHttpRequest) {
		req = new XMLHttpRequest();
	}
	else if (window.ActiveXObject) {
		isIE = true;
		req = new ActiveXObject("Microsoft.XMLHTTP");
	}   
               
    req.onreadystatechange = setGenderAjaxRequest;
    req.open("GET", url, true); 
              
    req.send(null);

}

function setGenderAjaxRequest(){
	if (req.readyState == 4) {
		if (req.status == 200) {
			
			document.getElementById('gendercategory').innerHTML = req.responseText;
			disableElement();
		}
	}
}


function disableElement(){
	var str = "<select name=categoryID><option value='0'>Select Product</option> </select>"
	
	document.getElementById('productajax').innerHTML = str;

}