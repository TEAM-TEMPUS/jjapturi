package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import dto.MemberDto;
import mysql.db.DbConnect;

public class MemberDao {

	DbConnect db = new DbConnect();

	public void save(MemberDto member) {
		String sql = "insert into Member(id, nickname, password, address, email, phone_number) values(?, ?, ?, ?, ?, ?)";
		Connection conn = db.getConnection();
		PreparedStatement ps = null;
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, member.getId());
			ps.setString(2, member.getNickname());
			ps.setString(3, member.getPassword());
			ps.setString(4, member.getAddress());
			ps.setString(5, member.getEmail());
			ps.setString(6, member.getPhoneNumber());
			
			ps.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(ps, conn);
		}
		
	}
}
