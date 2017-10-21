var gindex = 0;
var cell2 = '';

$(document).ready(function(){
	var validator = $("#product_form").validate({
		onsubmit: true,
		rules : {
			
			categoryID : {
				selected : true
				},
				
				gender : {
					selected : true
				},	
					
				
			productName : {
				required : true
				
				
				},
			price : {
		   		required : true
			} 
				
		 
		
		
		
		},
		messages : {
		
				categoryID : {
				selected : error.categoryID.selected
				},
				gender : {
				 selected : error.gender.selected
				},
				
				productName : {
						required : error.productName.required
						
						
					  },
				price : {
						required : error.price.required
					}
		
		    },
		
	});
	
	
});	



function setSubCategory(id){

	var url = "subcategoryAjaxProduct?id="+id+"";
   
	if (window.XMLHttpRequest) {
		req = new XMLHttpRequest();
	}
	else if (window.ActiveXObject) {
		isIE = true;
		req = new ActiveXObject("Microsoft.XMLHTTP");
	}   
               
    req.onreadystatechange = setSubCategoryRequest;
    req.open("GET", url, true); 
              
    req.send(null);

}


function setSubCategoryRequest(){
if (req.readyState == 4) {
		if (req.status == 200) {
		
			
    		 document.getElementById("productajax").innerHTML = req.responseText;
         
         }
	}
}


var categoryid;
function setCategoryID(id){
categoryid = id;

}

function productAjax(productName){

	var url = "productCategory?categoryid="+categoryid+"&productName="+productName+" ";
   
	if (window.XMLHttpRequest) {
		req = new XMLHttpRequest();
	}
	else if (window.ActiveXObject) {
		isIE = true;
		req = new ActiveXObject("Microsoft.XMLHTTP");
	}   
               
    req.onreadystatechange = setSubCategoryRequest;
    req.open("GET", url, true); 
              
    req.send(null);
}


function setSubCategoryRequest(){
if (req.readyState == 4) {
		if (req.status == 200) {
		
			if(req.responseText != "go"){
				 document.getElementById("msgtd").innerHTML = req.responseText;
				 document.getElementById('productName').value = "";
			}else{
				document.getElementById("msgtd").innerHTML = "";
			}
			
    		
         
         }
	}
}

var count = 1;

function setmoreproduct(){
	count++;
	var url = "moreProduct?count="+count+" ";
	   
	if (window.XMLHttpRequest) {
		req = new XMLHttpRequest();
	}
	else if (window.ActiveXObject) {
		isIE = true;
		req = new ActiveXObject("Microsoft.XMLHTTP");
	}   
               
    req.onreadystatechange = setmoreproductRequest;
    req.open("GET", url, true); 
              
    req.send(null);
}

function setmoreproductRequest(){
	if (req.readyState == 4) {
		if (req.status == 200) {
			document.getElementById("tbodyprdajax").innerHTML = req.responseText; 
			
		}
	}
	
}

var gpindex = 0;
function setGenderProductAjax(gender,index){
	gpindex = index;
	
	var url = "gprodCategory?gender="+gender+"&index="+index+" ";  
	if (window.XMLHttpRequest) {
		req = new XMLHttpRequest();
	}
	else if (window.ActiveXObject) {
		isIE = true;
		req = new ActiveXObject("Microsoft.XMLHTTP");
	}   
               
    req.onreadystatechange = setGenderProductAjaxRequest;
    req.open("GET", url, true); 
              
    req.send(null);

}

function setGenderProductAjaxRequest(){
	if (req.readyState == 4) {
		if (req.status == 200) {
			
			document.getElementById('s'+gpindex).innerHTML = req.responseText;
			
		 	 //cell2.innerHTML = req.responseText;
			
		}
	}
}


function setGenderProductAjax1(gender,index){
	
	var url = "gprodCategory?gender="+gender+"&index="+index+" ";  
	if (window.XMLHttpRequest) {
		req = new XMLHttpRequest();
	}
	else if (window.ActiveXObject) {
		isIE = true;
		req = new ActiveXObject("Microsoft.XMLHTTP");
	}   
               
    req.onreadystatechange = setGenderProductAjax1Request;
    req.open("GET", url, true); 
              
    req.send(null);

}

function setGenderProductAjax1Request(){
	if (req.readyState == 4) {
		if (req.status == 200) {
			
			document.getElementById('gendercategory').innerHTML = req.responseText;
			
		 	 //cell2.innerHTML = req.responseText;
			
		}
	}
}


function addRow(btnindx) 
{
	
	document.getElementById('btn'+btnindx).innerHTML = '';
	
	 var table = document.getElementById('productlisttable');
	 
	 var rowCount = table.rows.length;
     var row = table.insertRow(rowCount);
     var counts = rowCount - 1;
     
    /* var cell1 = row.insertCell(0);
 	 var element1 = document.createElement("input");
	 element1.type = "checkbox";
 	 element1.name="chkbox[]";
 	 element1.title="Delete Row";
 	 cell1.appendChild(element1);*/

	 var cell1 = row.insertCell(0);
 	 cell1.innerHTML = '<select onchange="setGenderProductAjax(this.value,'+counts+')" name="rowProductList['+counts+'].gender" id="rowProductList['+counts+'].gender"><option value="0">Select Gender</option><option value="1">Gents</option><option value="2">Ladies</option></select>';
 	 
 	 cell2 = row.insertCell(1);
 	 cell2.innerHTML = '<span id="s'+counts+'"><select onchange="setGenderProductAjax(this.value,'+counts+')" name="rowProductList['+counts+'].categoryID" id="rowProductList['+counts+'].categoryID"><option value="0">Select Category</option></select></span>';
 	
 	 
 	var cell3 = row.insertCell(2);
 	cell3.innerHTML = "<input type='text' maxlength='15' placeholder='Valid only 15 charecter'    name = 'rowProductList[" + counts + "].productName' id='rowProductList[" + counts + "].price'>";
 	
 	
 	var cell4 = row.insertCell(3);
 	cell4.innerHTML = "<input type='text' maxlength='6' placeholder='Enter Price'    name = 'rowProductList[" + counts + "].price' id='rowProductList[" + counts + "].productName'>";
	
	
	var cell5 = row.insertCell(4);
 	cell5.innerHTML = "<span id='btn"+counts+"'><input type='button' value='Add' onclick='addRow("+counts+")'></span>";
 	
 	
}