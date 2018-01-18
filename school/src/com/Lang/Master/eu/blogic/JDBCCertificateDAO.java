package com.Lang.Master.eu.blogic;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.Lang.Master.eu.bi.CertificateDAO;
import com.Lang.Master.eu.entity.Certificate;
import com.pacs.main.eu.blogic.jdbc.JDBCBaseDAO;

public class JDBCCertificateDAO extends JDBCBaseDAO implements CertificateDAO {

	public JDBCCertificateDAO(Connection connection){
		this.connection = connection;
	}

	public int savecertificateinfo(Certificate certificate) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		int result = 0;
		String sql = " insert into certificates(registerno, studentid, uid, name, fathername, mothername, nationalty, mothertongue, religion, cast, subcast, birthplace, "
                      + "taluka, district, nation, country, dob, dob_letters, prestandard, progress, behavior, reason, admission_date, "
                      + "leavingdate, lastname, preschool, shera, academicyr) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
		try{
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, certificate.getRegister_number());
			preparedStatement.setString(2, certificate.getStudentid());
			preparedStatement.setString(3, certificate.getUid());
			preparedStatement.setString(4, certificate.getStudentname());
			preparedStatement.setString(5, certificate.getFathername());
			preparedStatement.setString(6, certificate.getMothername());
			preparedStatement.setString(7, certificate.getNationality());
			preparedStatement.setString(8, certificate.getMothertongue());
			preparedStatement.setString(9, certificate.getReligion());
			preparedStatement.setString(10, certificate.getCast());
			preparedStatement.setString(11, certificate.getSubcast());
			preparedStatement.setString(12, certificate.getBirthplace());
			preparedStatement.setString(13, certificate.getTaluka());
			preparedStatement.setString(14, certificate.getDistrict());
			preparedStatement.setString(15, certificate.getNation());
			preparedStatement.setString(16, certificate.getCountry());
			preparedStatement.setString(17, certificate.getDob());
			preparedStatement.setString(18, certificate.getDob_letters());
			preparedStatement.setString(19, certificate.getPrestandard());
			preparedStatement.setString(20, certificate.getProgress());
			preparedStatement.setString(21, certificate.getBehavior());
			preparedStatement.setString(22, certificate.getReasonofleaving());
			preparedStatement.setString(23, certificate.getAdmissiondate());
			preparedStatement.setString(24, certificate.getLeavingdate());
			preparedStatement.setString(25, certificate.getLastname());
			preparedStatement.setString(26, certificate.getPreschool());
			preparedStatement.setString(27, certificate.getShera());
			preparedStatement.setString(28, certificate.getAcademicyr());
			
			
			preparedStatement.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}

	public ArrayList<Certificate> getleaveinfolist(String searchText) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		ArrayList<Certificate> list = new ArrayList<Certificate>();
		StringBuffer sql = new StringBuffer();
		
		 sql.append("select id, registerno, name, dob, district, admission_date, lastname from certificates ");
		 if (searchText!=null) {
		 if (!searchText.equals("")) {
				sql.append("where name  like('%" + searchText + "%') or lastname  like('%" + searchText + "%') order by id desc ");
			}
		 }
		try{
			preparedStatement = connection.prepareStatement(sql.toString());
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()){
				Certificate certificate = new Certificate();
				
				certificate.setId(rs.getInt(1));
				certificate.setRegister_number(rs.getString(2));
				certificate.setStudentname(rs.getString(3)+" "+rs.getString(7));
				certificate.setDob(rs.getString(4));
				certificate.setDistrict(rs.getString(5));
				certificate.setAdmissiondate(rs.getString(6));
				
				list.add(certificate);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}

	public Certificate getstudentleaving(String selectedid) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		Certificate certificate = new Certificate();
		String sql = "select registerno, studentid, uid, name, fathername, mothername, nationalty, mothertongue, religion, cast, subcast, birthplace, "
			     	+ "taluka, district, nation, country, dob, dob_letters, prestandard, progress, behavior, reason, "
			     	+ "admission_date, leavingdate, lastname, preschool, shera, academicyr from certificates where id="+selectedid+" ";
		
		try{
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()){
				
				certificate.setId(Integer.parseInt(selectedid));
				certificate.setRegister_number(rs.getString(1));
				certificate.setStudentid(rs.getString(2));
				certificate.setUid(rs.getString(3));
				certificate.setStudentname(rs.getString(4)+" "+rs.getString(5)+" "+rs.getString(25));
				certificate.setMothername(rs.getString(6));
				certificate.setNationality(rs.getString(7));
				certificate.setMothertongue(rs.getString(8));
				certificate.setReligion(rs.getString(9));
				certificate.setCast(rs.getString(10));
				certificate.setSubcast(rs.getString(11));
				certificate.setBirthplace(rs.getString(12));
				certificate.setTaluka(rs.getString(13));
				certificate.setDistrict(rs.getString(14));
				certificate.setNation(rs.getString(15));
				certificate.setCountry(rs.getString(16));
				certificate.setDob(rs.getString(17));
				certificate.setDob_letters(rs.getString(18));
				certificate.setPrestandard(rs.getString(19));
				certificate.setProgress(rs.getString(20));
				certificate.setBehavior(rs.getString(21));
				certificate.setReasonofleaving(rs.getString(22));
				certificate.setAdmissiondate(rs.getString(23));
				certificate.setLeavingdate(rs.getString(24));
				certificate.setLastname(rs.getString(25));
				certificate.setPreschool(rs.getString(26));
				
				String school = (String) certificate.getPreschool();
				String[] temp = school.split(",");
				
				school = temp[0];
				String standard = temp[1];
				
				certificate.setPreschool(school);
				certificate.setStandard(standard);
				
				certificate.setShera(rs.getString(27));
				certificate.setAcademicyr(rs.getString(28));
				
			}
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return certificate;
	}

	public int deleteinfo(String selectedid) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		int delete = 0;
		String sql = "delete from certificates where id="+selectedid+"  ";
		try{
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return delete;
	}

	public Certificate editinfo(String selectedid) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		Certificate certificate = new Certificate();
		String sql = "select registerno, studentid, uid, name, fathername, mothername, nationalty, mothertongue, religion, cast, subcast, birthplace, "
			     	+ "taluka, district, nation, country, dob, dob_letters, prestandard, progress, behavior, reason, "
			     	+ "admission_date, leavingdate, lastname, preschool, shera, academicyr from certificates where id="+selectedid+" ";
		try{
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()){
				certificate.setId(Integer.parseInt(selectedid));
				
				certificate.setRegister_number(rs.getString(1));
				certificate.setStudentid(rs.getString(2));
				certificate.setUid(rs.getString(3));
				certificate.setStudentname(rs.getString(4));
				certificate.setFathername(rs.getString(5));
				certificate.setMothername(rs.getString(6));
				certificate.setNationality(rs.getString(7));
				certificate.setMothertongue(rs.getString(8));
				certificate.setReligion(rs.getString(9));
				certificate.setCast(rs.getString(10));
				certificate.setSubcast(rs.getString(11));
				certificate.setBirthplace(rs.getString(12));
				certificate.setTaluka(rs.getString(13));
				certificate.setDistrict(rs.getString(14));
				certificate.setNation(rs.getString(15));
				certificate.setCountry(rs.getString(16));
				certificate.setDob(rs.getString(17));
				certificate.setDob_letters(rs.getString(18));
				certificate.setPrestandard(rs.getString(19));
				certificate.setProgress(rs.getString(20));
				certificate.setBehavior(rs.getString(21));
				certificate.setReasonofleaving(rs.getString(22));
				certificate.setAdmissiondate(rs.getString(23));
				certificate.setLeavingdate(rs.getString(24));
				certificate.setLastname(rs.getString(25));
				certificate.setPreschool(rs.getString(26));
				certificate.setShera(rs.getString(27));
				certificate.setAcademicyr(rs.getString(28));
				
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return certificate;
	}

	public int updateinfo(Certificate certificate) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		int update = 0;
		String sql = "update certificates set registerno=?, studentid=?, uid=?, name=?, fathername=?, mothername=?, nationalty=?, "
				     + "mothertongue=?, religion=?, cast=?, subcast=?, birthplace=?, taluka=?, district=?, nation=?, country=?, dob=?, dob_letters=?, prestandard=?, "
				    + "progress=?, behavior=?, reason=?, admission_date=?, leavingdate=?, lastname=?, preschool=?, shera=?, academicyr=? where id=? ";
		try {
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, certificate.getRegister_number());
			preparedStatement.setString(2, certificate.getStudentid());
			preparedStatement.setString(3, certificate.getUid());
			preparedStatement.setString(4, certificate.getStudentname());
			preparedStatement.setString(5, certificate.getFathername());
			preparedStatement.setString(6, certificate.getMothername());
			preparedStatement.setString(7, certificate.getNationality());
			preparedStatement.setString(8, certificate.getMothertongue());
			preparedStatement.setString(9, certificate.getReligion());
			preparedStatement.setString(10, certificate.getCast());
			preparedStatement.setString(11, certificate.getSubcast());
			preparedStatement.setString(12, certificate.getBirthplace());
			preparedStatement.setString(13, certificate.getTaluka());
			preparedStatement.setString(14, certificate.getDistrict());
			preparedStatement.setString(15, certificate.getNation());
			preparedStatement.setString(16, certificate.getCountry());
			preparedStatement.setString(17, certificate.getDob());
			preparedStatement.setString(18, certificate.getDob_letters());
			preparedStatement.setString(19, certificate.getPrestandard());
			preparedStatement.setString(20, certificate.getProgress());
			preparedStatement.setString(21, certificate.getBehavior());
			preparedStatement.setString(22, certificate.getReasonofleaving());
			preparedStatement.setString(23, certificate.getAdmissiondate());
			preparedStatement.setString(24, certificate.getLeavingdate());
			preparedStatement.setString(25, certificate.getLastname());
			preparedStatement.setString(26, certificate.getPreschool());
			preparedStatement.setString(27, certificate.getShera());
			preparedStatement.setString(28, certificate.getAcademicyr());
			preparedStatement.setInt(29, certificate.getId());
			
			preparedStatement.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return update;
	}
}
