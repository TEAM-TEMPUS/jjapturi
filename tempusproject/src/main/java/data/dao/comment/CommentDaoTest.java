package data.dao.comment;
import java.util.List;
import java.util.Vector;

import data.dto.comment.CommentDto;
import data.dto.comment.CommentInqueryDto;

public class CommentDaoTest {
	
	static CommentDao dao = new CommentDao();
	
	public static void main(String[] args) {
		CommentDaoTest test = new CommentDaoTest();
		//test.insertComment(new CommentDto(5L,7L,"text1"));
		//test.updateComment(new CommentDto(4L,null,null,"text1111111"));
		//test.deleteComment(13L);
		test.findAllByServiceId(3L);
	}
	
	//C(생성)R(조회)U(수정)D(삭제)
	//C
	public void insertComment(CommentDto dto){
		CommentDao dao = new CommentDao();
		dao.insertComment(dto);
	}
	
	/*R*/
	public void findAllByServiceId(Long serviceId){
		CommentDao dao = new CommentDao();
		
		List<CommentInqueryDto> comments = new Vector<CommentInqueryDto>();
		comments = dao.findAllByServiceId(serviceId);
		for(int i = 0; i < comments.size(); i++)
		{
			System.out.println(comments.get(i));
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
}
