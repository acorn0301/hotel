package spring.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.data.AdminBookDto;
import spring.data.AdminOrderDetailDto;
import spring.data.AdminOrderDto;
import spring.data.MemberDto;
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
		
		//완료된 룸서비스 건수 얻기
		int ostatus2 = aservice.getOrderListStatus2();
		
		
		request.setAttribute("ostatus0", ostatus0);
		request.setAttribute("ostatus1", ostatus1);
		request.setAttribute("ostatus2", ostatus2);
	
		
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
		
		List<AdminBookDto> list = null;
		
		if(book_status.equals("ChkIn")) {
			list = aservice.getBookListCheckInToday();
		}else if(book_status.equals("ChkOut")) {
			list = aservice.getBookListCheckOutToday();
		}else {
			list = aservice.getBookListByStatus(book_status);
		}		
		
		request.setAttribute("book_status", book_status);
		request.setAttribute("list", list);
		request.setAttribute("container", "../admin/manage/books.jsp");

		return "layout/home";
	}
	
	
	//개별 예약 리스트를 보여준다
	@RequestMapping("/adminBookListDetail.do")
	public String adminBookDetail(HttpServletRequest request, @RequestParam int book_num) {
	
		AdminBookDto abdto = aservice.getBookDetail(book_num);
			
		request.setAttribute("abdto", abdto);
		request.setAttribute("container", "../admin/manage/bookdetail.jsp");

		return "layout/home";
		
	}
	
	//주문 리스트 보여준다 
	@RequestMapping("/adminOrderList.do")
	public String adminOrderList(HttpServletRequest request, @RequestParam String room_status) {
		
		List<AdminOrderDto> list = aservice.getOrderListByStatus(room_status);
		
		for(AdminOrderDto a:list) {
			List<AdminOrderDetailDto> temp = aservice.getOrderDetailByOrderNum(a.getOrder_num());
			a.setOrder_detail(temp);
		}
		
		request.setAttribute("room_status", room_status);
		
		request.setAttribute("list", list);
		request.setAttribute("container", "../admin/manage/orders.jsp");

		return "layout/home";
		
	}
	
	@RequestMapping("/adminOrderListDetail.do")
	public String adminOrderDetail(HttpServletRequest request, @RequestParam int order_num) {
		
		AdminOrderDto aodto = aservice.getOrderData(order_num); 
		List<AdminOrderDetailDto> oddto = aservice.getOrderDetailByOrderNum(order_num);
		aodto.setOrder_detail(oddto);
		
		int totalPrice = 0;
		
		for(AdminOrderDetailDto a:oddto) {
			totalPrice += a.getMenu_price()*a.getQty();
		}
		
		
		request.setAttribute("totalPrice", totalPrice);
		request.setAttribute("aodto", aodto);
		request.setAttribute("container", "../admin/manage/orderdetail.jsp");

		return "layout/home";
		
	}
	
	
}
