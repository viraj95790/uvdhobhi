package com.Lang.Master.eu.bi;

import java.util.ArrayList;

import com.Lang.Master.eu.entity.Certificate;

public interface CertificateDAO {

	int savecertificateinfo(Certificate certificate);

	ArrayList<Certificate> getleaveinfolist(String searchText);

	Certificate getstudentleaving(String selectedid);

	int deleteinfo(String selectedid);

	Certificate editinfo(String selectedid);

	int updateinfo(Certificate certificate);

}
