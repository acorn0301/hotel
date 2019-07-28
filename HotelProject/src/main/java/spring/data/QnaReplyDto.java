package spring.data;

import java.sql.Timestamp;

public class QnaReplyDto {
	
	private int reply_num;
	private int board_num;
	private String reply_content;
	private Timestamp reply_writeday;
	private int member_num;
	
	//qna_reply db에는 없는 항 - 조인을 통해 member 테이블로부터 가져온다 
	private String name;
	private String grade;
	
	private String member_pic;
	
	
	
	public String getMember_pic() {
		return member_pic;
	}
	public void setMember_pic(String member_pic) {
		this.member_pic = member_pic;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getReply_num() {
		return reply_num;
	}
	public void setReply_num(int reply_num) {
		this.reply_num = reply_num;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public Timestamp getReply_writeday() {
		return reply_writeday;
	}
	public void setReply_writeday(Timestamp reply_writeday) {
		this.reply_writeday = reply_writeday;
	}
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	
	
}
