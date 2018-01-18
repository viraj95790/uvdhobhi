<%@page import="com.Lang.Master.eu.entity.Certificate"%>
<%@ taglib uri="/struts-tags" prefix="s" %>

<head>
    <title></title>
</head>
<body>
    <div>
        <style type="text/css">
            .tg {
                border-collapse: collapse;
                border-spacing: 0;
            }

                .tg td {
                    font-family: Arial, sans-serif;
                    font-size: 14px;
                    padding: 3px 5px;
                    border-style: solid;
                    border-width: 1px;
                    overflow: hidden;
                    word-break: normal;
                }

                .tg th {
                    font-family: Arial, sans-serif;
                    font-size: 14px;
                    font-weight: normal;
                    padding: 3px 5px;
                    border-style: solid;
                    border-width: 1px;
                    overflow: hidden;
                    word-break: normal;
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

                .tg .tg-4ro1 {
                    font-weight: bold;
                    font-family: "Comic Sans MS", cursive, sans-serif !important;
                    ;
                    text-align: center;
                }

                .tg .tg-74rq {
                    font-weight: bold;
                    font-size: 22px;
                    font-family: "Comic Sans MS", cursive, sans-serif !important;
                    ;
                    text-align: center;
                }

                .tg .tg-amwm {
                    font-weight: bold;
                    text-align: center;
                    vertical-align: top;
                }

            @media screen and (max-width: 767px) {
                .tg {
                    width: auto !important;
                }

                    .tg col {
                        width: auto !important;
                    }

                .tg-wrap {
                    overflow-x: auto;
                    -webkit-overflow-scrolling: touch;
                }
            }
        </style>
        
       <%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%> 

     <%request.setCharacterEncoding("UTF-8");response.setCharacterEncoding("UTF-8"); %> 
        
        <div class="tg-wrap" >
            <table class="tg" width="100%">
                <tr>
                    <th class="tg-rpan" colspan="8">व्यवस्थापनाचे नाव</th>
                    <th class="tg-rpan" colspan="8">: महिला सेवा मंडल, वर्धा</th>
                    <th class="tg-4ro1" colspan="4" rowspan="4"><img src="img/Mahila-Aashram-Logo.png" /></th>
                </tr>
                <tr>
                    <td class="tg-rpan" colspan="8">शाळेचे नाव</td>
                    <td class="tg-rpan" colspan="8">: महिला आश्रम बुनियादी प्राथमिक मराठी विद्यालय, वर्धा</td>
                </tr>
                <tr>
                    <td class="tg-rpan" colspan="8">पत्ता</td>
                    <td class="tg-rpan" colspan="8">: महिला आश्रम, सेवाग्राम रोड, वर्धा - 442001</td>
                </tr>
                <tr>
                    <td class="tg-rpan" colspan="8">तालुका</td>
                    <td class="tg-rpan" colspan="8">: वर्धा, जिल्हा : वर्धा</td>
                </tr>
                <tr>
                    <td class="tg-rpan" colspan="8">फोन नंबर</td>
                    <td class="tg-rpan" colspan="12">: 07152-251437 ई-मेल : - mahilashram_2014marathi@rediffmail.com</td>
                </tr>
                <tr>
                    <td class="tg-rpan" colspan="8">अनुक्रमांक : </td>
                    <td class="tg-rpan" colspan="12">  जनरल रजि. क्र.: </td>
                </tr>
                <tr>
                    <td class="tg-rpan" colspan="8">शाळा मान्यता क्र.</td>
                    <td class="tg-rpan" colspan="12">: शे.वि.क्र.9084,  दि.05/11/1962, माध्यम: मराठी</td>
                </tr>
                <tr>
                    <td class="tg-rpan" colspan="10">यु डायस क्र. : 27080817902</td>
                    <td class="tg-rpan" colspan="4">बोर्ड : </td>
                    <td class="tg-rpan" colspan="6">संलग्नता क्र.: </td>
                </tr>
                <tr>
                    <td class="tg-74rq" colspan="20">शाळा सोडण्याचे प्रमाणपत्र</td>
                </tr>
                <%Certificate certificate = (Certificate) session.getAttribute("certificate"); %>
                <tr>
                    <td class="tg-rpan" colspan="20">स्टुडंट आय. डी.  : <%=certificate.getStudentid() %></td>
                </tr>
                <tr>
                    <td class="tg-rpan" colspan="20">यु आय डी नं. (आधार कार्ड क्र.)  : <%=certificate.getUid() %></td>
                </tr>
                <tr>
                    <td class="tg-rpan" colspan="20">विद्यार्थ्यांचे संपूर्ण नाव : <%=certificate.getStudentname() %></td>
                </tr>
                <tr>
                    <td class="tg-rpan" colspan="20">आईचे नाव : <%=certificate.getMothername() %></td>
                </tr>
                <tr>
                    <td class="tg-rpan" colspan="10">राष्ट्रीयत्व : &#2349;&#2366;&#2352;&#2340;&#2368;&#2351; </td>
                    <td class="tg-rpan" colspan="10">मातृभाषा : <%=certificate.getMothertongue() %></td>
                </tr>
                <tr>
                    <td class="tg-rpan" colspan="9">धर्म : <%=certificate.getReligion() %></td>
                    <td class="tg-rpan" colspan="5">जात : <%=certificate.getCast() %></td>
                    <td class="tg-rpan" colspan="6">पोटजात : <%=certificate.getSubcast() %></td>
                </tr>
                <tr>
                    <td class="tg-rpan" colspan="12">जन्मस्थळ (गाव/शहर) : <%=certificate.getBirthplace() %></td>
                    <td class="tg-rpan" colspan="8">तालुका : <%=certificate.getTaluka() %></td>
                </tr>
                <tr>
                    <td class="tg-rpan" colspan="9">जिल्हा : <%=certificate.getDistrict() %></td>
                    <td class="tg-rpan" colspan="5">राज्य :  <%=certificate.getNation() %></td>
                    <td class="tg-rpan" colspan="6">देश :  &#2349;&#2366;&#2352;&#2340; </td>
                </tr>
                <tr>
                    <td class="tg-rpan" colspan="20">इ.सना प्रमाणे जन्म दिनांक : <%=certificate.getDob() %></td>
                </tr>
                <tr>
                    <td class="tg-rpan" colspan="20">जन्म दिनांक (अक्षरी) :  <%=certificate.getDob_letters() %></td>
                </tr>
                <tr>
                    <td class="tg-rpan" colspan="20">यापूर्वीची शाळा व इयत्ता :  <%=certificate.getPreschool() %></td>
                </tr>
                <tr>
                    <td class="tg-rpan" colspan="14">या शाळेत प्रवेश घेतल्याचा दिनांक : <%=certificate.getAdmissiondate() %></td>
                    <td class="tg-rpan" colspan="6">इयत्ता : <%=certificate.getStandard() %> </td>
                </tr>
                <tr>
                    <td class="tg-rpan" colspan="12">अभ्यासातील प्रगती : <%=certificate.getProgress() %></td>
                    <td class="tg-rpan" colspan="8">वर्तणुक : <%=certificate.getBehavior() %></td>
                </tr>
                <tr>
                    <td class="tg-rpan" colspan="20">शाळा सोडल्याचा दिनांक : <%=certificate.getLeavingdate() %></td>
                   <!--  <td class="tg-hd86" colspan="7"></td> -->
                </tr>
                <tr>
                    <td class="tg-rpan" colspan="20">कोणत्या इयत्तेत शिकत होता / होती  व केव्हा पासून (अक्षरी व अंकी) : <%=certificate.getPrestandard() %></td>
                </tr>
                <tr>
                    <td class="tg-rpan" colspan="20">शाळा सोडण्याचे कारण : <%=certificate.getReasonofleaving() %></td>
                </tr>
                <tr>
                    <td class="tg-rpan" colspan="20">शेरा : <%=certificate.getShera() %></td>
                </tr>
                <tr>
                    <td class="tg-4ro1" colspan="20">दाखला देण्यात येतो की, वरील माहिती शाळेतील जनरल रजिस्टर नं. १ प्रमाणे आहे.</td>
                </tr>
                <tr>
                    <td class="tg-rpan" colspan="8">दिनांक :</td>
                    <td class="tg-rpan" colspan="6"> </td>
                    <td class="tg-rpan" colspan="6"> </td>
                </tr>
                <tr>
                    <td class="tg-4ro1" colspan="8"><br><br><br><br>वर्ग शिक्षक  </td>
                    <td class="tg-4ro1" colspan="6"><br><br><br><br>लेखनिक</td>
                    <td class="tg-4ro1" colspan="6"><br><br><br>सही व शिक्का <br>मुख्याध्यापक </td>
                </tr>
                <tr>
                    <td class="tg-amwm" colspan="20">टीप : शाळा सोडल्याचे दाखल्यामध्ये अनधिकृतरित्या बदल केल्यास संबांधितावर कायदेशीर कारवाई करण्यात येईल.</td>
                </tr>
            </table>
        </div>
    </div>
</body>
</html>
