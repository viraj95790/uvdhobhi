package com.laundry.Account.eu.bi;

import java.util.ArrayList;

import com.laundry.Account.eu.entity.Account;
import com.laundry.Register.eu.entity.Cart;
import com.laundry.Register.eu.entity.Master;
import com.laundry.main.web.common.helper.LoginInfo;

public interface AccountDAO {

	ArrayList<Account> getchargeinvoice(String customerid,int vendorid,int usertype,String fromdate,String todate);

	

	int savecustpayment(Account account);

	ArrayList<Master> getVendorList();


	String getBvendorName(int id);

	ArrayList<Account> getpaymentList(String fromdate, String todate, String vendorid, String howpaid);

	ArrayList<Master> getcuustBarcodeList(String fromDate, String toDate);

	ArrayList<Master> getProdBarcodeList(String fromDate, String toDate);

	ArrayList<Account> getvendorinvoiceList();

	Cart getbarcodeinfo(String selectedid);

	int insertbarcodedata(Cart cart, String selectedid, LoginInfo loginInfo);

	ArrayList<Cart> getvendor(LoginInfo loginInfo);

	ArrayList<Cart> displaycabrcodeinf(String vendor, LoginInfo loginInfo);

	int deletebarcodedata(LoginInfo loginInfo);

	ArrayList<Cart> getitemproductlist(String selectedid, String string);


}
