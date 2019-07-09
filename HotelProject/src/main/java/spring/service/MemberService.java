package spring.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.data.MemberDao;
import spring.data.MemberDto;
import spring.data.QnaDto;

@Service
public class MemberService {

   @Autowired
   MemberDao mbdao;
   
   // 회원가입(회원추가)
   public void insertMember(MemberDto mbdto)
   {
      mbdao.insertMember(mbdto);
   }
   
   // 로그인
   public int loginCheck1(String id, String password)
   {
	   return mbdao.loginCheck1(id, password);
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
    



}