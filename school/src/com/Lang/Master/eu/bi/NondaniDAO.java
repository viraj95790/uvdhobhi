package com.Lang.Master.eu.bi;

import java.util.ArrayList;

import com.Lang.Master.eu.entity.Master;

public interface NondaniDAO {

	int saveinfodata(String phcid, String subcentreid, String village,
			String grmpanchayatid, String filingdate, String mnumber,
			String firstname, String midname, String lastname,
			String birthdate, String age, String relation,
			String maritalstatus, String gender, String education,
			String religion, String cast, String category, String childcount,
			String surgeryM, String garodarmata, String khep,
			String lastmc_date, String deliverdate, String deathreason,
			String watersource, String garbhpatdate, String symptomes,
			String childDOB, String childwt, String del_place,
			String prasuti_place, String del_type, String textdel_place,
			String ch_gender, String contraceptive, String surgery_w,
			String upjaatdeth, String matadeath, String cdeathweek,
			String withinmonth, String withinyr, String within5yr,
			String fiveyrabove, String death_place, String utilty,
			String uidno, String povertyline, String povertyno, String ajar,
			String upchardate, String townleft, String plancard, String phone,
			String bloodgrup, String test, String test_date, String conclusion,
			String bankName, String accountno, String branchName, String ifscnum);

	ArrayList<Master> getfamilydatalist(String mnumber);

	

}
