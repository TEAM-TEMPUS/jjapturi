package data.dao.grade;

import data.dto.tradinginfo.TradingInfoDto;

public class GradeDaoTest {
	static GradeDao dao=new GradeDao();
	
	public static void main(String[] args) {
		GradeDaoTest test=new GradeDaoTest();		
		test.insertGrade();
		
	}
	public void insertGrade() {
		TradingInfoDto dto=new TradingInfoDto(1L,1L,1L,3);
		dao.insertGrade(dto);
	}
}
