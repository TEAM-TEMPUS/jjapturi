package data.dao.tradinginfo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.tradinginfo.TradingInfoDto;
import mysql.db.DbConnect;

public class TradingInfoDao {
	DbConnect db = new DbConnect();
	
	public void updateGrade(TradingInfoDto tradingInfo){
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		String sql="update Trading_Info set grade = ? where service_id = ? and member_id != ?";
	
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, tradingInfo.getGrade());
			pstmt.setLong(2, tradingInfo.getServiceId());
			pstmt.setLong(3, tradingInfo.getMemberId());
				
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	public List<TradingInfoDto> findCompleteTradingInfosByMemberId(Long memberId) {
		List<TradingInfoDto> gradeList = new ArrayList<>();
		DbConnect db = new DbConnect();		
		String sql = "select ti.grade from Trading_Info ti "
				+ "INNER JOIN Service s "
				+ "on ti.service_id = s.service_id and s.status = 'completion' "
				+ "where ti.member_id = ?";
		Connection conn = db.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			ps = conn.prepareStatement(sql);
			ps.setLong(1, memberId);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				Integer grade = rs.getInt("grade");
				gradeList.add(new TradingInfoDto(grade));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(ps, conn);
		}
		
		return gradeList;
	}
	
	public int getTotalCountByMemberId(Long memberId) {
		int n = 0;

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select count(*) as count from Trading_Info where member_id = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, memberId);
			rs = pstmt.executeQuery();

			if (rs.next())
				n = rs.getInt("count");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}

		return n;
	}	

}
