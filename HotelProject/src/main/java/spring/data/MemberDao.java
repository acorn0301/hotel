package spring.data;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao extends SqlSessionDaoSupport{
   
   // 회원 추가
   public void insertMember(MemberDto mbdto)
   {
      getSqlSession().insert("member.memberInsert", mbdto);
   }
   
  /* // 로그인
   public int loginCheck1(String id, String password)
   {
	   Map<String, String> map = new HashMap<String, String>();
	   map.put("id", id);
	   map.put("password", password);
	   
	   return getSqlSession().selectOne("member.login", map);
   }
   */
   //암호화 로그인 - 혜수 수정
   public MemberDto loginCheck1(MemberDto mbdto)
   
   {
      return getSqlSession().selectOne("Hash.loginBcrypt", mbdto);
   }
   
   public int idExist(MemberDto mbdto){
	   return getSqlSession().selectOne("isIdExist", mbdto);
   }
   
   // member_num 값 얻기
   public int getMembernum(String id, String password)
   {
	   Map<String, String> map = new HashMap<String, String>();
	   map.put("id", id);
	   map.put("password", password);
	   
	   return getSqlSession().selectOne("member.getMembernum", map);
   }
   
   // 회원정보 얻기
   public MemberDto getMemberData(int member_num)
   {
	   return getSqlSession().selectOne("member.getMemberData", member_num);
   }
   

   // 회원정보 수정
   public void updateMember(MemberDto mbdto)
   {
		getSqlSession().update("member.infoEdit", mbdto);
   }
   
   
   // 아이디 중복체크
   public int userIdCheck(String id)
   {
	   return getSqlSession().selectOne("member.checkOverId", id);
   }
   
   
   // 비밀번호 찾기 (임시비번-이메일보내기)
   public String getPw(Map<String, Object> paramMap) 
   {
//	  Map<String, Object> paramMap = new HashMap<String, Object>();
//	  paramMap.put("name", name);
//	  paramMap.put("email", email);
	   
      return getSqlSession().selectOne("member.getPw", paramMap);
   }
   
   // 아이디 찾기
   public String getId(Map<String, Object> paramMap)
   {
	   return getSqlSession().selectOne("member.getId", paramMap);
   }
   
   // 임시 비밀번호로 변경
   public void setPw(MemberDto mbdto)
   {
	   getSqlSession().update("member.setPw", mbdto);
   }
   
   //아이디랑 이메일이 일치하는 데이터 갯수 출력
   public int IdEmailMatchCount(MemberDto mbdto)
   {
	   return getSqlSession().selectOne("IdEmailMatchCount",mbdto);
   }
   
   //장희 수정 시작
   //현재 숙박중인 회원인지 판단하기 (0 혹은 1 반환)
   public int isHere(int member_num) {
	   return getSqlSession().selectOne("isHere", member_num);
   }
   
   //현재 숙박 중이거나 체크아웃 한지 일주일 이내인지 확인하여(리뷰 작성 가능한지) null 혹은 book_num을 반환
   public int isReviewAvailable(int member_num) {
	   return getSqlSession().selectOne("isReviewAvailable", member_num);
   }
   //장희 수정 끝
   
   
   
   // 회원 탈퇴 처리 (문의 댓글/리뷰댓글/리뷰타인댓글/리뷰글/주문상세/주문/예약/ 멤버까지 삭제)
   public void withdrawal(MemberDto mbdto)
   {
	   // 문의 댓글 삭제
	   getSqlSession().delete("member.qna_replyDel", mbdto.getMember_num());
	   
	   // 리뷰 댓글 삭제
	   getSqlSession().delete("member.review_replyDel", mbdto.getMember_num());
	   
	   // 리뷰 타인의 댓글까지 삭제
	   getSqlSession().delete("member.review_peoplereplyDel", mbdto.getMember_num());
	   
	   // 리뷰 글 삭제
	   getSqlSession().delete("member.reviewDel", mbdto.getMember_num());
	   
	   // 주문 상세 내역 삭제
	   getSqlSession().delete("member.order_detailDel", mbdto.getMember_num());
	   
	   // 주문 내역 삭제
	   getSqlSession().delete("member.room_orderDel", mbdto.getMember_num());
	   
	   // 예약 내역 삭제
	   getSqlSession().delete("member.bookDel", mbdto.getMember_num());
	   
	   // 멤버 삭제 (최종 멤버까지 삭제-탈퇴)
	   getSqlSession().delete("member.withdrawal",  mbdto.getMember_num());
   }
   
   // member_num 값 얻기 (id만 받아서)
   public int getMembernum_kakao(String id)
   {
	   return getSqlSession().selectOne("member.getMembernum_kakao", id);
   }
   
   // 마이페이지 - 예약 확인 내역 (member_num으로 예약데이터 얻기)
   public List<AdminBookDto> m_getBookList(int member_num){
	   return getSqlSession().selectList("member.m_GetBookList", member_num);
   }
   
   // 내 예약 확인내역 갯수
   public int m_GetBookListCount(int member_num)
   {
	   return getSqlSession().selectOne("member.m_GetBookListCount", member_num);
   }
   
   // 예약 내역 자세히보기
   public AdminBookDto m_GetBookDetail(int book_num){
	   return getSqlSession().selectOne("member.m_GetBookDetail", book_num);
   }
   
   // 마이페이지 - 내 룸서비스 주문내역 목록
   public List<AdminOrderDto> m_GetOrderList(int member_num){
	   return getSqlSession().selectList("member.m_GetOrderList", member_num);
   }
   
   // 룸서비스 메뉴정보 받을때
   public List<AdminOrderDetailDto> m_getOrderDetailByOrderNum(int order_num){
	   return getSqlSession().selectList("member.m_GetOrderDetailByOrderNum", order_num);
   }

   // 내 룸서비스 주문내역 자세히보기(개별내역)
   public AdminOrderDto m_GetOrderDataDetail(int order_num) {
	   return getSqlSession().selectOne("member.m_GetOrderDataDetail", order_num);
   }
   
   // 개별 예약 취소
   public void m_bookCancel(int book_num){
	   getSqlSession().update("member.m_BookCancel", book_num);
   }

   // 개별 룸서비스 주문취소
   public void m_orderCancel(int order_num) {
	   getSqlSession().update("member.m_OrderCancel", order_num);
   }
   
   // 내 룸서비스 주문내역 확인갯수
   public int m_GetOrderListCount(int member_num)
   {
	   return getSqlSession().selectOne("member.m_GetOrderListCount", member_num);
   }
   
   
}