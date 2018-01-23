<%@ taglib uri="/struts-tags" prefix="s"%>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<link rel="stylesheet"
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.min.css" />
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

<style>

        /* Common style */
        .btn i {
            font-family: pramukhindic;
            font-size: 18px;
            line-height: 18px;
            font-style: normal;
            vertical-align: middle;
        }

        iframe.detailed-help {
            height: 400px;
            width: 100%;
            overflow: auto;
            border: 0px;
        }

        .shruti {
            font-family: "Shruti";
        }

        .arialunicodems {
            font-family: "Arial Unicode MS";
            font-size: 20px;
        }

        textarea {
            font-size: 20px;
            height: 400px;
            width: 100%;
            border: 0px;
        }

        @media (max-width: 768px) {
            textarea {
                font-size: 20px;
                height: 200px;
                width: 100%;
            }
        }

        .gujarati, .hindi {
            font-size: 20px;
        }

        /* Gujarati fonts */
        .gujaratiaa-sulekh {
            font-family: "AA_SULEKH_Simple_N";
        }

        .gujaratiakashganga {
            font-family: "AKASHGANGA";
        }

        .gujaratiakruti-guj-shyama {
            font-family: "AkrutiGujShyamaNormal";
        }

        .gujaratiakruti-office-shyama {
            font-family: "AkrutiOfficeShyamaNormal";
        }

        .gujaratiamrut {
            font-family: "Amrut";
        }

        .gujaratiankit {
            font-family: "Ankit";
        }

        .gujaratiapurva-med {
            font-family: "ApurvaMed";
        }

        .gujaratiasdigital-13 {
            font-family: "Asdigital 13";
        }

        .gujaratiatmadharma {
            font-family: "AtmaDharma Gujarati";
        }

        .gujaratibharti-gopika {
            font-family: "B Bharati GopikaTwo";
        }

        .gujaratichandra-b {
            font-family: "ChandraB";
        }

        .gujaratichitra {
            font-family: "Chitra";
        }

        .gujaraticlig-001, .gujaraticlig-001-2 {
            font-family: "clig001","clig010";
        }

        .gujaratieklg-10 {
            font-family: "eklg-10";
        }

        .gujaratieklg-17 {
            font-family: "eklg-17";
        }

        .gujaratifancy {
            font-family: "Fancy";
        }

        .gujaratigandharv {
            font-family: "Gandharv";
        }

        .gujaratighanshyam {
            font-family: "Ghanshyam";
        }

        .gujaratigj-tt-avantika {
            font-family: "GJ-TTAvantika", "GJ-TTAvantika Normal";
        }

        .gujaratigjw-tt-avantika {
            font-family: "GJW-TTAvantika";
        }

        .gujaratigjw-tt-krishna {
            font-family: "GJW-TTKrishna";
        }

        .gujaratigjw-tt-piyush {
            font-family: "GJW-TTPiyush";
        }

        .gujaratigiridhar {
            font-family: "Giridhar";
        }

        .gujaratigopika, .gujaratigopika-2 {
            font-family: "Gopika";
        }

        .gujaratigopika-english {
            font-family: "G_GopikaEnglish";
        }

        .gujaratigopika-two, .gujaratigopika-two-2 {
            font-family: "GopikaTwo";
        }

        .gujaratigovinda {
            font-family: "Govinda";
        }

        .gujaratigujarati-lys {
            font-family: "GujratiLys 020 Wide";
        }

        .gujaratigujar-2000 {
            font-family: "Gurjar 2000";
        }

        .gujaratigurjari {
            font-family: "Gurjari";
        }

        .gujaratihari {
            font-family: "Hari";
        }

        .gujaratiharikrishna {
            font-family: "Harikrishna";
        }

        .gujaratihitarth {
            font-family: "Hitarth Guj Prachi", "Hitarth Guj Prachi Normal", "Hitarth Guj Preyas", "Hitarth Guj Preyas Normal";
        }

        .gujaratikalakar-guj-9 {
            font-family: "KALAKAR-GUJ-9";
        }

        .gujaratikalapi {
            font-family: "Kalapi", "Kalapi Regular";
        }

        .gujaratikap-127 {
            font-family: "KAP127";
        }

        .gujaratikrishna, .gujaratikrishna-2 {
            font-family: "krishna";
        }

        .gujaratilmg-arun {
            font-family: "LMG-Arun","LMG-Arun Condensed","LMG-Arun Thin","LMG-Arun Wide";
        }

        .gujaratilmg-laxmi {
            font-family: "LMG-Laxmi","LMG-Laxmi Condensed","LMG-Laxmi Thin","LMG-Laxmi Wide";
        }

        .gujaratilmg-manoj {
            font-family: "LMG-Manoj","LMG-Manoj Condensed","LMG-Manoj Thin","LMG-Manoj Wide";
        }

        .gujaratilmg-paras {
            font-family: "LMG-Paras","LMG-Paras Condensed","LMG-Paras Thin","LMG-Paras Wide";
        }

        .gujaratilmg-rupen {
            font-family: "LMG-Rupen","LMG-Rupen Condensed","LMG-Rupen Thin","LMG-Rupen Wide";
        }

        .gujaratimani {
            font-family: "Mani";
        }

        .gujaratimms-chitra {
            font-family: "MMS-CHITRA  BOLD";
        }

        .gujaratimon-guj3 {
            font-family: "Mon_Guj03";
        }

        .gujaratimuni {
            font-family: "Muni";
        }

        .gujaratinayan {
            font-family: "Nayan";
        }

        .gujaratinil {
            font-family: "Nil";
        }

        .gujaratinilkanth {
            font-family: "Nilkanth";
        }

        .gujaratinita {
            font-family: "G_Nita_Lic2SPATEL";
        }

        .gujaratipramukh {
            font-family: "Pramukh";
        }

        .gujaratipragji {
            font-family: "Pragji";
        }

        .gujaratiprompt {
            font-family: "Prompt";
        }

        .gujaratipushti-krishna {
            font-family: "Pushti-Krishna";
        }

        .gujaratisandesh {
            font-family: "Sandesh";
        }

        .gujaratisaral {
            font-family: "Gujrati Saral-2";
        }

        .gujaratisarika {
            font-family: "G_Sarika_Lic2SPATEL";
        }

        .gujaratishefali {
            font-family: "G-Shefali Licensed2YP","G-Shefali Pankaj Shah";
        }

        .gujaratishirshak {
            font-family: "Shirshak";
        }

        .gujaratishreeguj-763 {
            font-family: "Shree-Guj-0763";
        }

        .gujaratishreeguj-768 {
            font-family: "Shree-Guj-0768W";
        }

        .gujaratishreeguj-7769 {
            font-family: "Shree-Guj7-0769";
        }

        .gujaratisms-aloktwo {
            font-family: "SMS AlokTwo";
        }

        .gujaratisms-maruti {
            font-family: "SMS Maruti";
        }

        .gujaratisuchitra {
            font-family: "Suchitra";
        }

        .gujaratisugam {
            font-family: "Sugam";
        }

        .gujaratisulekh {
            font-family: "Guj_Simple_Normal_SULEKH";
        }

        .gujaratiterafont-akash {
            font-family: "TERAFONT-AAKASH";
        }

        .gujaratiterafont-chandan {
            font-family: "TERAFONT-CHANDAN";
        }

        .gujaratiterafont-kinnari {
            font-family: "TERAFONT-KINNARI";
        }

        .gujaratiterafont-trilochan {
            font-family: "TERAFONT-TRILOCHAN";
        }

        .gujaratiterafont-varun {
            font-family: "TERAFONT-VARUN";
        }

        .gujarativakil {
            font-family: "Vakil_01";
        }

        .gujarativdggj {
            font-family: "VDGGJ";
        }

        .gujarativijaya {
            font-family: "Vijaya";
        }

        .gujarativirag-b {
            font-family: "ViragB";
        }

        .gujaratiyogi {
            font-family: "Yogi";
        }

        /* Hindi fonts */
        .hindiaditi, .marathiaditi {
            font-family: "A_Aditi";
        }

        .hindiagra, .marathiagra {
            font-family: "Agra";
        }

        .hindiajay, .marathiajay {
            font-family: "Ajay Normal";
        }

        .hindiakhil, .marathiakhil {
            font-family: "A_Akhil";
        }

        .hindiakruti-dev-priya, .marathiakruti-dev-priya {
            font-family: "AkrutiDevPriya";
        }

        .hindiaman, .marathiaman {
            font-family: "Aman";
        }

        .hindiamar, .marathiamar {
            font-family: "AmrHindi";
        }

        .hindiamar-ujala, .marathiamar-ujala {
            font-family: "Amar Ujala";
        }

        .hindiamit, .marathiamit {
            font-family: "Amit-Normal";
        }

        .hindiankit, .marathiankit {
            font-family: "Ankit";
        }

        .hindianmol, .marathianmol {
            font-family: "AnmolHindi";
        }

        .hindiannapurna, .marathiannapurna {
            font-family: "Annapurna";
        }

        .hindianubhuti, .marathianubhuti {
            font-family: "A_Anubhuti";
        }

        .hindiaps-dv-prakash, .marathiaps-dv-prakash {
            font-family: "APS-DV-Prakash";
        }

        .hindiaps-dv-pratima, .marathiaps-dv-pratima {
            font-family: "APS-DV-Pratima";
        }

        .hindiaps-dv-priyanka, .marathiaps-dv-priyanka {
            font-family: "APS-DV-Priyanka";
        }

        .hindiaps-dv-rashmi, .marathiaps-dv-rashmi {
            font-family: "APS-DV-RASHMI";
        }

        .hindiarjun, .marathiarjun {
            font-family: "Arjun";
        }

        .hindiaryan-2, .marathiaryan-2 {
            font-family: "Aryan2";
        }

        .hindiaseem, .marathiaseem {
            font-family: "A_Aseem";
        }

        .hindiatam, .marathiatam {
            font-family: "AtamHindi";
        }

        .hindiatmadharma, .marathiatmadharma {
            font-family: "AtmaDharma Hindi";
        }

        .hindib-bharati-kautilya, .marathib-bharati-kautilya {
            font-family: "B Bharati Kautilya";
        }

        .hindib-bharati-sahaj-two, .marathib-bharati-sahaj-two {
            font-family: "SahajTwo", "B Bharati SahajTwo";
        }

        .hindib-bharati-sangam-two, .marathib-bharati-sangam-two {
            font-family: "SangamTwo", "B Bharati SangamTwo";
        }

        .hindib-bharati-shweta-two, .marathib-bharati-shweta-two {
            font-family: "ShwetaTwo", "B Bharati ShwetaTwo";
        }

        .hindibharatvani, .marathibharatvani {
            font-family: "BharatVani";
        }

        .hindibhaskar, .marathibhaskar {
            font-family: "Bhaskar";
        }

        .hindichanakya, .marathichanakya {
            font-family: "Chanakya";
        }

        .hindidevlys-010, .marathidevlys-010 {
            font-family: "DevLys 010";
        }

        .hindidevlys-020, .marathidevlys-020 {
            font-family: "DevLys 020";
        }

        .hindidevlys-030, .marathidevlys-030 {
            font-family: "DevLys 030";
        }

        .hindidipti-019 {
            font-family: "Dipti 019";
        }

        .hindidv-divya, .marathidv-divya {
            font-family: "DV_Divya";
        }

        .hindidv-me-shree-0701, .marathidv-me-shree-0701 {
            font-family: "DV_ME_Shree0701";
        }

        .hindidv-divya-e, .marathidv-divya-e {
            font-family: "DV_Divyae";
        }

        .hindidv-tt-ganesh, .marathidv-tt-ganesh {
            font-family: "DV-TTGanesh";
        }

        .hindidv-tt-surekh, .marathidv-tt-surekh {
            font-family: "DV-TTSurekh";
        }

        .hindidv-tt-yogesh, .marathidv-tt-yogesh {
            font-family: "DV-TTYogesh";
        }

        .hindidvb-tt-yogesh-en, .marathidvb-tt-yogesh-en {
            font-family: DVB-TTYogeshEN;
        }

        .hindidvw-tt-surekh, .marathidvw-tt-surekh {
            font-family: "DVW-TTSurekh";
        }

        .hindihemant, .marathihemant {
            font-family: "Hemant";
        }

        .hindihtchanakya, .marathihtchanakya {
            font-family: "HTChanakya";
        }

        .hindijagran, .marathijagran {
            font-family: "Jagran";
        }

        .hindikautilya, .marathikautilya {
            font-family: "Kautilya";
        }

        .hindikrishna, .marathikrishna {
            font-family: "Krishna";
        }

        .hindikrutidev, .marathikrutidev {
            font-family: "Kruti Dev 010";
        }

        .hindikundli, .marathikundli {
            font-family: 'Kundli A';
        }

        .hindiliza, .marathiliza {
            font-family: "Liza";
        }

        .hindimarathi-kanak, .marathimarathi-kanak {
            font-family: "Marathi-Kanak";
        }

        .hindimarathi-lekhani, .marathimarathi-lekhani {
            font-family: "Marathi-Lekhani";
        }

        .hindimarathi-roupya, .marathimarathi-roupya {
            font-family: "Marathi-Roupya";
        }

        .hindimarathi-saras, .marathimarathi-saras {
            font-family: "Marathi-Saras";
        }

        .hindimarathi-sharada, .marathimarathi-sharada {
            font-family: "Marathi Sharada";
        }

        .hindimarathi-tirkas, .marathimarathi-tirkas {
            font-family: "Marathi Tirkas";
        }

        .hindimarathi-vakra, .marathimarathi-vakra {
            font-family: "Marathi-Vakra";
        }

        .hindimillennium-aditya, .marathimillennium-aditya {
            font-family: "MillenniumAditya";
        }

        .hindimillennium-ameya, .marathimillennium-ameya {
            font-family: "MillenniumAmeya";
        }

        .hindinew-delhi, .marathinew-delhi {
            font-family: "NewDelhi";
        }

        .hindipushti-mohan, .marathipushti-mohan {
            font-family: "Pushti-Mohan";
        }

        .hindiricha, .marathiricha {
            font-family: "Richa";
        }

        .hindisaral, .marathisaral {
            font-family: "Hindi Saral-1", "Hindi Saral-2", "Hindi Saral-3", "Hindi Saral-4";
        }

        .hindishivaji-01, .marathishivaji-01, .hindishivaji-01-2, .marathishivaji-01-2 {
            font-family: "Shivaji01","Shivaji05","Shivaji02";
        }

        .hindishivaji-02, .marathishivaji-02, .hindishivaji-02-2, .marathishivaji-02-2 {
            font-family: "Shivaji02","Shivaji05","Shivaji01";
        }

        .hindishivaji-05, .marathishivaji-05, .hindishivaji-05-2, .marathishivaji-05-2 {
            font-family: "Shivaji05","Shivaji02","Shivaji01";
        }

        .hindishusha, .marathishusha {
            font-family: "Shusha","Shusha05","Shusha02";
        }

        .hindishusha-02, .marathishusha-02 {
            font-family: "Shusha02","Shusha05","Shusha";
        }

        .hindishusha-05, .marathishusha-05 {
            font-family: "Shusha05","Shusha02","Shusha";
        }

        .hindishree-dev-0708, .marathishree-dev-0708 {
            font-family: "SHREE-DEV-0708";
        }

        .hindishree-dev7-0708-e, .marathishree-dev7-0708-e {
            font-family: "SHREE-DEV7-0708E";
        }

        .hindishree-dev-0709, .marathishree-dev-0709 {
            font-family: "SHREE-DEV-0709";
        }

        .hindishree-dev-0714, .marathishree-dev-0714 {
            font-family: "Shree-Dev-0714";
        }

        .hindishree-dev-0714-2, .marathishree-dev-0714-2 {
            font-family: "SHREE-DEV-0714";
        }

        .hindisubak, .marathisubak {
            font-family: "SUBAK";
        }

        .hindiwalkman-chanakya-905, .marathiwalkman-chanakya-905 {
            font-family: "Walkman-Chanakya-905","Walkman-Chanakya-902";
        }

        .hindiyogesh-web, .marathiyogesh-web {
            font-family: "Yogeshweb";
        }

        /* nepali fonts */
        .nepalianuradha {
            font-family: "Anuradha";
        }

        .nepalibahun {
            font-family: "Bahun";
        }

        .nepalibahunbad {
            font-family: "Bahunbad";
        }

        .nepalichandrodaya {
            font-family: "Chandrodaya";
        }

        .nepalicv-maya {
            font-family: "CV Maya";
        }

        .nepalicv-nepali-fancy {
            font-family: "CV Nepali Fancy";
        }

        .nepalidev {
            font-family: "Dev";
        }

        .nepaligadha {
            font-family: "Gadha";
        }

        .nepalihimal {
            font-family: "Himal";
        }

        .nepalihimali {
            font-family: "Himali";
        }

        .nepalijagahimali {
            font-family: "Jagahimali";
        }

        .nepalimaiya {
            font-family: "Maiya";
        }

        .nepalinarayan {
            font-family: "Narayan 1";
        }

        .nepalinavjeevan {
            font-family: "Navjeevan";
        }

        .nepalinepali {
            font-family: "Nepali";
        }

        .nepalineptimes {
            font-family: "Neptimes";
        }

        .nepalipagal {
            font-family: "Pagal";
        }

        .nepalipagali {
            font-family: "Pagali";
        }

        .nepalipari {
            font-family: "Pari";
        }

        .nepalipreeti {
            font-family: "Preeti";
        }

        .nepalipriyatam {
            font-family: "Priyatam";
        }

        .nepalipunmaya {
            font-family: "Punmaya";
        }

        .nepaliramsham {
            font-family: "Ramsham";
        }

        .nepaliritu {
            font-family: "Ritu";
        }

        .nepalirukmini {
            font-family: "Rukmini";
        }

        .nepalisarashoti {
            font-family: "Sarashoti";
        }

        .nepalishangrila-hybrid {
            font-family: "Shangrila Hybrid";
        }

        .nepalishangrila-numeric {
            font-family: "Shangrila Numeric";
        }

        .nepalisuryodaya {
            font-family: "Suryodaya";
        }
    </style>
    
