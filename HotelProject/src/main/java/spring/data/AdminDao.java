package spring.data;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDao extends SqlSessionDaoSupport{

	//예약접수 상태인 예약건수를 출력 
	public int getBookListStatus0() {	
		return getSqlSession().selectOne("adminGetBookListStatus0");
	}
	
	//오늘 체크인하는 예약 건수를 출력
	public int getBookListCheckIn() {
		return getSqlSession().selectOne("adminGetBookListCheckIn");				
	}
	
	//오늘 체크아웃하는 예약 건수를 출력
	public int getBookListCheckOut() {
		return getSqlSession().selectOne("adminGetBookListCheckOut");				
	}
	
	//예약 완료된 건수를 출력
	public int getBookListWaiting() {
		return getSqlSession().selectOne("adminGetBookListWaiting");
	}
	
	//접수된 룸서비스 건수를 출력
	public int getOrderListStatus0() {
		return getSqlSession().selectOne("adminGetOrderListStatus0");
	}
	
	//준비중인 룸서비스 건수를 출력
	public int getOrderListStatus1() {
		return getSqlSession().selectOne("adminGetOrderListStatus1");
	}
	//준비중인 룸서비스 건수를 출력
		public int getOrderListStatus2() {
			return getSqlSession().selectOne("adminGetOrderListStatus2");
		}
	
	
	//카테고리별 문의 수 출력
	public int getQnaByCategory(String category) {
		return getSqlSession().selectOne("adminGetQnaByCategory", category);
	}
	
	//예약 내역 디테일하게 가져오기
	public AdminBookDto getBookList(BookDto bdto){
		return getSqlSession().selectOne("adminGetBookDetail", bdto);
	}
	
	//북넘 bdto 구하기 
	public BookDto getBookDto(int book_num) {
		return getSqlSession().selectOne("adminGetBookDto", book_num);
	}
	
	//예약 상태에 따른 리스트 분류
	public List<AdminBookDto> getBookListByStatus(int book_status){
		return getSqlSession().selectList("adminGetBookListByStatus", book_status);
	}
	
	//오늘 체크인 하는 예약 리스트 가져오기
	public List<AdminBookDto> getBookListCheckInToday(){
		return getSqlSession().selectList("adminGetBookListCheckInToday");
	}
	
	//오늘 체크아웃하는 예약 리스트 가져오기 
	public List<AdminBookDto> getBookListCheckOutToday(){
		return getSqlSession().selectList("adminGetBookListCheckOutToday");
	}
	
	//멤버 넘으로 멤버 정보 가져오기
	public MemberDto getMemberData(int member_num) {
		return getSqlSession().selectOne("adminGetMemberData", member_num);
	}
	
	//개별 자세한 예약 정보 가져오기
	public AdminBookDto getBookDetail(int book_num) {
		return getSqlSession().selectOne("adminGetBookDetail", book_num);
	}
	
	//주문상태에 따른 룸서비스 주문 목록 가져오기 
	public List<AdminOrderDto> getOrderListByStatus(int room_status){
		return getSqlSession().selectList("adminGetOrderListByStatus", room_status);
	}
	
	//상세 주문내역 및 메뉴 정보 가져오기 
	public List<AdminOrderDetailDto> getOrderDetailByOrderNum(int order_num){
		return getSqlSession().selectList("adminGetOrderDetailByOrderNum", order_num);
	}
	
	//개별 주문내역 가져오기 
	public AdminOrderDto getOrderData(int order_num) {
		return getSqlSession().selectOne("adminGetOrderData", order_num);
	}
	
	//총 회원  수 가져오기
	public int getMemberTotalCount() {
		return getSqlSession().selectOne("adminGetTotalMemberCount");
	}
	
	//회원 목록 페이징 처리해서 가져오기 
	public List<MemberDto> getMemberList(int start, int end){
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		
		return getSqlSession().selectList("adminGetMemberList", map);
	}
	
	//메뉴 목록 페이징 처리해서 가져오기
	public List<MenuDto> getMenuList(int start, int end){
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		
		return getSqlSession().selectList("adminGetMenuList", map);
	}
	
	//총 메뉴 수 가져오기
	public int getMenuTotalCount() {
		return getSqlSession().selectOne("adminGetTotalMenuCount");
	}
	
	//메뉴 타입 가져오기 
	public List<MenuDto> getAllMenuType(){
		return getSqlSession().selectList("adminGetMenuType");
	}
	
	//메뉴 추가하기 
	public void insertMenu(MenuDto mndto) {
		getSqlSession().insert("adminInsertMenu", mndto);
	}
	
	//개별 메뉴 상세 정보 가져오기 
	public MenuDto getMenuData(int menu_num) {
		return getSqlSession().selectOne("adminGetMenuData", menu_num);
	}
	
	//메뉴 삭제하기
	public void deleteMenu(int menu_num) {
		getSqlSession().delete("adminDelteOrderDetailByMenuDelete", menu_num);
		getSqlSession().delete("adminDeleteMenu", menu_num);
	}
	
	//메뉴 수정하기 
	public void updateMenu(MenuDto mndto) {
		getSqlSession().update("adminUpdateMenu", mndto);
	}
	
	
	
	
	
	//호텔 별 객실 리스트 가져오기
	public List<RoomDto> getRoomListByHotel(int hotel_num){
		return getSqlSession().selectList("adminGetRoomListByHotel", hotel_num);
	}
	
	//객실 상세 정보 가져오기 
	public RoomDto getRoomdetail(int room_num) {
		return getSqlSession().selectOne("adminGetRoomDetail", room_num);
	}
	
	
	
	
	//호텔 넘버별 호텔 이름 가져오기
	public String getHotelLocalByHotelNum(int hotel_num) {
		return getSqlSession().selectOne("adminGetHotelLocalByHotelNum", hotel_num);
	}
	
	//예약 건 다음 스텝으로 넘기기
	public void bookNextStep(int book_num, int book_status) {
		if(book_status==1) {
			getSqlSession().update("adminBookNextStepCheckIn", book_num);
		}else if(book_status==2) {
			getSqlSession().update("adminBookNextStepCheckOut", book_num);
		}else {
			getSqlSession().update("adminBookNextStep", book_num);
		}
	}
	
	//예약 건 취소하기
	public void bookCancel(int book_num) {
		getSqlSession().update("adminBookCancel", book_num);
	}
	
	//예약 건 취소를 철회하기 
	public void bookCancelRevoke(int book_num) {
		getSqlSession().update("adminBookCancelRevoke", book_num);
	}
	
	//주문 건 다음 스텝으로 넘기기
	public void orderNextStep(int order_num) {
		getSqlSession().update("adminOrderNextStep", order_num);
	}
	
	//주문 건 취소하기
	public void orderCancel(int order_num) {
		getSqlSession().update("adminOrderCancel", order_num);
	}
	
	//주문 건 취소를 철회하기
	public void orderCancelRevoke(int order_num) {
		getSqlSession().update("adminOrderCancelRevoke", order_num);
	}
	
	//모든 메뉴 리스트 가져오기
	public List<MenuDto> getAllMenu(){
		return getSqlSession().selectList("adminGetAllMenu");
	}
	
	//특정 order_num의 order_detail 데이타 모두 삭제하기
	public void removeAllOrderDetail(int order_num) {
		getSqlSession().delete("adminRemoveOrderDetail", order_num);
	}
	
	//주문 데이타 수정 업데이트 
	public void updateOrder(OrderDto odto) {
		getSqlSession().update("adminUpdateOrder", odto);
	}
	
	//예약 데이타 수정 업데이트
	public void updateBook(BookDto bdto) {
		
		System.out.println("update book call");
		bdto.setCheck_in(bdto.getCheck_in() + " 15:00");
		bdto.setCheck_out(bdto.getCheck_out() + " 11:00");
		System.out.println("check in : " + bdto.getCheck_in());
		getSqlSession().update("adminUpdateBook", bdto);
		System.out.println("update book call end");
	}
	
	
	
	
	
	//admin log 에 데이타 넣기
	public void insertLog(AdminlogDto ldto) {
		System.out.println("log insert!!");
		getSqlSession().insert("adminInsertAdminLog", ldto);
	}
	
	//admin log 리스트 가져오기
	public List<AdminlogDto> getLogList(int start, int end){
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		return getSqlSession().selectList("adminGetAdminLogList", map);
	}
	
	//admin log total count 
	public int getLogTotalCount() {
		return getSqlSession().selectOne("adminLogTotalCount");
	}
}
