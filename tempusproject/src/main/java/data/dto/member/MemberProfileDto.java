package data.dto.member;

public class MemberProfileDto {
	private String nickname;
	private String selfIntroduction;
	private String memberImage;

	public MemberProfileDto(String nickname, String selfIntroduction, String memberImage) {
		super();
		this.nickname = nickname;
		this.selfIntroduction = selfIntroduction;
		this.memberImage = memberImage;
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

	@Override
	public String toString() {
		return "MemberProfileDto [nickname=" + nickname + ", selfIntroduction=" + selfIntroduction + ", memberImage="
				+ memberImage + "]";
	}

}
