package common;

public enum ServiceCategory {
	ERRAND("errand"), WALK("walk"), INSTALL("install"), STUDY("study"), CLEAN("clean");
	
	private String description;

	private ServiceCategory(String description) {
		this.description = description;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
}
