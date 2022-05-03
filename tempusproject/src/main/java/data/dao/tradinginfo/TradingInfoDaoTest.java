package data.dao.tradinginfo;

import java.util.List;

import data.dto.member.TradingInfoDto;

public class TradingInfoDaoTest {
	static TradingInfoDao dao = new TradingInfoDao();
	
	public static void main(String[] args) {
		TradingInfoDaoTest test = new TradingInfoDaoTest();
		test.findCompleteTradingInfosByMemberId(1L);
	}
	
	public void findCompleteTradingInfosByMemberId(Long memberId) {
		List<TradingInfoDto> tradingInfos = dao.findCompleteTradingInfosByMemberId(memberId);
		for (TradingInfoDto tradingInfo : tradingInfos) {
			System.out.println(tradingInfo.getGrade());
		}
	}
}
