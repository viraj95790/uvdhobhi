<%@page import="com.Lang.Master.eu.blogic.JDBCMasterDAO"%>
<%@page import="com.Lang.Master.eu.bi.MasterDAO"%>
<%@page import="com.pacs.main.eu.blogic.jdbc.Connection_provider"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.Lang.Master.eu.entity.Master"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="/struts-tags" prefix="s" %>

<script src="popupdialog/dialog/js/jquery-1.10.2.js"
	type="text/javascript"></script>
<script src="popupdialog/dialog/js/jquery-ui.min.js"
	type="text/javascript"></script>
	
<script type="text/javascript" src="master/js/master.js"></script>

<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>

<%request.setCharacterEncoding("UTF-8");response.setCharacterEncoding("UTF-8"); %>

<style>
.ss{
	text-align: center;
	width: 50%;
}
</style>

<script>
	function showMarksMaster(){
		document.getElementById('masterfrm').submit();
	}
</script>

<s:form action="termtestMaster" id="tfrm">
<s:hidden name="mainterm" id="hdnmainterms"/>
<s:hidden name="classid" id="hdnclassid"/>
</s:form>

<div style="padding-left: 4%">
<s:form action="Master" id="masterfrm" theme="simple">
	<div class="row" style="margin-top: 2%;">
		<div class="col-lg-2 col-md-12 col-xs-12">
			<s:select  name="classid" id="classid" list="classNameList"
			listKey="id" listValue="name" headerKey="0" headerValue="Select Class Name"
			onchange="maintermlist(this.value)"  cssClass="form-control"/>
		</div>
		
		<div class="col-lg-2 col-md-12 col-xs-12" id="maintermid">
			<select id="mainterm" name="mainterm" class="form-control" onchange="showexamtype(this.value)" >
                <option value="0">Select Terms</option>
             </select>
		</div>
		
		
		
		
		<div class="col-lg-2 col-md-12 col-xs-12" id="examid">
			<s:select  name="terms" id="terms" list="termList"
			listKey="id" listValue="name" headerKey="0" headerValue="Select Exam Type"
			cssClass="form-control"/>
		</div>
		<div class="col-lg-2 col-md-12 col-xs-12">
			<s:textfield cssClass="form-control"  name="searchText" id="searchText" placeholder="Search by name and roll number"/>
		</div>
		<div class="col-lg-1 col-md-12 col-xs-12">
			<input type="button" value=" GO " onclick="showdata()">
		</div>
		<div class="col-lg-3 col-md-12 col-xs-12">
			<a href="#" onclick="openDisplayPopup('reportMaster?classid=<s:property value="classid"/>&terms=<s:property value="terms"/>')">Creat Report For All</a>
			| <a href="reportMaster?classid=<s:property value="classid"/>&terms=<s:property value="terms"/>">SMS to All</a>
		</div>
	</div>
	</s:form>
	<br>
	<%ArrayList<Master>studentNameList = (ArrayList<Master>)session.getAttribute("studentNameList"); %>
	<%ArrayList<Master>subjectNameList = (ArrayList<Master>)session.getAttribute("subjectNameList");
	String terms = (String)session.getAttribute("terms");
	String classid = (String)session.getAttribute("classid");
	
	Connection connection = null;
	try{
		connection = Connection_provider.getconnection();
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
	%>
	<s:form action="saveMaster" id="savefrm">
	<s:hidden name="terms"/>
	<s:hidden name="classid"/>
	<s:hidden name="searchText"/>
	<div class="row">
			<table border="1" width="100%" cellpadding="0" cellspacing="0" class="timer-table" id = "allusertable" style="table-layout: fixed;">
				<col width="15%"/>
				<% for (Master m : subjectNameList){%>
					<col width="15%"/>
				<%} %>
			
			
				<tr>
					<th style="background-color: #DFD8D4"></th>
					
					<% for (Master m : subjectNameList){%>
					 <th style="text-align: center;" id="wn1"><%=m.getDisplayname() %></th>
					<%} %>
				</tr>
				<% 
				int ct=0; 
					
				int clinicendtime = studentNameList.size();
				clinicendtime = clinicendtime - ct;
				clinicendtime = clinicendtime + 1;
					
					int countslot = 1;
					String weekName[] = {"Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"};
					String tempCt = "";
					String tempMinute = "";
					String subjrctid = "";
					
				
				%>
				
				
					<div id="tgOver1" class="tg-col-overlaywrapper" style="display: none;">
							<div class="tg-hourmarker tg-nowmarker" id="tgnowmarker" style="top: 0px;"> </div>
						</div>
				
				<%String classname="";int i=1;for(Master m :studentNameList){
					int cval=subjectNameList.size()*i;
					cval=cval-subjectNameList.size();
					int cp = cval+1;
					
					
					%>
					<tr>
					    <td class="ui-state-default"  valign="top" style="font-size: 14px; font-weight: bold;"><span class="timeset"><%=m.getName() %></span></td>
						
						<%  for(int j=0;j<subjectNameList.size();j++){
								Master subj = subjectNameList.get(j);
							
								if(cp == countslot){
									if(j>0){
										classname = "yellow";
									}else{
										classname = "sub";
									}
									
								}else{
									
								}
							
						%>
						
							<td valign="top" id="<%=countslot %>" >
								<%for(int k=0;k<1;k++){ %>
										<%
											tempCt =  Integer.toString(ct);
											tempMinute = Integer.toString((5*k));
											if(ct <= 9) {
												tempCt = "0" + Integer.toString(ct);
											}
											if((5*k) <= 9) {
												tempMinute = "0" + Integer.toString((5*k));
											}
											
											MasterDAO masterDAO = new JDBCMasterDAO(connection);
											String marks = masterDAO.getEnteredMarks(terms,classid,m.getId(),subj.getName());
										%>
											
										
									<%if(k==6){ %>
										<div    id="<%=(5*k) %>min<%=countslot %>-<%=subj.getId() %>-<%=m.getId() %>~<%=marks %>"  class="<%=classname %>" title="<%=tempCt %>:<%=tempMinute %>" style="text-align: center; " >
											
										</div>
									<%}else{ %>
										<div id="<%=(5*k) %>min<%=countslot %>-<%=subj.getId() %>-<%=m.getId() %>~<%=marks %>"  class="<%=classname %>" title="<%=tempCt %>:<%=tempMinute %>"  style="text-align: center;"></div>
									<% }%>
        							
        						<% }%>
								
							</td>
							<%countslot++; %>
								
						<% }%>
						
					
						<%ct++; %>
					</tr>
					<%i++; %>
				<% }%>
			</table>
			
			
	</div>
		<br>
		<div align="right">
		<input type="submit" value=" Save " />
		
		</div>
	</s:form>
	
</div>

<script>
window.onload = function(){
	 $('.sub').each(function() { //loop through each checkbox
		 var id = this.id;
		 var data = id.split('~');
		document.getElementById(id).innerHTML = '<input class="ss" type="number" id="n'+id+'" name="n'+data[0]+'">';  
		
		
		var mid="n"+id;
		document.getElementById(mid).value = data[1];
		
     });
}
</script>