package common;

public enum Grades {
	BRONZE("브론즈"), SILVER("실버"), GOLD("골드"), PLATINUM("플래티넘");
	
	private String description;

	private Grades(String description) {
		this.description = description;
	}

	public String getDescription() {
		return description;
	}
}
