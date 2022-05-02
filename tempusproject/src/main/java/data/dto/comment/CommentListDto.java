package data.dto.comment;

public class CommentListDto {
	private Long comment_id;
	private Long member_id;
	private Long service_id;
	private String text;
	private String nickname;
	private String store_img_name;
	
	//생성자
	public CommentListDto() {
		// TODO Auto-generated constructor stub
	}
	
	public CommentListDto(Long comment_id, Long member_id, Long service_id, String text, String nickname, String store_img_name) {
		super();
		this.comment_id = comment_id;
		this.member_id = member_id;
		this.service_id = service_id;
		this.nickname = nickname;
		this.store_img_name = store_img_name;
		this.text= text;
	}
	
	
	
	//게터세터 생성
	public Long getComment_id() {
		return comment_id;
	}
	public void setComment_id(Long comment_id) {
		this.comment_id = comment_id;
	}
	public Long getMember_id() {
		return member_id;
	}
	public void setMember_id(Long member_id) {
		this.member_id = member_id;
	}
	public Long getService_id() {
		return service_id;
	}
	public void setService_id(Long service_id) {
		this.service_id = service_id;
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
	public String getStore_img_name() {
		return store_img_name;
	}
	public void setStore_img_name(String store_img_name) {
		this.store_img_name = store_img_name;
	}
	
}
