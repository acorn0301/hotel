package spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.data.AdminBookDto;
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
	
		
		//예약 문의 건수 얻기
		int qcategory1 = aservice.getQnaByCategory("예약");
		//객실 문의 건수 얻기
		int qcategory2 = aservice.getQnaByCategory("객실");
		//가격 문의 건수 얻기
		int qcategory3 = aservice.getQnaByCategory("가격");
		
		request.setAttribute("qcategory1", qcategory1);
		request.setAttribute("qcategory2", qcategory2);
		request.setAttribute("qcategory3", qcategory3);
		
		
		request.setAttribute("container", "../admin/manage/main.jsp");

		return "layout/home";
	}
	
	
	//예약리스트를 상태별로 가져온다.
	@RequestMapping("/adminBookList.do")
	public String adminBookList(HttpServletRequest request, @RequestParam String book_status) {
		
		List<AdminBookDto> list = aservice.getBookListByStatus(book_status);
		
		request.setAttribute("book_status", book_status);
		request.setAttribute("list", list);
		request.setAttribute("container", "../admin/manage/books.jsp");

		return "layout/home";
	}
	
	
	//개별 예약 리스트를 보여준다
	@RequestMapping("/adminBookListDetail.do")
	public String adminBookDetail(HttpServletRequest request, @RequestParam int book_num) {
		
		
		
		AdminBookDto abdto = aservice.getBookList(aservice.getBookDto(book_num));
		
		
		request.setAttribute("abdto", abdto);
		request.setAttribute("container", "../admin/manage/book.jsp");

		return "layout/home";
		
	}
	
	
}
