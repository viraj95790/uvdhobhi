<!DOCTYPE html>
<%@page import="com.Lang.Master.web.action.SmsService"%>
<%@page import="com.Lang.Master.eu.blogic.JDBCMasterDAO"%>
<%@page import="com.Lang.Master.eu.bi.MasterDAO"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.pacs.main.eu.blogic.jdbc.Connection_provider"%>
<%@page import="com.Lang.Master.eu.entity.Master"%>
<%@page import="java.util.ArrayList"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
</head>
<body>
    <style type="text/css">
        .tg {
            border-collapse: collapse;
            border-spacing: 0;
        }

            .tg td {
                font-family: Arial, sans-serif;
                font-size: 14px;
                padding: 10px 5px;
                border-style: solid;
                border-width: 1px;
                overflow: hidden;
                word-break: normal;
            }

            .tg th {
                font-family: Arial, sans-serif;
                font-size: 14px;
                font-weight: normal;
                padding: 10px 5px;
                border-style: solid;
                border-width: 1px;
                overflow: hidden;
                word-break: normal;
            }

            .tg .tg-s6z2 {
                text-align: center;
            }

            .tg .tg-baqh {
                text-align: center;
                vertical-align: top;
            }

            .tg .tg-rn8n {
                font-weight: bold;
                font-size: 20px;
                font-family: "Arial Black", Gadget, sans-serif !important;
                ;
                text-align: center;
            }

            .tg .tg-yw4l {
                vertical-align: top;
            }

            .tg .tg-431l {
                font-family: Arial, Helvetica, sans-serif !important;
                ;
                text-align: center;
            }

            .tg .tg-hgcj {
                font-weight: bold;
                text-align: center;
            }

            .tg .tg-amwm {
                font-weight: bold;
                text-align: center;
                vertical-align: top;
            }
    </style>
    <%ArrayList<Master>studentNameList = (ArrayList<Master>)session.getAttribute("studentNameList");
    String sessionterms = (String)session.getAttribute("sessionterms");
    String sessionclassid = (String)session.getAttribute("sessionclassid");
   
    Connection connection = null;
    try{
    	connection = Connection_provider.getconnection();
    	MasterDAO masterDAO = new JDBCMasterDAO(connection);
   
    %>
    <%for(Master master : studentNameList) { int studentid = master.getId();
    
    %>
    <table class="tg">
        <tr>
            <th class="tg-031e" colspan="2" rowspan="2"><img src="img/logo.png" /></th>
            <th class="tg-rn8n" colspan="16">Kurvey's New Model Public School<br></th>
            <th class="tg-yw4l" colspan="2" rowspan="2"><img src="img/cbse-logo.jpg" /></th>
        </tr>
        <tr>
            <td class="tg-431l" colspan="16">Affiliated to CBSE, Affiliation No - 11300420<br>Shraddhanand Peth,Diksha Bhumi Square, Nagpur, Maharashtra 440020</td>
        </tr>
        <tr>
            <td class="tg-hgcj" colspan="20">Report Card</td>
        </tr>
        <tr>
            <td class="tg-s6z2" colspan="20">Class : <br>Academic Session : </td>
        </tr>
        <tr>
            <td class="tg-031e">Student's Name</td>
            <td class="tg-031e" colspan="12"><%=master.getName() %></td>
            <td class="tg-yw4l" colspan="7" rowspan="2"><br>Roll No :<%=master.getRollno() %> </td>
        </tr>
        <tr>
            <td class="tg-031e">Father's Name</td>
            <td class="tg-031e" colspan="12"><%=master.getFathername() %></td>
        </tr>
        <tr>
            <td class="tg-031e">Mother's Name</td>
            <td class="tg-031e" colspan="12"><%=master.getMothername() %></td>
            <td class="tg-yw4l" colspan="7" rowspan="3">Admission No : <%=master.getId() %></td>
        </tr>
        <tr>
            <td class="tg-031e">Date Of Birth </td>
            <td class="tg-031e" colspan="12"><%=master.getDob() %></td>
        </tr>
        <tr>
            <td class="tg-031e">Address </td>
            <td class="tg-031e" colspan="12"><%=master.getAddress() %></td>
        </tr>
        <tr>
            <td class="tg-031e" colspan="20"></td>
        </tr>
        <tr>
            <td class="tg-031e">SCHOLASTIC AREA</td>
            <td class="tg-s6z2" colspan="19">Term 1(100 Mark)</td>
        </tr>
        <tr>
            <td class="tg-baqh" rowspan="2"><br>Subjects</td>
            <%ArrayList<Master>termnameList = (ArrayList<Master>)session.getAttribute("termnameList"); %>
            <% for(Master term : termnameList){%>
            <td class="tg-baqh" colspan="3"><%=term.getName()%></td>
            <%} %>
            <td class="tg-baqh" colspan="3">Total</td>
            <td class="tg-baqh" colspan="4" rowspan="2"><br>Grade</td>
        </tr>
        <tr>
            <td class="tg-baqh" colspan="3">10</td>
            <td class="tg-baqh" colspan="3">5</td>
            <td class="tg-baqh" colspan="3">5</td>
            <td class="tg-baqh" colspan="3">80</td>
            <td class="tg-baqh" colspan="3">100</td>
        </tr>
       
        <%ArrayList<Master>subjectNameList = (ArrayList<Master>)session.getAttribute("subjectNameList"); double overallmarks = 0; String smstxt = "Student Name : " + master.getName() + " , ";%>
        	<% for(Master sub : subjectNameList){double totalmarks = 0;%>
        	 <tr>
	            <td class="tg-yw4l"><%=sub.getDisplayname() %></td>
	           <%for(Master terms : termnameList){ 
	           double marks = masterDAO.getSelectedStudentMarks(sessionclassid,studentid,terms.getId(),sub.getName());
	           totalmarks = totalmarks + marks;
	           overallmarks = overallmarks + marks;
	           
	           %>
	           
	           
	            <td class="tg-yw4l" colspan="3"><%=marks %></td>
	            <% }%>
	            
	            <td class="tg-yw4l" colspan="3"><%=totalmarks %></td>
	            <%String grade = "";
	            smstxt = smstxt + sub.getDisplayname() + " : " + totalmarks + " , ";
	            	if(totalmarks>=91 && totalmarks<100){
	            		grade = "A1";
	            	}
	            	if(totalmarks>=81 && totalmarks<90){
	            		grade = "A2";
	            	}
	            	if(totalmarks>=71 && totalmarks<80){
	            		grade = "B1";
	            	}
	            	if(totalmarks>=61 && totalmarks<70){
	            		grade = "B2";
	            	}
	            	if(totalmarks>=51 && totalmarks<60){
	            		grade = "C1";
	            	}
	            	if(totalmarks>=41 && totalmarks<50){
	            		grade = "C2";
	            	}
	            	if(totalmarks>33 && totalmarks<40){
	            		grade = "D";
	            	}
	            	if(totalmarks==33 || totalmarks<33){
	            		grade = "E (Failed)";
	            	}
	            %>
	            <td class="tg-yw4l" colspan="4"><%=grade %></td>
            </tr>
            <%} %>
        
        <tr>
            <td class="tg-yw4l" colspan="20"></td>
        </tr>
        <tr>
            <td class="tg-baqh">Overall Marks</td>
            <% 
            double totaltermmark = masterDAO.gettotaltermsmarks(sessionterms);%>
            <td class="tg-baqh" colspan="4"><%=overallmarks %>/<%=subjectNameList.size() * totaltermmark %></td>
            <td class="tg-yw4l" colspan="2"></td>
            <td class="tg-baqh" colspan="3">Percentage</td>
            <% double t = subjectNameList.size() * totaltermmark;
            	double per = (overallmarks*100) / t;
            	
            	SmsService s = new SmsService();
            	smstxt = smstxt + " Percentage : " + per;
            	s.sendSms(smstxt, master.getMob());
            %>
            <td class="tg-baqh" colspan="3"><%=per %></td>
            <td class="tg-yw4l" colspan="2"></td>
            <td class="tg-baqh" colspan="3">Grade</td>
             <%String grade = "";
	           
	            	if(per>=91 && per<100){
	            		grade = "A1";
	            	}
	            	if(per>=81 && per<90){
	            		grade = "A2";
	            	}
	            	if(per>=71 && per<80){
	            		grade = "B1";
	            	}
	            	if(per>=61 && per<70){
	            		grade = "B2";
	            	}
	            	if(per>=51 && per<60){
	            		grade = "C1";
	            	}
	            	if(per>=41 && per<50){
	            		grade = "C2";
	            	}
	            	if(per>33 && per<40){
	            		grade = "D";
	            	}
	            	if(per==33 || per<33){
	            		grade = "E (Failed)";
	            	}
	            %>
            <td class="tg-baqh" colspan="2"><%=grade %></td>
        </tr>
        <tr>
            <td class="tg-amwm" colspan="9">Co-Scholastic Area<br>(3 Point Grading Scale A,B,C)</td>
            <td class="tg-yw4l" rowspan="10"></td>
            <td class="tg-amwm" colspan="10"><br>Discipline<br>(3 Point Grading Scale A,B,C)</td>
        </tr>
        <tr>
            <td class="tg-amwm" colspan="7">Term 1</td>
            <td class="tg-amwm" colspan="2">Grade</td>
            <td class="tg-amwm" colspan="8">Term 1</td>
            <td class="tg-amwm" colspan="2">Grade</td>
        </tr>
        <tr>
            <td class="tg-yw4l" colspan="7">Work Education</td>
            <td class="tg-amwm" colspan="2">A</td>
            <td class="tg-yw4l" colspan="8">Regularity &amp; Punctuality</td>
            <td class="tg-amwm" colspan="2">A</td>
        </tr>
        <tr>
            <td class="tg-yw4l" colspan="7">Art Education</td>
            <td class="tg-amwm" colspan="2">B</td>
            <td class="tg-yw4l" colspan="8">Sincerity</td>
            <td class="tg-amwm" colspan="2">B</td>
        </tr>
        <tr>
            <td class="tg-yw4l" colspan="7">Health &amp; Physical Education</td>
            <td class="tg-amwm" colspan="2">C</td>
            <td class="tg-yw4l" colspan="8">Behaviour &amp; Values</td>
            <td class="tg-amwm" colspan="2">C</td>
        </tr>
        <tr>
            <td class="tg-yw4l" colspan="7">Scientific Skills</td>
            <td class="tg-amwm" colspan="2">A</td>
            <td class="tg-yw4l" colspan="8">Respectfulness for Rules &amp; Regulations</td>
            <td class="tg-amwm" colspan="2">A</td>
        </tr>
        <tr>
            <td class="tg-yw4l" colspan="7">Thinking Skills</td>
            <td class="tg-amwm" colspan="2">B</td>
            <td class="tg-yw4l" colspan="8">Attitude Towards Teachers</td>
            <td class="tg-amwm" colspan="2">B</td>
        </tr>
        <tr>
            <td class="tg-yw4l" colspan="7">Social Skills</td>
            <td class="tg-amwm" colspan="2">C</td>
            <td class="tg-yw4l" colspan="8">Attitude Towards School Mates</td>
            <td class="tg-amwm" colspan="2">C</td>
        </tr>
        <tr>
            <td class="tg-yw4l" colspan="7">YOGA / NCC</td>
            <td class="tg-amwm" colspan="2">A</td>
            <td class="tg-yw4l" colspan="8">Attitude Towards Society</td>
            <td class="tg-amwm" colspan="2">A</td>
        </tr>
        <tr>
            <td class="tg-yw4l" colspan="7">Sport</td>
            <td class="tg-amwm" colspan="2">A</td>
            <td class="tg-yw4l" colspan="8">Attitude Towards Nation</td>
            <td class="tg-amwm" colspan="2">B</td>
        </tr>
        <tr>
            <td class="tg-yw4l" colspan="20" rowspan="2"></td>
        </tr>
        <tr></tr>
        <tr>
            <td class="tg-yw4l" colspan="20">Attendance : 116 / 122</td>
        </tr>
        <tr>
            <td class="tg-yw4l" colspan="20" rowspan="2"></td>
        </tr>
        <tr></tr>
        <tr>
            <td class="tg-baqh" colspan="7" rowspan="2">Date : 21/09/2017</td>
            <td class="tg-baqh" colspan="7" rowspan="2">Class Teacher</td>
            <td class="tg-baqh" colspan="6" rowspan="2">Principal</td>
        </tr>
        <tr></tr>
    </table>
    <% }%>
    
    <%  }catch(Exception e){
    	e.printStackTrace();
    }finally{
    	connection.close();
    }%>
</body>
</html>
