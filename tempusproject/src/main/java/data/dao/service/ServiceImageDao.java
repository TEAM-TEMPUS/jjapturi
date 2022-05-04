package data.dao.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.service.ServiceImageDto;
import mysql.db.DbConnect;

public class ServiceImageDao {

	DbConnect db = new DbConnect();

	public static void store(ServiceImageDto serviceImage) {
		DbConnect db = new DbConnect();
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

	public List<ServiceImageDto> findAllByServiceId(Long serviceId) {
		List<ServiceImageDto> list = new ArrayList<>();
		DbConnect db = new DbConnect();

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from Service_Image where service_id=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, serviceId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ServiceImageDto dto = new ServiceImageDto(rs.getLong("service_id"), rs.getLong("service_image_id"),
						rs.getString("store_img_name"));

				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}

		return list;
	}
}
