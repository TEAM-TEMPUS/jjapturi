package dto;

public class CommentDto {
///////////////////////////////member변수///////////////////////////
	private Long comment_id;
	private Long member_id;
	private Long service_id;
	private String text;
///////////////////////////////////생성자////////////////////////////////
	public CommentDto(){}
	
	public CommentDto(Long comment_id, Long member_id, Long service_id, String text) {
		super();
		this.comment_id = comment_id;
		this.member_id = member_id;
		this.service_id = service_id;
		this.text= text;
	}
	
	public CommentDto(Long member_id, Long service_id, String text) {
		super();
		this.member_id = member_id;
		this.service_id = service_id;
		this.text= text;
	}
	
	
public CommentDto(Long comment_id) {
		super();
		this.comment_id = comment_id;
	}

///////////////////////////////member함수///////////////////////////
	//접근제한자도 생략가능
	//반환값있으면 함수 없으면 생성자
	//파라미터도 생략가능
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
	@Override
	public String toString() {
		return "CommentDto [comment_id=" + comment_id + ", member_id=" + member_id + ", service_id=" + service_id
				+ ", text=" + text + "]";
	}
	
	
	
	
	
}
