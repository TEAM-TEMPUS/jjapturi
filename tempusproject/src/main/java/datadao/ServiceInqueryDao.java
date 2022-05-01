package datadao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import datadto.ServiceInqueryDto;
import mysql.db.DbConnect;

public class ServiceInqueryDao {
	DbConnect db = new DbConnect();
	
	public ServiceInqueryDto findInqueryServiceId(Long serviceId) {
		ServiceInqueryDto dto = new ServiceInqueryDto();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from Service where service_id=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setLong(1, serviceId);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setTypes(rs.getString("types"));
				dto.setTitle(rs.getString("title"));
				dto.setCategory(rs.getString("category"));
				dto.setPlace(rs.getString("place"));
				dto.setStartDate(rs.getDate("start_date"));
				dto.setEndDate(rs.getDate("end_date"));
				dto.setPrice(rs.getInt("price"));
				dto.setDescription(rs.getString("description"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		
		return dto;
	}
}
