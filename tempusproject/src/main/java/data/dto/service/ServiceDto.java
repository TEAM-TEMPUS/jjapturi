package data.dto.service;

public class ServiceDto {

	private String types;
	private String title;
    private String category;
    private String status;
    private String place;
    private String startDate;
    private String endDate;
    private int price;
    private String description;
	private Long serviceId;
    
//    Date를 전부 String으로 바꿈
    public ServiceDto(String types, String title, String category, 
    		String status, String place,String startDate, String endDate, 
    		int price, String description) {
    	super();
    	this.types = types;
    	this.title = title;
    	this.category = category;
    	this.status = status;
    	this.place = place;
    	this.startDate = startDate;
    	this.endDate = endDate;
    	this.price = price;
    	this.description = description;
    }
    
    public ServiceDto(String types, String title, String category, 
    		String status, String place, String startDate, String endDate, 
    		int price, String description, Long serviceId) {

    	this.types = types;
    	this.title = title;
    	this.category = category;
    	this.status = status;
    	this.place = place;
    	this.startDate = startDate;
    	this.endDate = endDate;
    	this.price = price;
    	this.description = description;
    	this.serviceId = serviceId;
    }
    
    public ServiceDto(String types, String title, String category, String place, String startDate, String endDate,
			int price, String description) {
		super();
		this.types = types;
		this.title = title;
		this.category = category;
		this.place = place;
		this.startDate = startDate;
		this.endDate = endDate;
		this.price = price;
		this.description = description;
	}

	public ServiceDto(String status, Long serviceId) {
		super();
		this.status = status;
		this.serviceId = serviceId;
	}

	public ServiceDto(Long serviceId) {
		super();
		this.serviceId = serviceId;
	}

	public Long getServiceId() {
		return serviceId;
	}

	public void setServiceId(Long serviceId) {
		this.serviceId = serviceId;
	}

	public String getTypes() {
		return types;
	}
	public void setTypes(String types) {
		this.types = types;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

}
