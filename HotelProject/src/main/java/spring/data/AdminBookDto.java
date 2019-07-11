package spring.data;

import java.sql.Timestamp;

public class AdminBookDto {

	private int book_num;
	
	private int member_num;
	private String name;
	private String id;
	private String phone;
	private String email;
	
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	private Timestamp check_in;
	private Timestamp check_out;
	
	private int room_num;
	private int room_local;
	private String room_name;
	private String type;
	private int price;
	private int hotel_num;
	private String hotel_local;
	
	private int head_count;
	private String book_memo;
	private String book_status;
	private Timestamp book_day;
	private int add_bed;
	private int breakfast_count;
	
	
	public int getBook_num() {
		return book_num;
	}
	public void setBook_num(int book_num) {
		this.book_num = book_num;
	}
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Timestamp getCheck_in() {
		return check_in;
	}
	public void setCheck_in(Timestamp check_in) {
		this.check_in = check_in;
	}
	public Timestamp getCheck_out() {
		return check_out;
	}
	public void setCheck_out(Timestamp check_out) {
		this.check_out = check_out;
	}
	public int getRoom_num() {
		return room_num;
	}
	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getHotel_num() {
		return hotel_num;
	}
	public void setHotel_num(int hotel_num) {
		this.hotel_num = hotel_num;
	}
	public String getHotel_local() {
		return hotel_local;
	}
	public void setHotel_local(String hotel_local) {
		this.hotel_local = hotel_local;
	}
	public int getRoom_local() {
		return room_local;
	}
	public void setRoom_local(int room_local) {
		this.room_local = room_local;
	}
	public int getHead_count() {
		return head_count;
	}
	public void setHead_count(int head_count) {
		this.head_count = head_count;
	}
	public String getBook_memo() {
		return book_memo;
	}
	public void setBook_memo(String book_memo) {
		this.book_memo = book_memo;
	}
	public String getBook_status() {
		return book_status;
	}
	public void setBook_status(String book_status) {
		this.book_status = book_status;
	}
	public Timestamp getBook_day() {
		return book_day;
	}
	public void setBook_day(Timestamp book_day) {
		this.book_day = book_day;
	}
	public int getAdd_bed() {
		return add_bed;
	}
	public void setAdd_bed(int add_bed) {
		this.add_bed = add_bed;
	}
	public int getBreakfast_count() {
		return breakfast_count;
	}
	public void setBreakfast_count(int breakfast_count) {
		this.breakfast_count = breakfast_count;
	}
	
	
	
	
	
	
}
