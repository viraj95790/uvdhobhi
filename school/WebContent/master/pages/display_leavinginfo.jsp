<%@page import="com.Lang.Master.eu.entity.Certificate"%>
<%@page import="com.Lang.Master.eu.entity.Master"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

 <%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>

  <%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>  

<div style="padding-left: 4%">
	<div>
		<a href="inputCertificate">Add Student info</a>
	</div>

	<div class="row">
		<div class="col-lg-12 col-md-12 col-xs-12" style="margin-top: 15px;">
						
						<s:form action="Certificate" theme="simple">
		                      <div class="col-lg-8 col-md-12 col-xs-12">
									<div class="form-group">
									
									<% String searchtxt = (String) session.getAttribute("searchtxt"); %>
									
										<input type="text" class="form-control" name="searchText"
											id="searchText" placeholder="Search by Name or Lastname" value="<%=searchtxt %>" >
									</div>
								</div>
								
								<div class="col-lg-1 col-md-12 col-xs-12">
									<div class="form-group">
										<input type="submit" value=" GO ">
									</div>
								</div>
						</s:form>		
			<table class="table table-striped">
				<thead>
					<tr style="font-size: 20%; color: black;"center">
						<th>&#2357;&#2367;&#2342;&#2381;&#2351;&#2366;&#2352;&#2381;&#2341;&#2381;&#2351;&#2366;&#2306;&#2330;&#2375;&#2344;&#2366;&#2357;</th>

						<th>&#2332;&#2344;&#2352;&#2354;
							&#2352;&#2332;&#2367;&#2360;&#2381;&#2335;&#2352;
							&#2325;&#2381;&#2352;&#2350;&#2366;&#2306;&#2325;</th>

						<th>&#2332;&#2344;&#2381;&#2350;&#2342;&#2367;&#2344;&#2366;&#2306;&#2325;</th>
						<th>&#2332;&#2367;&#2354;&#2381;&#2361;&#2366;</th>

						<th>&#2343;&#2366;&#2326;&#2366;&#2354;&#2366;
							&#2350;&#2367;&#2342;&#2366;&#2354;&#2381;&#2351;&#2366;&#2330;&#2368;
							&#2342;&#2367;&#2344;&#2366;&#2306;&#2325;</th>

						<th>Generate Leaving</th>
						<th>Generate Character</th>
						<th>Edit</th>
						<th>Delete</th>
					</tr>
				</thead>

				<%--  <s:iterator value="masterList">
				<tr>
					<td><s:property value="mastername"/></td>
				</tr>
			</s:iterator>  --%>

				<%
					ArrayList<Certificate> certinfolist = (ArrayList<Certificate>) session.getAttribute("certinfolist");
				%>
				<%
					for (Certificate certificate : certinfolist) {
				%>

				<tbody>
					<tr style="font-size: 15px;">
						<td><%=certificate.getStudentname()%></td>
						<td><%=certificate.getRegister_number()%></td>
						<td><%=certificate.getDob()%></td>
						<td><%=certificate.getDistrict()%></td>
						<td><%=certificate.getAdmissiondate()%></td>
						<td><a
							href="generateleavingCertificate?selectedid=<%=certificate.getId()%>"
							class="btn btn-primary">Leaving Certificate</a></td>
					    <td><a
							href="generatecharacterCertificate?selectedid=<%=certificate.getId()%>"
							class="btn btn-primary">BONAFIDE Certificate</a></td>
						<td><a
							href="editleavingCertificate?selectedid=<%=certificate.getId()%>"
							class="btn btn-primary">Edit</a></td>
						<td><a
							href="deleteCertificate?selectedid=<%=certificate.getId()%>"
							onclick="return confirmedDelete()"  class="btn btn-danger">Delete</a></td>
					</tr>
				</tbody>
				<%
					}
				%>
			</table>
		</div>
	</div>
</div>




<%-- <section class="two miniheaight">

	<div class="container-fluid">
		<header>
			<h2 class="stephedpa text-left">Student Information</h2>
		</header>




		

		<div class="col-lg-12 col-md-12 col-sm-12 paddingnil">
			<div class="tile-body">
				<div class="table-condensed">

					<table class="table table-custom" id="editable-usage">

						<tr>

							<th style="background: transparent url('common/images/table_header.gif') no-repeat scroll 0 0;">Name</th>
							
							<th style="background: transparent url('common/images/table_header.gif') no-repeat scroll 0 0;">Registration No.</th>
							
							<th style="background: transparent url('common/images/table_header.gif') no-repeat scroll 0 0;">BirthDate</th>
							
							<th style="background: transparent url('common/images/table_header.gif') no-repeat scroll 0 0;">District</th>
							
							<th style="background: transparent url('common/images/table_header.gif') no-repeat scroll 0 0;">Edit</th>
							
							<th style="background: transparent url('common/images/table_header.gif') no-repeat scroll 0 0;">Delete</th>

						</tr>


						<s:iterator value="getclasslist" status="status">


							<tr>

								<td><s:property value="studentname" /></td>
								<td><s:property value="registrationno" /></td>
								<td><s:property value="dob" /></td>
								<td><s:property value="district" /></td>
								
								<s:url action="editstandardMaster" id="edit">
											<s:param name="selectedid" value="%{id}"></s:param>
										</s:url>
										<td><s:a href="%{edit}" cssClass="btn btn-info btn-xs">Edit</s:a></td>

										<s:url action="deletestandardMaster" id="delete">
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
</section> --%>