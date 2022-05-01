package data.dao.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.service.ServiceImgDto;
import mysql.db.DbConnect;

public class ServiceImgDao {
	DbConnect db=new DbConnect();
	
	public List<ServiceImgDto> findByServiceImage(Long serviceId){
		List<ServiceImgDto> list=new ArrayList<>();
		DbConnect db=new DbConnect();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from Service_Image where service_id=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setLong(1, serviceId);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				ServiceImgDto dto=new ServiceImgDto();
				dto.setServiceImageId(rs.getLong("service_image_id"));
				dto.setServiceId(rs.getLong("service_id"));
				dto.setStoreImgName(rs.getString("store_img_name"));
			
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return list;
		
		
	}
}
