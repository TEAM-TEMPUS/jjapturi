package data.dto.service;

import java.sql.Date;

public class MyServiceDto {
	private Long serviceId;
	private String title;
	private String status;
	private String place;
	private Date startDate;
	private Date endDate;
	private Long price;
	private String description;
	private String types;

	public MyServiceDto(Long serviceId, String title, String status, String place, Date startDate, Date endDate,
			Long price, String description, String types) {
		super();
		this.serviceId = serviceId;
		this.title = title;
		this.status = status;
		this.place = place;
		this.startDate = startDate;
		this.endDate = endDate;
		this.price = price;
		this.description = description;
		this.types = types;
	}

	public Long getServiceId() {
		return serviceId;
	}

	public void setServiceId(Long serviceId) {
		this.serviceId = serviceId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Long getPrice() {
		return price;
	}

	public void setPrice(Long price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getTypes() {
		return types;
	}

	public void setTypes(String types) {
		this.types = types;
	}

	@Override
	public String toString() {
		return "MyServiceDto [serviceId=" + serviceId + ", title=" + title + ", status=" + status + ", place=" + place
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", price=" + price + ", description="
				+ description + ", types=" + types + "]";
	}

}
