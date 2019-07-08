package spring.data;

public class RoomDto {
	private int room_num;
	private String room_name;
	private String type;
	private int max;
	private int price;
	private int hotel_num;
	private String room_config;
	private int room_local;
	private String room_img;
	
	
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
	public int getMax() {
		return max;
	}
	public void setMax(int max) {
		this.max = max;
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
	public String getRoom_config() {
		return room_config;
	}
	public void setRoom_config(String room_config) {
		this.room_config = room_config;
	}
	public int getRoom_local() {
		return room_local;
	}
	public void setRoom_local(int room_local) {
		this.room_local = room_local;
	}
	public String getRoom_img() {
		return room_img;
	}
	public void setRoom_img(String room_img) {
		this.room_img = room_img;
	}
	
	
}
