var CON = new CONTROLLS_CLASS();

//keyboard handlers
document.onkeydown = function(e) {return CON.on_keyboard_action(e); }
document.onkeyup = function(e) {return CON.on_keyboardup_action(e); }
//mouse
window.ondrop = function(e){ /*CON.upload_drop(e);*/ }		//drop
window.ondragover = function(e){/*e.preventDefault();*/  }
document.onmousedown = CON.mouse_click;	//mouse click
document.onmousemove = CON.mouse_move;	//mouse move
document.onmouseup = CON.mouse_release;	//mouse resease
document.addEventListener("mousewheel", CON.mouse_wheel_handler, false);	//mouse scroll
document.addEventListener("DOMMouseScroll", CON.mouse_wheel_handler, false);	//mouse scroll
window.onresize = CON.calc_preview_auto;					//window resize
document.oncontextmenu = function(e) {return CON.mouse_right_click(e); };	//mouse right click

function CONTROLLS_CLASS(){
	this.mouse;
	this.ctrl_pressed = false; //17
	this.alt_pressed = false; //18
	this.shift_pressed = false; //16
	this.ZOOM_X = 0;
	this.ZOOM_Y = 0;
	this.mini_rect_data = { w: 0, h:0 };
	
	var autosize = true;
	var isDrag = false;
	var mouse_click_x = false;
	var mouse_click_y = false;
	var mouse_x_move_last = false;
	var mouse_y_move_last = false;
	var resize_all = false;
	var mouse_click_valid = false;
	
	//keyboard actions
	this.on_keyboard_action = function(event){
		k = event.keyCode;	//log(k);
		
		if(POP != undefined && POP.active==true && k != 27) return true;
		if(document.activeElement.type == 'text') return true;
		
		//up
	/*	if(k == 38){
			if(ACTION=='select_tool'){
				MAIN.save_state();
				LAYER.layer_move_active(0, -1);
				return false;
				}
			}*/
		//down
	/*	else if(k == 40){
			if(ACTION=='select_tool'){
				MAIN.save_state();
				LAYER.layer_move_active(0, 1)
				return false;
				}
			}*/
		//left
	/*	else if(k == 39){
			if(ACTION=='select_tool'){
				MAIN.save_state();
				LAYER.layer_move_active(1, 0);
				return false;
				}
			}*/
		//right
		/*else if(k == 37){
			if(ACTION=='select_tool'){
				MAIN.save_state();
				LAYER.layer_move_active(-1, 0);
				return false;
				}
			}*/
		//esc
		 if(k == 27){		
			if(POP != undefined && POP.active == true)
				POP.hide();
			}
		//z - undo
		else if(k == 90){
			//undo
			if(CON.ctrl_pressed==true)
				MAIN.undo();
			}
		//t - trim
		else if(k == 84){
			MAIN.save_state();
			DRAW.trim();
			}
		//o - open
		/*else if(k == 79)
			MENU.open();*/
		//s - save
		else if(k == 83){
			if(POP != undefined){
				POP.add({name: "name",		title: "File name:",	value: ["example"],	});
				POP.add({name: "type",		title: "Save as type:",	values: SAVE_TYPES,	});	
				POP.add({name: "quality",	title: "Quality (1-100) (optional):",	value: 92, range: [1, 100],	});
				POP.show('Save as ...', MENU.save);
				}
			}
		//l - rotate left
		else if(k == 76){
			MAIN.save_state();
			MENU.rotate_resize_doc(270, WIDTH, HEIGHT); 
			MENU.rotate_layer({angle: 270}, canvas_active(), WIDTH, HEIGHT);
			}
		//r - rotate right
		else if(k == 82){
			MAIN.save_state();
			MENU.rotate_resize_doc(90, WIDTH, HEIGHT); 
			MENU.rotate_layer({angle: 90}, canvas_active(), WIDTH, HEIGHT);
			}
		//grid
		else if(k==71){
			if(MAIN.grid == false)
				MAIN.grid = true;
			else
				MAIN.grid = false;
			DRAW.draw_grid(canvas_back, 50, 50);	
			}
		//del
		else if(k==46){
			if(TOOLS.select_data != false){
				MAIN.save_state();
				canvas_active().clearRect(TOOLS.select_data.x, TOOLS.select_data.y, TOOLS.select_data.w, TOOLS.select_data.h);
				TOOLS.select_data = false;
				canvas_front.clearRect(0, 0, WIDTH, HEIGHT);
				}
			}
		//shift
		else if(k==16)
			CON.shift_pressed = true; 
		//ctrl
		else if(k==17){
			CON.ctrl_pressed = true; 
			if (!window.Clipboard)
				pasteCatcher.focus();
			}
		//alt
		else if(k==18)
			CON.alt_pressed = true;
		//a
		else if(k==65){
			if(CON.ctrl_pressed == true){
				TOOLS.select_data = {
					x: 	0,
					y: 	0,
					w: 	WIDTH,
					h: 	HEIGHT
					};
				TOOLS.draw_selected_area();
				return false;
				}
			}
		//x
		else if(k==88){
			if(CON.ctrl_pressed == true && TOOLS.select_data != false){
				MAIN.save_state();
				MENU.copy_to_clipboard();
				canvas_active().clearRect(TOOLS.select_data.x, TOOLS.select_data.y, TOOLS.select_data.w, TOOLS.select_data.h);
				TOOLS.select_data = false;
				canvas_front.clearRect(0, 0, WIDTH, HEIGHT);
				}
			}
		//c
		else if(k==67){
			if(CON.ctrl_pressed == true && TOOLS.select_data != false)
				MENU.copy_to_clipboard();
			}
		//v
		else if(k==86){
			MAIN.save_state();
			if(CON.ctrl_pressed == true)
				MENU.paste();
			}
			
		DRAW.zoom();
		return true;
		}
	//keyboard release
	this.on_keyboardup_action = function(event){
		k = event.keyCode;
		//shift
		if(k==16)
			CON.shift_pressed = false;
		//ctrl
		else if(k==17)
			CON.ctrl_pressed = false;
		//alt
		else if(k==18)
			CON.alt_pressed = false;
		}
	this.get_mouse_position = function(event){
		var valid = true;
		if(event.offsetX) {
			mouse_x = event.offsetX;
			mouse_y = event.offsetY;
			}
		else if(event.layerX) {
			mouse_x = event.layerX;
			mouse_y = event.layerY;
			}
		else
			return false;
		if(event.target.id != "canvas_preview"){
			if((mouse_x < 200 || mouse_y < 200) && event.target.id != "canvas_front"){
				mouse_x = mouse_x - 109;
				mouse_y = mouse_y - 34;
				valid = false;
				}
			else if((mouse_x > WIDTH+1 || mouse_y > HEIGHT+1) && event.target.id != "canvas_front"){
				mouse_x = mouse_x - 109;
				mouse_y = mouse_y - 34;	
				valid = false;
				}
			if(ZOOM != 100 ){
				mouse_x = Math.floor(mouse_x / ZOOM * 100);
				mouse_y =  Math.floor(mouse_y / ZOOM * 100);
				}
			}
		else
			valid = false;
		
		//save - other place will use it too
		CON.mouse = {
			x: mouse_x, 
			y: mouse_y, 
			click_x: mouse_click_x,
			click_y: mouse_click_y,
			last_x: mouse_x_move_last,
			last_y: mouse_y_move_last,
			valid: valid,
			click_valid: mouse_click_valid,
			};
		}
	//mouse right click
	this.mouse_right_click = function(event){
		if(POP != undefined && POP.active==true) return true;
		mouse_click_x = mouse_x;
		mouse_click_y = mouse_y;
		CON.get_mouse_position(event);
		
		for (i in TOOLS){
			if(i == ACTION){
				return TOOLS[i]('right_click', CON.mouse, event);
				break;
				}
			}
		}
	//mouse click
	this.mouse_click = function(event){
		if(POP != undefined && POP.active==true) return true;
		if(event.which == 3) return true;
		mouse_click_x = mouse_x;
		mouse_click_y = mouse_y;
		CON.get_mouse_position(event);
		if(CON.mouse.valid == false)
			mouse_click_valid = false;
		else
			mouse_click_valid = true;
		isDrag = true;
		
		//check tools functions
		for (i in TOOLS){
			if(i == ACTION){
				TOOLS[i]('click', CON.mouse, event);
				break;
				}
			}
			
		if(event.target.id == "canvas_preview") 
			CON.calc_preview_by_mouse(CON.mouse.x, CON.mouse.y);	
		
		//main window resize
		resize_all = false;
		if(ZOOM == 100){
			if(event.target.id == "resize-w")	resize_all = "w";
			else if(event.target.id == "resize-h")	resize_all = "h";
			else if(event.target.id == "resize-wh")	resize_all = "wh";
			}
		}
	//mouse move
	this.mouse_move = function(event){
		if(POP != undefined && POP.active==true) return true;
		CON.get_mouse_position(event);
		if(event.target.id == "canvas_preview" && isDrag==true)
			CON.calc_preview_by_mouse(CON.mouse.x, CON.mouse.y);
		LAYER.update_info_block();
		
		//main window resize
		if(ZOOM == 100){
			if(event.target.id == "resize-w")	document.body.style.cursor = "w-resize";
			else if(event.target.id == "resize-h")	document.body.style.cursor = "n-resize";
			else if(event.target.id == "resize-wh")	document.body.style.cursor = "nw-resize";
			else					document.body.style.cursor = "auto";
			if(resize_all != false && isDrag==true){
				document.body.style.cursor = "auto";
				if(resize_all == "w"){
					new_w = mouse_x;
					new_h = HEIGHT;
					}
				else if(resize_all == "h"){
					new_w = WIDTH;
					new_h = mouse_y;
					}
				else if(resize_all == "wh"){
					new_w = mouse_x;
					new_h = mouse_y;
					}
				canvas_front.clearRect(0, 0, WIDTH, HEIGHT);
				HELPER.dashedRect(canvas_front, 0, 0, new_w-1, new_h-1);
				event.preventDefault();
				HELPER.remove_selection();
				return false;
				}
			}
		//check tools functions
		if(isDrag === false){
			for (i in TOOLS){
				if(i == ACTION){
					TOOLS[i]('move', CON.mouse, event);
					break;
					}
				}
			}
		
		if(isDrag === false) return false;	//only drag now
		
		//check tools functions
		for (i in TOOLS){
			if(i == ACTION){
				TOOLS[i]('drag', CON.mouse, event);
				break;
				}
			}
			
		if(ACTION != 'select_square')
			TOOLS.select_square_action = '';
		
		mouse_x_move_last = CON.mouse.x;
		mouse_y_move_last = CON.mouse.y;
		}
	//release mouse click
	this.mouse_release = function(event){
		if(POP != undefined && POP.active==true) return true;
		var mouse = CON.get_mouse_position(event);
		isDrag = false;
		mouse_x_move_last = false
		mouse_y_move_last = false;
		if(TOOLS.select_square_action == '' && CON.mouse.valid == true)
			TOOLS.select_data = false;
		
		//check tools functions
		canvas_front.clearRect(0, 0, WIDTH, HEIGHT);
		TOOLS.draw_selected_area();
		for (i in TOOLS){
			if(i == ACTION){
				TOOLS[i]('release', CON.mouse, event);
				break;
				}
			}
			
		//main window resize
		if(resize_all != false && ZOOM == 100){
			CON.autosize = false;
			document.body.style.cursor = "auto";
			if(resize_all == "w")
				WIDTH = parseInt(mouse_x);
			else if(resize_all == "h")
				HEIGHT = parseInt(mouse_y);
			else if(resize_all == "wh"){
				WIDTH = parseInt(mouse_x);
				HEIGHT = parseInt(mouse_y);
				}
			RATIO = WIDTH/HEIGHT;
			LAYER.set_canvas_size();
			DRAW.zoom();
			}
		resize_all = false;
		DRAW.zoom();
		}
	//upload drop zone
	this.upload_drop = function(e){
		e.preventDefault();
		var progress = document.getElementById('uploadprogress');
		progress.style.display='block';
		progress.value = progress.innerHTML = 0;
		MAIN.save_state();
		for (var i = 0, f; f = e.dataTransfer.files[i]; i++){
			if(!f.type.match('image.*') && f.type != 'text/xml') continue;
		
			var FR = new FileReader();	
			FR.file = e.dataTransfer.files[i];
						
			FR.onload = function(event){
				if(this.file.type != 'text/xml'){
					//image
					LAYER.layer_add(this.file.name, event.target.result, this.file.type);
					EXIF.getData(this.file, TOOLS.save_EXIF);
					}
				else{
					//xml
					var responce = MAIN.load_xml(event.target.result);
					if(responce === true)
						return false;
					}
				
				//finish progress
				var progress = document.getElementById('uploadprogress');
				progress.value = progress.innerHTML = 100;
				progress.style.display='none';
				};		
			FR.onprogress = (function(e){
				return function(e){
				 	var complete = (e.loaded / e.total * 100 | 0);
				 	var progress = document.getElementById('uploadprogress');
					progress.value = progress.innerHTML = complete;
					};
				})(f);
			if(f.type == "text/plain")
				FR.readAsText(f);
			else if(f.type == "text/xml")
				FR.readAsText(f);	
			else
				FR.readAsDataURL(f);
			}
		document.getElementById("drop_zone").style.display='none';
		}
	this.mouse_wheel_handler = function(e){	//return true;
		var step = 100;
		//zoom
		if(CON.ctrl_pressed==true){
			var delta = Math.max(-1, Math.min(1, (e.wheelDelta || -e.detail)));
			if(ZOOM <=100 && delta < 0)
				step = 10;
			if(ZOOM <100 && delta > 0)
				step = 10;
			delta = delta * step;
			if(ZOOM + delta > 0){
				ZOOM = ZOOM + delta;
				CON.calc_preview_auto();
				DRAW.zoom();
				}
			if(TOOLS.action_data().name == 'zoom'){
				TOOLS.action_data().attributes.zoom = ZOOM;
				show_action_attributes();
				}
				
			//disable page scroll if ctrl pressed
			e.preventDefault()
			return false;
			}
		}
	this.scroll_window = function(){
		var pad_left = 109;
		var pad_top = 34;
		var dim = HELPER.get_dimensions();
		var page_w = dim[0];
		var page_h = dim[1];
		var total_w = (WIDTH * ZOOM/100)  + pad_left;
		var total_h = (HEIGHT * ZOOM/100) + pad_top;
		var visible_w = page_w - 60;
		var visible_h = page_h - 60;
		
		var scrollbar_w = page_w * visible_w / total_w;
		var scrollbar_h = page_h * visible_h / total_h;
	
		xx = total_w * CON.ZOOM_X / (DRAW.PREVIEW_SIZE.w);
		yy = total_h * CON.ZOOM_Y / (DRAW.PREVIEW_SIZE.h );
		
		//minuus scrollbar size
		xx = xx - scrollbar_w/2;
		yy = yy - scrollbar_h/2;
		
		scrollTo(xx, yy);
		}
	this.calc_preview_by_mouse = function(mouse_x, mouse_y){
		CON.ZOOM_X = mouse_x - CON.mini_rect_data.w/2;
		CON.ZOOM_Y = mouse_y - CON.mini_rect_data.h/2;
		if(CON.ZOOM_X < 0) CON.ZOOM_X = 0;
		if(CON.ZOOM_Y < 0) CON.ZOOM_Y = 0;
	
		DRAW.zoom(undefined, true);
		return true;
		}
	this.calc_preview_auto = function(){
		var pad_left = 109;
		var pad_top = 34;
		var dim = HELPER.get_dimensions();
		var page_w = dim[0];
		var page_h = dim[1];
		var total_w = (WIDTH * ZOOM/100)  + pad_left;
		var total_h = (HEIGHT * ZOOM/100) + pad_top;
		var visible_w = page_w - 60;
		var visible_h = page_h - 60;		
		
		CON.mini_rect_data.w = round(visible_w * DRAW.PREVIEW_SIZE.w / total_w);	
		CON.mini_rect_data.h = round(visible_h * DRAW.PREVIEW_SIZE.h / total_h);
		
		DRAW.redraw_preview();
		}
	}

