package com.laundry.Account.web.action;

import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.laundry.Account.eu.bi.AccountDAO;
import com.laundry.Account.eu.blogic.jdbc.JDBCAccountDAO;
import com.laundry.Register.eu.entity.Master;
import com.laundry.Register.web.form.MasterForm;
import com.laundry.main.eu.blogic.jdbc.Connection_provider;
import com.laundry.main.web.action.BaseAction;
import com.laundry.main.web.common.helper.LoginHelper;
import com.laundry.main.web.common.helper.LoginInfo;
import com.onbarcode.barcode.Code39;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

public class BarcodeAction extends BaseAction implements ModelDriven<MasterForm>{
	
	HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
	HttpServletResponse response = (HttpServletResponse)ActionContext.getContext().get(ServletActionContext.HTTP_RESPONSE);
	HttpSession session = request.getSession(true);
	LoginInfo loginInfo = LoginHelper.getLoginInfo(request);
	
	MasterForm masterForm = new MasterForm();
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return super.execute();
	}
	
	public String vendor(){
		
		Connection connection = null;
		try{
			connection = Connection_provider.getconnection();
			AccountDAO accountDAO = new JDBCAccountDAO(connection);
			
			String fromDate = masterForm.getFromdate();
			String toDate = masterForm.getTodate();	
			String action = masterForm.getActiontype();
			if(!fromDate.equals("")){
				String temp[]= fromDate.split("/");
				fromDate = temp[2]+"-"+temp[1]+"-"+temp[0];
			}
			if(!toDate.equals("")){
				String temp1[]= toDate.split("/");
				toDate = temp1[2]+"-"+temp1[1]+"-"+temp1[0];
			}
			
			//ArrayList<Master>bvendorList = accountDAO.getBvendorList(fromDate,toDate);
			if(action.equals("v")){
				Code39 code128 = new Code39();
				code128.setBarcodeWidth(3);
				
				String vendorname = accountDAO.getBvendorName(loginInfo.getId());
				Master master = new Master();
				ArrayList<Master>totalBarcodeList = new ArrayList<Master>();
				for(int i=1;i<=12;i++){
					master.setName(vendorname);
					code128.setData(Integer.toString(loginInfo.getId()));
					 String filePath = request.getRealPath("/livedata/vbarcode/"+loginInfo.getId()+""+".gif");
					 code128.drawBarcode(filePath);
					 master.setImageName(loginInfo.getId()+".gif");
					 
					 totalBarcodeList.add(master);
					 
				}
				session.setAttribute("totalBarcodeList", totalBarcodeList);
				return "vbarcode";
			}
		
			if(action.equals("c")){
				ArrayList<Master>custList = accountDAO.getcuustBarcodeList(fromDate,toDate);
				ArrayList<Master>totalBarcodeList = new ArrayList<Master>();
				Code39 code128 = new Code39();
				code128.setBarcodeWidth(3);
				for(Master master : custList){
					code128.setData(Integer.toString(master.getId()));
					 String filePath = request.getRealPath("/livedata/cbarcode/"+master.getId()+""+".gif");
					 code128.drawBarcode(filePath);
					 master.setImageName(master.getId()+".gif");
					 
					 totalBarcodeList.add(master);
				}
				session.setAttribute("totalBarcodeList", totalBarcodeList);
				return "cbarcode";
			}
			
			if(action.equals("p")){
				ArrayList<Master>prodtList = accountDAO.getProdBarcodeList(fromDate,toDate);
				ArrayList<Master>totalBarcodeList = new ArrayList<Master>();
				Code39 code128 = new Code39();
				code128.setBarcodeWidth(3);
				
				for(Master master : prodtList){
					code128.setData(Integer.toString(master.getId()));
					 String filePath = request.getRealPath("/livedata/pbarcode/"+master.getId()+""+".gif");
					 code128.drawBarcode(filePath);
					 master.setImageName(master.getId()+".gif");
					 
					 totalBarcodeList.add(master);
				}
				session.setAttribute("totalBarcodeList", totalBarcodeList);
				
				return "pbarcode";
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "vbarcode";
	}
	
	
	public String customer(){
		
		return "cbarcode";
	}

	@Override
	public MasterForm getModel() {
		// TODO Auto-generated method stub
		return masterForm;
	}

}
