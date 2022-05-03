package data.dto.comment;

public class CommentInqueryDto {
	private Long commentId;
	private Long memberId;
	private Long serviceId;
	private String text;
	private String nickname;
	private String storeImgName;

	public CommentInqueryDto(Long commentId, Long memberId, Long serviceId, String text, String nickname,
			String storeImgName) {
		super();
		this.commentId = commentId;
		this.memberId = memberId;
		this.serviceId = serviceId;
		this.text = text;
		this.nickname = nickname;
		this.storeImgName = storeImgName;
	}

	public Long getCommentId() {
		return commentId;
	}

	public void setCommentId(Long commentId) {
		this.commentId = commentId;
	}

	public Long getMemberId() {
		return memberId;
	}

	public void setMemberId(Long memberId) {
		this.memberId = memberId;
	}

	public Long getServiceId() {
		return serviceId;
	}

	public void setServiceId(Long serviceId) {
		this.serviceId = serviceId;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getStoreImgName() {
		return storeImgName;
	}

	public void setStoreImgName(String storeImgName) {
		this.storeImgName = storeImgName;
	}

	@Override
	public String toString() {
		return "CommentInqueryDto [commentId=" + commentId + ", memberId=" + memberId + ", serviceId=" + serviceId
				+ ", text=" + text + ", nickname=" + nickname + ", storeImgName=" + storeImgName + "]";
	}

	
}