<script type="text/javascript" src="master/js/master.js"></script>

  <%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>

<%-- <%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>  --%>


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

						<s:form action="addleavinginfoCertificate" theme="simple">
							<div class="nondani-content">

								<div class="row" style="margin-left: 25%;">
									<div class="col-md-1">
										<label style="font-size: large;">&#2360;&#2344; : </label>
									</div>
									<div class="col-md-2">
										<s:textfield  name="academicyr" cssClass="form-control"
											id="academicyr"/>
									</div>
								</div>

								<div class="row" style="margin-top: 1%;">
									<div class="col-md-3">
										<label>&#2332;&#2344;&#2352;&#2354;
											&#2352;&#2332;&#2367;&#2360;&#2381;&#2335;&#2352;
											&#2325;&#2381;&#2352;&#2350;&#2366;&#2306;&#2325;</label>
										<s:textfield cssClass="form-control" id="register_number"
											name="register_number" />
									</div>
									<div class="col-md-3">
										<label>&#2360;&#2381;&#2335;&#2369;&#2337;&#2306;&#2335;
											. &#2310;&#2351; . &#2337;&#2368;</label>
										<s:textfield cssClass="form-control" id="studentid"
											name="studentid" />
									</div>
									<div class="col-md-3">
										<label>&#2351;&#2369; . &#2310;&#2351; .
											&#2337;&#2368;</label>
										<s:textfield cssClass="form-control" id="uid" name="uid" />
									</div>
									<div class="col-md-3">
										<label>&#2357;&#2367;&#2342;&#2381;&#2351;&#2366;&#2352;&#2381;&#2341;&#2381;&#2351;&#2366;&#2306;&#2330;&#2375;
											&#2344;&#2366;&#2357; </label>
										<s:textfield cssClass="form-control" id="studentname"
											name="studentname" />
									</div>
								</div>
								<div class="row contentspace">

									<div class="col-md-3">
										<label>&#2310;&#2337;&#2344;&#2366;&#2357; </label>
										<s:textfield cssClass="form-control" id="lastname"
											name="lastname" />
									</div>
									<div class="col-md-3">
										<label>&#2357;&#2337;&#2367;&#2354;&#2366;&#2306;&#2330;&#2375;
											&#2344;&#2366;&#2357; </label>
										<s:textfield cssClass="form-control" id="fathername"
											name="fathername" />
									</div>
									<div class="col-md-3">
										<label>&#2310;&#2312;&#2330;&#2375;
											&#2344;&#2366;&#2357; </label>
										<s:textfield cssClass="form-control" id="mothername"
											name="mothername" />
									</div>
									<div class="col-md-3">
										<label>&#2352;&#2366;&#2359;&#2381;&#2335;&#2381;&#2352;&#2368;&#2351;&#2340;&#2381;&#2357;
										</label>
										<s:textfield cssClass="form-control" id="nationality"
											name="nationality" />
									</div>
									<div class="col-md-3">

										<label>&#2350;&#2366;&#2340;&#2371;&#2349;&#2366;&#2359;&#2366;
										</label>
										<s:textfield cssClass="form-control" id="mothertongue"
											name="mothertongue" />
									</div>
									<div class="col-md-3">
										<label>&#2343;&#2352;&#2381;&#2350; <sup>*</sup></label>
										<s:textfield cssClass="form-control" id="religion"
											name="religion" />
									</div>
									<div class="col-md-3">
										<label>&#2332;&#2366;&#2340; <sup>*</sup></label>
										<s:textfield cssClass="form-control" id="cast" name="cast" />
									</div>
									<div class="col-md-3">
										<label>&#2346;&#2379;&#2335;&#2332;&#2366;&#2340; <sup>*</sup></label>
										<s:textfield cssClass="form-control" id="subcast"
											name="subcast" />
									</div>
									<div class="col-md-3">
										<label>&#2332;&#2344;&#2381;&#2350;&#2360;&#2381;&#2341;&#2337;<sup>*</sup></label>
										<s:textfield cssClass="form-control" id="birthplace"
											name="birthplace" />
									</div>
									<div class="col-md-3">
										<label>&#2340;&#2366;&#2354;&#2369;&#2325;&#2366; <sup>*</sup></label>
										<s:textfield cssClass="form-control" id="taluka" name="taluka" />
									</div>
									<div class="col-md-3">
										<label>&#2332;&#2367;&#2354;&#2381;&#2361;&#2366; <sup>*</sup></label>
										<s:textfield cssClass="form-control" id="district"
											name="district" />
									</div>
									<div class="col-md-3">
										<label>&#2352;&#2366;&#2332;&#2381;&#2351; <sup>*</sup>
										</label>
										<s:textfield cssClass="form-control" id="nation" name="nation" />
									</div>
									<div class="col-md-3">
										<label>&#2342;&#2375;&#2358; <sup>*</sup></label>
										<s:textfield cssClass="form-control" id="country"
											name="country" />
									</div>
									<div class="col-md-3">
										<label>&#2332;&#2344;&#2381;&#2350;&#2342;&#2367;&#2344;&#2366;&#2306;&#2325;
											<span class="required">*</span>
										</label>
										<s:textfield cssClass="form-control col-md-7 col-xs-12"
											id="dob" name="dob" />
									</div>
									<div class="col-md-3">
										<label>&#2332;&#2344;&#2381;&#2350;&#2342;&#2367;&#2344;&#2366;&#2306;&#2325;
											&#2309;&#2325;&#2381;&#2359;&#2352;&#2368; <sup>*</sup>
										</label>
										<s:textfield cssClass="form-control col-md-7 col-xs-12"
											id="dob_letters" name="dob_letters" />
									</div>

									<div class="col-md-3">
										<label for="name"> &#2351;&#2366;
											&#2346;&#2370;&#2352;&#2381;&#2357;&#2368;&#2330;&#2368;
											&#2358;&#2366;&#2337;&#2366; &#2357;
											&#2311;&#2351;&#2340;&#2381;&#2340;&#2366; <span
											class="required">*</span>
										</label>
										<s:textfield cssClass="form-control col-md-7 col-xs-12"
											id="preschool" name="preschool" />
									</div>

									<div class="col-md-3">
										<label> &#2346;&#2381;&#2352;&#2357;&#2375;&#2358;
											&#2342;&#2367;&#2344;&#2366;&#2306;&#2325; <span
											class="required">*</span>
										</label>
										<s:textfield cssClass="form-control" id="admissiondate"
											name="admissiondate" placeholder="admissiondate" />
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
										<s:textfield cssClass="form-control col-md-7 col-xs-12"
											id="prestandard" name="prestandard" />
									</div>

									<div class="col-md-3">
										<label for="name">
											&#2309;&#2349;&#2381;&#2351;&#2366;&#2360;&#2366;&#2340;&#2368;&#2354;
											&#2346;&#2381;&#2352;&#2327;&#2340;&#2367; <span
											class="required">*</span>
										</label>
										<s:textfield cssClass="form-control col-md-7 col-xs-12"
											id="progress" name="progress" />
									</div>
									<div class="col-md-3">
										<label for="name">
											&#2357;&#2352;&#2381;&#2340;&#2339;&#2370;&#2325; <span
											class="required">*</span>
										</label>
										<s:textfield cssClass="form-control col-md-7 col-xs-12"
											id="behavior" name="behavior" />
									</div>
									<div class="col-md-3">
										<label for="name"> &#2358;&#2366;&#2337;&#2366;
											&#2360;&#2379;&#2337;&#2339;&#2381;&#2351;&#2366;&#2330;&#2375;
											&#2325;&#2366;&#2352;&#2339; <span class="required">*</span>
										</label>
										<s:textfield cssClass="form-control col-md-7 col-xs-12"
											id="reasonofleaving" name="reasonofleaving" />
									</div>

									<div class="col-md-3">
										<label> &#2358;&#2375;&#2352;&#2366;  <span
											class="required">*</span>
										</label>
										<s:textfield cssClass="form-control col-md-7 col-xs-12"
											id="shera" name="shera" />
									</div>

									<div class="col-md-3">
										<label> &#2358;&#2366;&#2355;&#2366;
											&#2360;&#2379;&#2337;&#2354;&#2381;&#2351;&#2366;&#2330;&#2366;
											&#2342;&#2367;&#2344;&#2366;&#2306;&#2325; <span
											class="required">*</span>
										</label>
										<s:textfield cssClass="form-control" id="leavingdate"
											name="leavingdate" />
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