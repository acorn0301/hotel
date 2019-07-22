package spring.data;

import java.sql.Timestamp;

public class ReviewReplyDto {
	
	private int review_reply_num;
	private int review_num;
	private int member_num;
	
	private String id;
	private String member_pic;
	
	private Timestamp review_reply_writeday;
	private String review_reply_comment;
	
	private String simpletime;

	public int getReview_reply_num() {
		return review_reply_num;
	}

	public void setReview_reply_num(int review_reply_num) {
		this.review_reply_num = review_reply_num;
	}

	public int getReview_num() {
		return review_num;
	}

	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}

	public int getMember_num() {
		return member_num;
	}

	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getMember_pic() {
		return member_pic;
	}

	public void setMember_pic(String member_pic) {
		this.member_pic = member_pic;
	}

	public Timestamp getReview_reply_writeday() {
		return review_reply_writeday;
	}

	public void setReview_reply_writeday(Timestamp review_reply_writeday) {
		this.review_reply_writeday = review_reply_writeday;
	}

	public String getReview_reply_comment() {
		return review_reply_comment;
	}

	public void setReview_reply_comment(String review_reply_comment) {
		this.review_reply_comment = review_reply_comment;
	}

	public String getSimpletime() {
		return simpletime;
	}

	public void setSimpletime(String simpletime) {
		this.simpletime = simpletime;
	}
	
	
}
