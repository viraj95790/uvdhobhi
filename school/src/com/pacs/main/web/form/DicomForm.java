package com.pacs.main.web.form;

import java.io.File;
import java.util.ArrayList;

import com.pacs.main.eu.entity.Dicom;

public class DicomForm {
	
	ArrayList<Dicom>dicomList;
	
	private int id;
	private String destination;
	private String source;
	private String folder_prfix;
	private boolean patient_name;
	private boolean date;
	private boolean time;
	private boolean imgformatprefix;
	private String width;
	private String height;
	private String imgformat;
	ArrayList<Dicom>patientImageList;
	private String foldername;
	public String clientImageData;
	public String selectedimageid;
	
	public String hospName;
	ArrayList<Dicom>hospNameList;
	
	
	public File getUserImage() {
		return userImage;
	}

	public void setUserImage(File userImage) {
		this.userImage = userImage;
	}

	public String getUserImageContentType() {
		return userImageContentType;
	}

	public void setUserImageContentType(String userImageContentType) {
		this.userImageContentType = userImageContentType;
	}

	public String getUserImageFileName() {
		return userImageFileName;
	}

	public void setUserImageFileName(String userImageFileName) {
		this.userImageFileName = userImageFileName;
	}

	private String selectedimgids;
	private String selectedhospname;
	private String selectedpatientname;
	private String selectedinvst;
	
	
	ArrayList<Dicom>reportImgList;
	private String patientName;
	private String pacsFindings;
	
	
   private File userImage;
	
	private String userImageContentType;
	
	private String userImageFileName;
	
	


	public String getPacsFindings() {
		return pacsFindings;
	}

	public void setPacsFindings(String pacsFindings) {
		this.pacsFindings = pacsFindings;
	}

	public String getPatientName() {
		return patientName;
	}

	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}

	public ArrayList<Dicom> getReportImgList() {
		return reportImgList;
	}

	public void setReportImgList(ArrayList<Dicom> reportImgList) {
		this.reportImgList = reportImgList;
	}

	public String getSelectedimgids() {
		return selectedimgids;
	}

	public void setSelectedimgids(String selectedimgids) {
		this.selectedimgids = selectedimgids;
	}

	public String getSelectedhospname() {
		return selectedhospname;
	}

	public void setSelectedhospname(String selectedhospname) {
		this.selectedhospname = selectedhospname;
	}

	public String getSelectedpatientname() {
		return selectedpatientname;
	}

	public void setSelectedpatientname(String selectedpatientname) {
		this.selectedpatientname = selectedpatientname;
	}

	public String getSelectedinvst() {
		return selectedinvst;
	}

	public void setSelectedinvst(String selectedinvst) {
		this.selectedinvst = selectedinvst;
	}

	public String getHospName() {
		return hospName;
	}

	public void setHospName(String hospName) {
		this.hospName = hospName;
	}

	public ArrayList<Dicom> getHospNameList() {
		return hospNameList;
	}

	public void setHospNameList(ArrayList<Dicom> hospNameList) {
		this.hospNameList = hospNameList;
	}

	public String getSelectedimageid() {
		return selectedimageid;
	}

	public void setSelectedimageid(String selectedimageid) {
		this.selectedimageid = selectedimageid;
	}

	public String getClientImageData() {
		return clientImageData;
	}

	public void setClientImageData(String clientImageData) {
		this.clientImageData = clientImageData;
	}

	public String getFoldername() {
		return foldername;
	}

	public void setFoldername(String foldername) {
		this.foldername = foldername;
	}

	public ArrayList<Dicom> getPatientImageList() {
		return patientImageList;
	}

	public void setPatientImageList(ArrayList<Dicom> patientImageList) {
		this.patientImageList = patientImageList;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getFolder_prfix() {
		return folder_prfix;
	}

	public void setFolder_prfix(String folder_prfix) {
		this.folder_prfix = folder_prfix;
	}

	public boolean isPatient_name() {
		return patient_name;
	}

	public void setPatient_name(boolean patient_name) {
		this.patient_name = patient_name;
	}

	public boolean isDate() {
		return date;
	}

	public void setDate(boolean date) {
		this.date = date;
	}

	public boolean isTime() {
		return time;
	}

	public void setTime(boolean time) {
		this.time = time;
	}

	public boolean isImgformatprefix() {
		return imgformatprefix;
	}

	public void setImgformatprefix(boolean imgformatprefix) {
		this.imgformatprefix = imgformatprefix;
	}

	public String getWidth() {
		return width;
	}

	public void setWidth(String width) {
		this.width = width;
	}

	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}

	public String getImgformat() {
		return imgformat;
	}

	public void setImgformat(String imgformat) {
		this.imgformat = imgformat;
	}

	public ArrayList<Dicom> getDicomList() {
		return dicomList;
	}

	public void setDicomList(ArrayList<Dicom> dicomList) {
		this.dicomList = dicomList;
	}
	

}
