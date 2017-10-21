<%@ taglib uri="/struts-tags" prefix="s" %>

<script type="text/javascript" src="master/js/master.js"></script>

<script src="popupdialog/dialog/js/jquery-1.10.2.js"
	type="text/javascript"></script>


  <%-- <script>

$(document).ready(function() {

	$("#admissiondate").datepicker({

		 format : 'dd/mm/yyyy',
		//yearRange: yearrange,
		minDate : '30/12/1880',
		changeMonth : true,
		changeYear : true

	});

	}); 
 
</script> --%>  

 <section class="section-content section-drawing bg-gray-light border-bottom p-t-60 p-b-0">
        <div class="container regsittop">
            <div class="row">
            
            
            <div class="col-lg-12 col-sm-12 col-dm-12">
             <div class="col-lg-12 col-sm-12 col-xs-12 col-md-6 formregn">
             
               <h4 class="stephedpa text-black">Edit Student Information</h4>
                     <s:form action="updatestudentMaster" id="reg_form" name="registerfrm" theme="simple">
                      <s:hidden id="id" name="id"></s:hidden>
                     
                     <div class="row" style="margin-top: 3%">
                     
                       <div class="col-lg-2 col-md-6 col-sm-6">
                               <div class="form-group">
                                   <s:select list="classNameList" id="id" name="name" listKey="id" listValue="name" headerKey="0" headerValue="Select Class" cssClass="form-control" theme="simple"></s:select>
                                </div>
                              </div>
                              
                               <div class="col-lg-1 col-md-6 col-sm-6">
                               <div class="form-group">
                                    <s:textfield id="rollno" name="rollno" placeholder="rollno" cssClass="form-control" theme="simple"></s:textfield>
                                </div>
                           </div>
                              
                     </div>
                     
                     <div class="row" style="margin-top: 3%">
                           
                           <div class="col-lg-2 col-md-6 col-sm-6">
                               <div class="form-group">
                                    <s:textfield id="admissiondate" name="admissiondate" placeholder="Admission Date" cssClass="form-control" theme="simple"></s:textfield>
                                </div>
                           </div>
                           
                           <div class="col-lg-2 col-md-6 col-sm-6">
                               <div class="form-group">
                                    <s:textfield id="grnum" name="grnum" placeholder="GR Number" cssClass="form-control" theme="simple"></s:textfield>
                                </div>
                           </div>
                           
                           <div class="col-lg-2 col-md-6 col-sm-6">
                               <div class="form-group">
                                    <s:textfield id="mothername" name="mothername" placeholder="MotherName" cssClass="form-control" theme="simple"></s:textfield>
                                </div>
                           </div>
                              
                     </div>
                     
                      <div class="row" style="margin-top: 3%">
                           
                           <div class="col-lg-2 col-md-6 col-sm-6">
                               <div class="form-group">
                                    <s:textfield id="firstname" name="firstname" placeholder="FirstName" cssClass="form-control" theme="simple"></s:textfield>
                                </div>
                           </div>
                           
                           <div class="col-lg-2 col-md-6 col-sm-6">
                               <div class="form-group">
                                    <s:textfield id="fathername" name="fathername" placeholder="Fathername" cssClass="form-control" theme="simple"></s:textfield>
                                </div>
                           </div>
                           
                           <div class="col-lg-2 col-md-6 col-sm-6">
                               <div class="form-group">
                                    <s:textfield id="Lastname" name="lastname" placeholder="Lastname" cssClass="form-control" theme="simple"></s:textfield>
                                </div>
                           </div>
                              
                     </div>
                     
                     <div class="row" style="margin-top: 3%">
                     
                         <div class="col-lg-2 col-md-6 col-sm-6">
                               <div class="form-group">
                                    <s:textfield id="dob" name="dob" placeholder="birthdate" cssClass="form-control" theme="simple"></s:textfield>
                                </div>
                           </div>
                           
                           <div class="col-lg-2 col-md-6 col-sm-6">
                               <div class="form-group">
                                    <s:textfield id="address" name="address" placeholder="Enter address" cssClass="form-control" theme="simple"></s:textfield>
                                </div>
                           </div>
                           
                           <div class="col-lg-2 col-md-6 col-sm-6">
                               <div class="form-group">
                                    <s:textfield id="mob" name="mob" placeholder="Enter MobileNo." cssClass="form-control" theme="simple"></s:textfield>
                                </div>
                           </div>
                           
                         </div>  
                         
                         <div class="row" style="margin-top: 3%">
                     
                         <div class="col-lg-2 col-md-6 col-sm-6">
                               <div class="form-group">
                                    <s:textfield id="aadhar" name="aadhar" placeholder="Aadhar No" cssClass="form-control" theme="simple"></s:textfield>
                                </div>
                           </div>
                           
                           <div class="col-lg-2 col-md-6 col-sm-6">
                               <div class="form-group">
                                 <label>Only Chlid :</label>
                                    <s:select list="#{'Yes':'Yes', 'No':'No'}" theme="simple" id="onlychild" name="onlychild" ></s:select>
                                </div>
                           </div>
                           
                           <div class="col-lg-2 col-md-6 col-sm-6">
                               <div class="form-group">
                                    <label>Handicap :</label>
                                    <s:select list="#{'No':'No', 'Yes':'Yes'}" theme="simple" id="handicap" name="handicap" ></s:select>
                                </div>
                           </div>
                           
                         </div>  
                         
                         <div class="row" style="margin-top: 3%">
                           
                           <div class="col-lg-2 col-md-6 col-sm-6">
                               <div class="form-group">
                                    <s:textfield id="cast" name="cast" placeholder="Enter Cast" cssClass="form-control" theme="simple"></s:textfield>
                                </div>
                           </div>
                           
                           <div class="col-lg-2 col-md-6 col-sm-6">
                               <div class="form-group">
                                    <s:textfield id="category" name="category" placeholder="Enter Category" cssClass="form-control" theme="simple"></s:textfield>
                                </div>
                           </div>
                           
                           <div class="col-lg-2 col-md-6 col-sm-6">
                               <div class="form-group">
                                    <s:textfield id="phone" name="phone" placeholder="Enter Landline No" cssClass="form-control" theme="simple"></s:textfield>
                                </div>
                           </div>
                           
                         </div>  
                         
                         <div class="row" style="margin-top: 3%">
                           
                           <div class="col-lg-2 col-md-6 col-sm-6">
                               <div class="form-group">
                                    <s:textfield id="oldschool" name="oldschool" placeholder="Previous school Name" cssClass="form-control" theme="simple"></s:textfield>
                                </div>
                           </div>
                           
                           <div class="col-lg-2 col-md-6 col-sm-6">
                               <div class="form-group">
                                    <s:textfield id="uidseno" name="uidseno" placeholder="UDISE No" cssClass="form-control" theme="simple"></s:textfield>
                                </div>
                           </div>
                           
                           <div class="col-lg-2 col-md-6 col-sm-6">
                               <div class="form-group">
                                    <s:textfield id="housedress" name="housedress" placeholder="Enter HouseDress" cssClass="form-control" theme="simple"></s:textfield>
                                </div>
                           </div>
                           
                         </div> 
                     
                     <div class="row" style="margin-top: 3%">
                            <div class="col-lg-6 col-md-6 col-sm-6">
                               <div class="text-left">
                               <input type="submit" value="Update"  class="btn btn-primary"/>
                               </div>
                             </div>
                         </div>
                     
                     </s:form>
             </div>
           </div>  
            
            </div>
 </div>
 </section> 