//=== Clipboard ================================================================

//firefox
var pasteCatcher;
if (!window.Clipboard){
	pasteCatcher = document.createElement("div");
	pasteCatcher.setAttribute("id", "paste_ff");
	pasteCatcher.setAttribute("contenteditable", "");
	pasteCatcher.style.cssText = 'opacity:0;position:fixed;top:0px;left:0px;';
	pasteCatcher.style.marginLeft = "-20px";
	document.body.appendChild(pasteCatcher);
	pasteCatcher.focus();
	document.addEventListener("click", function(){
		//pasteCatcher.focus();
		});
	document.getElementById('paste_ff').addEventListener('DOMSubtreeModified',function(){
		if(pasteCatcher.children.length == 1){
			img = pasteCatcher.firstElementChild.src;
			LAYER.layer_add('Paste', img);
			pasteCatcher.innerHTML = '';
			}
		},false);
	}
//chrome
window.addEventListener("paste", pasteHandler);
function pasteHandler(e){
	if(e.clipboardData) {
		var items = e.clipboardData.items;
		if (items){
			for (var i = 0; i < items.length; i++) {
				if (items[i].type.indexOf("image") !== -1) {
					var blob = items[i].getAsFile();
					var URLObj = window.URL || window.webkitURL;
					var source = URLObj.createObjectURL(blob);
					paste_createImage(source);
					}
				}
			}
		// If we can't handle clipboard data directly (Firefox),
		// we need to read what was pasted from the contenteditable element
		else{
			}
		}
	else{
		setTimeout(paste_check_Input, 1);
		}
	}
function paste_check_Input(){
	var child = pasteCatcher.childNodes[0];
	pasteCatcher.innerHTML = "";
	if (child){
		if (cild.tagName === "IMG"){
			paste_createImage(child.src);
			}
		}
	}
function paste_createImage(source){
	var pastedImage = new Image();
	pastedImage.onload = function() {
		LAYER.layer_add('Paste', source);
		}
	pastedImage.src = source;
	}

//=== /Clipboard ===============================================================
