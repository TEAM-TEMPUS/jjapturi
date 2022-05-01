package data.dto.grade;

public class GradeDto {
	private Long tradingInfoId;
	private Long memberId;
	private Long serviceId;
	private int grade;
	


	public GradeDto(Long memberId, Long serviceId, int grade) {
		super();
		this.memberId = memberId;
		this.serviceId = serviceId;
		this.grade = grade;
	}


	public GradeDto(Long tradingInfoId, Long memberId, Long serviceId, int grade) {
		super();
		this.tradingInfoId = tradingInfoId;
		this.memberId = memberId;
		this.serviceId = serviceId;
		this.grade = grade;
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
