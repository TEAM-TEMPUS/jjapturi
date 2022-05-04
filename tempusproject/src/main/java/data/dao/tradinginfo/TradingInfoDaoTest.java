package data.dao.tradinginfo;

import java.util.List;

import data.dto.tradinginfo.TradingInfoDto;

public class TradingInfoDaoTest {
	static TradingInfoDao dao = new TradingInfoDao();
	
	public static void main(String[] args) {
		TradingInfoDaoTest test = new TradingInfoDaoTest();
//		test.updateGrade(1L, 33L, 4);
//		test.findCompleteTradingInfosByMemberId(1L);
//		test.getTotalCountByMemberId(1L);
		test.deleteByMemberIdAndServiceId(5L, 41L);
	}
	
	public void updateGrade(Long memberId, Long serviceId, int grade) {
		dao.updateGrade(new TradingInfoDto(memberId, serviceId, grade));
	}
	public void findCompleteTradingInfosByMemberId(Long memberId) {
		List<TradingInfoDto> tradingInfos = dao.findCompleteTradingInfosByMemberId(memberId);
		for (TradingInfoDto tradingInfo : tradingInfos) {
			System.out.println(tradingInfo.getGrade());
		}
	}
	
	public void getTotalCountByMemberId(Long memberId) {
		int totalCount = dao.getTotalCountByMemberId(memberId);
		System.out.println(totalCount);
	}
	
	public void deleteByMemberIdAndServiceId(Long memberId, Long serviceId) {
		dao.deleteByMemberIdAndServiceId(memberId, serviceId);
	}
}
