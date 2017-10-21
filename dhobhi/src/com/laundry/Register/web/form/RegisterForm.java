package com.laundry.Register.web.form;

import java.lang.reflect.Array;
import java.util.ArrayList;

import com.laundry.Register.eu.entity.Register;


public class RegisterForm {

private int id;
	
	private String name;
	
	private String surname;
	
	private String mobile;
	
	private String email;
	
	private String password;
	
	private String address;
	
	private String landmark;
	
	private String city;
	
	private String pincode;
	
	private String customer_type;
	
	private String usertype;
	
	private String modified_date;
	
	private String custstatus;;
	
	
	private ArrayList<Register> registrationDataList;
	private ArrayList<Register> customerTypeList;
	private ArrayList<String> cityList;
	private String citytext;
	
	private String postname;
	

	

	
	
	

	public String getCuststatus() {
		return custstatus;
	}

	public void setCuststatus(String custstatus) {
		this.custstatus = custstatus;
	}

	public String getPostname() {
		return postname;
	}

	public void setPostname(String postname) {
		this.postname = postname;
	}

	public String getCitytext() {
		return citytext;
	}

	public void setCitytext(String citytext) {
		this.citytext = citytext;
	}

	public ArrayList<String> getCityList() {
		return cityList;
	}

	public void setCityList(ArrayList<String> cityList) {
		this.cityList = cityList;
	}

	public ArrayList<Register> getCustomerTypeList() {
		return customerTypeList;
	}

	public void setCustomerTypeList(ArrayList<Register> customerTypeList) {
		this.customerTypeList = customerTypeList;
	}

	public ArrayList<Register> getRegistrationDataList() {
		return registrationDataList;
	}

	public void setRegistrationDataList(ArrayList<Register> registrationDataList) {
		this.registrationDataList = registrationDataList;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getLandmark() {
		return landmark;
	}

	public void setLandmark(String landmark) {
		this.landmark = landmark;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getPincode() {
		return pincode;
	}

	public void setPincode(String pincode) {
		this.pincode = pincode;
	}

	public String getCustomer_type() {
		return customer_type;
	}

	public void setCustomer_type(String customer_type) {
		this.customer_type = customer_type;
	}

	public String getUsertype() {
		return usertype;
	}

	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}

	public String getModified_date() {
		return modified_date;
	}

	public void setModified_date(String modified_date) {
		this.modified_date = modified_date;
	}
	
	
	
}
