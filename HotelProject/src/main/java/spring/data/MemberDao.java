package spring.data;

import java.util.HashMap;
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
   
}