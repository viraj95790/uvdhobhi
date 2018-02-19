<%@ taglib uri="/struts-tags" prefix="s"%>

    <script type="text/javascript" src="register/js/productCateloge.js"></script>

  
  
 <script>

  $(document).ready(function() {

		$("#pickup_date").datepicker({

			dateFormat : 'dd/mm/yy',
			//yearRange: yearrange,
			minDate : '30/12/1880',
			changeMonth : true,
			changeYear : true

		});

		$("#deliver_date").datepicker({

			dateFormat : 'dd/mm/yy',
			//yearRange: yearrange,
			minDate : '30/12/1880',
			changeMonth : true,
			changeYear : true

		});

	}); 
 
</script>

<s:form action="cartinvoiceService" id="servicefrm" theme="simple">

<!-- Begin Content Discover App -->
    <section class="section-content section-drawing bg-gray-light border-bottom p-t-60 p-b-0">
        <div class="container" style="padding-bottom: 30px;">
            <div class="row">
              
                
                <div class="col-md-9">
                    <h3 class="section-title">Service Form</h3>
                    <div class="cmsmasters_featured_block">
                        <div class="featured_block_inner bacset">
                            <form>
                            
                                    <div class="form-group fomgese">
                                    <label for="pwd">Enter pincode & select vendor</label>
                                    <div class="col-lg-12 col-md-12" style="padding:0px;">
                                        <div class="col-lg-3 col-md-3" style="padding-left:0px;">
                                           
                                            <input onchange="showVendorList(this.value)" type="text" placeholder="Enter Pincode" name="pincode" id="pincode" class="form-control"/>
                                        </div>
                                        <div class="col-lg-3 col-md-3" id="vendorlistdiv">
                                              <select name="vendor" id="vendor" class="form-control">
                                                <option value="Select Cloth">Select Vendor</option>
                                            </select>
                                        </div>
                                        <div class="col-lg-3 col-md-3">
                                             
                                        </div>
                                        <div class="col-lg-3 col-md-3">
                                             
                                        </div>
                                    </div>
                                </div>
                            
                            
                                
                                <div class="form-group fomgese">
                                    <label for="pwd">Select The Item</label>
                                    <div class="col-lg-12 col-md-12" style="padding:0px;">
                                    <div class="col-lg-2 col-md-2" style="padding-left:0px;">
                                           <s:select  id="serviceid" name="services" list="serviceList" listKey="id" listValue="services" 
                                           headerKey="0" headerValue="Select Service" 
                                                            onchange="setitemcategory(this.value)"  cssClass="form-control">
                                   </s:select>
                                            
                                            
                                        </div>
                                        <div class="col-lg-2 col-md-2" id="itemdivid" style="padding-left:0px;">
                                            <%-- <select name="pickup_time" class="form-control">
                                                <option value="Select Cloth">Select All</option>
                                                <option value="Mens Wear">Mens Wear</option>
                                                <option value="Women Wear">Women Wear</option>
                                                <option value="Winter Wear">Winter Wear</option>
                                                <option value="Kids Wear">Kids Wear</option>
                                                <option value="Party Wear">Party Wear</option>
                                                <option value="Soft Toys">Soft Toys</option>
                                                <option value="Home Care" selected="">Home Care</option>
                                            </select> --%>
                                            
                                            <select id="id" name="item" onchange="setItemAjax(this.value)" class="form-control">
											      <option value="0">Select Category</option>
												</select>
                                        </div>
                                        <div class="col-lg-2 col-md-2" id="subitemdivid">
                                             <%-- <select name="pickup_time" class="form-control">
                                                <option value="Select Cloth">Select Cloth</option>
                                                <option value="">Bath Towel</option>
                                                <option value="" selected="">Bed Sheet</option>
                                                <option value="">Blanket</option>
                                                <option value="">Quilt / Heavy Blanket</option>
                                                <option value="">Curtain-Small</option>
                                                <option value="">Curtain-Big</option>
                                                <option value="">Pillow/Cushion-covers</option>
                                                <option value="">Sofa-cover</option>
                                                <option value="">Pillow</option>
                                                <option value="">Carpet/sq.ft</option>
                                                <option value="">Doormat</option>
                                                <option value="">Floormat</option>
                                            </select> --%>
                                            
                                            <select id="subitemid" name="subitem" class="form-control" onclick="setpriceAjax()">
                                                       <option value="0">Select subItem</option>
                                            </select>
                                        </div>
                                        <div class="col-lg-2 col-md-2" style="padding-right:0px;">
                                           <%--  <select ame="qty" class="pickup_date form-control">
                                                <option value="" class="washfold">Select Qty</option>
                                                <option>1</option>
                                                <option>2</option>
                                            </select>  --%>
                                            
                                            <input type="number" value="1" name="qty" id="qty" onchange="setpriceAjax()" class="form-control"/>
                                        </div>
                                        <div class="col-lg-2 col-md-2" style="padding-right:0px;">
                                           <%--  <select ame="qty" class="pickup_date form-control">
                                                <option value="" class="washfold">Select Qty</option>
                                                <option>1</option>
                                                <option>2</option>
                                            </select>  --%>
                                            
                                           <a href="#0" class="cd-add-to-cart btn btn-primary" data-price="25.99" type="button" onclick="addlaundrycartAjax()" style="margin: 0px;margin-top: 13px;"><i class="fa fa-plus" aria-hidden="true"></i></a>
                                        </div>
                                        <div class="col-lg-2 col-md-2 rupeeper" id="priceid">
                                           <span class="costperitem" id="priceiddiv"></span> 
                                        </div>
                                    </div>
                                </div>
                                 <div class="form-group">
                                 	 <div class="col-lg-12 col-md-12" style="padding:0px;padding-bottom:15px;">
                                 	 	<small class="smalltextpick">Please select the pickup and delivery date/time as per your convenience & we will work our best to match it.</small>
                                 	 </div>
                                 
                                 </div>
                                <div class="form-group fomgese">
                                    <label for="email">Pickup Date/Time</label>
                                    <div class="col-lg-12 col-md-12" style="padding:0px;">
                                        <div class="col-lg-3" style="padding-left: 0px;">
                                            <%-- <select name="pickup_date" class="pickup_date form-control">
                                                <option value="2016-06-16">Today (02 Feb 17)</option>
                                                <option value="2016-06-17">Tomorrow (03 Jun 17)</option>
                                                <option value="2016-06-18">Day After (Saturday (04 Jun 17)</option>
                                                <option value="2016-06-19">Sunday (05 Jun 17)</option>
                                            </select> --%>
                                            
                                          <s:textfield id="pickup_date" name="pickup_date" cssClass="form-control" theme="simple"></s:textfield>
                                            <a class="btn btn-link asec hidden" data-toggle="collapse" href="#slectdate" aria-expanded="false" aria-controls="slectdate" style="padding: 0px;">
                                                Select Date Manually
                                            </a>
                                            <div class="collapse" id="slectdate">
                                                <form id="dateRangeForm" method="post" class="form-horizontal">
                                                    <div class="form-group">
                                                        <div class="col-xs-12 date">
                                                            <div class="input-group input-append date datedisplay" id="dateRangePicker">
                                                                <input type="text" class="form-control" name="date" placeholder="Select date manually">
                                                                <span class="input-group-addon add-on"><i class="fa fa-calendar calicon" aria-hidden="true"></i></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                        <div class="col-lg-3" style="padding-right: 0px;">
                                            <%-- <select name="pickup_time" class="form-control">
                                                <option value="Morning (9:00 am to 11:00 am)">Morning (9:00 am to 11:00 am)</option>
                                                <option value="Noon (11:00 am to 1:00 pm)" selected="">Noon (11:00 am to 1:00 pm)</option>
                                                <option value="Evening (4:00 pm to 7:00 pm)">Evening (4:00 pm to 7:00 pm)</option>
                                                <option value="Late Evening (after 8:00 pm)">Late Evening (after 8:00 pm)</option>
                                            </select> --%>
                                            
                                            <s:if test="%{#pickupTimeList != 'null'}"/>
											<s:select id="ptime" name="ptime" list="pickupTimeList"
												theme="simple" cssClass="form-control showToolTip chosen-select"
												title="Select Pickup Time" />
                                        </div>
										<div class="col-lg-3 col-md-3">
                                             
                                        </div>
                                        <div class="col-lg-3 col-md-3">
                                             
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group fomgese">
                                    <label for="email"> Delivery Date/Time</label>
                                    <div class="col-lg-12 col-md-12" style="padding:0px;">
                                        <div class="col-lg-3" style="padding-left: 0px;">
                                            <%-- <select name="pickup_date" class="pickup_date form-control">
                                                <option value="2016-06-16">Today (02 Feb 17)</option>
                                                <option value="2016-06-17">Tomorrow (03 Jun 17)</option>
                                                <option value="2016-06-18">Day After (Saturday (04 Jun 17)</option>
                                                <option value="2016-06-19">Sunday (05 Jun 17)</option>
                                            </select> --%>
                                            
                                            <s:textfield id="deliver_date" name="deliver_date" cssClass="form-control" theme="simple"></s:textfield>

                                        </div>
                                        <div class="col-lg-3" style="padding-right: 0px;">
                                            <%-- <select name="pickup_time" class="form-control">
                                                <option value="Morning (9:00 am to 11:00 am)">Morning (9:00 am to 11:00 am)</option>
                                                <option value="Noon (11:00 am to 1:00 pm)" selected="">Noon (11:00 am to 1:00 pm)</option>
                                                <option value="Evening (4:00 pm to 7:00 pm)">Evening (4:00 pm to 7:00 pm)</option>
                                                <option value="Late Evening (after 8:00 pm)">Late Evening (after 8:00 pm)</option>
                                            </select> --%>
                                            
                                            <s:if test="%{#deliverTimeList != 'null'}"/>
											<s:select id="dtime" name="dtime" list="deliverTimeList"
												theme="simple" cssClass="form-control showToolTip chosen-select"
												title="Select Deliver Time" />
                                        </div>
                                        <div class="col-lg-3 col-md-3">
                                             
                                        </div>
                                        <div class="col-lg-3 col-md-3">
                                             
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group text-right">
                                     
                                    <!-- <button id="send" type="button" onclick="addlaundrycartAjax()" class="cd-add-to-cart btn btn-primary">Add To Cart</button> -->
                                </div>
                                
                            </form>
                         
                        </div>
                    </div>
                </div>
                <div class="col-md-3 text-left features-list padbot50">
                    <h3 class="section-title">Affordable Prices</h3><!--
                    
                     <div class="col-lg-12 col-md-12 col-xs-12" style="padding:0px;">
                        <img src="images/washinmachinewall.jpg" class="img-responsive" />
                    </div>
                    --><div class="col-lg-12 col-md-12 col-xs-12 imgepadtop">
                    <ul>
                    	<li>
                    		<div class="media animated" data-animation="fadeIn" data-animation-delay="300">
                                <div class="c-primary">
                                    <img src="images/set1.png" class="img-responsive afforimg" />
                                </div>
                                <div class="media-body" style="text-align:center">
                                    <h5 class="media-heading c-dark">From Rs.50 Per shirt</h5>
                                    <p>Shirt Service</p>
                                </div>
                            </div>
                    	</li>
                    	<li>
                    		<div class="media animated" data-animation="fadeIn" data-animation-delay="600">
                                <div class="c-primary">
                                    <img src="images/set2.png" class="img-responsive afforimg" />
                                </div>
                                <div class="media-body" style="text-align:center">
                                    <h5 class="media-heading c-dark">Rs.20 Per Kg</h5>
                                    <p>Laundry Sevice</p>
                                </div>
                            </div>
                    	</li>
                    	<li>
                    		<div class="media animated" data-animation="fadeIn" data-animation-delay="900">
                                <div class="c-primary">
                                    <img src="images/set3.png" class="img-responsive afforimg" />
                                </div>
                                <div class="media-body" style="text-align:center">
                                    <h5 class="media-heading c-dark">From Rs.25 Per Item</h5>
                                    <p>Dry Cleaning</p>
                                </div>
                            </div>
                    	</li>
                    </ul>
                        
                    </div>
                  
                </div>
            </div>
        </div>
    </section>
    <!-- End Content Discover App -->
    
     <!-- Begin Call to Action Contact -->
    <section class="section-call-action action-sm bg-dark" style="background-color: #32c6f4;">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <h2 style="color: #555;">Free pickup and delivery for all orders above Rs. 500.</h2>
                </div>
                <div class="col-md-4 text-right m-t-0 hidden">
                    <a href="#" class="btn btn-white btn-rounded hover-effect m-b-0">Book a pickup</a>
                </div>
            </div>
        </div>
    </section>
    <!-- End Call to Action Contact -->
    
      <!-- Begin  Logo List -->
    <section class="section-content clearfix p-t-30 bg-gray-light">
        <div class="container">
            <div class="row">
                <div class="center m-b-30 hidden">
                    <h3>Our elaundry have already <span class="rotate-text" data-plugin-options='{"speed": 2000}'>Passion, Innovation, Laundry</span> Yes, Laundry.</h3>
                    <h4 class="p-b-20">Use one of our premade pages or build your customized page in minuts.</h4>
                </div>
                <figure>
                    <div class="owl-carousel icon-carousel" data-plugin-options='{"items": 6, "singleItem": false}'>
                        <div class="item">
                            <img src="images/client.png" alt="logo1">
                        </div>
                        <div class="item">
                            <img src="images/client.png" alt="logo2">
                        </div>
                        <div class="item">
                            <img src="images/client.png" alt="logo3">
                        </div>
                        <div class="item">
                            <img src="images/client.png" alt="logo5">
                        </div>
                        <div class="item">
                            <img src="images/client.png" alt="logo6">
                        </div>
                        <div class="item">
                            <img src="images/client.png" alt="logo1">
                        </div>
                        <div class="item">
                            <img src="images/client.png" alt="logo2">
                        </div>
                        <div class="item">
                            <img src="images/client.png" alt="logo3">
                        </div>
                        <div class="item">
                            <img src="images/client.png" alt="logo5">
                        </div>
                        <div class="item">
                            <img src="images/client.png" alt="logo6">
                        </div>
                    </div>
                </figure>
            </div>
        </div>
    </section>
    <!--End  Logo List -->
   
      <div class="cd-cart-container empty">
        <a href="#0" class="cd-cart-trigger">
            Cart
            <ul class="count">
                <!-- cart items count -->
                <li>0</li>
                <li>0</li>
            </ul> <!-- .count -->
        </a>
        <div class="cd-cart">
            <div class="wrapper">
                <header>
                    <h2 style="line-height: 0px;">Cart</h2>
                    <span class="undo">Item removed. <a href="#0">Undo</a></span>
                </header>

                <div class="body">
                    <ul>
                        <!-- products added to the cart will be inserted here using JavaScript -->
                    </ul>
                </div>
                <footer>
                	
                   		 <a href="#" onclick="savecartform()" class="checkout btn"><em>Checkout -  <span id="chkoutamtid">0</span></em></a>
                </footer>
            </div>
        </div> <!-- .cd-cart -->
    </div> <!-- cd-cart-container -->
    </s:form>
    
 
    
