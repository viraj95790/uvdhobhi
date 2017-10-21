<%@ taglib uri="/struts-tags"  prefix="s"%>
<script type="text/javascript" src="user/js/pacsdetails.js"></script>

<style>
.afterupload{
    width: 146%;
}

</style>


 <section id="content">
 <span class="actionmsg"><s:actionmessage id="server_side_error"/></span>
            <div class="page page-sidebar-xs-layout">

                <div class="pageheader padright">
                  
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 topheadbaxck">
                        <s:form action="Dicom" id="folderfrm" theme="simple">
                            <div class="col-md-3">
								<s:select onchange="showFolderImage()" id="foldername" name="foldername" list="patientImageList"
								listKey="id" listValue="foldername" headerKey="0" headerValue="Select Folder"
								cssClass="form-control"/>
							</div>
							<div class="col-md-3">	
									<s:select onchange="showPatientName(this.value)" id="hospName" name="hospName" list="hospNameList"
								listKey="hospName" listValue="hospName" headerKey="0" headerValue="Select Hospital"
								cssClass="form-control"/>
							</div>
							<div class="col-md-3" id="patientnamedivid">	
									<select name="clientName" id="clientName" class="form_control">
										<option value="0">Select Patient</option>
									</select>
							</div>
							<div class="col-md-3" id="invsttnamedivid">	
									<select name="invstName" id="invstName" class="form_control">
										<option value="0">Select InvstigationID</option>
									</select>
                            </div>
                          </s:form>
                            <div class="col-md-6 text-right">
                            </div>
                        </div> 
                        <div class=" col-lg-12 col-md-12 col-sm-12 paddingnil">
                            
                            <div class="">
                                <div class="gallery">
                                   
                                    <div class="col-lg-1 col-md-1 col-sm-1 paddingnil">
                                        
                                        <div class="some-content-related-div">

                                            <div id="inner-content-div">

                                                <div>
                                                    <div class="previews">
                                                    
                                                     <s:iterator value="dicomList">
                                                        <div class="col-sm-12 marbotspace10">
                                                            <div class="col-sm-12 border-box-black" id="leftviewdiv">
                                                                <a class="fancybox-thumbs selected" data-fancybox-group="thumb" data-full="dicom/dimage<s:property value="id"/>.png"><img src="dicom/dimage<s:property value="id"/>.png" class="img-responsive img-radio" style="cursor:pointer"></a>
                                                                <div class=""><input type="checkbox"  onclick="showMultiPicView()" value="<s:property value="id"/>"  class="pack_item pull-right checback" /></div>
                                                            </div>
                                                        </div>
                                                        </s:iterator>
                                                      

                                                    </div>
                                                </div>
                                            </div>
                                        </div>


                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-11 col-sm-11 col-md-11 filtr-container">
                                <div class="full">
                                    <!-- first image is viewable to start -->
                                    
                                    
                                    <div id="multipicdivid1" class="col-xs-12 col-sm-12 col-md-12 edit_hover_class filtr-item" data-category="1" data-sort="one">
                                       <div class="col-lg-12 col-md-12" id="">
                                       <a href="#" data-toggle="modal" data-target="#edit"><i class="fa fa-edit iconedit" aria-hidden="true"></i></a></div>
                                            
                                           
                                    </div>
                                   
                                    <div class="col-xs-12 col-sm-12 col-md-12 filtr-item" id="multipicdivid2"  data-category="2" data-sort="two" >
                                        <div class="col-xs-6 col-sm-6 col-md-6 paddingnil" >
                                        <a href="#" data-toggle="modal" data-target="#edit"><i class="fa fa-edit iconedit" aria-hidden="true"></i></a></div>
                                    </div>
                      
                                       <div class="col-xs-12 col-sm-12 col-md-12 filtr-item" data-category="3" data-sort="four">
                                       <div class="col-lg-12 col-sm-12 col-md-12 paddingnil" id="multipicdivid4">
                                        <div class="col-lg-6 col-sm-6 col-md-6 paddingnil" >
                                        <a href="#" data-toggle="modal" data-target="#edit"><i class="fa fa-edit iconedit" aria-hidden="true"></i></a></div>
                                       </div>
                                    </div>
                                       
                                    
                                   
                                   
                                </div>

                            </div>
                            
                            <div class="col-lg-2 col-sm-3 col-ms-2 hidden">
                                <table class="table my-table xlstable table-bordered" style="width: 100%;">
                                    <thead>
                                        <tr>
                                            <th>DICOM Tags</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Pateint ID</td>
                                            <td>1023021522</td>
                                        </tr>
                                        <tr>
                                            <td>Study Date</td>
                                            <td>21 July 2016</td>
                                        </tr>
                                        <tr>
                                            <td>Study Time</td>
                                            <td>15:11 PM</td>
                                        </tr>
                                        <tr>
                                            <td>Image Format</td>
                                            <td>.Jpg</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <br />
                                <a href="#" data-toggle="modal" data-target="#upload" type="button" class="btn btn-primary">Upload</a>
                            </div>
                        </div>
                    </div>

                    

                </div>

               
            </div>
            
        </section>
        
        
            <!--Setting Modal-->
     <s:form action="settingDicom" theme="simple">
    <div class="modal fade" id="setting" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Upload</h4>
                </div>
                <div class="modal-body">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-3 control-label">Destination :</label>
                                    <div class="col-sm-9">
                                        <div class="input-group">
                                            <s:textfield id="destination" name="destination" cssClass="form-control"/>
                                            <label class="input-group-btn">
                                                <span class="btn btn-primary">
                                                    Browse&hellip; <input type="file" style="display: none;" multiple>
                                                </span>
                                            </label>

                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-3 control-label">Source :</label>
                                    <div class="col-sm-9">
                                        <div class="input-group">
                                           <s:textfield id="source" name="source" cssClass="form-control"/>
                                            <label class="input-group-btn">
                                                <span class="btn btn-primary">
                                                    Browse&hellip; <input type="file" style="display: none;" multiple>
                                                </span>
                                            </label>

                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputPassword3" class="col-sm-3 control-label">Filename Prefix :</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control inputtextboheight2" id="filename">
                                        <label class="checkbox-inline">
                                        	<s:checkbox name="patient_name" id="inlineCheckbox1" onclick="getid(this)"></s:checkbox>Pateint Name
                                        </label>
                                        <label class="checkbox-inline">
                                        	<s:checkbox name="date" id="inlineCheckbox2" onclick="getid(this)"></s:checkbox>Date
                                        </label>
                                        <label class="checkbox-inline">
                                           <s:checkbox name="time" id="inlineCheckbox3" onclick="getid(this)"></s:checkbox>Time
                                        </label>
                                        <label class="checkbox-inline">
                                           <s:checkbox name="imgformatprefix" id="inlineCheckbox4" onclick="getid(this)"></s:checkbox>Img_Format 
                                        </label>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <label for="inputPassword3" class="col-sm-3 control-label">Image Format :</label>
                                    <div class="col-sm-5">
                                    
                                   		 <s:select cssClass="form-control inputtextboheight2"   list="#{'jpg':'JPG Files','png':'PNG Files','tif':'TIF Files'}"  name="imgformat" id="imgformat" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">Image Resize</div>
                        <div class="panel-body">
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <div class="col-sm-5">
                                        <div class="radio">
                                            <label>
                                                <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>
                                                Original ( 1024 X 786 ) px
                                            </label>
                                        </div>
                                        <div class="radio">
                                            <label>
                                                <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
                                                <div style="display: inline-flex;">Other <s:textfield name="width" id="width" cssClass="form-control inputtextboheight" placeholder="1024"/> &nbsp;&nbsp;X 
                                                <s:textfield name="height"  id="height" cssClass="form-control inputtextboheight" placeholder="786" cssStyle="margin-left: 6px !important;"/> &nbsp;px</div>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <input type="submit" class="btn btn-primary">Update</button>
                </div>
            </div>
        </div>
    </div>
    
    </s:form>
   
   
   
     <!-- Modal -->
    <s:form action="editorDicom" id="editorfrm">
    <s:hidden name="clientImageData" id="clientImageData"/>
    <s:hidden name="selectedimageid" id="selectedimageid"/>
    <div class="modal fade" id="dicomeditormodel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
       <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Image Editor</h4>
                </div>
               <div class="modal-body" style="height: 600px; overflow-y: scroll;">
				<button type="button" class="btn btn-primary"
						onclick="setSelectedImageToEditor();">Update Image</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
					<%@ include file="/minipaint/editor.jsp"%>
				</div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button onclick="updateImageData()" type="button" class="btn btn-primary">Submit</button>
                </div>
            </div>
        </div>
    </div>
