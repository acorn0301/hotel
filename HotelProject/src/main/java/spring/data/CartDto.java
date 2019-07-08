package spring.data;

public class CartDto {
	private int menu_num;
	private int qty;
	
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
}
