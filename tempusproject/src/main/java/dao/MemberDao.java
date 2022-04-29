package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.MemberDto;
import dto.MemberProfileDto;
import mysql.db.DbConnect;

public class MemberDao {

	DbConnect db = new DbConnect();

	public void save(MemberDto member) {
		String sql = "insert into Member values(null, ?, ?, ?, ?, ?, ?, ?)";
		Connection conn = db.getConnection();
		PreparedStatement ps = null;

		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, member.getId());
			ps.setString(2, member.getNickname());
			ps.setString(3, member.getPassword());
			ps.setString(4, "");
			ps.setString(5, member.getAddress());
			ps.setString(6, member.getEmail());
			ps.setString(7, member.getPhoneNumber());

			ps.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(ps, conn);
		}

	}

	public void update(MemberDto member) {
		DbConnect db = new DbConnect();

		String sql = "update Member set nickname=?, password=?, address=?, email=?, phone_number=? where id=?";
		Connection conn = db.getConnection();
		PreparedStatement ps = null;

		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, member.getNickname());
			ps.setString(2, member.getPassword());
			ps.setString(3, member.getAddress());
			ps.setString(4, member.getEmail());
			ps.setString(5, member.getPhoneNumber());
			ps.setString(6, member.getId());
			
			ps.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(ps, conn);
		}
	}
	
	public MemberDto findByMemberId(Long memberId) {
		MemberDto member = null;
		DbConnect db = new DbConnect();		
		String sql = "select * from Member where member_id=?";
		Connection conn = db.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			ps = conn.prepareStatement(sql);
			ps.setLong(1, memberId);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				String nickname = rs.getString("nickname");
				String id = rs.getString("id");
				String password = rs.getString("password");
				String address = rs.getString("address");
				String email = rs.getString("email");
				String phoneNumber = rs.getString("phone_number");
				member = new MemberDto(nickname, id, password, address, email, phoneNumber);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(ps, conn);
		}
		
		return member;
	}
	
	public MemberDto findById(String id) {
		MemberDto member = null;
		DbConnect db = new DbConnect();		
		String sql = "select * from Member where id=?";
		Connection conn = db.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				Long memberId = rs.getLong("member_id");
				String nickname = rs.getString("nickname");
				String password = rs.getString("password");
				String address = rs.getString("address");
				String email = rs.getString("email");
				String phoneNumber = rs.getString("phone_number");
				member = new MemberDto(memberId, nickname, id, password, address, email, phoneNumber);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(ps, conn);
		}
		
		return member;
	}

	public MemberProfileDto findMemberProfileByMemberId(Long memberId) {
		MemberProfileDto memberProfile = null;
		DbConnect db = new DbConnect();		
		String sql = "select m.nickname, m.self_introduction, mi.store_img_name "
				+ "from Member m "
				+ "INNER JOIN Member_Image mi on m.member_id = mi.member_id "
				+ "where m.member_id = ?";
		Connection conn = db.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			ps = conn.prepareStatement(sql);
			ps.setLong(1, memberId);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				String nickname = rs.getString("nickname");
				String selfIntroduction = rs.getString("self_introduction");
				String storeImgName = rs.getString("store_img_name");
				memberProfile = new MemberProfileDto(nickname, selfIntroduction, storeImgName);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(ps, conn);
		}
		
		return memberProfile;
	}
}
