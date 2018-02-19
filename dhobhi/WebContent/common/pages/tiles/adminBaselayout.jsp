<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
        <title>DhobhiTech | Best laundry service in nagpur.</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="assets/css/main.css" />
        <link href="assets/plugin/owl.carousel.2.0.0-beta.2.4/assets/owl.carousel.css" rel="stylesheet" />
        <link href="assets/plugin/CaptionHoverEffects/css/component.css" rel="stylesheet" />
        <link href="assets/css/Admincss.css" rel="stylesheet" />

        <!-- Include Bootstrap Datepicker -->
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.min.css" />
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker3.min.css" />

        <link href="assets/plugin/datatables/css/jquery.dataTables.min.css" rel="stylesheet" />
        <link href="assets/plugin/datatables/datatables.bootstrap.min.css" rel="stylesheet" />
        <link href="assets/css/tablecss.css" rel="stylesheet" />

        <script src="assets/plugin/CaptionHoverEffects/js/modernizr.custom.js"></script>
        
        <script type="text/javascript" src="account/js/fullscreen.js"></script>

        <style>
            .panel {
                margin-bottom: 0px;
            }

        </style>
        
       

	</head>





<body id="his" class="appWrapper sidebar-xs-forced">

    <div id="wrap" class="">
        
       <tiles:insertAttribute name="header" />
       <tiles:insertAttribute name="menu" />
       <tiles:insertAttribute name="body" />
        <tiles:insertAttribute name="footer" />
       



    </div>





   
   

    <!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
            <script src="assets/js/bootstrap.min.js"></script>
            <script src="assets/plugin/CaptionHoverEffects/js/toucheffects.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/jquery.scrollzer.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>

            <script src="assets/js/validator.js"></script>

        <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.min.js"></script>
        <!--<script src="assets/js/table-edits.js"></script>-->
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="assets/js/main.js"></script>
          


        <script>
            $('ul.nav li.dropdown').hover(function () {
                $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeIn(500);
            }, function () {
                $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeOut(500);
            });
        </script>

        <script>
            (function ($) {

                'use strict';

                $(document).on('show.bs.tab', '.nav-tabs-responsive [data-toggle="tab"]', function (e) {
                    var $target = $(e.target);
                    var $tabs = $target.closest('.nav-tabs-responsive');
                    var $current = $target.closest('li');
                    var $parent = $current.closest('li.dropdown');
                    $current = $parent.length > 0 ? $parent : $current;
                    var $next = $current.next();
                    var $prev = $current.prev();
                    var updateDropdownMenu = function ($el, position) {
                        $el
                          .find('.dropdown-menu')
                          .removeClass('pull-xs-left pull-xs-center pull-xs-right')
                          .addClass('pull-xs-' + position);
                    };

                    $tabs.find('>li').removeClass('next prev');
                    $prev.addClass('prev');
                    $next.addClass('next');

                    updateDropdownMenu($prev, 'left');
                    updateDropdownMenu($current, 'center');
                    updateDropdownMenu($next, 'right');
                });

            })(jQuery);
        </script>
        <!--<script>
            $(function () {
                var pickers = {};

                $('table tr').editable({
                    dropdowns: {
                        sex: ['Male', 'Female']
                    },
                    edit: function (values) {
                        $(".edit i", this)
                          .removeClass('fa-pencil')
                          .addClass('fa-save')
                          .attr('title', 'Save');

                        pickers[this] = new Pikaday({
                            field: $("td[data-field=birthday] input", this)[0],
                            format: 'MMM D, YYYY'
                        });
                    },
                    save: function (values) {
                        $(".edit i", this)
                          .removeClass('fa-save')
                          .addClass('fa-pencil')
                          .attr('title', 'Edit');

                        if (this in pickers) {
                            pickers[this].destroy();
                            delete pickers[this];
                        }
                    },
                    cancel: function (values) {
                        $(".edit i", this)
                          .removeClass('fa-save')
                          .addClass('fa-pencil')
                          .attr('title', 'Edit');

                        if (this in pickers) {
                            pickers[this].destroy();
                            delete pickers[this];
                        }
                    }
                });
            });
        </script>-->
  <script>
      $(document).ready(function () {
          $('a.toggler').click(function () {
              $(this).toggleClass('off');
          });
      });
  </script>

        <script>
            function OnSelectedIndexChange() {
                if (document.getElementById('search').value == "1") {
                    location.href = "Admin_Maindashboard.html";
                }
                if (document.getElementById('search').value == "2") {
                    location.href = "Admin_Delcobooking.html";
                }
            }
        </script>
        <script>
            $(document).ready(function () {
                $('#dateRangePicker')
                    .datepicker({
                        format: 'dd/mm/yyyy',
                        startDate: '01/01/2010',
                        endDate: '30/12/2020'
                    })
                    .on('changeDate', function (e) {
                        // Revalidate the date field
                        $('#dateRangeForm').formValidation('revalidateField', 'date');
                    });
            });
        </script>

        <script>
            $('#accordion1').on('shown.bs.collapse', function () {
                $("#package1 i.indicator").removeClass("<i class='fa fa-chevron-circle-up' aria-hidden='true'></i>").addClass("<i class='fa fa-chevron-circle-down' aria-hidden='true'></i>");
            });
            $('#accordion1').on('hidden.bs.collapse', function () {
                $("#package1 i.indicator").removeClass("<i class='fa fa-chevron-circle-down' aria-hidden='true'></i>").addClass("<i class='fa fa-chevron-circle-up' aria-hidden='true'></i>");
            });

            $('#accordion2').on('shown.bs.collapse', function () {
                $("#package2 i.indicator").removeClass("<i class='fa fa-chevron-circle-up' aria-hidden='true'></i>").addClass("<i class='fa fa-chevron-circle-down' aria-hidden='true'></i>");
            });
            $('#accordion2').on('hidden.bs.collapse', function () {
                $("#package2 i.indicator").removeClass("<i class='fa fa-chevron-circle-down' aria-hidden='true'></i>").addClass("<i class='fa fa-chevron-circle-up' aria-hidden='true'></i>");
            });
        </script>

        <script>
            function myFunction() {
                alert("Are you sure to cancel Booking!");
            }
        </script>


</body>
</html>


  