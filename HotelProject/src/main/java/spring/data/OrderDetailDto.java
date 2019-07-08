package spring.data;

public class OrderDetailDto {
	private int order_detail_num;
	private int order_num;
	private int menu_num;
	private int qty;
	
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
	public int getQTY() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
}
