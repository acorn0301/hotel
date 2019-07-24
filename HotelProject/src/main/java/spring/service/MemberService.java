package spring.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.data.AdminBookDto;
import spring.data.AdminDao;
import spring.data.BookDto;
import spring.data.MemberDao;
import spring.data.MemberDto;

@Service
public class MemberService {

   @Autowired
   MemberDao mbdao;
   
   // 회원가입(회원추가)
   public void insertMember(MemberDto mbdto)
   {
      mbdao.insertMember(mbdto);
   }
   
//   // 로그인
//   public int loginCheck1(String id, String password)
//   {
//	   return mbdao.loginCheck1(id, password);
//   }
   
   //로그인 - 혜수수정
   public MemberDto loginCheck1(MemberDto mbdto)
   {
      return mbdao.loginCheck1(mbdto);
   }
   
   public int idExist(MemberDto mbdto){
	   return mbdao.idExist(mbdto);
   }
   
   // member_num 얻기
   public int getMembernum(String id, String password)
   {
	   return mbdao.getMembernum(id, password);
   }
   
   
   // 회원 정보 가져오기
 	public MemberDto getMemberData(int member_num) 
 	{
 		return mbdao.getMemberData(member_num);
 	}
 	
    // 회원 정보 수정
    public void updateMember(MemberDto mbdto)
    {
 	   mbdao.updateMember(mbdto);
    }
    
    
    // 아이디 중복체크
    public int userIdCheck(String id)
    {
    	return mbdao.userIdCheck(id);
    }
    
    
    // 비밀번호 찾기 (이메일보내기)
    public String getPw(Map<String, Object> paramMap)
    {
    	return mbdao.getPw(paramMap);
    }
    
    // 아이디 찾기
    public String getId(Map<String, Object> paramMap)
    {
    	return mbdao.getId(paramMap);
    }
    
    // 임시 비밀번호로 변경
    public void setPw(MemberDto mbdto)
    {
    	mbdao.setPw(mbdto);
    }

    //아이디랑 이메일이 일치하는 데이터 갯수 출력
    public int IdEmailMatchCount(MemberDto mbdto)
    {
    	return mbdao.IdEmailMatchCount(mbdto);
    }
    
    //장희 수정 시작
    //현재 숙박중인 회원인지 판단하기 (0 혹은 1 반환)
    public int isHere(int member_num) {
 	   return mbdao.isHere(member_num);
    }
    
    //현재 숙박 중이거나 체크아웃 한지 일주일 이내인지 확인하여(리뷰 작성 가능한지) null 혹은 book_num을 반환
    public int isReviewAvailable(int member_num) {
 	   return mbdao.isReviewAvailable(member_num);
    }
    //장희 수정 끝 
    
    // 회원 탈퇴
    public void withdrawal(MemberDto mbdto)
    {
    	mbdao.withdrawal(mbdto);
    }

    // member_num 값 얻기 (id만 받아서)
    public int getMembernum_kakao(String id)
    {
 	   return mbdao.getMembernum_kakao(id);
    }
    
    // 마이페이지 - 예약 확인 내역 (member_num으로 예약데이터 얻기)
  	public List<AdminBookDto> m_getBookList(int member_num){
  		return mbdao.m_getBookList(member_num);
  	}
  	
  	// 내 예약 확인내역 갯수
    public int m_GetBookListCount(int member_num)
    {
 	   return mbdao.m_GetBookListCount(member_num);
    }
    
    // 예약 내역 자세히보기
    public AdminBookDto m_GetBookDetail(int book_num){
    	return mbdao.m_GetBookDetail(book_num);
    }

}