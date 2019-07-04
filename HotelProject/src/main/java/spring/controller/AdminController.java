package spring.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.service.AdminService;

@Controller
public class AdminController {

	@Autowired
	AdminService aservice;
	
	
	//관리자 메인페이지를 보여준다 
	@RequestMapping("/admin.do")
	public String adminMain(HttpServletRequest request) {
		
		
		//예약 접수 상태인 예약 건수 얻기
		int status0 = aservice.getBookListStatus0();
		
		//오늘 체크인하는 예약 건수 얻기
		int statusCheckIn = aservice.getBookListCheckIn();
		
		//오늘 체크아웃하는 예약 건수 얻기
		int statusCheckOut = aservice.getBookListCheckOut();
				
		//예약 완료된 건수 얻기
		int status1 = aservice.getBookListWaiting();
		
		request.setAttribute("status0", status0);
		request.setAttribute("status1", status1);
		request.setAttribute("statusCheckIn", statusCheckIn);
		request.setAttribute("statusCheckOut", statusCheckOut);
		
		
		//접수 상태인 룸서비스 건수 얻기
		int ostatus0 = aservice.getOrderListStatus0();
		
		//준비중인 룸서비스 건수 얻기
		int ostatus1 = aservice.getOrderListStatus1();
		
		request.setAttribute("ostatus0", ostatus0);
		request.setAttribute("ostatus1", ostatus1);
		
		request.setAttribute("container", "../admin/manage/main.jsp");

		return "layout/home";
	}
	
	
}
