package data.dao.comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import data.dto.comment.CommentDto;
import data.dto.comment.CommentInqueryDto;
import mysql.db.DbConnect;

public class CommentDao {
	DbConnect db = new DbConnect();

	// insert입력
	public void insertComment(CommentDto dto) {

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "insert into Comment (member_id,service_id,text) values (?,?,?)";

		try {
			pstmt = conn.prepareStatement(sql);
			// 바인딩
			pstmt.setLong(1, dto.getMember_id());
			pstmt.setLong(2, dto.getService_id());
			pstmt.setString(3, dto.getText());

			pstmt.execute();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}

	}

	// 조회[Vector는 저장순서를 유지하고 중복을 허용한다]
	// List타입은 CommentDto이다
	public List<CommentInqueryDto> findAllByServiceId(Long serviceId) {

		List<CommentInqueryDto> comments = new Vector<CommentInqueryDto>();

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		// service_id를 이용해 해당 service_id를 가진 comment들을 가져온다.
		// 가져 온 후 list에 저장한다.
		String sql = "SELECT "
				+ "c.comment_id, c.member_id, c.service_id, c.text, m.nickname as nickname, "
				+ "mi.store_img_name as store_img_name FROM Comment AS c LEFT JOIN Member as m "
				+ "on c.member_id=m.member_id LEFT JOIN Member_Image as mi on c.member_id=mi.member_id "
				+ "group by c.comment_id having service_id=?";
		/*
		 * sql문 SELECT c.comment_id, c.member_id, c.service_id, c.text, m.nickname as
		 * nickname, mi.store_img_name as store_img_name FROM Comment AS c LEFT JOIN
		 * Member as m on c.member_id=m.member_id LEFT JOIN Member_Image as mi on
		 * c.member_id=mi.member_id group by c.comment_id
		 */
		try {
			pstmt = conn.prepareStatement(sql);
			// 바인딩 ?표값을 설정한다
			pstmt.setLong(1, serviceId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				/*
				 * //댓글 정보 DTO 객체 생성 CommentDto dto = new CommentDto(); //SQL 결과로 얻은 댓글 정보를
				 * DTO객체에 저장 dto.setComment_id(rs.getLong("comment_id"));
				 * dto.setMember_id(rs.getLong("member_id"));
				 * dto.setService_id(rs.getLong("service_id"));
				 * dto.setText(rs.getString("text"));
				 */
				// Long comment_id, Long member_id, Long service_id, String text, String
				// nickname, String store_img_name
				CommentInqueryDto comment = new CommentInqueryDto(rs.getLong("comment_id"), rs.getLong("member_id"),
						rs.getLong("service_id"), rs.getString("text"), rs.getString("nickname"),
						rs.getString("store_img_name"));

				comments.add(comment); // list에 comment들 저장
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}

		return comments; // DTO 객체 반환
	}

	// 수정
	public void updateComment(CommentDto dto) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		String sql = "update Comment set text=? where comment_id=?";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getText());
			pstmt.setLong(2, dto.getComment_id());

			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}

	}

	// 삭제
	public void deleteComment(Long commentId) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		String sql = "delete from Comment where comment_id=?";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setLong(1, commentId);
			pstmt.execute();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}

	}

}
