package common;

public enum Grades {
	BRONZE("브론즈", "bronze"), SILVER("실버", "silver"), GOLD("골드", "gold"), PLATINUM("플래티넘", "platinum");
	
	private String description;
	private String imagePath;

	private Grades(String description, String imagePath) {
		this.description = description;
		this.imagePath = imagePath;
	}

	public String getDescription() {
		return description;
	}
	
	public String getImagePath() {
		return imagePath;
	}
}
