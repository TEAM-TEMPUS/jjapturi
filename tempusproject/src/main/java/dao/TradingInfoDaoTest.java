package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.MemberDto;
import mysql.db.DbConnect;

public class TradingInfoDaoTest {
	static TradingInfoDao dao = new TradingInfoDao();
	
	public static void main(String[] args) {
		TradingInfoDaoTest test = new TradingInfoDaoTest();
		test.findByMemberId(1L);
	}
	
	public void findByMemberId(Long memberId) {
		List<String> gradeList = dao.findCompleteTrandingsByMemberId(memberId);
		for (String grade : gradeList) {
			System.out.println(grade);
		}
	}
}
