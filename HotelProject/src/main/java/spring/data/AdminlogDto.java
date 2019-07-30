package spring.data;

import java.sql.Timestamp;
import java.util.List;

public class AdminlogDto {

	private int log_num;
	private int member_num;
	private Timestamp log_time;
	private String log_table;
	private String log_act;
	private String log_act_kor;
	
	
	private String log_memo;
	private String log_attr;
	private String simpletime;
	private String name;
	private String member_pic;
	
	
	public String getMember_pic() {
		return member_pic;
	}
	public void setMember_pic(String member_pic) {
		this.member_pic = member_pic;
	}
	private List<String> log_attr_arr;
	
	
	
	public List<String> getLog_attr_arr() {
		return log_attr_arr;
	}
	public void setLog_attr_arr(List<String> log_attr_arr) {
		this.log_attr_arr = log_attr_arr;
	}
	public String getLog_act_kor() {
		return log_act_kor;
	}
	public void setLog_act_kor(String log_act_kor) {
		this.log_act_kor = log_act_kor;
	}
	
	public String getSimpletime() {
		return simpletime;
	}
	public void setSimpletime(String simpletime) {
		this.simpletime = simpletime;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLog_attr() {
		return log_attr;
	}
	public void setLog_attr(String log_attr) {
		this.log_attr = log_attr;
	}
	public int getLog_num() {
		return log_num;
	}
	public void setLog_num(int log_num) {
		this.log_num = log_num;
	}
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	public Timestamp getLog_time() {
		return log_time;
	}
	public void setLog_time(Timestamp log_time) {
		this.log_time = log_time;
	}
	public String getLog_table() {
		return log_table;
	}
	public void setLog_table(String log_table) {
		this.log_table = log_table;
	}
	public String getLog_act() {
		return log_act;
	}
	public void setLog_act(String log_act) {
		this.log_act = log_act;
	}
	public String getLog_memo() {
		return log_memo;
	}
	public void setLog_memo(String log_memo) {
		this.log_memo = log_memo;
	}
	
	
}
