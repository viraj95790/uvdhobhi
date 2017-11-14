package com.Lang.Master.eu.bi;

import java.util.ArrayList;

import com.Lang.Master.eu.entity.Master;

public interface MasterDAO {

	ArrayList<Master> getClasssNameList();

	ArrayList<Master> getStudeneNameList(String classid,String searchText);


	ArrayList<Master> getSubjectNameList(String terms);

	ArrayList<Master> getTermList();

	boolean checkColumnExist(String subjectname);

	int createColumnName(String subjectname);

	int saveMarks(int id, String terms, String classid);

	int updateMarks(String marks, String subjectname, int saveid);

	boolean checkTermExist(int id, String terms, String classid);

	int getSavedId(int id, String terms, String classid);

	String getEnteredMarks(String terms,String classid,int studentid,String subjectname);

	ArrayList<Master> getTermNameList(String terms);

	double getSelectedStudentMarks(String classid,int studentid,int termid,String subjectname);
	
	double gettotaltermsmarks(String termid);

	int insertclasname(Master master);

	ArrayList<Master> getstandardlist();

	ArrayList<Master> getSubjectlist();

	int insertsubject(Master master);

	int insertstudentinfo(Master master);

	ArrayList<Master> getstudentdata(String clasid, String searchText);

	Master editstudentdata(String selectedid);

	Master editstandard(String selectedid);

	int updatestudentinfo(Master master);

	int deletestudent(String selectedid);

	ArrayList<Master> getmasterTermlist(String classid);

	ArrayList<Master> showtermlist(String mainterm);

	Master getacademicyr(String terms);

	Master getclasname(String classid);

	ArrayList<Master> getReportSubjectNameList(String terms);
	
	ArrayList<Master>getCoschoSubjectList(int sid,String termid,String classid, String mainterms);
	
	ArrayList<Master>getdmoSubjectList(int sid,String termid,String classid, String mainterms);
	
	

}
