package data.dto.service;

public class ServiceImageDto {
	private	Long serviceId;
	private Long serviceImageId;
	private String storeImageName;
	
	public Long getServiceId() {
		return serviceId;
	}
	public void setServiceId(Long serviceId) {
		this.serviceId = serviceId;
	}
	public Long getServiceImageId() {
		return serviceImageId;
	}
	public void setServiceImageId(Long serviceImageId) {
		this.serviceImageId = serviceImageId;
	}
	public String getStoreImageName() {
		return storeImageName;
	}
	public void setStoreImageName(String storeImageName) {
		this.storeImageName = storeImageName;
	}
	
	public ServiceImageDto(Long serviceId, String storeImageName) {
		super();
		this.serviceId = serviceId;
		this.storeImageName = storeImageName;
	}
	
	public ServiceImageDto(Long serviceId, Long serviceImageId, String storeImageName) {
		super();
		this.serviceId = serviceId;
		this.serviceImageId = serviceImageId;
		this.storeImageName = storeImageName;
	}

}