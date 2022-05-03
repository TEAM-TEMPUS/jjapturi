package data.dto.member;

public class MemberProfileDto {
	private String nickname;
	private String selfIntroduction;
	private String memberImage;
	private String phoneNumber;

	public MemberProfileDto(String nickname, String selfIntroduction, String memberImage, String phoneNumber) {
		super();
		this.nickname = nickname;
		this.selfIntroduction = selfIntroduction;
		this.memberImage = memberImage;
		this.phoneNumber = phoneNumber;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getSelfIntroduction() {
		return selfIntroduction;
	}

	public void setSelfIntroduction(String selfIntroduction) {
		this.selfIntroduction = selfIntroduction;
	}

	public String getMemberImage() {
		return memberImage;
	}

	public void setMemberImage(String memberImage) {
		this.memberImage = memberImage;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	@Override
	public String toString() {
		return "MemberProfileDto [nickname=" + nickname + ", selfIntroduction=" + selfIntroduction + ", memberImage="
				+ memberImage + ", phoneNumber=" + phoneNumber + "]";
	}

}
