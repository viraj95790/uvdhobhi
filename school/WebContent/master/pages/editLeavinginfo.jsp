<%@page import="com.Lang.Master.eu.entity.Certificate"%>
<%@ taglib uri="/struts-tags" prefix="s"%>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<link rel="stylesheet"
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.min.css" />
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

<script type="text/javascript" src="master/js/master.js"></script>

<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>

<%-- <%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%> --%>


<script>
	$(document).ready(function() {

		$("#admissiondate").datepicker({

			dateFormat : 'dd/mm/yy',
			yearRange : yearrange,
			minDate : '30/12/1880',
			changeMonth : true,
			changeYear : true

		});

		$("#leavingdate").datepicker({

			dateFormat : 'dd/mm/yy',
			yearRange : yearrange,
			minDate : '30/12/1880',
			changeMonth : true,
			changeYear : true

		});

		$("#dob").datepicker({

			dateFormat : 'dd/mm/yy',
			yearRange : yearrange,
			minDate : '30/12/1880',
			changeMonth : true,
			changeYear : true

		});

	});
</script>

<!-- page content -->
<div class="right_col" role="main">
	<div class="">
		<div class="page-title">
			<div class="title_left">
				<h3>Add Student Details</h3>
			</div>

			<%-- <div class="title_right">
				<div
					class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
					<div class="input-group">
						<input type="text" class="form-control"
							placeholder="Search for..."> <span
							class="input-group-btn">
							<button class="btn btn-default" type="button">Go!</button>
						</span>
					</div>
				</div>
			</div> --%>
		</div>
		<div class="clearfix"></div>

		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="x_panel">
					<div class="x_title">

						<div class="clearfix"></div>
					</div>
					<div class="x_content">

						<s:form action="updateCertificate" theme="simple">
						  <s:hidden id="id" name="id"></s:hidden>
							<div class="nondani-content">
							
							<%Certificate certificate =(Certificate)session.getAttribute("editcertificate"); %>

								<div class="row" style="margin-left: 25%;">
									<div class="col-md-1">
										<label style="font-size: large;">&#2360;&#2344; : </label>
									</div>
									<div class="col-md-2">
										<input type="text" class="form-contorl" name="academicyr"
											id="academicyr"  value="<%=certificate.getAcademicyr() %>">
									</div>
								</div>

								<div class="row" style="margin-top: 1%;">
									<div class="col-md-3">
										<label>&#2332;&#2344;&#2352;&#2354;
											&#2352;&#2332;&#2367;&#2360;&#2381;&#2335;&#2352;
											&#2325;&#2381;&#2352;&#2350;&#2366;&#2306;&#2325;</label>
										<input type="text" class="form-control" id="register_number"
											name="register_number" value="<%=certificate.getRegister_number() %>"/>
									</div>
									<div class="col-md-3">
										<label>&#2360;&#2381;&#2335;&#2369;&#2337;&#2306;&#2335;
											. &#2310;&#2351; . &#2337;&#2368;</label>
										<input class="form-control" id="studentid"
											name="studentid" value="<%=certificate.getStudentid() %>"/>
									</div>
									<div class="col-md-3">
										<label>&#2351;&#2369; . &#2310;&#2351; .
											&#2337;&#2368;</label>
										<input class="form-control" id="uid" name="uid" value="<%=certificate.getUid() %>" />
									</div>
									<div class="col-md-3">
										<label>&#2357;&#2367;&#2342;&#2381;&#2351;&#2366;&#2352;&#2381;&#2341;&#2381;&#2351;&#2366;&#2306;&#2330;&#2375;
											&#2344;&#2366;&#2357; </label>
										<input class="form-control" id="studentname"
											name="studentname" value="<%=certificate.getStudentname() %>"/>
									</div>
								</div>
								<div class="row contentspace">

									<div class="col-md-3">
										<label>&#2310;&#2337;&#2344;&#2366;&#2357; </label>
										<input class="form-control" id="lastname"
											name="lastname" value="<%=certificate.getLastname() %>" />
									</div>
									<div class="col-md-3">
										<label>&#2357;&#2337;&#2367;&#2354;&#2366;&#2306;&#2330;&#2375;
											&#2344;&#2366;&#2357; </label>
										<input class="form-control" id="fathername"
											name="fathername" value="<%=certificate.getFathername() %>" />
									</div>
									<div class="col-md-3">
										<label>&#2310;&#2312;&#2330;&#2375;
											&#2344;&#2366;&#2357; </label>
										<input class="form-control" id="mothername"
											name="mothername" value="<%=certificate.getMothername() %>" />
									</div>
									<div class="col-md-3">
										<label>&#2352;&#2366;&#2359;&#2381;&#2335;&#2381;&#2352;&#2368;&#2351;&#2340;&#2381;&#2357;
										</label>
										<input class="form-control" id="nationality"
											name="nationality" value="<%=certificate.getNationality() %>"/>
									</div>
									<div class="col-md-3">

										<label>&#2350;&#2366;&#2340;&#2371;&#2349;&#2366;&#2359;&#2366;
										</label>
										<input class="form-control" id="mothertongue"
											name="mothertongue" value="<%=certificate.getMothertongue() %>"/>
									</div>
									<div class="col-md-3">
										<label>&#2343;&#2352;&#2381;&#2350; <sup>*</sup></label>
										<input class="form-control" id="religion"
											name="religion" value="<%=certificate.getReligion() %>" />
									</div>
									<div class="col-md-3">
										<label>&#2332;&#2366;&#2340; <sup>*</sup></label>
										<input class="form-control" id="cast" name="cast" value="<%=certificate.getCast() %>"/>
									</div>
									<div class="col-md-3">
										<label>&#2346;&#2379;&#2335;&#2332;&#2366;&#2340; <sup>*</sup></label>
										<input class="form-control" id="subcast"
											name="subcast" value="<%=certificate.getSubcast() %>"/>
									</div>
									<div class="col-md-3">
										<label>&#2332;&#2344;&#2381;&#2350;&#2360;&#2381;&#2341;&#2337;<sup>*</sup></label>
										<input class="form-control" id="birthplace"
											name="birthplace" value="<%=certificate.getBirthplace() %>" />
									</div>
									<div class="col-md-3">
										<label>&#2340;&#2366;&#2354;&#2369;&#2325;&#2366; <sup>*</sup></label>
										<input class="form-control" id="taluka" name="taluka" value="<%=certificate.getTaluka() %>"/>
									</div>
									<div class="col-md-3">
										<label>&#2332;&#2367;&#2354;&#2381;&#2361;&#2366; <sup>*</sup></label>
										<input class="form-control" id="district"
											name="district" value="<%=certificate.getDistrict() %>" />
									</div>
									<div class="col-md-3">
										<label>&#2352;&#2366;&#2332;&#2381;&#2351; <sup>*</sup>
										</label>
										<input class="form-control" id="nation" name="nation" value="<%=certificate.getNation() %>" />
									</div>
									<div class="col-md-3">
										<label>&#2342;&#2375;&#2358; <sup>*</sup></label>
										<input class="form-control" id="country"
											name="country" value="<%=certificate.getCountry() %>" />
									</div>
									<div class="col-md-3">
										<label>&#2332;&#2344;&#2381;&#2350;&#2342;&#2367;&#2344;&#2366;&#2306;&#2325;
											<span class="required">*</span>
										</label>
										<input class="form-control col-md-7 col-xs-12"
											id="dob" name="dob" value="<%=certificate.getDob() %>" />
									</div>
									<div class="col-md-3">
										<label>&#2332;&#2344;&#2381;&#2350;&#2342;&#2367;&#2344;&#2366;&#2306;&#2325;
											&#2309;&#2325;&#2381;&#2359;&#2352;&#2368; <sup>*</sup>
										</label>
										<input class="form-control col-md-7 col-xs-12"
											id="dob_letters" name="dob_letters"  value="<%=certificate.getDob_letters() %>"/>
									</div>

									<div class="col-md-3">
										<label for="name"> &#2351;&#2366;
											&#2346;&#2370;&#2352;&#2381;&#2357;&#2368;&#2330;&#2368;
											&#2358;&#2366;&#2337;&#2366; &#2357;
											&#2311;&#2351;&#2340;&#2381;&#2340;&#2366; <span
											class="required">*</span>
										</label>
										<input class="form-control col-md-7 col-xs-12"
											id="preschool" name="preschool" value="<%=certificate.getPreschool() %>"/>
									</div>

									<div class="col-md-3">
										<label> &#2346;&#2381;&#2352;&#2357;&#2375;&#2358;
											&#2342;&#2367;&#2344;&#2366;&#2306;&#2325; <span
											class="required">*</span>
										</label>
										<input class="form-control" id="admissiondate"
											name="admissiondate" placeholder="admissiondate" value="<%=certificate.getAdmissiondate() %>"/>
									</div>

									<div class="col-md-3">
										<label for="name">
											&#2325;&#2379;&#2339;&#2340;&#2381;&#2351;&#2366;
											&#2311;&#2351;&#2340;&#2381;&#2340;&#2366;(&#2309;&#2325;&#2381;&#2359;&#2352;&#2368;)
											&#2357;
											&#2325;&#2343;&#2368;&#2346;&#2366;&#2360;&#2370;&#2344;(&#2309;&#2306;&#2325;)
											&#2358;&#2367;&#2325;&#2340; &#2361;&#2379;&#2340;&#2366; <span
											class="required">*</span>
										</label>
										<input class="form-control col-md-7 col-xs-12"
											id="prestandard" name="prestandard" value="<%=certificate.getPrestandard() %>"/>
									</div>

									<div class="col-md-3">
										<label for="name">
											&#2309;&#2349;&#2381;&#2351;&#2366;&#2360;&#2366;&#2340;&#2368;&#2354;
											&#2346;&#2381;&#2352;&#2327;&#2340;&#2367; <span
											class="required">*</span>
										</label>
										<input class="form-control col-md-7 col-xs-12"
											id="progress" name="progress" value="<%=certificate.getProgress() %>"/>
									</div>
									<div class="col-md-3">
										<label for="name">
											&#2357;&#2352;&#2381;&#2340;&#2339;&#2370;&#2325; <span
											class="required">*</span>
										</label>
										<input class="form-control col-md-7 col-xs-12"
											id="behavior" name="behavior" value="<%=certificate.getBehavior() %>"/>
									</div>
									<div class="col-md-3">
										<label for="name"> &#2358;&#2366;&#2337;&#2366;
											&#2360;&#2379;&#2337;&#2339;&#2381;&#2351;&#2366;&#2330;&#2375;
											&#2325;&#2366;&#2352;&#2339; <span class="required">*</span>
										</label>
										<input class="form-control col-md-7 col-xs-12"
											id="reasonofleaving" name="reasonofleaving" value="<%=certificate.getReasonofleaving() %>"/>
									</div>

									<div class="col-md-3">
										<label> &#2358;&#2375;&#2352;&#2366;  <span
											class="required">*</span>
										</label>
										<input class="form-control col-md-7 col-xs-12"
											id="shera" name="shera" value="<%=certificate.getShera() %>"/>
									</div>

									<div class="col-md-3">
										<label> &#2358;&#2366;&#2355;&#2366;
											&#2360;&#2379;&#2337;&#2354;&#2381;&#2351;&#2366;&#2330;&#2366;
											&#2342;&#2367;&#2344;&#2366;&#2306;&#2325; <span
											class="required">*</span>
										</label>
										<input class="form-control" id="leavingdate"
											name="leavingdate" value="<%=certificate.getLeavingdate() %>"/>
									</div>

								</div>
							</div>
							<div class="ln_solid"></div>
							<div class="form-group" style="margin-top: 4%;">
								<div class="col-md-6 col-md-offset-3">
									<!-- <button type="submit" class="btn btn-primary">Cancel</button> -->
									<!-- <button id="send" type="submit" class="btn btn-success">Save</button> -->
									<input type="submit" class="btn btn-success" value="SAVE">
								</div>
							</div>
						</s:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /page content -->