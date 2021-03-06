package com.laundry.Register.eu.bi;

import java.util.ArrayList;

import com.laundry.Register.eu.entity.Cart;
import com.laundry.Register.eu.entity.Master;

public interface ServiceDAO {

	ArrayList<Master> getserviceList(String action);

	ArrayList<Master> getitemList(String selectedid);

	ArrayList<Master> getsubitemList(String selectedid, int id, int userType);

	Cart getprice(String subitemid);

	int insertcartdata(String userId, Cart cart1, int id);

	int savedata(Cart cart, int invoiceid);

	int getdebitupdated(int invoiceid, double total);

	double Itemprice(String subitemid);

	ArrayList<Master> getassesementlist(int invoiceid);

	ArrayList<Master> getcartdata(String customerid,int vendorid,String fromdate,String todate);

	double getdebitAmount(String selectedid);

	ArrayList<Master> getcustomerlist(int vendorid);

	int saveinvcharge(String customerid);

	int savechargeproduct(int invoiceid, String selectedid);

	double updatedebit(int invoiceid, double totaldeb);

	ArrayList<Master> getVendorList(String postcode);

	String getitemname(String item);

	ArrayList<Master> getVendorList();

	ArrayList<Master> getcustomerinfo(int id);

	String checkEmailIdExist(String email);

	ArrayList<Master> getHostalList();

	int updateUserInfo(int id, String address, String mobile,String landmark,String city,String pincode);

	ArrayList<Master> getNotConfirmedInvoiceList();

	int deleteNotConfirmedCharge(int id);

	int deleteNotConfirmedinvoice();

	int updateConfirmCharge(int invoiceid);

	
	ArrayList<Master> getCustomerCartList(int vendorid, String fromDate,
			String toDate);


}
