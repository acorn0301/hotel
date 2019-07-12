package spring.service;


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}