</s:form>

<s:form action="saveDicom" id="savefrmid">
	<s:hidden name="selectedimgids" id="selectedimgids"/>
	<s:hidden name="selectedhospname" id="selectedhospname"/>
	<s:hidden name="selectedpatientname" id="selectedpatientname"/>
	<s:hidden name="selectedinvst" id="selectedinvst"/>
	
</s:form>

<s:form action="reportDicom" id="reportfrm" target="formtarget">
	<s:hidden name="selectedimgids" id="crselectedimgids"/>
	<s:hidden name="selectedhospname" id="crselectedhospname"/>
	<s:hidden name="selectedpatientname" id="crselectedpatientname"/>
	<s:hidden name="selectedinvst" id="crselectedinvst"/>
	<s:hidden name="patientName" id="selectedpname"/>
	
</s:form>
 
 
     <script>
        $(function () {
            $('#inner-content-div').slimScroll({
                height: '655px'
            });
        });
        $(document).ready(function () {
            document.getElementById("inlineCheckbox1").checked = true;
            document.getElementById("inlineCheckbox2").checked = true;
            document.getElementById("filename").value= "Manojmishra_21July2016";


        });
        function getid(obj)
        {
            
            var a = "";
            var b = "";
            var c = "";
            var d = "";
       
            var date = document.getElementById("inlineCheckbox2");
            var time = document.getElementById("inlineCheckbox3");
            var format = document.getElementById("inlineCheckbox4");

            if (obj.checked == true)
            {
                //document.getElementById("filename").value = "1023021522";
                a = "Manojmishra";
                document.getElementById("inlineCheckbox1").checked = true;
            }
            else {
                // document.getElementById("filename").value = "";
                a = "";
                document.getElementById("inlineCheckbox1").checked = false;
            }


            if (date.checked == true) {
                
                b = "_21July2016";
                document.getElementById("inlineCheckbox2").checked = true;
            }
            else {
                b = "";
                document.getElementById("inlineCheckbox2").checked = false;
            }


            if (time.checked == true) {
                c = "_15:11_PM";
                document.getElementById("inlineCheckbox3").checked = true;
            }
            else {
                c = "";
                document.getElementById("inlineCheckbox3").checked = false;
            }


            if (format.checked == true) {
                d = "_jpg";
                document.getElementById("inlineCheckbox4").checked = true;
            }
            else {
                d = "";
                document.getElementById("inlineCheckbox4").checked = false;
            }


            document.getElementById("filename").value = a+b+c+d;

        }
        function getdate(obj) {
           
            var a = "";
            var b = "";
            var c = "";
            var d = "";

            var Id = document.getElementById("inlineCheckbox1");
            var time = document.getElementById("inlineCheckbox3");
            var format = document.getElementById("inlineCheckbox4");

            if (Id.checked == true) {
                //document.getElementById("filename").value = "1023021522";
                a = "Manojmishra";
                document.getElementById("inlineCheckbox1").checked = true;
            }
            else {
                // document.getElementById("filename").value = "";
                a = "";
                document.getElementById("inlineCheckbox1").checked = false;
            }


            if (obj.checked == true) {

                b = "_21July2016";
                document.getElementById("inlineCheckbox2").checked = true;
            }
            else {
                b = "";
                document.getElementById("inlineCheckbox2").checked = false;
            }


            if (time.checked == true) {
                c = "_15:11_PM";
                document.getElementById("inlineCheckbox3").checked = true;
            }
            else {
                c = "";
                document.getElementById("inlineCheckbox3").checked = false;
            }


            if (format.checked == true) {
                d = "_jpg";
                document.getElementById("inlineCheckbox4").checked = true;
            }
            else {
                d = "";
                document.getElementById("inlineCheckbox4").checked = false;
            }


            document.getElementById("filename").value = a + b + c + d;
        }



        function gettime(obj) {
            var a = "";
            var b = "";
            var c = "";
            var d = "";

            var date = document.getElementById("inlineCheckbox2");
            var Id = document.getElementById("inlineCheckbox1");
            var format = document.getElementById("inlineCheckbox4");

            if (Id.checked == true) {
                //document.getElementById("filename").value = "1023021522";
                a = "Manojmishra";
                document.getElementById("inlineCheckbox1").checked = true;
            }
            else {
                // document.getElementById("filename").value = "";
                a = "";
                document.getElementById("inlineCheckbox1").checked = false;
            }


            if (date.checked == true) {

                b = "_21July2016";
                document.getElementById("inlineCheckbox2").checked = true;
            }
            else {
                b = "";
                document.getElementById("inlineCheckbox2").checked = false;
            }


            if (obj.checked == true) {
                c = "_15:11_PM";
                document.getElementById("inlineCheckbox3").checked = true;
            }
            else {
                c = "";
                document.getElementById("inlineCheckbox3").checked = false;
            }


            if (format.checked == true) {
                d = "_jpg";
                document.getElementById("inlineCheckbox4").checked = true;
            }
            else {
                d = "";
                document.getElementById("inlineCheckbox4").checked = false;
            }


            document.getElementById("filename").value = a + b + c + d;
        }



        function getformat(obj) {
            var a = "";
            var b = "";
            var c = "";
            var d = "";

            var date = document.getElementById("inlineCheckbox2");
            var time = document.getElementById("inlineCheckbox3");
            var Id = document.getElementById("inlineCheckbox1");

            if (Id.checked == true) {
                //document.getElementById("filename").value = "1023021522";
                a = "Manojmishra";
                document.getElementById("inlineCheckbox1").checked = true;
            }
            else {
                // document.getElementById("filename").value = "";
                a = "";
                document.getElementById("inlineCheckbox1").checked = false;
            }


            if (date.checked == true) {

                b = "_21July2016";
                document.getElementById("inlineCheckbox2").checked = true;
            }
            else {
                b = "";
                document.getElementById("inlineCheckbox2").checked = false;
            }


            if (time.checked == true) {
                c = "_15:11_PM";
                document.getElementById("inlineCheckbox3").checked = true;
            }
            else {
                c = "";
                document.getElementById("inlineCheckbox3").checked = false;
            }


            if (obj.checked == true) {
                d = "_jpg";
                document.getElementById("inlineCheckbox4").checked = true;
            }
            else {
                d = "";
                document.getElementById("inlineCheckbox4").checked = false;
            }


            document.getElementById("filename").value = a + b + c + d;
        }
    </script>
    
    
      <script>
        $(document).ready(function () {
            $('a').click(function () {
                var largeImage = $(this).attr('data-full');
                $('.selected').removeClass();
                $(this).addClass('selected');
                $('.full img').hide();
                $('.full img').attr('src', largeImage);
                $('.full img').fadeIn();


            }); // closing the listening on a click
            $('.full img').on('click', function () {
                var modalImage = $(this).attr('src');
                $.fancybox.open(modalImage);
            });
        }); //closing our doc ready
    </script>

    <script>
        $(function () {
            $('input.pack_item').click(function (e) {
                if (this.checked) {
                    $(this).parent().parent().addClass("border-box-blue");
                    $(this).parent().parent().removeClass("border-box-black");
                    $(this).siblings('.img-radio').css('opacity', '1.0');
                } else {
                    $(this).parent().parent().addClass("border-box-black");
                    $(this).parent().parent().removeClass("border-box-blue");
                    $(this).siblings('.img-radio').css('opacity', '0.5');
                }
            });
        });
    </script>   
