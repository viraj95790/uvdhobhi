package com.laundry.Account.eu.entity;

import java.util.ArrayList;

import com.laundry.Register.eu.entity.Cart;
import com.laundry.Register.eu.entity.Master;

public class Account {

	private int id;
	
	private String name;
	
	private String item;
	
	private String chargeinvid;
	
	private String billdate;
	
	private String debit;
	
	private String discount;
	
	private ArrayList<Master> chargeslist;
	
	private ArrayList<Cart> itemproductList;
	
	private String customerid;
	
	private String date;
	
	private String credit;
	
    private String howpaid;
	
	private String paynote;
	
	private String deliver_status;
	
	private String balance;
	
	private String vendorname;
	
	private String totalamount;
	
	private String gst;
	
	private String totalcgstvalue;
	
	private String totalsgstvalue; 
	
	private String totaldebit;
	
	private String barcode;
	
	
	
	
	
	
	

	public String getBarcode() {
		return barcode;
	}

	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}

	public String getTotaldebit() {
		return totaldebit;
	}

	public void setTotaldebit(String totaldebit) {
		this.totaldebit = totaldebit;
	}

	public String getGst() {
		return gst;
	}

	public void setGst(String gst) {
		this.gst = gst;
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

	public String getTotalamount() {
		return totalamount;
	}

	public void setTotalamount(String totalamount) {
		this.totalamount = totalamount;
	}

	public String getVendorname() {
		return vendorname;
	}

	public void setVendorname(String vendorname) {
		this.vendorname = vendorname;
	}

	public String getBalance() {
		return balance;
	}

	public void setBalance(String balance) {
		this.balance = balance;
	}

	public String getDeliver_status() {
		return deliver_status;
	}

	public void setDeliver_status(String deliver_status) {
		this.deliver_status = deliver_status;
	}

	public String getHowpaid() {
		return howpaid;
	}

	public void setHowpaid(String howpaid) {
		this.howpaid = howpaid;
	}

	public String getPaynote() {
		return paynote;
	}

	public void setPaynote(String paynote) {
		this.paynote = paynote;
	}

	public String getCredit() {
		return credit;
	}

	public void setCredit(String credit) {
		this.credit = credit;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getCustomerid() {
		return customerid;
	}

	public void setCustomerid(String customerid) {
		this.customerid = customerid;
	}

	public ArrayList<Cart> getItemproductList() {
		return itemproductList;
	}

	public void setItemproductList(ArrayList<Cart> itemproductList) {
		this.itemproductList = itemproductList;
	}

	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public ArrayList<Master> getChargeslist() {
		return chargeslist;
	}

	public void setChargeslist(ArrayList<Master> chargeslist) {
		this.chargeslist = chargeslist;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getChargeinvid() {
		return chargeinvid;
	}

	public void setChargeinvid(String chargeinvid) {
		this.chargeinvid = chargeinvid;
	}

	public String getBilldate() {
		return billdate;
	}

	public void setBilldate(String billdate) {
		this.billdate = billdate;
	}

	public String getDebit() {
		return debit;
	}

	public void setDebit(String debit) {
		this.debit = debit;
	}

	public String getDiscount() {
		return discount;
	}

	public void setDiscount(String discount) {
		this.discount = discount;
	}
	
	
	
	
}
