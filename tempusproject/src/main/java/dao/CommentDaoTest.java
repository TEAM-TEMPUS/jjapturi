package dao;
import java.util.List;
import java.util.Vector;

import dao.CommentDao.CommentList;
import dto.CommentDto;

public class CommentDaoTest {
	
	static CommentDao dao = new CommentDao();
	
	public static void main(String[] args) {
		CommentDaoTest test = new CommentDaoTest();
		//test.insertComment(new CommentDto(5L,7L,"text1"));
		//test.updateComment(new CommentDto(4L,null,null,"text1111111"));
		//test.deleteComment(13L);
		test.findcommentlist(7L);
	}
	
	
	//C(생성)R(조회)U(수정)D(삭제)
	//C
	public void insertComment(CommentDto dto){
		CommentDao dao = new CommentDao();
		dao.insertComment(dto);
	}
	
	
	
	
	/*R*/
	public void findcommentlist(Long serviceId){
		CommentDao dao = new CommentDao();
		
		List<CommentList> cl = new Vector<CommentList>();
		cl = dao.findcommentlist(serviceId);
		for(int i = 0; i < cl.size(); i++)
		{
			System.out.print(cl.get(i).getComment_id() + " ");
			System.out.print(cl.get(i).getMember_id() + " ");
			System.out.print(cl.get(i).getService_id() + " ");
			System.out.print(cl.get(i).getText()+" ");
			System.out.print(cl.get(i).getNickname() + " ");
			System.out.println(cl.get(i).getStore_img_name() + " ");
		}
	}
	
	//U
	public void updateComment(CommentDto dto){
		CommentDao dao = new CommentDao();
		dao.updateComment(dto);
	}
	
	
	
	
	//D
	public void deleteComment(Long commentId){
		CommentDao dao = new CommentDao();
		dao.deleteComment(commentId);
	}
	
	
	
	
	
	
	
	
	
	
	
	/*
	//등록 테스트
	public void inertComment() {
		
	}
	
	//수정 데스트
	public void updateComment() {
		
	}
	
	//삭제 테스트
	public void deleteComment() {
		
	}
	*/
	//조회 테스트
	/*
	public void findcommentlist(Long commentId) {
		CommentDaoTest sid=(CommentDaoTest) dao.findcommentlist(commentId);
		System.out.println(sid);
	}
*/	
}
