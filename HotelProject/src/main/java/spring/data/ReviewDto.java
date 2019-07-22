package spring.data;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ReviewDto {
	
	private int review_num;
	private int review_clean;
	private int review_dining;
	private int review_location;
	private int review_service;
	private int review_price;
	private Timestamp review_writeday;
	
	private String simpletime;
	
	
	private String review_comment;
	private int review_like;
	private int book_num;
	private String review_img;
	
	private int member_num;
	private String id;
	private String member_pic;
	
	private int review_reply_count;
	private List<ReviewReplyDto> reply_list;
	
	private MultipartFile upfile;
	
	

	public String getSimpletime() {
		return simpletime;
	}
	public void setSimpletime(String simpletime) {
		this.simpletime = simpletime;
	}

	public MultipartFile getUpfile() {
		return upfile;
	}
	public void setUpfile(MultipartFile upfile) {
		this.upfile = upfile;
	}

	private int user_member_num;
	private String user_id;
	private String user_member_pic;
	
	public int getUser_member_num() {
		return user_member_num;
	}
	public void setUser_member_num(int user_member_num) {
		this.user_member_num = user_member_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_member_pic() {
		return user_member_pic;
	}
	public void setUser_member_pic(String user_member_pic) {
		this.user_member_pic = user_member_pic;
	}
	public int getReview_reply_count() {
		return review_reply_count;
	}
	public void setReview_reply_count(int review_reply_count) {
		this.review_reply_count = review_reply_count;
	}
	public List<ReviewReplyDto> getReply_list() {
		return reply_list;
	}
	public void setReply_list(List<ReviewReplyDto> reply_list) {
		this.reply_list = reply_list;
	}
	public int getReview_num() {
		return review_num;
	}
	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}
	public int getReview_clean() {
		return review_clean;
	}
	public void setReview_clean(int review_clean) {
		this.review_clean = review_clean;
	}
	public int getReview_dining() {
		return review_dining;
	}
	public void setReview_dining(int review_dining) {
		this.review_dining = review_dining;
	}
	public int getReview_location() {
		return review_location;
	}
	public void setReview_location(int review_location) {
		this.review_location = review_location;
	}
	public int getReview_service() {
		return review_service;
	}
	public void setReview_service(int review_service) {
		this.review_service = review_service;
	}
	public int getReview_price() {
		return review_price;
	}
	public void setReview_price(int review_price) {
		this.review_price = review_price;
	}
	public Timestamp getReview_writeday() {
		return review_writeday;
	}
	public void setReview_writeday(Timestamp review_writeday) {
		this.review_writeday = review_writeday;
	}
	public String getReview_comment() {
		return review_comment;
	}
	public void setReview_comment(String review_comment) {
		this.review_comment = review_comment;
	}
	public int getReview_like() {
		return review_like;
	}
	public void setReview_like(int review_like) {
		this.review_like = review_like;
	}
	public int getBook_num() {
		return book_num;
	}
	public void setBook_num(int book_num) {
		this.book_num = book_num;
	}
	public String getReview_img() {
		return review_img;
	}
	public void setReview_img(String review_img) {
		this.review_img = review_img;
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
	
	
	

}
