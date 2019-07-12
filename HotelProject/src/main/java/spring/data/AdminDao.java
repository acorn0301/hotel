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
	public List<AdminBookDto> getBookListByStatus(String book_status){
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
	public List<AdminOrderDto> getOrderListByStatus(String room_status){
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
	
	
	//호텔 별 객실 리스트 가져오기
	public List<RoomDto> getRoomListByHotel(int hotel_num){
		return getSqlSession().selectList("adminGetRoomListByHotel", hotel_num);
	}
	
	//호텔 넘버별 호텔 이름 가져오기
	public String getHotelLocalByHotelNum(int hotel_num) {
		return getSqlSession().selectOne("adminGetHotelLocalByHotelNum", hotel_num);
	}
	
}
