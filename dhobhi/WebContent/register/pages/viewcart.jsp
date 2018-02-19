 <%@ taglib uri="/struts-tags" prefix="s" %>
 
 <!-- Begin Services 3 columns 1 row -->
    <section class="section-services services-wrap ov-hidden bactopset">
            <img src="images/goinitiative.jpg" class="img-responsive" />
    </section>
    <!-- End Services 3 columns 1 row -->

   <script src="register/js/productCateloge.js" ></script>
   
<style>
.bactopset {
    padding-top: 60px;
}
</style>

    <!-- Begin Content Discover App -->
    <section class="section-content section-drawing bg-gray-light border-bottom p-t-60 p-b-0">
        <div class="container" style="padding-bottom: 30px;">
            <div class="row">
                <h3 class="section-title">Your Cart - Summery</h3>
                <div class="col-lg-5 col-sm-5 col-md-5 formregn">
		          <s:iterator value="custinfo">
                    <div class="paypanel text-left">
                        <h1><small>step #1</small>Cutomer Details </h1>
                        <p class="cartfont"><s:property value="name"/></p>
                        <p class="cartfont"><s:property value="mobile"/></p>
                        <p class="cartfont"><s:property value="email"/></p>
                        <p class="cartfont"><s:property value="address"/> </p>
                    </div>
                    </s:iterator>
                    <div class="paypanel text-left martop25piccart">
                        <h1><small>step #2</small>Pickup &amp; Delivery Time &nbsp;&nbsp;<a data-toggle="collapse" href="#editpickup" aria-expanded="false" aria-controls="editpickup" class="collapsed"><i class="fa fa-pencil editicon" onclick="userinfo()"></i></a></h1>
                        <div class="collapse" id="editpickup" aria-expanded="false" style="height: 0px;">
                            <div class="col-sm-12 paddingnil editpickback">
                                <label for="email">Pickup</label>
                                <p style="display: inline-flex;">
                                    <span class="w200 mareditright" style="width: 50%;">
                                         <select name="pickup_date" class="pickup_date form-control">
                                            <option value="2016-06-16">Today (08 Mar 17)</option>
                                            <option value="2016-06-17">Tomorrow (09 Mar 17)</option>
                                            <option value="2016-06-18">Day After (Friday (10 Mar 17))</option>
                                            <option value="2016-06-19">Saturday (11 Mar 17)</option>
                                        </select> 
               
                                    </span>
                                    <span class="w200" style="width: 50%;">
                                        <select name="pickup_time" class="form-control">
                                            <option value="Morning (9:00 am to 11:00 am)">Morning (9:00 am to 11:00 am)</option>
                                            <option value="Noon (11:00 am to 1:00 pm)" selected="">Noon (11:00 am to 1:00 pm)</option>
                                            <option value="Evening (4:00 pm to 7:00 pm)">Evening (4:00 pm to 7:00 pm)</option>
                                            <option value="Late Evening (after 8:00 pm)">Late Evening (after 8:00 pm)</option>
                                        </select>
                                    </span>
                                </p>

                            </div>
                        </div>
                        <label for="email">Pickup</label>
                        <!-- <p class="cartfont"> Today (08 Mar 16)</p> -->
                        <p class="cartfont"> Date :<s:property value="pickup_date"/></p>
                        <!-- <p class="cartfont">Evening (4:00 pm to 7:00 pm)</p> -->
                        <p class="cartfont"> Time :<s:property value="ptime"/></p>
                        <label for="email">Delivery</label>
                        <p class="cartfont"> Date :<s:property value="deliver_date"/></p>
                        <p class="cartfont"> Time :<s:property value="dtime"/></p>
                    </div>
                    
                    
                    
                   <!--  updatecode -->
                    
       
                    
                    
                    
                    
                    
                    
                    
                </div>
                <div class="col-lg-1 col-md-1 col-sm-1"></div>
                <div class="col-lg-6 col-sm-6 col-md-6 formregn">
                    <div class="col-lg-12 col-md-12 col-xs-12 paypanel text-left">
                        <h1>Laundry Service</h1>
                    </div>
                    
                    <s:iterator value="assessmentList">
                     <div class="col-lg-12 col-md-12 col-xs-12 eachitem">
						<s:iterator value="productlist">
                        <div class="col-lg-5 col-md-5" style="padding:0px;">
                            <div class="fontview">
                                <p><s:property value="item"/>:</p>
                                <s:property value="subitem"/>
                            </div>
                        </div>
                        
                        
                        <div class="col-lg-3 col-md-3">
                            <form class="form-inline">
                                <a href="#" class="plusmis hidden" title="remove"><i class="fa fa-minus" aria-hidden="true"></i></a>
                                <div class="form-group">
                                  <small class="display:inline-block;">  <s:property value="qty"/> &nbsp;&nbsp;  (<s:property value="gst"/>%)</small>
                                </div>
                                <a href="#" class="plusmis hidden" title="add"><i class="fa fa-plus" aria-hidden="true"></i></a>
                            </form>
                        </div>
                        
                        <%-- div class="col-lg-3 col-md-3">
                            <form class="form-inline">
                                <a href="#" class="plusmis hidden" title="remove"><i class="fa fa-minus" aria-hidden="true"></i></a>
                                <div class="form-group">
                                  <small class="display:inline-block;">  <s:property value="gst"/>GST %</small>
                                </div>
                                <a href="#" class="plusmis hidden" title="add"><i class="fa fa-plus" aria-hidden="true"></i></a>
                            </form>
                        </div> --%>
                        
                        <div class="col-lg-3 col-md-3 text-right">
                            <div class="citemprice">
                                <span class="crate">@ <s:property value="price"/></span><br />
                                <span class="cprice">Rs. <strong id="sub97"><s:property value="totalprice"/></strong></span>
                            </div>
                        </div>
                        <div class="col-lg-1 col-md-1 text-right">
                            <a href="#" title="delete" class="delete"><i class="fa fa-times" aria-hidden="true"></i></a>
                        </div>
                        
                       </s:iterator>
                           
                    </div>
                     </s:iterator>
                    
                    
                    

                    <!--total panel-->
                    <div class="col-lg-12 col-md-12 col-xs-12 eachitem">
                        
                        <div class="col-lg-8 col-md-8 text-right" style="padding:0px;">
                           
                            <p>Handling Charges</p> 
                            <p>Order Amount</p>
                            <p>CGST Amount</p>
                            <p>SGST Amount</p>
                            <p>Discount (0%)</p> 
                        </div>
                        <div class="col-lg-3 col-md-3 text-right">
                            <div class="citemprice">
                                <p class="cprice">Rs. <strong id="sub97">00.00</strong></p>
                                <p class="cprice">Rs. <strong id="sub97"><s:property value="orderamount"/></strong></p>
                                <p class="cprice">Rs. <strong id="sub97"><s:property value="totalcgstvalue"/></strong></p>
                                <p class="cprice">Rs. <strong id="sub97"><s:property value="totalsgstvalue"/></strong></p>
                                <p class="cprice">Rs. <strong id="sub97">00.00</strong></p>
                            </div>
                        </div>
                        <div class="col-lg-1 col-md-1 text-right">
                            
                        </div>
                    </div>

                    <!--total with coupen/discount-->
                    <div class="col-lg-12 col-md-12 col-xs-12 eachitem">
                        <div class="col-lg-5 col-md-5 text-left" style="padding:0px;">
                            <form class="form-inline">
                                <div class="form-group" style="width: 65%;">
                                    <input type="text" class="form-control" placeholder="Do you have a coupon?" style="width: 100%;">
                                </div>
                                <button type="submit" class="btn btn-danger btn-sm">Apply</button>
                            </form>
                        </div>
                        <div class="col-lg-3 col-md-2 text-right" style="padding:0px;">

                            <p>TOTAL</p>
                        </div>
                        <div class="col-lg-3 col-md-3 text-right">
                            <div class="citemprice">
                                <p class="cprice">Rs. <strong id="sub97"><s:property value="carttotal"/></strong></p>
                            </div>
                        </div>
                        <div class="col-lg-1 col-md-1 text-right">

                        </div>
                    </div>

                    <div class="col-lg-12 col-md-12 col-xs-12 text-right" style="padding-top:15px">
                       <!--  <a href="sendotpService" class="btn btn-primary">Cash on delivery</a> -->
                        <a href="#" onclick="goforot()" class="btn btn-primary">Cash on delivery</a>
                    </div>
                   
                       
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 bhoechie-tab-container hidden">
                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 bhoechie-tab-menu">
                                    <div class="list-group">
                                        <a href="#" class="list-group-item active text-center">
                                            Credit Card
                                        </a>
                                        <a href="#" class="list-group-item text-center">
                                            Debit Card
                                        </a>
                                        <a href="#" class="list-group-item text-center">
                                            Net Banking
                                        </a>
                                        <a href="#" class="list-group-item text-center">
                                            COD
                                        </a>
                                        <a href="#" class="list-group-item text-center">
                                            e-wallet Cash
                                        </a>
                                    </div>
                                </div>
                                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-9 bhoechie-tab">
                                    <!-- flight section -->
                                    <div class="bhoechie-tab-content active">
                                        <div class="backcolorrs">
                                            <span>You Pay: <b class="">Rs. 430</b></span>
                                        </div>
                                        <div class="">
                                            <span class="pickupde">Pay using Credit Card</span>
                                        </div>
                                        <form class="form-horizontal">
                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-4 control-label paddingnil">Card Number :</label>
                                                <div class="col-sm-8">
                                                    <input type="email" class="form-control" id="inputEmail3" placeholder="Card Number">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputPassword3" class="col-sm-4 control-label paddingnil">Expiry Date :</label>
                                                <div class="col-sm-8">
                                                    <div class="creditcard-inlineblock col-xs-19">
                                                        <div class="creditcard-expiry lfloat" style="display: inline-flex;">
                                                            <select class="card_exp_month customized s-hidden form-control" name="expMonth" style="width: 70%;">
                                                                <option value="" selected="selected">MM</option>
                                                                <option value="1">01</option>
                                                                <option value="2">02</option>
                                                                <option value="3">03</option>
                                                                <option value="4">04</option>
                                                                <option value="5">05</option>
                                                                <option value="6">06</option>
                                                                <option value="7">07</option>
                                                                <option value="8">08</option>
                                                                <option value="9">09</option>
                                                                <option value="10">10</option>
                                                                <option value="11">11</option>
                                                                <option value="12">12</option>
                                                            </select>
                                                            <span class="lfloat lineht36px">&nbsp;&nbsp;</span>
                                                            <select class="card_exp_year_custom customized s-hidden form-control" style="width: 70%;" name="expYear">
                                                                <option value="" selected="selected">YY</option>
                                                                <option value="16">16</option>
                                                                <option value="17">17</option>
                                                                <option value="18">18</option>
                                                                <option value="19">19</option>
                                                                <option value="20">20</option>
                                                                <option value="21">21</option>
                                                                <option value="22">22</option>
                                                                <option value="23">23</option>
                                                                <option value="24">24</option>
                                                                <option value="25">25</option>
                                                                <option value="26">26</option>
                                                                <option value="27">27</option>
                                                                <option value="28">28</option>
                                                                <option value="29">29</option>
                                                                <option value="30">30</option>
                                                                <option value="31">31</option>
                                                                <option value="32">32</option>
                                                                <option value="33">33</option>
                                                                <option value="34">34</option>
                                                                <option value="35">35</option>
                                                                <option value="36">36</option>
                                                                <option value="37">37</option>
                                                                <option value="38">38</option>
                                                                <option value="39">39</option>
                                                                <option value="40">40</option>
                                                                <option value="41">41</option>
                                                            </select>
                                                            <div class="creditcard-cvv lfloat" style="width: 65%; margin-left: 8px;">
                                                                <input type="password" placeholder="CVV" autocomplete="new-password" value="" maxlength="3" class="security_code valid form-control" name="cvvValidate">

                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="form-group text-right">
                                                <div class="col-sm-offset-2 col-sm-10 text-right">
                                                    <button type="submit" class="btn btn-primary">Make Payment</button>
                                                </div>
                                            </div>
                                            <div>
                                                <small class="smalterms">This card will be saved for a faster payment experience[?]</small>
                                                <small class="smalterms">By placing the order, I have read and agreed to snapdeal.com   Terms of Use  |  Terms of Sale</small>
                                            </div>
                                        </form>
                                    </div>
                                    <!-- train section -->
                                    <div class="bhoechie-tab-content">
                                        <div class="backcolorrs">
                                            <span>You Pay: <b class="">Rs. 430</b></span>
                                        </div>
                                        <div class="">
                                            <span class="pickupde">Pay using Debit Card</span>
                                        </div>
                                        <form class="form-horizontal">
                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-4 control-label paddingnil">Card Number :</label>
                                                <div class="col-sm-8">
                                                    <input type="email" class="form-control" id="inputEmail3" placeholder="Card Number">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputPassword3" class="col-sm-4 control-label paddingnil">Expiry Date :</label>
                                                <div class="col-sm-8">
                                                    <div class="creditcard-inlineblock col-xs-19">
                                                        <div class="creditcard-expiry lfloat" style="display: inline-flex;">
                                                            <select class="card_exp_month customized s-hidden form-control" name="expMonth" style="width: 70%;">
                                                                <option value="" selected="selected">MM</option>
                                                                <option value="1">01</option>
                                                                <option value="2">02</option>
                                                                <option value="3">03</option>
                                                                <option value="4">04</option>
                                                                <option value="5">05</option>
                                                                <option value="6">06</option>
                                                                <option value="7">07</option>
                                                                <option value="8">08</option>
                                                                <option value="9">09</option>
                                                                <option value="10">10</option>
                                                                <option value="11">11</option>
                                                                <option value="12">12</option>
                                                            </select>
                                                            <span class="lfloat lineht36px">&nbsp;&nbsp;</span>
                                                            <select class="card_exp_year_custom customized s-hidden form-control" style="width: 70%;" name="expYear">
                                                                <option value="" selected="selected">YY</option>
                                                                <option value="16">16</option>
                                                                <option value="17">17</option>
                                                                <option value="18">18</option>
                                                                <option value="19">19</option>
                                                                <option value="20">20</option>
                                                                <option value="21">21</option>
                                                                <option value="22">22</option>
                                                                <option value="23">23</option>
                                                                <option value="24">24</option>
                                                                <option value="25">25</option>
                                                                <option value="26">26</option>
                                                                <option value="27">27</option>
                                                                <option value="28">28</option>
                                                                <option value="29">29</option>
                                                                <option value="30">30</option>
                                                                <option value="31">31</option>
                                                                <option value="32">32</option>
                                                                <option value="33">33</option>
                                                                <option value="34">34</option>
                                                                <option value="35">35</option>
                                                                <option value="36">36</option>
                                                                <option value="37">37</option>
                                                                <option value="38">38</option>
                                                                <option value="39">39</option>
                                                                <option value="40">40</option>
                                                                <option value="41">41</option>
                                                            </select>
                                                            <div class="creditcard-cvv lfloat" style="width: 65%; margin-left: 8px;">
                                                                <input type="password" placeholder="CVV" autocomplete="new-password" value="" maxlength="3" class="security_code valid form-control" name="cvvValidate">

                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="form-group text-right">
                                                <div class="col-sm-offset-2 col-sm-10 text-right">
                                                    <button type="submit" class="btn btn-primary">Make Payment</button>
                                                </div>
                                            </div>
                                            <div>
                                                <small class="smalterms">This card will be saved for a faster payment experience[?]</small>
                                                <small class="smalterms">By placing the order, I have read and agreed to snapdeal.com   Terms of Use  |  Terms of Sale</small>
                                            </div>
                                        </form>
                                    </div>

                                    <!-- hotel search -->
                                    <div class="bhoechie-tab-content">
                                        <div class="backcolorrs">
                                            <span>You Pay: <b class="">Rs. 430</b></span>
                                        </div>
                                        <div class="">
                                            <span class="pickupde">Pay using Net Banking</span>
                                        </div>
                                        <form class="form-horizontal">
                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-4 control-label paddingnil">State Bank :</label>
                                                <div class="col-sm-8 paddingnil">
                                                    <label>
                                                        <input type="radio" name="ccard"><img src="http://placehold.it/50x50">
                                                    </label>
                                                    <label>
                                                        <input type="radio" name="ccard"> <img src="http://placehold.it/50x50">
                                                    </label>
                                                    <label>
                                                        <input type="radio" name="ccard"><img src="http://placehold.it/50x50">
                                                    </label>

                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputPassword3" class="col-sm-4 control-label paddingnil">Other Bank :</label>
                                                <div class="col-sm-8">
                                                    <div class="creditcard-inlineblock col-xs-19">
                                                        <div class="creditcard-expiry lfloat" style="display: inline-flex; width: 100%;">
                                                            <select class="card_exp_month customized s-hidden form-control" name="expMonth">
                                                                <option value="" selected="selected">Select</option>
                                                                <option value="">State Bank of India</option>
                                                                <option value="1">Andhra Bank</option>
                                                                <option value="2">Bank of Maharashtra</option>
                                                                <option value="3">Bank of India</option>
                                                            </select>

                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="form-group text-right">
                                                <div class="col-sm-offset-2 col-sm-10 text-right">
                                                    <button type="submit" class="btn btn-primary">Make Payment</button>
                                                </div>
                                            </div>
                                            <div>
                                                <small class="smalterms">By placing the order, I have read and agreed to snapdeal.com   Terms of Use  |  Terms of Sale</small>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="bhoechie-tab-content">
                                        <div class="backcolorrs">
                                            <span>You Pay: <b class="">Rs. 430</b></span>
                                        </div>
                                        <div class="">
                                            <span class="pickupde">Pay using Cash On Delivery</span>
                                        </div>
                                        <form class="form-horizontal" style="padding-top:15px;">
                                            <div class="form-group text-left">
                                                <div class=" col-sm-10">
                                                    <a href="sendotp.html" type="button" class="btn btn-primary">Place Order</a>
                                                </div>
                                            </div>
                                            <div>
                                                <small class="smalterms">By placing the order, I have read and agreed to snapdeal.com   Terms of Use  |  Terms of Sale</small>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="bhoechie-tab-content">
                                        <center>

                                            <h2 style="margin-top: 0; color: #2A435E">Empty</h2>
                                            <h3 style="margin-top: 0; color: #2A435E">DT-wallet</h3>
                                        </center>
                                    </div>
                                </div>
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
    
     <!-- Begin Call to Action Newsletter -->
    <section class="section-call-action newsletter hidden">
        <div class="container">
            <div class="row">
                <div class="col-md-7">
                    <h4 class="section-title">Stay Tuned by subscribing to our Newsletter.</h4>
                    <p class="section-title c-gray">We will not share your email.</p>
                </div>
                <div class="col-md-5">
                    <div class="inline-form">
                        <input placeholder="Enter Your Email" class="form-control" type="text">
                        <button type="submit" class="btn btn-lg m-b-0 btn-dark">Subscribe</button>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Call to Action Newsletter -->
   
   

   
    <!-- Begin Testimonials-->
    <section class="section-testimonials parallax bg-dark hidden" data-img="bgtesto.jpg">
        <div class="section-overlay"></div>
        <div class="container center">
            <div class="row">
                <div class="col-md-12">
                    <h3 class="section-title">What Clients say</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <div id="testimonials-pager" class="testimonial-photos">
                        <a data-slide-index="0" href="" class="photo-hold">
                            <img src="images/blank_avatar.png" alt="" /> <!-- Client photo 1 -->
                        </a>
                        <a data-slide-index="1" href="" class="photo-hold">
                            <img src="images/blank_avatar.png" alt="" /> <!-- Client photo 2 -->
                        </a>
                        <a data-slide-index="2" href="" class="photo-hold">
                            <img src="images/blank_avatar.png" alt="" /> <!-- Client photo 3 -->
                        </a>
                    </div>
                    <div class="testimonials-slider">
                        <!-- Single Testimonial Starts -->
                        <div class="testimonial">
                            <p class="comment">
                                The best thing that I could imagine to sort out my problem of laundry at my doorstep. It has an exceptional customer service. I can think of giving away my dearer clothes to laundry without any worry. Also the delivery of clothes in less than 24hrs is one additional service Gr8 job.
                            </p>
                            <h5 class="happy-client">Ashish Verma, Nagpur</h5>
                        </div>
                        <!-- Single Testimonial Ends -->
                        <!-- Single Testimonial Starts -->
                        <div class="testimonial">
                            <p class="comment">
                                Service in terms of quality,pricing and overall satisfaction was amazing compared to other laundromat services in Nagpur. The whole idea of tracking the order progress in real time on the android app was fabulous.
                            </p>
                            <h5 class="happy-client">Nikhil Sharma, Ngapur</h5>
                        </div>
                        <!-- Single Testimonial Ends -->
                        <!-- Single Testimonial Starts -->
                        <div class="testimonial">
                            <p class="comment">
                                The best thing that I could imagine to sort out my problem of laundry at my doorstep. It has an exceptional customer service. I can think of giving away my dearer clothes to laundry without any worry. Also the delivery of clothes in less than 24hrs is one additional service Gr8 job.
                            </p>
                            <h5 class="happy-client">Arun karuna, Nagpur</h5>
                        </div>
                        <!-- Single Testimonial Ends -->
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Testimonials -->
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
    
    
    <!-- Add new ot charge popup -->
