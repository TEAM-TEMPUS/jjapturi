package data.dto.service;

public class ServiceImgDto {
	private Long serviceImageId;
	private Long serviceId;
	private String storeImgName;
	
	public Long getServiceImageId() {
		return serviceImageId;
	}
	public void setServiceImageId(Long serviceImageId) {
		this.serviceImageId = serviceImageId;
	}
	public Long getServiceId() {
		return serviceId;
	}
	public void setServiceId(Long serviceId) {
		this.serviceId = serviceId;
	}
	public String getStoreImgName() {
		return storeImgName;
	}
	public void setStoreImgName(String storeImgName) {
		this.storeImgName = storeImgName;
	}
	
	
	@Override
	public String toString() {
		return "ServiceImgDto [serviceImageId=" + serviceImageId + ", serviceId=" + serviceId + ", storeImgName="
				+ storeImgName + "]";
	}

	
	

}
