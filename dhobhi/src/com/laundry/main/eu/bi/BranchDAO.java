package com.laundry.main.eu.bi;


import java.util.ArrayList;

import com.laundry.main.eu.entity.Branch;


public interface BranchDAO {

	Branch getuser(String userId) throws Exception;

	ArrayList<Branch> getBranch();



	

}