<s:form action="saveuinfoService" id="saveunfoFrm" theme="simple">
  <div class="modal fade" id="newotchargepopupid" tabindex="-1"
   role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
    <div class="modal-content">
     <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal">
       <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
      </button>
      <h4 class="modal-title" id="myModalLabel">Update Profile Info</h4>
     </div>
     <div class="modal-body">
     
       <div class="row">
       <div class="col-lg-3">
        <label>Select Hostel</label>
       </div>
       <div class="col-lg-9">

       <s:select onchange="showUserProfileData(this.value)" name="hname" id="hid" list="hostallist"
       listKey="id" listValue="name" headerKey="0" headerValue="Select Hostal"
       cssClass="form-conrol"/>
       </div>
      </div>
      <br>
      
      <div class="row">
       <div class="col-lg-3">
        <label>Address</label>
       </div>
       <div class="col-lg-9">

       <s:textarea name="address" id="paddress" cssClass="form-control"/>
       </div>
      </div>
      <br>
      
       <div class="row">
       <div class="col-lg-3">
        <label>Landmark</label>
       </div>
       <div class="col-lg-9">

      <s:textfield name="landmark" id="plandmark" cssClass="form-control"/>
       </div>
      </div>
      <br>
      
        <div class="row">
       <div class="col-lg-3">
        <label>City</label>
       </div>
       <div class="col-lg-9">

      <s:textfield name="city" id="pcity" cssClass="form-control"/>
       </div>
      </div>
      <br>
      
        <div class="row">
       <div class="col-lg-3">
        <label>Pincode</label>
       </div>
       <div class="col-lg-9">

      <s:textfield name="picode" id="ppincode" cssClass="form-control"/>
       </div>
      </div>
      <br>
      
      
      <div class="row">
       <div class="col-lg-3">
        <label>Mobile</label>
       </div>
       <div class="col-lg-9">

      <s:textfield name="mobile" id="pmobile" cssClass="form-control"/>
       </div>
      </div>
      <br>

      

     </div>
     <div class="modal-footer">

      <button onclick="saveuserInfo()" type="button" class="btn btn-primary"
        >Save</button>
      <!-- <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button> -->
     </div>
    </div>
   </div>
  </div>
  
  </s:form>
             