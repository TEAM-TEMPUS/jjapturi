package data.dao.grade;

import data.dto.grade.GradeDto;

public class GradeDaoTest {
	static GradeDao dao=new GradeDao();
	
	public static void main(String[] args) {
		GradeDaoTest test=new GradeDaoTest();		
		test.insertGrade();
		
	}
	public void insertGrade() {
		GradeDto dto=new GradeDto(1L,1L,1L,3);
		dao.insertGrade(dto);
	}
}
