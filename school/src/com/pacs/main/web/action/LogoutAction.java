package com.pacs.main.web.action;


import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.pacs.main.web.common.helper.LoginHelper;

public class LogoutAction extends BaseAction{
	
	
	public String execute() throws Exception {
		

		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		LoginHelper.removeLoginInfo(request);
		
		
		return SUCCESS;
	}

}
