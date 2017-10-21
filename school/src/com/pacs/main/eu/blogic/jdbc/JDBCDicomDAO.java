package com.pacs.main.eu.blogic.jdbc;

import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.pacs.main.eu.bi.DicomDAO;
import com.pacs.main.eu.entity.Dicom;

public class JDBCDicomDAO extends JDBCBaseDAO implements DicomDAO {
	
	public JDBCDicomDAO(Connection connection){
		this.connection = connection;
	}

	public ArrayList<Dicom> getDicomList(String foldername) {
		PreparedStatement preparedStatement = null;
		ArrayList<Dicom>list = new ArrayList<Dicom>();
		String sql = "select id, image from pacsdata where dstatus = 0 and pacsparent="+foldername+" ";
		
		
		try{
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()){
				Dicom dicom = new Dicom();
				dicom.setId(rs.getInt(1));
				dicom.setImagedata(rs.getBinaryStream(2));
				
			/*	Blob blob = rs.getBlob("image");
				byte[] bdata = blob.getBytes(1, (int) blob.length());
				String text = new String(bdata);*/
				
				//System.out.println(text);
				
				list.add(dicom);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}

	
	public int updatePacsSetting(Dicom dicom) {
		PreparedStatement preparedStatement = null;
		int result = 0;
		String sql = "update pacs_setting set destination=?, source=?,  "
				+ "patient_name=?, pdate=?, ptime=?, imgformatprefix=?, imgformat=?, width=?, height=? where id = 1 ";
		
		try{
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, dicom.getDestination());
			preparedStatement.setString(2, dicom.getSource());
			preparedStatement.setBoolean(3, dicom.isPatient_name());
			preparedStatement.setBoolean(4, dicom.isDate());
			preparedStatement.setBoolean(5, dicom.isTime());
			preparedStatement.setBoolean(6, dicom.isImgformatprefix());
			preparedStatement.setString(7, dicom.getImgformat());
			preparedStatement.setString(8, dicom.getWidth());
			preparedStatement.setString(9, dicom.getHeight());
			
			result = preparedStatement.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}

	public Dicom getPacsSettingDetails() {
		PreparedStatement preparedStatement = null;
		Dicom dicom = new Dicom();
		String sql = "select destination, source, patient_name, pdate, "
				+ "ptime, imgformatprefix, imgformat, width, height from pacs_setting where id = 1";
		
		try{
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next()){
				dicom.setDestination(rs.getString(1));
				dicom.setSource(rs.getString(2));
				dicom.setPatient_name(rs.getBoolean(3));
				dicom.setDate(rs.getBoolean(4));
				dicom.setTime(rs.getBoolean(5));
				dicom.setImgformatprefix(rs.getBoolean(6));
				dicom.setImgformat(rs.getString(7));
				dicom.setWidth(rs.getString(8));
				dicom.setHeight(rs.getString(9));
				
				
				
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return dicom;
	}

	public ArrayList<Dicom> getPatientImageList() {
		PreparedStatement preparedStatement = null;
		ArrayList<Dicom>list = new ArrayList<Dicom>();
		String sql = "SELECT id,foldername FROM pacs_parent ";
		
		
		try{
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()){
				Dicom dicom = new Dicom();
				dicom.setId(rs.getInt(1));
				dicom.setFoldername(rs.getString(2));
				
				list.add(dicom);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}

	
	public ArrayList<Dicom> getHospitalNameList() {
		PreparedStatement preparedStatement = null;
		ArrayList<Dicom>list = new ArrayList<Dicom>();
		String sql = "SELECT userid FROM apm_user  where usertype = 2 ";
		
		try{
			
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()){
				Dicom dicom = new Dicom();
				dicom.setHospName(rs.getString(1));
				list.add(dicom);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return list;
	}

	public ArrayList<Dicom> getClientNameList(String fromdate) {
		String todate = fromdate + " 23:55:55";
		PreparedStatement preparedStatement = null;
		ArrayList<Dicom>list = new ArrayList<Dicom>();
		StringBuffer sql = new StringBuffer();
		
		sql.append("SELECT clientid,concat(title,' ',firstname,' ',surname) FROM apm_client_parent_investigation ");
		sql.append("inner join apm_patient on apm_patient.id = apm_client_parent_investigation.clientid ");
		sql.append("where apm_client_parent_investigation.lastmodified  between '"+fromdate+"' and '"+todate+"' and reporttype!='Numerical'  group by clientid ");
		
		try{
			preparedStatement = connection.prepareStatement(sql.toString());
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()){
				Dicom dicom = new Dicom();
				dicom.setId(rs.getInt(1));
				dicom.setClientname(rs.getString(2));
				
				list.add(dicom);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		return list;
	}

	public ArrayList<Dicom> getInvstList(String clientid) {
		PreparedStatement preparedStatement = null;
		ArrayList<Dicom>list = new ArrayList<Dicom>();
		String sql = "SELECT id FROM apm_client_parent_investigation where clientid = "+clientid+"  and reporttype!='Numerical' ";
		
		try{
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()){
				Dicom dicom = new Dicom();
				dicom.setId(rs.getInt(1));
				String invstName = getDbInvstName(dicom.getId());
				dicom.setInvstName(invstName);
				
				list.add(dicom);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return list;
	}

	private String getDbInvstName(int id) {
		PreparedStatement preparedStatement = null;
		String result = "";
		String sql = "SELECT invsttype FROM apm_client_investigation where parentid = "+id+" order by id desc limit 0,1 ";
		
		try{
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next()){
				result = rs.getString(1);
			}
					
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}

	public ArrayList<Dicom> getBlobImgDataList(String id) {
		PreparedStatement preparedStatement = null;
		ArrayList<Dicom>list = new ArrayList<Dicom>();
		String sql = "SELECT id,image FROM pacsdata where id in("+id+") ";
		
		try{
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()){
				Dicom dicom = new Dicom();
				dicom.setId(rs.getInt(1));
				byte[]imagedata = rs.getBytes(2);
				dicom.setBlbData(imagedata);
				
				list.add(dicom);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return list;
	}

	
	public int saveDicomData(int imgid,
			byte[] imagedata, String selectedpatientid,
			String selectedinvst) {
		PreparedStatement preparedStatement = null;
		int result = 0;
		String sql = "insert into his_pacs_data (imgid, imgname, clientid, invstid) values(?,?,?,?) ";
		
		try{
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, imgid);
			preparedStatement.setBytes(2, imagedata);
			preparedStatement.setString(3, selectedpatientid);
			preparedStatement.setString(4, selectedinvst);
			
			result = preparedStatement.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}

	public int updateFinding(String selectedinvst, String pacsFindings) {
		PreparedStatement preparedStatement = null;
		int result = 0;
		String sql  = "update apm_client_investigation set findings=? where parentid = "+selectedinvst+" ";
		
		try{
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, pacsFindings);
			
			result = preparedStatement.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return result;
	}

	public int getMultiPacsCount() {
		PreparedStatement preparedStatement = null;
		int result = 0;
		String sql = "SELECT count(*) FROM multipacs ";
		
		try{
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next()){
				result = rs.getInt(1);
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return result;
	}



}
