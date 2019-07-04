package spring.service;


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


}