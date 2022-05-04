package data.dto.tradinginfo;

public class TradingInfoDto {
	private Long tradingInfoId;
	private Long memberId;
	private Long serviceId;
	private int grade;
	private String types;

	public TradingInfoDto(int grade) {
		super();
		this.grade = grade;
	}

	public TradingInfoDto(Long memberId, Long serviceId, int grade) {
		super();
		this.memberId = memberId;
		this.serviceId = serviceId;
		this.grade = grade;
	}

	public TradingInfoDto(Long tradingInfoId, Long memberId, Long serviceId, int grade) {
		super();
		this.tradingInfoId = tradingInfoId;
		this.memberId = memberId;
		this.serviceId = serviceId;
		this.grade = grade;
	}

	public TradingInfoDto(Long tradingInfoId, Long memberId, Long serviceId, int grade, String types) {
		super();
		this.tradingInfoId = tradingInfoId;
		this.memberId = memberId;
		this.serviceId = serviceId;
		this.grade = grade;
		this.types = types;
	}

	public Long getTradingInfoId() {
		return tradingInfoId;
	}

	public void setTradingInfoId(Long tradingInfoId) {
		this.tradingInfoId = tradingInfoId;
	}

	public Long getMemberId() {
		return memberId;
	}

	public void setMemberId(Long memberId) {
		this.memberId = memberId;
	}

	public Long getServiceId() {
		return serviceId;
	}

	public void setServiceId(Long serviceId) {
		this.serviceId = serviceId;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

}
