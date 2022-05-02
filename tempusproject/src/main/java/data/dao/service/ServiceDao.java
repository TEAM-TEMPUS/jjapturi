package data.dao.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.cj.protocol.Resultset;

import data.dto.service.ServiceDto;
import data.dto.service.ServiceImageDto;
import data.dto.service.ServiceInqueryDto;
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

	public ServiceInqueryDto findByServiceId(Long serviceId) {
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
	
	
	//전체출력...페이지에서 필요한 만큼만 리턴
	List<ServiceInqueryDto> findAll(int offset, int limit){
		List<ServiceInqueryDto> serviceList = new ArrayList<ServiceInqueryDto>();
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from Service " + "order by service_id desc " + "limit ? " + "offset ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, limit);
			pstmt.setLong(2, offset);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Long serviceId = rs.getLong("service_id");
				Long memberId = rs.getLong("member_id");
				String types = rs.getString("types");
				String title = rs.getString("title");
				String category = rs.getString("category");
				String place = rs.getString("place");
				Date startDate = rs.getDate("start_date");
				Date endDate = rs.getDate("end_date");
				Integer price = rs.getInt("price");
				String description = rs.getString("description");

				serviceList.add(new ServiceInqueryDto(serviceId, memberId, types, title, category, place, startDate,
						endDate, price, description));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}

		return serviceList;
	}
	

	
}


