package com.Lang.Master.eu.blogic;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.Lang.Master.eu.bi.MasterDAO;
import com.Lang.Master.eu.entity.Master;
import com.Lang.Master.web.form.MasterForm;
import com.pacs.main.eu.blogic.jdbc.JDBCBaseDAO;

public class JDBCMasterDAO extends JDBCBaseDAO implements MasterDAO {

	public JDBCMasterDAO(Connection connection) {
		this.connection = connection;
	}

	public ArrayList<Master> getClasssNameList() {
		PreparedStatement preparedStatement = null;
		ArrayList<Master> list = new ArrayList<Master>();
		String sql = "select id,name from classname";

		try {
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				Master master = new Master();
				master.setId(rs.getInt(1));
				master.setName(rs.getString(2));

				list.add(master);
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	public ArrayList<Master> getStudeneNameList(String classid,
			String searchText) {
		PreparedStatement preparedStatement = null;
		ArrayList<Master> list = new ArrayList<Master>();
		StringBuffer sql = new StringBuffer();

		sql.append("select id,name,rollno,fathername,mothername,dob,address,mob from studentname where classid = "
				+ classid + " ");

		if (!searchText.equals("")) {
			sql.append("and name like('%" + searchText + "%') or rollno='"
					+ searchText + "' ");
		}

		try {
			preparedStatement = connection.prepareStatement(sql.toString());
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				Master master = new Master();
				master.setId(rs.getInt(1));
				master.setName(rs.getString(2) + " (" + rs.getString(3) + ")");
				master.setRollno(rs.getString(3));
				master.setFathername(rs.getString(4));
				master.setMothername(rs.getString(5));
				master.setDob(rs.getString(6));
				master.setAddress(rs.getString(7));
				master.setMob(rs.getString(8));

				list.add(master);
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	public ArrayList<Master> getSubjectNameList(String terms) {
		PreparedStatement preparedStatement = null;
		ArrayList<Master> list = new ArrayList<Master>();

		String subjectid = getSubjectIdList(terms);

		String sql = "SELECT id,name,displayname FROM subjectname where id in("
				+ subjectid + ") ";

		try {
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				Master master = new Master();
				master.setId(rs.getInt(1));
				master.setName(rs.getString(2));
				master.setDisplayname(rs.getString(3));

				list.add(master);
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	private String getSubjectIdList(String terms) {
		PreparedStatement preparedStatement = null;
		String result = "";
		String sql = "select subjectid from terms  where id = " + terms + " ";

		try {
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			if (rs.next()) {
				result = rs.getString(1);
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}

	public ArrayList<Master> getTermList() {
		PreparedStatement preparedStatement = null;
		ArrayList<Master> list = new ArrayList<Master>();
		String sql = "select id,name,outofmarks from terms ";

		try {

			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				Master master = new Master();
				master.setId(rs.getInt(1));
				master.setName(rs.getString(2) + " (" + rs.getString(3) + ")");

				list.add(master);
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	public boolean checkColumnExist(String subjectname) {
		PreparedStatement preparedStatement = null;
		boolean result = false;
		try {
			DatabaseMetaData md = connection.getMetaData();
			ResultSet rs = md.getColumns(null, null, "marks", subjectname);

			if (rs.next()) {
				result = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

		return result;
	}

	public int createColumnName(String subjectname) {
		PreparedStatement preparedStatement = null;
		int result = 0;
		String myColumnType = "VARCHAR(45)";
		String sql = "ALTER TABLE marks ADD " + subjectname + " "
				+ myColumnType;

		try {
			preparedStatement = connection.prepareStatement(sql);
			result = preparedStatement.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}

	public int saveMarks(int id, String terms, String classid) {
		PreparedStatement preparedStatement = null;
		int result = 0;
		String sql = "insert into marks(termid, studentid, classid) values(?,?,?)";

		try {

			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, terms);
			preparedStatement.setInt(2, id);
			preparedStatement.setString(3, classid);

			result = preparedStatement.executeUpdate();
			if (result > 0) {

				ResultSet nextGenRs = preparedStatement.getGeneratedKeys();
				while (nextGenRs.next()) {

					result = nextGenRs.getInt(1);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public int updateMarks(String marks, String subjectname, int saveid) {
		PreparedStatement preparedStatement;
		int result = 0;
		String sql = "update marks set " + subjectname + "='" + marks
				+ "' where id=" + saveid + " ";

		try {
			preparedStatement = connection.prepareStatement(sql);
			result = preparedStatement.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}

	public boolean checkTermExist(int id, String terms, String classid) {
		PreparedStatement preparedStatement = null;
		boolean result = false;
		String sql = "select * from marks where termid=" + terms
				+ " and studentid=" + id + " and classid=" + classid + " ";

		try {
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			if (rs.next()) {
				result = true;
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}

	public int getSavedId(int id, String terms, String classid) {
		PreparedStatement preparedStatement = null;
		int result = 0;
		String sql = "select * from marks where termid=" + terms
				+ " and studentid=" + id + " and classid=" + classid + " ";

		try {
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		return result;
	}

	public String getEnteredMarks(String terms, String classid, int studentid,
			String subjectname) {
		PreparedStatement preparedStatement = null;
		String result = "";
		String sql = "select " + subjectname + " from marks where termid="
				+ terms + " and studentid=" + studentid + " and classid="
				+ classid + "  ";

		try {
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			if (rs.next()) {
				result = rs.getString(1);
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}

	public ArrayList<Master> getTermNameList(String terms) {
		PreparedStatement preparedStatement = null;
		ArrayList<Master> list = new ArrayList<Master>();
		int mastertermid = getMasterTermId(terms);
		String sql = "select id,name,outofmarks  from terms where termid = "
				+ mastertermid + " and status=0 ";

		try {

			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				Master master = new Master();
				master.setId(rs.getInt(1));
				master.setName(rs.getString(2));

				list.add(master);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	public double getSelectedStudentMarks(String classid, int studentid,
			int termid, String subjectname) {
		PreparedStatement preparedStatement = null;
		double result = 0;
		String sql = "SELECT " + subjectname + "  FROM marks where classid = "
				+ classid + " and studentid = " + studentid + " and termid  = "
				+ termid + " ";

		try {
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			if (rs.next()) {
				result = rs.getDouble(1);
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}

	public double gettotaltermsmarks(String termid) {
		PreparedStatement preparedStatement = null;
		double result = 0;
		int mastertermid = getMasterTermId(termid);
		String sql = "select sum(outofmarks)  from terms where termid = "
				+ mastertermid + " ";

		try {
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			if (rs.next()) {
				result = rs.getDouble(1);
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}

	private int getMasterTermId(String termid) {
		PreparedStatement preparedStatement = null;
		int result = 0;
		String sql = "select termid from terms where id = " + termid + " ";

		try {
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}

	public int insertclasname(Master master) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		int result = 0;
		String sql = "insert into classname (name, result_date) values(?,?)";
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, master.getClassname());
			preparedStatement.setString(2, master.getResult_date());
			preparedStatement.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}

	public ArrayList<Master> getstandardlist() {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		ArrayList<Master> list = new ArrayList<Master>();
		String sql = "select id, name, result_date from classname";
		try {
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				Master master = new Master();
				master.setId(rs.getInt(1));
				master.setClassname(rs.getString(2));
				master.setResult_date(rs.getString(3));

				list.add(master);
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	public ArrayList<Master> getSubjectlist() {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		ArrayList<Master> list = new ArrayList<Master>();
		String sql = "select id, name from subjectname";
		try {
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				Master master = new Master();
				master.setId(rs.getInt(1));
				master.setSubjectname(rs.getString(2));
				master.setDisplayname(rs.getString(3));

				list.add(master);
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	public int insertsubject(Master master) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		int result = 0;
		String sql = "insert into subjectname  (name, displayname) values(?,?)";
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, master.getSubjectname());
			preparedStatement.setString(2, master.getDisplayname());
			preparedStatement.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}

	public int insertstudentinfo(Master master) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		int result = 0;
		String sql = "insert into studentname (classid, rollno, firstname, fathername, surname, name, mothername, dob, caste, "
				+ "category, address, mob, phno, adhar, hdress, oldschool, admissiondate, "
				+ "grnum, onlychild, handicap, udiseno) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
		try {
			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, master.getClassname());
			preparedStatement.setString(2, master.getRollno());
			preparedStatement.setString(3, master.getFirstname());
			preparedStatement.setString(4, master.getFathername());
			preparedStatement.setString(5, master.getLastname());
			preparedStatement.setString(6, master.getFirstname() + " " + master.getLastname());
			preparedStatement.setString(7, master.getMothername());
			preparedStatement.setString(8, master.getDob());
			preparedStatement.setString(9, master.getCast());
			preparedStatement.setString(10, master.getCategory());
			preparedStatement.setString(11, master.getAddress());
			preparedStatement.setString(12, master.getMob());
			preparedStatement.setString(13, master.getPhone());
			preparedStatement.setString(14, master.getAadhar());
			preparedStatement.setString(15, master.getHousedress());
			preparedStatement.setString(16, master.getOldschool());
			preparedStatement.setString(17, master.getAdmissiondate());
			preparedStatement.setString(18, master.getGrnum());
			preparedStatement.setString(19, master.getOnlychild());
			preparedStatement.setString(20, master.getHandicap());
			preparedStatement.setString(21, master.getUidseno());

			preparedStatement.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}

	public ArrayList<Master> getstudentdata(String clasid, String searchText) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		ArrayList<Master> list = new ArrayList<Master>();
		StringBuffer sql = new StringBuffer();

		sql.append("select id, name, rollno, dob, mob, category, classid from studentname where classid='"
				+ clasid + "' ");

		if (searchText != null) {
			sql.append("and name like('%" + searchText + "%') or rollno='"
					+ searchText + "' and classid='" + clasid + "' ");
		}

		try {
			preparedStatement = connection.prepareStatement(sql.toString());
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				Master master = new Master();

				master.setId(rs.getInt(1));
				master.setName(rs.getString(2));
				master.setRollno(rs.getString(3));
				master.setDob(rs.getString(4));
				master.setMob(rs.getString(5));
				master.setCategory(rs.getString(6));

				list.add(master);

			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}

	public Master editstudentdata(String selectedid) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		Master master = new Master();
		String sql = "select classid, rollno, firstname, fathername, surname, mothername, dob, caste, category, "
				+ "address, mob, phno, adhar, hdress, oldschool, admissiondate, grnum, onlychild, handicap, udiseno "
				+ "from studentname where id='" + selectedid + "' ";
		try {
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {

				master.setId(Integer.parseInt(selectedid));
				master.setName(rs.getString(1));
				master.setRollno(rs.getString(2));
				master.setFirstname(rs.getString(3));
				master.setFathername(rs.getString(4));
				master.setLastname(rs.getString(5));
				master.setMothername(rs.getString(6));
				master.setDob(rs.getString(7));
				master.setCast(rs.getString(8));
				master.setCategory(rs.getString(9));
				master.setAddress(rs.getString(10));
				master.setMob(rs.getString(11));
				master.setPhone(rs.getString(12));
				master.setAadhar(rs.getString(13));
				master.setHousedress(rs.getString(14));
				master.setOldschool(rs.getString(15));
				master.setAdmissiondate(rs.getString(16));
				master.setGrnum(rs.getString(17));
				master.setOnlychild(rs.getString(18));
				master.setHandicap(rs.getString(19));
				master.setUidseno(rs.getString(20));

			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return master;
	}

	public Master editstandard(String selectedid) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		Master master = new Master();
		String sql = "select id, name, result_date from classname where id="+selectedid+" ";
		try {
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {

				master.setId(rs.getInt(1));
				master.setClassname(rs.getString(2));
				master.setResult_date(rs.getString(3));
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return master;
	}

	public int updatestudentinfo(Master master) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		int update = 0;
		String sql = "update studentname set classid=?, rollno=?, firstname=?, fathername=?, surname=?, name=?, mothername=?, dob=?, caste=?, category=?, "
				+ "address=?, mob=?, phno=?, adhar=?, hdress=?, oldschool=?, admissiondate=?, grnum=?, onlychild=?, handicap=?, udiseno=? where id=? ";
		try {
			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, master.getClassname());
			preparedStatement.setString(2, master.getRollno());
			preparedStatement.setString(3, master.getFirstname());
			preparedStatement.setString(4, master.getFathername());
			preparedStatement.setString(5, master.getLastname());
			preparedStatement.setString(6, master.getFirstname() + " " + master.getLastname());
			preparedStatement.setString(7, master.getMothername());
			preparedStatement.setString(8, master.getDob());
			preparedStatement.setString(9, master.getCast());
			preparedStatement.setString(10, master.getCategory());
			preparedStatement.setString(11, master.getAddress());
			preparedStatement.setString(12, master.getMob());
			preparedStatement.setString(13, master.getPhone());
			preparedStatement.setString(14, master.getAadhar());
			preparedStatement.setString(15, master.getHousedress());
			preparedStatement.setString(16, master.getOldschool());
			preparedStatement.setString(17, master.getAdmissiondate());
			preparedStatement.setString(18, master.getGrnum());
			preparedStatement.setString(19, master.getOnlychild());
			preparedStatement.setString(20, master.getHandicap());
			preparedStatement.setString(21, master.getUidseno());
			preparedStatement.setInt(22, master.getId());

			preparedStatement.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return update;
	}

	public int deletestudent(String selectedid) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		int result = 0;
		String sql = "delete from studentname where id='" + selectedid + "'  ";
		try {
			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}

	public ArrayList<Master> getmasterTermlist(String classid) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		ArrayList<Master> list = new ArrayList<Master>();
		String sql = "select id, name from master_terms where classid ="+ classid + " ";
		try {
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				Master master = new Master();
				master.setId(rs.getInt(1));
				master.setMainterm(rs.getString(2));

				list.add(master);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}

	public ArrayList<Master> showtermlist(String mainterm) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		ArrayList<Master> list = new ArrayList<Master>();
		String sql = "select id, name, outofmarks from terms where termid="
				+ mainterm + " ";
		try {
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				Master master = new Master();
				master.setId(rs.getInt(1));
				master.setName(rs.getString(2) + " (" + rs.getString(3) + ")");

				list.add(master);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}

	public Master getacademicyr(String terms) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		Master master = new Master();
		String sql = "select termid, acad_session from terms inner join master_terms on master_terms.id = terms.termid where terms.id ="
				+ terms + " ";
		try {
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				master.setTermid(rs.getString(1));
				master.setAcademic(rs.getString(2));
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return master;
	}

	public Master getclasname(String classid) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		Master master = new Master();
		String sql = "select name from classname where id =" + classid + " ";
		try {
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				master.setClassname(rs.getString(1));
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return master;
	}

	public ArrayList<Master> getReportSubjectNameList(String terms) {
		PreparedStatement preparedStatement = null;
		ArrayList<Master> list = new ArrayList<Master>();

		String subjectid = getSubjectIdList(terms);

		String sql = "SELECT id,name,displayname FROM subjectname where id in("
				+ subjectid + ") and co_scholastic = 0 ";

		try {
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				Master master = new Master();
				master.setId(rs.getInt(1));
				master.setName(rs.getString(2));
				master.setDisplayname(rs.getString(3));

				list.add(master);
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	public ArrayList<Master> getCoschoSubjectList(int sid, String termid,
			String classid, String mainterms) {
		PreparedStatement preparedStatement = null;
		termid = getcotermid(mainterms, "Co_Scholastic Area" ); 
		ArrayList<Master> list = new ArrayList<Master>();
		String sql = "SELECT id, name, displayname FROM subjectname where co_scholastic= 1 ";
		try {
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				Master master = new Master();
				master.setId(rs.getInt(1));
				master.setName(rs.getString(2));
				master.setDisplayname(rs.getString(3));

				String grrade = getGradeName(sid, termid, classid,
						master.getName());
				master.setGrades(grrade);
				
				list.add(master);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return list;
	}

	private String getcotermid(String mainterms, String type) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		String result= "";
		String sql = "SELECT id FROM terms where termid = "+mainterms+" and name =  '"+type+"' ";
		try {
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()){
				result = rs.getString(1);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return result;
	}

	private String getGradeName(int sid, String termid, String classid,
			String name) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		String grade = "";
		String sql = "SELECT "+name+" FROM marks where studentid = "+sid+" and termid = "+termid+" and classid = "+classid+" ";
		try {
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				
				grade = rs.getString(1);
				
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return grade;
	}

	public ArrayList<Master> getdmoSubjectList(int sid, String termid,
			String classid, String mainterms) {
		PreparedStatement preparedStatement = null;
		termid = getcotermid(mainterms, "Discipline" );
		ArrayList<Master> list = new ArrayList<Master>();
		String sql = "SELECT id, name, displayname FROM subjectname where co_scholastic= 2 ";
		try {
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				Master master = new Master();
				master.setId(rs.getInt(1));
				master.setName(rs.getString(2));
				master.setDisplayname(rs.getString(3));

				String grrade = getGradeName(sid, termid, classid,
						master.getName());
				master.setGrades(grrade);
				
				list.add(master);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}

	public Master getresultdate(String classid) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		Master master = new Master();
		String sql = "select result_date from classname where id ="+classid+" ";
		try {
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()){
				master.setResult_date(rs.getString(1));
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return master;
	}

	public int updateclasname(Master master) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		int result = 0;
		String sql = "update classname set name=?, result_date=? where id=? ";
		try {
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, master.getClassname());
			preparedStatement.setString(2, master.getResult_date());
			preparedStatement.setInt(3, master.getId());
			
			preparedStatement.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}

	public int deletestandard(String selectedid) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement = null;
		int result = 0;
		String sql = "delete from classname where id="+ selectedid +"  ";
		try {
			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}

}
