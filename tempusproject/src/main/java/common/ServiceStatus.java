package common;

public enum ServiceStatus {
	BASIC("basic"), RESERVATION("reservation"), COMPLETION("completion");
	
	private String description;

	private ServiceStatus(String description) {
		this.description = description;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
}
