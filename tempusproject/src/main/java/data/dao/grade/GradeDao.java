package data.dao.grade;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import data.dto.tradinginfo.TradingInfoDto;
import mysql.db.DbConnect;

public class GradeDao {
	DbConnect db=new DbConnect();
	
	public void insertGrade(TradingInfoDto grade){
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		String sql="insert into Trading_Info values(null,?,?,?)";
	
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setLong(1, grade.getMemberId());
			pstmt.setLong(2, grade.getServiceId());
			pstmt.setInt(3, grade.getGrade());
			
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
}
