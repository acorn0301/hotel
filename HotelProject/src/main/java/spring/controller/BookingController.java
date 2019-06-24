package spring.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BookingController {

	
	//예약확인 버튼을 눌렀을 때
	@RequestMapping("/bookingCheck.do")
	public String booking(HttpSession session,HttpServletRequest request) {
		
		//만약 로그인 후에 예약확인 버튼을 눌렀다면 분명 세션에 member_num이 저장되어있을 것이다.
		String member_num = (String)session.getAttribute("member_num");
		
		//로그인이 된 상태에서 예약확인을 눌렀을 때
		if(member_num != null) {
			
			//받아온 member_num으로 부터 book 테이블을 조회해서 해당 member_num을 가진 예약내역을 출력하시오 
			
			request.setAttribute("container", "../member/mypage/mybooking.jsp");
		
			
		//로그인 되지 않은 상태에서 예약확인을 눌렀을 때
		}else {
			
			//로그인 할지 비회원으로 조회할지를 묻는 페이지로 넘겨준다. 
			request.setAttribute("container", "../member/askLogin.jsp");

		}
		
		return "layout/home";
	}
}
