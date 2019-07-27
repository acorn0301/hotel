package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.data.AdminBookDto;
import spring.data.AdminDao;
import spring.data.AdminOrderDetailDto;
import spring.data.AdminOrderDto;
import spring.data.BookDao;
import spring.data.BookDto;
import spring.data.MemberDto;
import spring.data.MenuDto;
import spring.data.OrderDto;
import spring.data.RoomDto;

@Service
public class AdminService {
	
	@Autowired
	AdminDao adao;

	//예약접수 상태인 예약건수를 출력 
	public int getBookListStatus0() {
	
		return adao.getBookListStatus0();
	}
	
	
	//오늘 체크인하는 예약 건수를 출력
	public int getBookListCheckIn() {
		
		return adao.getBookListCheckIn();
	}
	//오늘 체크아하는 예약 건수를 출력
	public int getBookListCheckOut() {
		
		return adao.getBookListCheckOut();
	}
	

	//예약 완료된 건수를 출력
	public int getBookListWaiting() {
		return adao.getBookListWaiting();
	}
	
	//접수된 룸서비스 건수를 출력
	public int getOrderListStatus0() {
		return adao.getOrderListStatus0();
	}
	
	//준비중인 룸서비스 건수를 출력
	public int getOrderListStatus1() {
		return adao.getOrderListStatus1();
	}
	
	//완료된 룸서비스 건수를 출력
		public int getOrderListStatus2() {
			return adao.getOrderListStatus2();
		}
	
	//카테고리별 문의 수 출력
	public int getQnaByCategory(String category) {
		return adao.getQnaByCategory(category);
	}
	
	//예약 내역 디테일하게 가져오기
	public AdminBookDto getBookList(BookDto bdto){
			return adao.getBookList(bdto);
	}
	
	//북넘으로 룸넘 구하기
	public BookDto getBookDto(int book_num) {
		return adao.getBookDto(book_num);
	}
	
	//예약 상태에 따른 리스트 분류
	public List<AdminBookDto> getBookListByStatus(int book_status){
		return adao.getBookListByStatus(book_status);
	}
	
	//오늘 체크인 하는 예약 리스트 가져오기
	public List<AdminBookDto> getBookListCheckInToday(){
		return adao.getBookListCheckInToday();
	}
	
	//오늘 체크아웃하는 예약 리스트 가져오기 
	public List<AdminBookDto> getBookListCheckOutToday(){
		return adao.getBookListCheckOutToday();
	}
	
	//멤버 넘으로 멤버 정보 가져오기
	public MemberDto getMemberData(int member_num) {
		return adao.getMemberData(member_num);
	}
	
	//개별 자세한 예약 정보 가져오기
	public AdminBookDto getBookDetail(int book_num) {
		return adao.getBookDetail(book_num);
	}
	
	//주문상태에 따른 룸서비스 주문 목록 가져오기 
	public List<AdminOrderDto> getOrderListByStatus(int room_status){
		return adao.getOrderListByStatus(room_status);
	}
	
	//상세 주문내역 및 메뉴 정보 가져오기 
	public List<AdminOrderDetailDto> getOrderDetailByOrderNum(int order_num){
	
		return adao.getOrderDetailByOrderNum(order_num);
	}
	
	//개별 주문내역 가져오기 
	public AdminOrderDto getOrderData(int order_num) {
		return adao.getOrderData(order_num);
	}
	
	//총 회원  수 가져오기
	public int getMemberTotalCount() {
		return adao.getMemberTotalCount();
	}

	//회원 목록 페이징 처리해서 가져오기 
	public List<MemberDto> getMemberList(int start, int end){	
		return adao.getMemberList(start, end);
	}
	
	//총 메뉴 수 가져오기
	public int getMenuTotalCount() {
		return adao.getMenuTotalCount();
	}
	
	//메뉴 목록 페이징 처리해서 가져오기
	public List<MenuDto> getMenuList(int start, int end){
		return adao.getMenuList(start, end);
	}
	
	
	//메뉴 타입 가져오기 
	public List<MenuDto> getAllMenuType(){
		return adao.getAllMenuType();
	}
	

	//메뉴 추가하기 
	public void insertMenu(MenuDto mndto) {
		 adao.insertMenu(mndto);
	}
	
	//개별 메뉴 상세 정보 가져오기 
	public MenuDto getMenuData(int menu_num) {
		return adao.getMenuData(menu_num);
	}
	
	//메뉴 삭제하기
	public void deleteMenu(int menu_num) {
		adao.deleteMenu(menu_num);
	}
	
	
	
	
	
	//호텔 별 객실 리스트 가져오기
	public List<RoomDto> getRoomListByHotel(int hotel_num){
		return adao.getRoomListByHotel(hotel_num);
	}
	
	//호텔 넘버별 호텔 이름 가져오기
	public String getHotelLocalByHotelNum(int hotel_num) {
		return adao.getHotelLocalByHotelNum(hotel_num);
	}
	
	//예약 건 다음 스텝으로 넘기기
	public void bookNextStep(int book_num, int book_status) {
		adao.bookNextStep(book_num, book_status);
	}
	
	//예약 건 취소하기
	public void bookCancel(int book_num) {
		adao.bookCancel(book_num);
	}
	
	//예약 건 취소를 철회하기 
	public void bookCancelRevoke(int book_num) {
		adao.bookCancelRevoke(book_num);
	}
	
	//주문 건 다음 스텝으로 넘기기
	public void orderNextStep(int order_num) {
		adao.orderNextStep(order_num);
	}
	
	//주문 건 취소하기
	public void orderCancel(int order_num) {
		adao.orderCancel(order_num);
	}
	
	//주문 건 취소를 철회하기
	public void orderCancelRevoke(int order_num) {
		adao.orderCancelRevoke(order_num);
	}
	
	//모든 메뉴 리스트 가져오기
	public List<MenuDto> getAllMenu(){
		return adao.getAllMenu();
	}
	
	//특정 order_num의 order_detail 데이타 모두 삭제하기
	public void removeAllOrderDetail(int order_num) {	
		adao.removeAllOrderDetail(order_num);
	}
	
	//주문 데이타 수정 업데이트 
	public void updateOrder(OrderDto odto) {
		adao.updateOrder(odto);
	}
	
	//예약 데이타 수정 업데이트
	public void updateBook(BookDto bdto) {
		adao.updateBook(bdto);
	}
}
