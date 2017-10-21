  <%@ taglib uri="/struts-tags" prefix="s" %>
 <link href="css/jquery.countdownTimer.css" rel="stylesheet" />
 
 <script src="account/js/custaccount.js"></script>

  <!-- Begin Content Discover App -->
    <section class="section-content section-drawing bg-gray-light border-bottom p-t-60 p-b-0">
        <div class="container" style="padding-bottom: 30px;">
            <div class="row">
                <h3 class="section-title">Confirm Your Order With OTP.</h3>
                <div class="col-lg-5 col-sm-5 col-md-5 formregn">
                    <p class="otpman">An OTP has been send to your registerd Email Id & Mobile Number.</p>
                    <s:form>
                        <b>One-Time Password</b>
                        <div class="form-group">
                            <small class="clock3">Please enter your 6-digit One-Time Password (OTP) &nbsp; <div id="countdowntimer"><span id="m_timer"><span></div></small>

                            <input type="text" class="form-control" id="textotp" name="textotp" placeholder="Type Here" title="OTP" tabindex="1">
                        </div>
                        <div class="text-left">
                            <!-- <a href="thxService" type="button" class="btn btn-primary">Confirm</a> -->
                             <a href="#" onclick="confirmation(this.value)"  type="button" class="btn btn-primary">Confirm</a>
                            <!-- <button type="button" onclick="confirmation(this.value)" >Confirm</button> -->
                        </div>
                    </s:form>
                    
                    <s:form id="orderconfirm" action="thxService">
                    </s:form>
                    <br />
                    <p class="otpman">If you do not recive your OTP via Email and SMS withen the next few minutes, please click <a href="#" style="text-decoration: underline;">here</a> to resend.</p>
               
                </div>
                <div class="col-lg-1 col-md-1 col-sm-1"></div>
                <div class="col-lg-6 col-sm-6 col-md-6">
                    <img src="images/jacket.png" class="swingimage img-responsive hidden" style="margin-left: auto; margin-right: auto;" />
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
    
       <script src="js/jquery.countdownTimer.js"></script>
       
       <script>
        $(function () {
            $('#m_timer').countdowntimer({
                minutes: 3,
                size: "lg"
            });
        });
    </script>
    