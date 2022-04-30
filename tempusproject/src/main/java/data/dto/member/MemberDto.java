package data.dto.member;

public class MemberDto {
	private Long memberId;
	private String nickname;
	private String id;
	private String password;
	private String address;
	private String email;
	private String phoneNumber;

	public MemberDto(String nickname, String id, String password, String address, String email, String phoneNumber) {
		super();
		this.nickname = nickname;
		this.id = id;
		this.password = password;
		this.address = address;
		this.email = email;
		this.phoneNumber = phoneNumber;
	}

	public MemberDto(Long memberId, String nickname, String id, String password, String address, String email,
			String phoneNumber) {
		super();
		this.memberId = memberId;
		this.nickname = nickname;
		this.id = id;
		this.password = password;
		this.address = address;
		this.email = email;
		this.phoneNumber = phoneNumber;
	}

	public Long getMemberId() {
		return memberId;
	}

	public void setMemberId(Long memberId) {
		this.memberId = memberId;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	@Override
	public String toString() {
		return "MemberDto [nickname=" + nickname + ", id=" + id + ", password=" + password + ", address=" + address
				+ ", email=" + email + ", phoneNumber=" + phoneNumber + "]";
	}

}
