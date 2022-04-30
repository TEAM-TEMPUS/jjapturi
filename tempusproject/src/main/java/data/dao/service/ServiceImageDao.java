package data.dao.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import data.dto.service.ServiceDto;
import data.dto.service.ServiceImageDto;
import mysql.db.DbConnect;

public class ServiceImageDao {

	DbConnect db = new DbConnect();
	
	public void store(ServiceImageDto serviceImage) {

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "INSERT INTO Service_Image (service_id, store_img_name) VALUES (?,?)";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setLong(1, serviceImage.getServiceId());
			pstmt.setString(2, serviceImage.getStoreImageName());
			
			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
}
