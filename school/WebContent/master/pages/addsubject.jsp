<%@ taglib uri="/struts-tags" prefix="s" %>

 <section class="section-content section-drawing bg-gray-light border-bottom p-t-60 p-b-0">
        <div class="container regsittop">
            <div class="row">
            
            
            <div class="col-lg-12 col-sm-12 col-dm-12">
             <div class="col-lg-6 col-sm-12 col-xs-12 col-md-6 formregn">
             
               <h4 class="stephedpa text-black">Add Subjects</h4>
                     <s:form action="addsubjectMaster" id="reg_form" name="registerfrm" theme="simple">
                     
                     <div class="row" style="margin-top: 3%">
                     
                       <div class="col-lg-6 col-md-6 col-sm-6">
                               <div class="form-group">
                                    <s:textfield id="subjectname" name="subjectname"  placeholder="Enter subject" cssClass="form-control" />
                                </div>
                              </div>
                              
                     </div>
                     
                     <div class="row" style="margin-top: 3%">
                     
                       <div class="col-lg-6 col-md-6 col-sm-6">
                               <div class="form-group">
                                    <s:textfield id="displayname" name="displayname"  placeholder="Enter displayname" cssClass="form-control" />
                                </div>
                              </div>
                              
                     </div>
                     
                     <div class="row" style="margin-top: 3%">
                            <div class="col-lg-6 col-md-6 col-sm-6">
                               <div class="text-left">
                               <button type="submit" class="btn btn-primary">Submit</button>
                               </div>
                             </div>
                         </div>
                     
                     </s:form>
            
             </div>
           </div>  
            
            </div>
        </div>
 </section>           