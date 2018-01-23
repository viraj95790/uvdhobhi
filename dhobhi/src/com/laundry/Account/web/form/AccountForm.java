package com.laundry.Account.web.form;

import java.util.ArrayList;

import com.laundry.Account.eu.entity.Account;
import com.laundry.Register.eu.entity.Cart;
import com.laundry.Register.eu.entity.Master;

public class AccountForm {

    private int id;
    
    private String name = "0";
    
    private String date;
	
	private String chargeinvid;
	
	private String billdate;
	
	private String debit;
	
	private String discount;
	
	private String address;
	
	private String mobile;
	
	private String city;
	
	private String vname;
	
	private String vmobile;
	
	private String vcity;
	
	private String vaddress;
	
	private String credit;
	
	private String howpaid = "0";
	
	private String paynote;
	
	private String deliver_status;
	
	private String balance;
	
	private String fromdate = "";
	
	private String todate= "";
	
	private String totalamount;
	
	private String totalcgstvalue;
	
	private String totalsgstvalue;
	
	private String gst;
	
	private String totaldebit;
	
	private String barcode;
	
	private String barcodeid;
	
	private String orderamount;
	
	private String totalinword;
	
	
	
	
	
	
	private ArrayList<Account> chargeinvList;
	private ArrayList<Master> customerList;
	/*private ArrayList<Account> masterProductList;*/
	private ArrayList<Account> paymentReportList;
	ArrayList<Master>vendorList;
	
	
	private ArrayList<Cart> masterProductList;
	
	

	
	

	
	
	
	
	
	
	
	

	public String getTotalinword() {
		return totalinword;
	}

	public void setTotalinword(String totalinword) {
		this.totalinword = totalinword;
	}

	public ArrayList<Cart> getMasterProductList() {
		return masterProductList;
	}

	public void setMasterProductList(ArrayList<Cart> masterProductList) {
		this.masterProductList = masterProductList;
	}

	public String getOrderamount() {
		return orderamount;
	}

	public void setOrderamount(String orderamount) {
		this.orderamount = orderamount;
	}

	public String getBarcodeid() {
		return barcodeid;
	}

	public void setBarcodeid(String barcodeid) {
		this.barcodeid = barcodeid;
	}

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

	public String getVcity() {
		return vcity;
	}

	public void setVcity(String vcity) {
		this.vcity = vcity;
	}

	public String getVaddress() {
		return vaddress;
	}

	public void setVaddress(String vaddress) {
		this.vaddress = vaddress;
	}

	public String getTotalamount() {
		return totalamount;
	}

	public void setTotalamount(String totalamount) {
		this.totalamount = totalamount;
	}

	public ArrayList<Account> getPaymentReportList() {
		return paymentReportList;
	}

	public void setPaymentReportList(ArrayList<Account> paymentReportList) {
		this.paymentReportList = paymentReportList;
	}

	public ArrayList<Master> getVendorList() {
		return vendorList;
	}

	public void setVendorList(ArrayList<Master> vendorList) {
		this.vendorList = vendorList;
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

	public String getVname() {
		return vname;
	}

	public void setVname(String vname) {
		this.vname = vname;
	}

	public String getVmobile() {
		return vmobile;
	}

	public void setVmobile(String vmobile) {
		this.vmobile = vmobile;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
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

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public ArrayList<Master> getCustomerList() {
		return customerList;
	}

	public void setCustomerList(ArrayList<Master> customerList) {
		this.customerList = customerList;
	}

	public ArrayList<Account> getChargeinvList() {
		return chargeinvList;
	}

	public void setChargeinvList(ArrayList<Account> chargeinvList) {
		this.chargeinvList = chargeinvList;
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
