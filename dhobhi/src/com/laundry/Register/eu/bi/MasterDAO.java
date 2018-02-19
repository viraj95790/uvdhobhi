package com.laundry.Register.eu.bi;

import java.util.ArrayList;

import com.laundry.Register.eu.entity.Master;



public interface MasterDAO {

	int insertservices(Master master);

	ArrayList<Master> getserviceList();

	Master editservices(String selectedid);

	int updateservice(Master master);

	int deleteservice(String selectedid);

	int insertItem(Master master);

	ArrayList<Master> getItemList();

	Master edititem(String selectedid);

	int updateItem(Master master);

	int deleteItem(String selectedid);

	ArrayList<Master> getSubItemList();

	int insertsubItem(Master master);

	Master editsubItem(String selectedid);

	int updatesubItem(Master master);

	int deletesubItem(String selectedid);

	ArrayList<Master> gethospitalList();

	
}
