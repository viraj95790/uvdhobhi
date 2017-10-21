
<%@ taglib uri="/struts-tags" prefix="s"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    <link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.min.css" />
    <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

<script type="text/javascript" src="master/js/master.js"></script>



<script>

$(document).ready(function() {

	$("#admissiondate").datepicker({

		dateFormat : 'dd/mm/yy',
		yearRange: yearrange,
		minDate : '30/12/1880',
		changeMonth : true,
		changeYear : true

	});
	
	$("#dob").datepicker({

		dateFormat : 'dd/mm/yy',
		yearRange: yearrange,
		minDate : '30/12/1880',
		changeMonth : true,
		changeYear : true

	});

	}); 
 
</script> 

<section
	class="section-content section-drawing bg-gray-light border-bottom p-t-60 p-b-0">
	<div class="container regsittop">
	
	<div class="row">


				<div class="col-lg-12 col-sm-12 col-dm-12">
					<div class="col-lg-12 col-sm-12 col-xs-12 col-md-6 formregn">

						<h4 class="stephedpa text-black">Add Student Information</h4>



						<div class="row" style="margin-top: 3%">
							<s:form action="inputstudentinfoMaster" id="dis_student"
								theme="simple">
								<div class="col-lg-3 col-md-6 col-sm-6">
									<div class="form-group">
										<s:select list="classNameList" id="id" name="name"
											listKey="id" listValue="name" headerKey="0"
											headerValue="Select Class" 
											cssClass="form-control"></s:select>
									</div>
								</div>

								<div class="col-lg-4 col-md-12 col-xs-12">
									<div class="form-group">
										<s:textfield cssClass="form-control" name="searchText"
											id="searchText" placeholder="Search by name and roll number" />
									</div>
								</div>


								<div class="col-lg-1 col-md-12 col-xs-12">
									<div class="form-group">
										<input onclick="showSearch()" type="button" value=" GO ">
									</div>
								</div>

							</s:form>

						</div>
						
	
	
		<s:form action="addstudentMaster" id="reg_form" name="registerfrm"
			theme="simple">
			<s:hidden id="actiontype" name="actiontype"></s:hidden>
			<s:hidden id="classname" name="name"></s:hidden>
			

						<div class="row" style="margin-top: 3%">

							<div class="col-lg-2 col-md-6 col-sm-6">
								<div class="form-group">
									<s:textfield id="rollno" name="rollno" placeholder="rollno"
										cssClass="form-control" theme="simple"></s:textfield>
								</div>
							</div>

							<div class="col-lg-2 col-md-6 col-sm-6">
								<div class="form-group">
									<s:textfield id="admissiondate" name="admissiondate"
										placeholder="Admission Date" cssClass="form-control"
										theme="simple"></s:textfield>
								</div>
							</div>

							<div class="col-lg-2 col-md-6 col-sm-6">
								<div class="form-group">
									<s:textfield id="grnum" name="grnum" placeholder="GR Number"
										cssClass="form-control" theme="simple"></s:textfield>
								</div>
							</div>

							<div class="col-lg-2 col-md-6 col-sm-6">
								<div class="form-group">
									<s:textfield id="mothername" name="mothername"
										placeholder="MotherName" cssClass="form-control"
										theme="simple"></s:textfield>
								</div>
							</div>
							
								<div class="col-lg-2 col-md-6 col-sm-6">
								<div class="form-group">
									<s:textfield id="firstname" name="firstname"
										placeholder="FirstName" cssClass="form-control" theme="simple"></s:textfield>
								</div>
							</div>

							<div class="col-lg-2 col-md-6 col-sm-6">
								<div class="form-group">
									<s:textfield id="fathername" name="fathername"
										placeholder="Fathername" cssClass="form-control"
										theme="simple"></s:textfield>
								</div>
							</div>

						</div>

						<div class="row" style="margin-top: 3%">

						

							<div class="col-lg-2 col-md-6 col-sm-6">
								<div class="form-group">
									<s:textfield id="Lastname" name="lastname"
										placeholder="Lastname" cssClass="form-control" theme="simple"></s:textfield>
								</div>
							</div>
							
							<div class="col-lg-2 col-md-6 col-sm-6">
								<div class="form-group">
									<s:textfield id="dob" name="dob" placeholder="birthdate"
										cssClass="form-control" theme="simple"></s:textfield>
								</div>
							</div>

							<div class="col-lg-2 col-md-6 col-sm-6">
								<div class="form-group">
									<s:textfield id="address" name="address"
										placeholder="Enter address" cssClass="form-control"
										theme="simple"></s:textfield>
								</div>
							</div>

							<div class="col-lg-2 col-md-6 col-sm-6">
								<div class="form-group">
									<s:textfield id="mob" name="mob" placeholder="Enter MobileNo."
										cssClass="form-control" theme="simple"></s:textfield>
								</div>
							</div>
							
							<div class="col-lg-2 col-md-6 col-sm-6">
								<div class="form-group">
									<s:textfield id="aadhar" name="aadhar" placeholder="Aadhar No"
										cssClass="form-control" theme="simple"></s:textfield>
								</div>
							</div>

							<div class="col-lg-2 col-md-6 col-sm-6">
								<div class="form-group">
									<label>Onlychild :</label>
									<s:select list="#{'Yes':'Yes', 'No':'No'}" theme="simple"
										id="onlychild" name="onlychild"></s:select>
								</div>
							</div>
							

						</div>


						<div class="row" style="margin-top: 3%">

							

							<div class="col-lg-2 col-md-6 col-sm-6">
								<div class="form-group">
									<label>Handicap :</label>
									<s:select list="#{'No':'No', 'Yes':'Yes'}" theme="simple"
										id="handicap" name="handicap"></s:select>
								</div>
							</div>
							
							<div class="col-lg-2 col-md-6 col-sm-6">
								<div class="form-group">
									<s:textfield id="cast" name="cast" placeholder="Enter Cast"
										cssClass="form-control" theme="simple"></s:textfield>
								</div>
							</div>

							<div class="col-lg-2 col-md-6 col-sm-6">
								<div class="form-group">
									<s:textfield id="category" name="category"
										placeholder="Enter Category" cssClass="form-control"
										theme="simple"></s:textfield>
								</div>
							</div>

							<div class="col-lg-2 col-md-6 col-sm-6">
								<div class="form-group">
									<s:textfield id="phone" name="phone"
										placeholder="Enter Landline No" cssClass="form-control"
										theme="simple"></s:textfield>
								</div>
							</div>
							
							
							<div class="col-lg-2 col-md-6 col-sm-6">
								<div class="form-group">
									<s:textfield id="oldschool" name="oldschool"
										placeholder="Previous school Name" cssClass="form-control"
										theme="simple"></s:textfield>
								</div>
							</div>

							<div class="col-lg-2 col-md-6 col-sm-6">
								<div class="form-group">
									<s:textfield id="uidseno" name="uidseno" placeholder="UDISE No"
										cssClass="form-control" theme="simple"></s:textfield>
								</div>
							</div>

							
							

						</div>


						<div class="row" style="margin-top: 3%">
							<div class="col-lg-2 col-md-6 col-sm-6">
								<div class="form-group">
									<s:textfield id="housedress" name="housedress"
										placeholder="Enter HouseDress" cssClass="form-control"
										theme="simple"></s:textfield>
								</div>
							</div>
							
							<div class="col-lg-6 col-md-6 col-sm-6">
								<div class="text-left">
									<input type="button" value="Submit" onclick="getstudentinfo()"
										class="btn btn-primary" />
								</div>
							</div>
						</div>

					</s:form>

					</div>
				</div>

			</div>


			<div class="row" style="margin-top: 3%">





				<div class="col-lg-12 col-md-12 col-sm-12 paddingnil">
					<div class="tile-body">
						<div class="table-condensed">

							<table class="table table-custom" id="editable-usage">

								<tr>

									<th
										style="background: transparent url('common/images/table_header.gif') no-repeat scroll 0 0;">Roll
										no</th>

									<th
										style="background: transparent url('common/images/table_header.gif') no-repeat scroll 0 0;">Name</th>


									<th
										style="background: transparent url('common/images/table_header.gif') no-repeat scroll 0 0;">DOB</th>

									<th
										style="background: transparent url('common/images/table_header.gif') no-repeat scroll 0 0;">Mobile</th>

									<th
										style="background: transparent url('common/images/table_header.gif') no-repeat scroll 0 0;">Category</th>

									<th
										style="background: transparent url('common/images/table_header.gif') no-repeat scroll 0 0;">Edit</th>

									<th
										style="background: transparent url('common/images/table_header.gif') no-repeat scroll 0 0;">Delete</th>

								</tr>


								<s:iterator value="studentinfoList" status="status">


									<tr>

										<td><s:property value="rollno" /></td>
										<td><s:property value="name" /></td>
										<td><s:property value="dob" /></td>
										<td><s:property value="mob" /></td>
										<td><s:property value="category" /></td>

										<s:url action="editstudentMaster" id="edit">
											<s:param name="selectedid" value="%{id}"></s:param>
										</s:url>
										<td><s:a href="%{edit}" cssClass="btn btn-info btn-xs">Edit</s:a></td>

										<s:url action="deletestudentMaster" id="delete">
											<s:param name="selectedid" value="%{id}"></s:param>
										</s:url>
										<td><s:a href="%{delete}"
												cssClass="btn btn-danger btn-xs">Delete</s:a></td>

									</tr>


								</s:iterator>


							</table>
						</div>
					</div>
				</div>



			</div>


		
	</div>
</section>
