<%@page import="com.Lang.Master.eu.entity.Certificate"%>
<%@ taglib uri="/struts-tags" prefix="s" %>


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

            .tg .tg-avqc {
                font-weight: bold;
                font-size: 24px;
                font-family: "Comic Sans MS", cursive, sans-serif !important;
                ;
                text-align: center;
            }

            .tg .tg-c6m9 {
                font-weight: bold;
                font-size: 22px;
                font-family: "Comic Sans MS", cursive, sans-serif !important;
                ;
                text-align: center;
                vertical-align: top;
            }

            .tg .tg-s6z2 {
                text-align: center;
            }

            .tg .tg-yhko {
                font-weight: bold;
                font-family: "Comic Sans MS", cursive, sans-serif !important;
                ;
                vertical-align: top;
            }

            .tg .tg-ukaz {
                font-weight: bold;
                font-family: "Comic Sans MS", cursive, sans-serif !important;
                ;
                vertical-align: top;
            }

            .tg .tg-mfmo {
                font-weight: bold;
                font-size: 28px;
                font-family: "Comic Sans MS", cursive, sans-serif !important;
                ;
                text-align: center;
            }

            .tg .tg-hd86 {
                font-weight: bold;
                font-family: "Comic Sans MS", cursive, sans-serif !important;
                ;
                text-align: right;
            }

            .tg .tg-rpan {
                font-weight: bold;
                font-family: "Comic Sans MS", cursive, sans-serif !important;
            }

            .tg .tg-xoji {
                font-weight: bold;
                font-size: 15px;
                font-family: "Comic Sans MS", cursive, sans-serif !important;
                ;
                text-align: center;
            }

            .tg .tg-7fgq {
                font-weight: bold;
                font-family: "Comic Sans MS", cursive, sans-serif !important;
                ;
                text-align: center;
                vertical-align: top;
            }

            .tg .tg-u6ki {
                font-weight: bold;
                font-family: "Comic Sans MS", cursive, sans-serif !important;
                ;
                text-align: right;
                vertical-align: top;
            }
    </style>
    
    <%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>

    <%request.setCharacterEncoding("UTF-8");response.setCharacterEncoding("UTF-8"); %>
    
    <table class="tg" style="undefined;table-layout: fixed; width: 100%">
        <colgroup>
            <col style="width: 93px">
            <col style="width: 98px">
            <col style="width: 174px">
            <col style="width: 208px">
            <col style="width: 79px">
            <col style="width: 250px">
        </colgroup>
        <tr>
            <th class="tg-xoji" colspan="6">सरकारमान्य <br>महिला सेवा मंडळ, वर्धा द्वारा संचालित</th>
        </tr>
        <tr>
            <td class="tg-mfmo" colspan="6">महिला आश्रम बुनियादी प्राथमिक मराठी विद्यालय, वर्धा</td>
        </tr>
        <tr>
            <td class="tg-rpan" colspan="2">07152-251437</td>
            <td class="tg-s6z2" colspan="2" rowspan="2"><img src="img/Mahila-Aashram-Logo.png" /></td>
            <td class="tg-hd86" colspan="2" rowspan="2">युडायस क्र. 27080817902<br>क्रमांक : </td>
        </tr>
        <tr>
            <td class="tg-rpan" colspan="2">संस्थापक,<br>जमनालाल बजाज <br>शांताबाई रानीवाला</td>
        </tr>
        <tr>
            <td class="tg-avqc" colspan="6">प्रमाणित - प्रमाणपत्र</td>
        </tr>
        <%Certificate certificate = (Certificate) session.getAttribute("certificate"); %>
        <tr>
            <td class="tg-7fgq" colspan="6">सन : <%=certificate.getAcademicyr() %></td>
        </tr>
        <tr>
            <td class="tg-yhko" colspan="6">प्रमाणित करण्यात येते की, <%=certificate.getStudentname() %></td>
        </tr>
        <tr>
            <td class="tg-yhko" colspan="5">आईचे पूर्ण नाव   <%=certificate.getMothername() %></td>
            <td class="tg-ukaz">जात   <%=certificate.getCast() %></td>
        </tr>
        <tr>
            <td class="tg-yhko" colspan="6">या विद्यालयाचा प्रमाणित विद्यार्थी आहे. दाखल खारीज रजि. क्रमांक    <%=certificate.getRegister_number() %></td>
        </tr>
        <tr>
            <td class="tg-yhko" colspan="4">अन्वये जन्म तारीख  <%=certificate.getDob() %></td>
            <td class="tg-yhko" colspan="2">(अक्षरात)  <%=certificate.getDob_letters() %></td>
        </tr>
        <tr>
            <td class="tg-yhko" colspan="2">ही आहे. तो / ती      <%=certificate.getStandard() %>  </td>
            <td class="tg-yhko" colspan="3">वर्गाचा विद्यार्थी असून      <%=certificate.getDistrict() %> </td>
            <td class="tg-u6ki">येथील राहवासी आहे.</td>
        </tr>
        <tr>
            <td class="tg-yhko" colspan="4" rowspan="2"><br><br>दिनांक : </td>
            <td class="tg-c6m9" colspan="2" rowspan="2"><br><br>मुख्याध्यापक</td>
        </tr>
        <tr></tr>
    </table>
</body>
</html>
