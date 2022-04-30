package data.dao.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.cj.protocol.Resultset;

import data.dto.service.ServiceDto;
import data.dto.service.ServiceImageDto;
import mysql.db.DbConnect;

public class ServiceDao {
DbConnect db = new DbConnect();

//	서비스 등록, 테스트완료
	public Long store(ServiceDto service) {
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "insert into Service(types,title,category,place,start_date,end_date,price,description) values(?,?,?,?,?,?,?,?)";
		
		try {
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, service.getTypes());
			pstmt.setString(2, service.getTitle());
			pstmt.setString(3, service.getCategory());
			pstmt.setString(4, service.getPlace());
			pstmt.setString(5, service.getStartDate());
			pstmt.setString(6, service.getEndDate());
			pstmt.setInt(7, service.getPrice());
			pstmt.setString(8, service.getDescription());

			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		return getLastIndex();
	}
	
//	아이디값 받아오는거
	private Long getLastIndex() {
		String sql = "select max(service_id) as service_id from Service;";

		Long lastIndex = null;
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			
			pstmt=conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				lastIndex = rs.getLong("service_id");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		
		return lastIndex;
	}
	
//	서비스 수정, 테스트완료
	public void modify(ServiceDto service) {
		DbConnect db = new DbConnect();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		String sql = "update Service set types=?, title=?, category=?, place=?, start_date=?, end_date=?, price=?, description=? where service_id=?";

		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, service.getTypes());
			pstmt.setString(2, service.getTitle());
			pstmt.setString(3, service.getCategory());
			pstmt.setString(4, service.getPlace());
			pstmt.setString(5, service.getStartDate());
			pstmt.setString(6, service.getEndDate());
			pstmt.setInt(7, service.getPrice());
			pstmt.setString(8, service.getDescription());
			pstmt.setLong(9, service.getServiceId());
			
			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
//	서비스 삭제, 뭔지는 모르겠지만 성공함...?return null로 바꾸고 void에서 ServiceDto로 바꿈
	public void delete(Long serviceId) {
		DbConnect db = new DbConnect();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "delete from Service where service_id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setLong(1, serviceId);
			
			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	
	
	
//	서비스 상태 수정, 테스트완료
	public void changeStatus(ServiceDto service) {
		DbConnect db = new DbConnect();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "update Service set status=? where service_id=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, service.getStatus());
			pstmt.setLong(2, service.getServiceId());
			
			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		
	}
}
