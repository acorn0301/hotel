package spring.data;

import java.sql.Timestamp;

public class QnaDto {

	private int board_num;
	private String writer;
	private String subject;
	private String content;
	private Timestamp writeday;
	private int readcount;
	private String category;
	private String board_img;
	private String board_status;
	private String simpletime;
	private String board_pass;
	private int replyCount;
	
	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
	public String getBoard_pass() {
		return board_pass;
	}
	public void setBoard_pass(String board_pass) {
		this.board_pass = board_pass;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getWriter() {
		return writer;
	}
	public void setName(String writer) {
		this.writer = writer;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getWriteday() {
		return writeday;
	}
	public void setWriteday(Timestamp writeday) {
		this.writeday = writeday;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getBoard_img() {
		return board_img;
	}
	public void setBoard_img(String board_img) {
		this.board_img = board_img;
	}
	public String getBoard_status() {
		return board_status;
	}
	public void setBoard_status(String status) {
		this.board_status = status;
	}

	public String getSimpletime() {
		return simpletime;
	}
	public void setSimpletime(String simpletime) {
		this.simpletime = simpletime;
	}
	
	
	
}
