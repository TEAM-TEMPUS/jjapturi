package datadao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import datadto.GradeDto;
import mysql.db.DbConnect;

public class GradeDao {
	DbConnect db=new DbConnect();
	
	public void insertGrade(GradeDto dto){
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		String sql="insert into Trading_Info values(null,?,?,?)";
	
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setLong(1, dto.getMemberId());
			pstmt.setLong(2, dto.getServiceId());
			pstmt.setInt(3, dto.getGrade());
			
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	
}
