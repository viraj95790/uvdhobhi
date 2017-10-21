package com.pacs.main.eu.entity;

import java.io.InputStream;

public class Dicom {
	private int id;
	private InputStream imagedata;
	
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
	private String foldername;
	private String hospName;
	private String clientname;
	private byte[] blbData;
	private String invstName;
	
	
	public String getInvstName() {
		return invstName;
	}
	public void setInvstName(String invstName) {
		this.invstName = invstName;
	}
	public byte[] getBlbData() {
		return blbData;
	}
	public void setBlbData(byte[] blbData) {
		this.blbData = blbData;
	}
	public String getClientname() {
		return clientname;
	}
	public void setClientname(String clientname) {
		this.clientname = clientname;
	}
	public String getHospName() {
		return hospName;
	}
	public void setHospName(String hospName) {
		this.hospName = hospName;
	}
	public String getFoldername() {
		return foldername;
	}
	public void setFoldername(String foldername) {
		this.foldername = foldername;
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
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public InputStream getImagedata() {
		return imagedata;
	}
	public void setImagedata(InputStream imagedata) {
		this.imagedata = imagedata;
	}
	
	
}
