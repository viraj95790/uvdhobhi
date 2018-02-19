  $(document).ready(function () {
            $('#reg_form').bootstrapValidator({
                // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later

                fields: {
                    name: {
                        validators: {
                            stringLength: {
                                min: 2,
                            },
                            notEmpty: {
                                message: 'Please enter your first name'
                            }
                        }
                    },
                    surname: {
                        validators: {
                            stringLength: {
                                min: 2,
                            },
                            notEmpty: {
                                message: 'Please enter your last name'
                            }
                        }
                    },

                    mobile: {
                        validators: {
                            notEmpty: {
                                message: 'Please enter your phone number'
                            },
                            phone: {
                                country: 'US',
                                message: 'Please enter a vaild phone number with area code'
                            }
                        }
                    },
                    address: {
                        validators: {
                            stringLength: {
                                min: 8,
                            },
                            notEmpty: {
                                message: 'Please enter your street address'
                            }
                        }
                    },
                    city: {
                        validators: {
                            
                            notEmpty: {
                                message: 'Please enter your city'
                            }
                        }
                    },
                    customer_type: {
                        validators: {
                            notEmpty: {
                                message: 'Please select customer type'
                            }
                        }
                    },
                    pincode: {
                        validators: {
                        	stringLength: {
                                min: 6,
                            },
                            notEmpty: {
                                message: 'Please enter your post code'
                            },
                            /*postname: {
                                country: 'US',
                                message: 'Please enter a vaild post code'
                            }*/
                        }
                    },
                    postname: {
                        validators: {
                           
                            notEmpty: {
                                message: 'Please enter post name'
                            }
                        }
                    },
                    email: {
                        validators: {
                            notEmpty: {
                                message: 'Please enter your email address'
                            },
                            emailAddress: {
                                message: 'Please enter a valid email address'
                            }
                            
                        }
                    },

                    password: {
                        validators: {
                        	  notEmpty: {
                                  message: 'Please enter  password'
                              },
                            identical: {
                                field: 'confirmPassword',
                                message: 'Confirm your password below - type same password please'
                            }
                        }
                    },
                    confirmPassword: {
                        validators: {
                            identical: {
                                field: 'password',
                                message: 'The password and its confirm are not the same'
                            }
                        }
                    },


                }
            })


                .on('success.form.bv', function (e) {
                    $('#success_message').slideDown({ opacity: "show" }, "slow") // Do something ...
                    $('#reg_form').data('bootstrapValidator').resetForm();

                    // Prevent form submission
                    e.preventDefault();

                    // Get the form instance
                    var $form = $(e.target);

                    // Get the BootstrapValidator instance
                    var bv = $form.data('bootstrapValidator');

                    // Use Ajax to submit form data
                    $.post($form.attr('action'), $form.serialize(), function (result) {
                        console.log(result);
                    }, 'json');
                });
        });
  
  
  
  function checkEmailExist(email){
		 var url = "emailService?email="+email+" ";
		 
		 
		 if (window.XMLHttpRequest) {
				req = new XMLHttpRequest();
			}
			else if (window.ActiveXObject) {
				isIE = true;
				req = new ActiveXObject("Microsoft.XMLHTTP");
			}   
		               
		    req.onreadystatechange = checkEmailExistRequest;
		    req.open("GET", url, true); 
		              
		    req.send(null); 
  }
  
  function checkEmailExistRequest(){
	  if (req.readyState == 4) {
			if (req.status == 200) {
				
		var data = req.responseText;	
		
		if(data=='true'){
			document.getElementById('chkemailerror').style.display='';
		}else{
			document.getElementById('chkemailerror').style.display='none';
		}
			}
	  }
  }