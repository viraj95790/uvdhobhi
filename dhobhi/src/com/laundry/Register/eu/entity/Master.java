package com.laundry.Register.eu.entity;

import java.util.ArrayList;

public class Master {

	private int id;
	
	private String cartinvid;
	
	private String name;
	
	private String vendorname;
	
	private String type;
	
	private String services;
	
	private String item;
	
	private String subitem;
	
	private String userid;
	
	private String date;
	
	private String mobile;
	
	private String address;
	
	private String email;
	
	private String debit;
	
    private String cgst;
	
	private String sgst;
	
	private String price;
	
    private String totalcgstvalue;
	
	private String totalsgstvalue;
	
	private ArrayList<Cart> productlist;
	
	private String productid;
	
	
	private String imageName;
	
	
	

	
	
	
	
	
	
	
	
	public String getProductid() {
		return productid;
	}

	public void setProductid(String productid) {
		this.productid = productid;
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

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}

	public String getCartinvid() {
		return cartinvid;
	}

	public void setCartinvid(String cartinvid) {
		this.cartinvid = cartinvid;
	}

	public String getDebit() {
		return debit;
	}

	public void setDebit(String debit) {
		this.debit = debit;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public ArrayList<Cart> getProductlist() {
		return productlist;
	}

	public void setProductlist(ArrayList<Cart> productlist) {
		this.productlist = productlist;
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
