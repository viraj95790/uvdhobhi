var currencySign = '£';
var hisonlineusers = 0;


var apmuserlist = "";
var yearrange = "1880:2050";

var openpopupwidth = 1920;
var openpopupheight = 1024;
alertmsgduration = 1500;


function openPopup(URL) { 
	var oldwindow = window.open(URL, "Client Container", "status = 1, height = "+openpopupheight+", width = "+openpopupwidth+", resizable = 0,scrollbars=yes" ); 
	oldwindow.focus();
	} 
