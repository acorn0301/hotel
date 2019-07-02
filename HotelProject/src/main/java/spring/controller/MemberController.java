package spring.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import spring.data.MemberDto;
import spring.service.MemberService;

@Controller
public class MemberController {
   
   @Autowired
   private MemberService mservice;

   //로그인 버튼 클릭시 
   @RequestMapping("/login.do")
   public String login(HttpServletRequest request) {
      
      //로그인 버튼 클릭시 실행되어야 할 기능들
      // 1. 이 회원이 현재날짜 우리 객실에 머무는 사람인지 -> 그렇다면 세션에 currentCustomer 값을 yes로 저장할것
      // 2. 이 회원이 관리자 계정인지 -> 그렇다면 세션에 admin 값을 yes로 저장할것 
      // 3. 이 회원의 member_num을 session에 저장해야 로그인중일때와 로그아웃중일때 나타나는 메뉴 구성을 다르게 할 수 있음.
      // 또한 member_num이 있어야 예약확인 페이지나 마이페이지를 불러올 수 있음 
      
      request.setAttribute("container", "../member/login/loginmain.jsp");
      
      return "layout/home";
   }
   
   //로그아웃 버튼 클릭시 
   @RequestMapping("/logout.do")
   public String logout() {
      
      //로그아웃 되는 로직을 짜보세요.
      //세션도 깔끔하게 지워줍시다. 
      
      return "layout/home";
   }
   
   //회원가입 버튼 클릭시 
   @RequestMapping("/join.do")
   public String joinform(HttpServletRequest request) {
            
      request.setAttribute("container", "../member/join/joinform.jsp");
      
      return "layout/home";
   }
   
   //비회원으로 로그인 버튼 클릭시
   @RequestMapping("/nonMemberLogin.do")
   public String nonMemberLogin(HttpServletRequest request) {
      
      request.setAttribute("container", "../member/login/nonmemberlogin.jsp");
      
      return "layout/home";
   }
   
   //마이페이지 버튼 클릭시
   @RequestMapping("/mypage.do")
   public String mypage(HttpServletRequest request, HttpSession session) {
      
      String member_num = (String)session.getAttribute("member_num");
      
      //넘겨받은 member_num을 이용해 mypage 를 보여줍니다.
      
      request.setAttribute("container", "../member/mypage/mypage.jsp");
      
      return "layout/home";
   }
   
   
   // 가입완료 버튼 클릭시
   @RequestMapping(value="/joinok.do", method=RequestMethod.POST)
   public String joinok(HttpServletRequest request, @ModelAttribute MemberDto mbdto,
		   				@RequestParam("year")String year, @RequestParam("month")String month, @RequestParam("day")String day) {
     
	 mbdto.setBirth(year + "-" + month +"-" + day); // 생년월일 값 따로 전송
     mservice.insertMember(mbdto);
     request.setAttribute("container", "../member/join/joincomplete.jsp");
      
     return "layout/home";
   }
   
}