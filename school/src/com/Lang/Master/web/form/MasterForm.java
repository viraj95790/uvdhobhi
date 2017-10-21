package com.Lang.Master.web.form;

import java.util.ArrayList;

import com.Lang.Master.eu.entity.Master;

public class MasterForm {
	
	private int id;
	private String name;
	private String classid = "";
	private String terms;
	private String classname;
	private String subjectname;
	private String firstname;
	private String fathername;
	private String mothername;
	private String lastname;
	private String address;
	private String rollno;
	private String dob;
	private String mob;
	private String phone;
	private String displayname;
	private String cast;
	private String category;
	private String aadhar;
	private String uidseno;
	private String oldschool;
	private String admissiondate;
	private String onlychild;
	private String handicap;
	private String grnum;
	private String housedress;
	private String actiontype = "0";
	
	
	
	
	
	ArrayList<Master>termList;
	ArrayList<Master>classNameList;
	private String searchText;
	ArrayList<Master> getclasslist;
	ArrayList<Master> getsubjectlist;
	ArrayList<Master> getstudentList;
	ArrayList<Master> studentinfoList;
	
	
	
	
	
	
	
	
	
	
	
	
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getHousedress() {
		return housedress;
	}
	public void setHousedress(String housedress) {
		this.housedress = housedress;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public ArrayList<Master> getStudentinfoList() {
		return studentinfoList;
	}
	public void setStudentinfoList(ArrayList<Master> studentinfoList) {
		this.studentinfoList = studentinfoList;
	}
	public String getGrnum() {
		return grnum;
	}
	public void setGrnum(String grnum) {
		this.grnum = grnum;
	}
	public String getCast() {
		return cast;
	}
	public void setCast(String cast) {
		this.cast = cast;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getAadhar() {
		return aadhar;
	}
	public void setAadhar(String aadhar) {
		this.aadhar = aadhar;
	}
	public String getUidseno() {
		return uidseno;
	}
	public void setUidseno(String uidseno) {
		this.uidseno = uidseno;
	}
	public String getOldschool() {
		return oldschool;
	}
	public void setOldschool(String oldschool) {
		this.oldschool = oldschool;
	}
	public String getAdmissiondate() {
		return admissiondate;
	}
	public void setAdmissiondate(String admissiondate) {
		this.admissiondate = admissiondate;
	}
	public String getOnlychild() {
		return onlychild;
	}
	public void setOnlychild(String onlychild) {
		this.onlychild = onlychild;
	}
	public String getHandicap() {
		return handicap;
	}
	public void setHandicap(String handicap) {
		this.handicap = handicap;
	}
	public String getActiontype() {
		return actiontype;
	}
	public void setActiontype(String actiontype) {
		this.actiontype = actiontype;
	}
	public String getDisplayname() {
		return displayname;
	}
	public void setDisplayname(String displayname) {
		this.displayname = displayname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getClassname() {
		return classname;
	}
	public void setClassname(String classname) {
		this.classname = classname;
	}
	public String getSubjectname() {
		return subjectname;
	}
	public void setSubjectname(String subjectname) {
		this.subjectname = subjectname;
	}
	public String getFathername() {
		return fathername;
	}
	public void setFathername(String fathername) {
		this.fathername = fathername;
	}
	public String getMothername() {
		return mothername;
	}
	public void setMothername(String mothername) {
		this.mothername = mothername;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getRollno() {
		return rollno;
	}
	public void setRollno(String rollno) {
		this.rollno = rollno;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getMob() {
		return mob;
	}
	public void setMob(String mob) {
		this.mob = mob;
	}
	public ArrayList<Master> getGetclasslist() {
		return getclasslist;
	}
	public void setGetclasslist(ArrayList<Master> getclasslist) {
		this.getclasslist = getclasslist;
	}
	public ArrayList<Master> getGetsubjectlist() {
		return getsubjectlist;
	}
	public void setGetsubjectlist(ArrayList<Master> getsubjectlist) {
		this.getsubjectlist = getsubjectlist;
	}
	public ArrayList<Master> getGetstudentList() {
		return getstudentList;
	}
	public void setGetstudentList(ArrayList<Master> getstudentList) {
		this.getstudentList = getstudentList;
	}
	public String getSearchText() {
		return searchText;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
	public ArrayList<Master> getTermList() {
		return termList;
	}
	public void setTermList(ArrayList<Master> termList) {
		this.termList = termList;
	}
	public String getTerms() {
		return terms;
	}
	public void setTerms(String terms) {
		this.terms = terms;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getClassid() {
		return classid;
	}
	public void setClassid(String classid) {
		this.classid = classid;
	}
	public ArrayList<Master> getClassNameList() {
		return classNameList;
	}
	public void setClassNameList(ArrayList<Master> classNameList) {
		this.classNameList = classNameList;
	}

}
