package data.dto.service;

import java.sql.Date;
import java.util.List;

public class ServiceInqueryDto {
	private Long serviceId;
	private Long memberId;
	private String types;
	private String title;
	private String category;
	private String status;
	private String place;
	private Date startDate;
	private Date endDate;
	private int price;
	private String description;

	public ServiceInqueryDto() {
	}

	public ServiceInqueryDto(Long serviceId, Long memberId, String types, String title, String category, String status, 
			String place, Date startDate, Date endDate, int price, String description) {
		super();
		this.serviceId = serviceId;
		this.memberId = memberId;
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

	@Override
	public String toString() {
		return "ServiceInqueryDto [types=" + types + ", title=" + title + ", category=" + category + ", place=" + place
				+ ", status = " + status + ",startDate=" + startDate + ", endDate=" + endDate + ", price=" + price + ", description="
				+ description + "]";
	}

}