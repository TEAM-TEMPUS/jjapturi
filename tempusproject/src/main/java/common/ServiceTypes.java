package common;

public enum ServiceTypes {
	ANT("ant"), GRASSHOPPER("grasshopper");

	private String description;

	private ServiceTypes(String description) {
		this.description = description;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
}
