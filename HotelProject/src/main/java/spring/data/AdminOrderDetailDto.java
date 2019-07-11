package spring.data;

public class AdminOrderDetailDto {
	private int order_detail_num;
	private int order_num;
	private int menu_num;
	private int qty;
	
	private String menu_type;
	private String menu_name_kor;
	private String menu_name_eng;
	private int menu_price;
	private String menu_img;
	private String menu_desc;
	public int getOrder_detail_num() {
		return order_detail_num;
	}
	public void setOrder_detail_num(int order_detail_num) {
		this.order_detail_num = order_detail_num;
	}
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
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
	public String getMenu_name_eng() {
		return menu_name_eng;
	}
	public void setMenu_name_eng(String menu_name_eng) {
		this.menu_name_eng = menu_name_eng;
	}
	public int getMenu_price() {
		return menu_price;
	}
	public void setMenu_price(int menu_price) {
		this.menu_price = menu_price;
	}
	public String getMenu_img() {
		return menu_img;
	}
	public void setMenu_img(String menu_img) {
		this.menu_img = menu_img;
	}
	public String getMenu_desc() {
		return menu_desc;
	}
	public void setMenu_desc(String menu_desc) {
		this.menu_desc = menu_desc;
	}
	
	
}
