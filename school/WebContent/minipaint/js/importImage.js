var globalfilepath = "";
function showPopup(){
	 $( '#selectImage' ).modal( "show" );
}

function setImage(filepath){
	//globalfilepath = filepath;
	filepath = 'dicom/dimage1.png';
	globalfilepath = 'dicom/dimage1.png';
	
	 var $img = $('<img>', { src: filepath });
     var canvas = $('#myCanvas')[0];
   
     var context = canvas.getContext('2d');
     context.clearRect(0, 0, canvas.width, canvas.height);


     $img.load(function() {
       context.drawImage(this, 0, 0);
     });
     
}

function setSelectedImageToEditor(val){
	document.getElementById('selectedimageid').value = val;
	globalfilepath = 'dicom/dimage'+val+'.png';
	 var $img = $('<img>', { src: globalfilepath });
     var canvas = $('#Background')[0];
   
     var context = canvas.getContext('2d');
     context.clearRect(0, 0, canvas.width, canvas.height);

     $img.load(function() {
       context.drawImage(this, 0, 0);
     });
     $( '#dicomeditormodel' ).modal( "show" );
	
}