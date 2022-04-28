package dao;

import java.util.List;

public class TradingInfoDaoTest {
	static TradingInfoDao dao = new TradingInfoDao();
	
	public static void main(String[] args) {
		TradingInfoDaoTest test = new TradingInfoDaoTest();
		test.findCompleteTrandingsByMemberId(1L);
	}
	
	public void findCompleteTrandingsByMemberId(Long memberId) {
		List<String> gradeList = dao.findCompleteTrandingsByMemberId(memberId);
		for (String grade : gradeList) {
			System.out.println(grade);
		}
	}
}
