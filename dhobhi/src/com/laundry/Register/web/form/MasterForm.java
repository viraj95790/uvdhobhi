package com.laundry.Register.web.form;

import java.util.ArrayList;

import com.laundry.Register.eu.entity.Master;

public class MasterForm {

    private int id;
	
	private String name = "0";
	
	private String vendorname = "0";
	
	private String type;
	
	private String pickup_date = "";
	
	private String deliver_date = "";
	
	private String ptime;
	
	private String dtime;
	
    private String services;
	
	private String item;
	
	private String subitem;
	
	private String price;
	
	private String cgst;
	
	private String sgst;
	
    private String mobile;
	
	private String address;
	
	private String email;
	
	private String selectedchk;
	
	private String carttotal;
	
	private String vendor;
	
	private String actiontype;
	
    private String totalcgstvalue;
	
	private String totalsgstvalue;
	
	private String orderamount;
	
	
	private ArrayList<Master> serviceList;
	private ArrayList<Master> itemList;
	private ArrayList<Master> subitemList;
	private ArrayList<String> pickupTimeList;
	private ArrayList<String> deliverTimeList;
	private ArrayList<Master> hospitallist;
	
	
	private ArrayList<Master> assessmentList;
	private ArrayList<Master> productList;
	private ArrayList<Master> cartitemList;
	private ArrayList<Master> customerList;
	private ArrayList<Master> vendorList;
	private ArrayList<Master> custinfo;
	
	private String fromdate = "";
	
	private String todate= "";
	
	private  ArrayList<Master>hostallist;
	
	private String landmark;
	private String city;
	private String pincode;
	
	
	
	
	
	
	
	
	
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

	public ArrayList<Master> getHostallist() {
		return hostallist;
	}

	public void setHostallist(ArrayList<Master> hostallist) {
		this.hostallist = hostallist;
	}

	public String getOrderamount() {
		return orderamount;
	}

	public void setOrderamount(String orderamount) {
		this.orderamount = orderamount;
	}

	public ArrayList<Master> getHospitallist() {
		return hospitallist;
	}

	public void setHospitallist(ArrayList<Master> hospitallist) {
		this.hospitallist = hospitallist;
	}

	public ArrayList<Master> getCustinfo() {
		return custinfo;
	}

	public void setCustinfo(ArrayList<Master> custinfo) {
		this.custinfo = custinfo;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getVendorname() {
		return vendorname;
	}

	public void setVendorname(String vendorname) {
		this.vendorname = vendorname;
	}

	public ArrayList<Master> getVendorList() {
		return vendorList;
	}

	public void setVendorList(ArrayList<Master> vendorList) {
		this.vendorList = vendorList;
	}

	public String getTotalcgstvalue() {
		return totalcgstvalue;
	}

	public void setTotalcgstvalue(String totalcgstvalue) {
		this.totalcgstvalue = totalcgstvalue;
	}

	public String getTotalsgstvalue() {
		return totalsgstvalue;
	}

	public void setTotalsgstvalue(String totalsgstvalue) {
		this.totalsgstvalue = totalsgstvalue;
	}

	public String getActiontype() {
		return actiontype;
	}

	public void setActiontype(String actiontype) {
		this.actiontype = actiontype;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getCgst() {
		return cgst;
	}

	public void setCgst(String cgst) {
		this.cgst = cgst;
	}

	public String getSgst() {
		return sgst;
	}

	public void setSgst(String sgst) {
		this.sgst = sgst;
	}

	public String getFromdate() {
		return fromdate;
	}

	public void setFromdate(String fromdate) {
		this.fromdate = fromdate;
	}

	public String getTodate() {
		return todate;
	}

	public void setTodate(String todate) {
		this.todate = todate;
	}


	public ArrayList<Master> getCustomerList() {
		return customerList;
	}

	public void setCustomerList(ArrayList<Master> customerList) {
		this.customerList = customerList;
	}
	
	

	public String getVendor() {
		return vendor;
	}

	public void setVendor(String vendor) {
		this.vendor = vendor;
	}

	public String getSelectedchk() {
		return selectedchk;
	}

	public void setSelectedchk(String selectedchk) {
		this.selectedchk = selectedchk;
	}

	public ArrayList<Master> getCartitemList() {
		return cartitemList;
	}

	public void setCartitemList(ArrayList<Master> cartitemList) {
		this.cartitemList = cartitemList;
	}

	public String getCarttotal() {
		return carttotal;
	}

	public void setCarttotal(String carttotal) {
		this.carttotal = carttotal;
	}

	public ArrayList<Master> getAssessmentList() {
		return assessmentList;
	}

	public void setAssessmentList(ArrayList<Master> assessmentList) {
		this.assessmentList = assessmentList;
	}

	public ArrayList<Master> getProductList() {
		return productList;
	}

	public void setProductList(ArrayList<Master> productList) {
		this.productList = productList;
	}

	public String getServices() {
		return services;
	}

	public void setServices(String services) {
		this.services = services;
	}

	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	public String getSubitem() {
		return subitem;
	}

	public void setSubitem(String subitem) {
		this.subitem = subitem;
	}

	public ArrayList<String> getPickupTimeList() {
		return pickupTimeList;
	}

	public void setPickupTimeList(ArrayList<String> pickupTimeList) {
		this.pickupTimeList = pickupTimeList;
	}

	public ArrayList<String> getDeliverTimeList() {
		return deliverTimeList;
	}

	public void setDeliverTimeList(ArrayList<String> deliverTimeList) {
		this.deliverTimeList = deliverTimeList;
	}

	public String getPickup_date() {
		return pickup_date;
	}

	public void setPickup_date(String pickup_date) {
		this.pickup_date = pickup_date;
	}

	public String getDeliver_date() {
		return deliver_date;
	}

	public void setDeliver_date(String deliver_date) {
		this.deliver_date = deliver_date;
	}

	public String getPtime() {
		return ptime;
	}

	public void setPtime(String ptime) {
		this.ptime = ptime;
	}

	public String getDtime() {
		return dtime;
	}

	public void setDtime(String dtime) {
		this.dtime = dtime;
	}

	public ArrayList<Master> getItemList() {
		return itemList;
	}

	public void setItemList(ArrayList<Master> itemList) {
		this.itemList = itemList;
	}

	public ArrayList<Master> getSubitemList() {
		return subitemList;
	}

	public void setSubitemList(ArrayList<Master> subitemList) {
		this.subitemList = subitemList;
	}

	public ArrayList<Master> getServiceList() {
		return serviceList;
	}

	public void setServiceList(ArrayList<Master> serviceList) {
		this.serviceList = serviceList;
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	
	
	
	
}
