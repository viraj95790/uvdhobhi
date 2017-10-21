package com.pacs.main.eu.bi;

import java.io.InputStream;
import java.util.ArrayList;

import com.pacs.main.eu.entity.Dicom;

public interface DicomDAO {

	ArrayList<Dicom> getDicomList(String foldername);

	int updatePacsSetting(Dicom dicom);

	Dicom getPacsSettingDetails();

	ArrayList<Dicom> getPatientImageList();

	ArrayList<Dicom> getHospitalNameList();


	ArrayList<Dicom> getClientNameList(String curDate);

	ArrayList<Dicom> getInvstList(String clientid);



	ArrayList<Dicom> getBlobImgDataList(String selectedimgids);

	int saveDicomData(int id, byte[] blbData, String selectedpatientid,
			String selectedinvst);

	int updateFinding(String selectedinvst, String pacsFindings);
	
	int getMultiPacsCount();


}
