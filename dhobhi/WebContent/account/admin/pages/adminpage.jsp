<!-- Register Customer -->
<%@ taglib uri="/struts-tags" prefix="s" %>




                <section class="two miniheaight">

                    <div class="container-fluid">
                        <header>
                            <h2 class="stephedpa text-left">Manage Cutomers</h2>
                        </header>

                        <div class="col-lg-12 col-sm-12 col-dm-12 text-left pagepaddingbotal60">

                            <div class="">
                                <div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs" style="font-size:15px;">
                                    <ul id="myTab" class="nav nav-tabs nav-tabs-responsive backwhite" role="tablist">
                                        <li role="presentation" class="active">
                                            <a href="#custlist" id="custlist-tab" role="tab" data-toggle="tab" aria-controls="custlist" aria-expanded="true">
                                                <span class="text">Custmer_List</span>
                                            </a>
                                        </li>
                                        <li role="presentation" class="next">
                                            <a href="#custadd" role="tab" id="custadd-tab" data-toggle="tab" aria-controls="custadd">
                                                <span class="text">Add_Customer</span>
                                            </a>
                                        </li>

                                    </ul>
                                    <div id="myTabContent" class="tab-content backwhite">
                                        <div role="tabpanel" class="tab-pane fade in active minheaightcusttabel" id="custlist" aria-labelledby="custlist-tab">
                                            <div class="col-lg-12 col-md-12 col-sm-12 searchback">
                                                <div class="col-lg-8 col-md-8 col-sm-8">
                                                    <form class="form-inline">
                                                        <div class="form-group marright20" style="width: 28%;">
                                                            <input type="email" class="form-control" id="exampleInputEmail3" placeholder="Search Customer" style="width:100%">
                                                        </div>
                                                        <div class="form-group marright20">
                                                            <select class="form-control">
                                                                <option value="Select Cutomer Type">Select Group</option>
                                                                <option value="A">A</option>
                                                                <option value="B">B</option>
                                                                <option value="C">C</option>
                                                                <option value="D">D</option>
                                                            </select>
                                                        </div>
                                                        <div class="form-group marright20">
                                                            <select class="form-control">
                                                                <option value="Select Cutomer Type">Select City</option>
                                                                <option value="Amravati">Amravati</option>
                                                                <option value="Nagpur">Nagpur</option>
                                                            </select>
                                                        </div>
                                                        <div class="form-group marright20">
                                                            <select class="form-control">
                                                                <option value="All Area">Select Area</option>
                                                                <option value="Abhyankar Nagar">Abhyankar Nagar</option>
                                                                <option value="Ajni">Ajni</option>
                                                                <option value="Amar Jyoti Nagar">Amar Jyoti Nagar</option>
                                                                <option value="Ambazari Layout">Ambazari Layout</option>
                                                                <option value="Amravati Road">Amravati Road</option>
                                                                <option value="Bajaj Nagar">Bajaj Nagar</option>
                                                                <option value="Buldi">Buldi</option>
                                                                <option value="Central Avenue Road">Central Avenue Road</option>
                                                                <option value="Chatrapati Square">Chatrapati Square</option>
                                                                <option value="Civil Lines">Civil Lines</option>
                                                                <option value="Dhantoli" selected="">Dhantoli</option>
                                                                <option value="Dharampeth">Dharampeth</option>
                                                                <option value="Futala">Futala</option>
                                                            </select>
                                                        </div>
                                                        <button type="submit" class="btn btn-warning"><i class="fa fa-search"></i></button>
                                                        <button type="submit" class="btn btn-primary">Reset</button>
                                                    </form>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-4">
                                                    <div class="text-right">
                                                        <select class="form-control balclis">
                                                            <option value="Select Cutomer Type">Select Cutomer Type</option>
                                                            <option value="Active">Active</option>
                                                            <option value="BlackListed">BlackListed</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-12 col-md-12 col-sm-12 paddingnil">
                                                <div class="tile-body">
                                                    <div class="table-responsive">
                                                        <table class="table table-custom" id="editable-usage">
                                                            <thead>
                                                                <tr>
                                                                    <th>Cutomer_Name</th>
                                                                    <th>Group</th>
                                                                    <th>Mobile_Number</th>
                                                                    <th>Email_ID</th>
                                                                    <th>Address</th>
                                                                    <th>Area</th>
                                                                    <th>City</th>
                                                                    <th>Pincode</th>
                                                                    <th>Date_Of_Join</th>
                                                                    <th>Cust_Type</th>
                                                                    <th>Action</th>
                                                                    <th style="width: 78px;" class="no-sort">Actions</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr class="odd gradeX">
                                                                    <td>Abhinav Parmar</td>
                                                                    <td>D</td>
                                                                    <td>8446545681</td>
                                                                    <td>abhi15parmar@gmail.com</td>
                                                                    <td>G-2 Krsuhna Apt, Khadgoan Road</td>
                                                                    <td>Wadi</td>
                                                                    <td>Nagpur</td>
                                                                    <td>440023</td>
                                                                    <td>16 June, 2016</td>
                                                                    <td>Retail</td>
                                                                    <td><a href="#" class="toggler">&nbsp;</a></td>
                                                                    <td class="actions"><a role="button" tabindex="0" class="edit text-primary text-uppercase text-strong text-sm mr-10">Edit</a><a role="button" tabindex="0" class="delete text-danger text-uppercase text-strong text-sm mr-10">Remove</a></td>
                                                                </tr>
                                                                <tr class="even gradeC">
                                                                    <td>Seva Hospital</td>
                                                                    <td>A</td>
                                                                    <td>9856452321</td>
                                                                    <td>Sevacare@gmail.com</td>
                                                                    <td>G-2 Krsuhna Apt, Khadgoan Road</td>
                                                                    <td>Dhantoli</td>
                                                                    <td>Nagpur</td>
                                                                    <td>440023</td>
                                                                    <td>11 June, 2016</td>
                                                                    <td>Corporate</td>
                                                                    <td><a href="#" class="toggler">&nbsp;</a></td>
                                                                    <td class="actions"><a role="button" tabindex="0" class="edit text-primary text-uppercase text-strong text-sm mr-10">Edit</a><a role="button" tabindex="0" class="delete text-danger text-uppercase text-strong text-sm mr-10">Remove</a></td>
                                                                </tr>

                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div role="tabpanel" class="tab-pane fade minheaighsetpanel" id="custadd" aria-labelledby="custadd-tab">
                                            <div class="col-lg-12 col-sm-12 col-md-12 paddingnil formregn1">
                                                <div class="col-lg-6 col-md-6 col-sm-6 paddingnil">
                                                    <s:form action="registerdataRegistration" id="reg_form" theme="simple">
                                                        <div class="col-lg-6 col-md-6 col-sm-6">
                                                         <%-- <s:select cssClass="form-control selectpicker" list="customerTypeList" id="id" name="customer_type" listKey="id" listValue="customer_type" headerKey="0" headerValue="Select Type"></s:select> --%>
                                                               <select class="form-control" id="customer_type" name="customer_type">
                                                                <option value="0">Select Customer Type</option>
                                                                <option value="1">Retail</option>
                                                                <option value="2">Corporate</option>
                                                            </select> 
                                                        </div>
                                                        <div class="col-lg-6 col-md-6 col-sm-6" style="margin-bottom: 15px;">
                                                            <select class="form-control">
                                                                <option value="Select Cutomer Type">Assign Group</option>
                                                                <option value="A">A = 25%</option>
                                                                <option value="B">B = 20%</option>
                                                                <option value="C">C = 15%</option>
                                                                <option value="D">D = 10%</option>
                                                            </select>
                                                        </div>


                                                        <div class="col-lg-6 col-md-6 col-sm-6">
                                                            <div class="form-group">
                                                                <s:textfield cssclass="form-control" id="name" name="name" placeholder="First Name"></s:textfield>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-6 col-md-6 col-sm-6">
                                                            <div class="form-group">
                                                                <s:textfield cssclass="form-control" id="surname" name="surname" placeholder="Last Name"></s:textfield>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-6 col-md-6 col-sm-6">
                                                            <div class="form-group">
                                                                <s:textfield cssclass="form-control" id="mobile" name="mobile" placeholder="Mobile No" title="Mobile No"></s:textfield>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-6 col-md-6 col-sm-6">
                                                            <div class="form-group">
                                                                <s:textfield cssclass="form-control" id="email" name="email" placeholder="Email ID"></s:textfield>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-6 col-md-6 col-sm-6">
                                                            <div class="form-group">
                                                                <!--<label for="exampleInputPassword1">Password</label>-->
                                                                <s:textfield cssclass="form-control" id="password" name="password" placeholder="Password"></s:textfield>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-6 col-md-6 col-sm-6">
                                                            <div class="form-group">
                                                                <!--<label for="exampleInputPassword1">Password</label>-->
                                                                <s:textfield cssclass="form-control" id="c_password" placeholder="Confirm Password"></s:textfield>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-12 col-md-12 col-sm-12">
                                                            <div class="form-group">
                                                                <s:textfield csscssclass="form-control" id="address" name="address" placeholder="Enter Full Address"></s:textfield>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-6 col-md-6 col-sm-6">
                                                            <div class="form-group">
                                                                <s:textfield cssclass="form-control" id="landmark" name="landmark" placeholder="Near Landmark (optional)"></s:textfield>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-6 col-md-6 col-sm-6">
                                                            <div class="form-group">
                                                                  <input class="form-control" id="city" name="city" placeholder="City" type="text">
                                                               <%-- <s:select list="cityList" id="city" name="city" listKey="city" listValue="city" headerKey="0" headerValue="Select City" title="City" 
                                                                     placeholder="City" theme="simple" cssClass="form-control"></s:select> --%>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-6 col-md-6 col-sm-6">
                                                            <div class="form-group">
                                                                <s:textfield cssclass="form-control" id="pincode" name="pincode" placeholder="Pin Code"></s:textfield>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-12 col-md-12 col-sm-12">
                                                            <div class="form-group">
                                                                <input class="form-control" id="exampleInputEmail1" placeholder="Referral Code (Optional)" title="Referral Code" tabindex="11" type="email">
                                                                <small>Enter referral code &amp; earn 100 eLaundry Cash </small>
                                                            </div>
                                                            <div class="text-right">
                                                                <button type="submit" class="btn btn-primary">Submit</button>
                                                            </div>
                                                        </div>

                                                    </s:form>
                                                </div>
                                                <div class="col-lg-6 col-md-6 col-sm-6"></div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>


                </section>
                <script src="register/js/registeration.js"></script>
