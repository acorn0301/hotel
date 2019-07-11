package spring.data;

import java.sql.Timestamp;
import java.util.List;

public class AdminOrderDto {
	
	//room_order 
	private int order_num;
	private Timestamp time;
	private int member_num;
	private String memo;
	private String room_status;
	private int total_price;
	
	//order_detail
	private int order_detail_num;
	private int menu_num;
	private int qty;
	
	//menu
	private String menu_type;
	private String menu_name_kor;
	private int menu_price;
	
	//member
	private String name;
	private String id;
	private String phone;
	
	private List<AdminOrderDetailDto> order_detail; 
	
	
	
	public List<AdminOrderDetailDto> getOrder_detail() {
		return order_detail;
	}

	public void setOrder_detail(List<AdminOrderDetailDto> order_detail) {
		this.order_detail = order_detail;
	}

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

	private String email;
	
	//book
	private int book_num;
	private int room_num;
	
	//room
	private int room_local;
	private int hotel_num;
	
	//hotel
	private String hotel_local;

	public int getOrder_num() {
		return order_num;
	}

	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}

	public Timestamp getTime() {
		return time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	public int getMember_num() {
		return member_num;
	}

	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getRoom_status() {
		return room_status;
	}

	public void setRoom_status(String room_status) {
		this.room_status = room_status;
	}

	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}

	public int getOrder_detail_num() {
		return order_detail_num;
	}

	public void setOrder_detail_num(int order_detail_num) {
		this.order_detail_num = order_detail_num;
	}

	public int getMenu_num() {
		return menu_num;
	}

	public void setMenu_num(int menu_num) {
		this.menu_num = menu_num;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public String getMenu_type() {
		return menu_type;
	}

	public void setMenu_type(String menu_type) {
		this.menu_type = menu_type;
	}

	public String getMenu_name_kor() {
		return menu_name_kor;
	}

	public void setMenu_name_kor(String menu_name_kor) {
		this.menu_name_kor = menu_name_kor;
	}

	public int getMenu_price() {
		return menu_price;
	}

	public void setMenu_price(int menu_price) {
		this.menu_price = menu_price;
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

	public int getBook_num() {
		return book_num;
	}

	public void setBook_num(int book_num) {
		this.book_num = book_num;
	}

	public int getRoom_num() {
		return room_num;
	}

	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}

	public int getRoom_local() {
		return room_local;
	}

	public void setRoom_local(int room_local) {
		this.room_local = room_local;
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
	
	
	
	

}
