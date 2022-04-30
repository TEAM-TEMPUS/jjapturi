package data.dao.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import data.dto.member.MemberDto;
import mysql.db.DbConnect;

public class MemberImageDao {
	DbConnect db = new DbConnect();

	public void save(Long memberId) {
		String sql = "insert into Member_Image values(null, ?, 'basic-profile-image.png')";
		Connection conn = db.getConnection();
		PreparedStatement ps = null;

		try {
			ps = conn.prepareStatement(sql);
			ps.setLong(1, memberId);

			ps.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(ps, conn);
		}

	}
}
