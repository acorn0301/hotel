package spring.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.data.AdminBookDto;
import spring.data.AdminOrderDetailDto;
import spring.data.AdminOrderDto;
import spring.data.MemberDto;
import spring.data.MenuDto;
import spring.data.QnaDto;
import spring.data.RoomDto;
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
	
	
	
	//관리자 -> 회원 db관리 리스트
	@RequestMapping("/adminMemberList.do")
	public String adminMemberList(HttpServletRequest request, @RequestParam(value="pageNum", defaultValue="1") int currentPage, HttpSession session) {
		
		

		//페이징 처리에 필요한 변수들 선언
				int totalCount; //전체 갯수
				int totalPage; //총 페이지 수 
				int start; //각 페이지의 시작 번호
				int end; //각 페이지의 끝번호		
				int startPage; //블럭의 시작페이지 
				int endPage; //블럭의 끝페이지
				int no; //출력을 시작할 번호
				int perPage = 10; //한페이지당 보여질 글의 갯수  이건 나중에 알아서 조절해보자 
				int perBlock = 5; //한블럭당 보여질 페이지의 갯수 
				
				//1. dao선언
			
				//총 글의 갯수를 구한다.
				totalCount = aservice.getMemberTotalCount();
				
				//총 페이지수를 구한다.
//				totalPage = (int)Math.ceil((double)totalPage/perBlock);
				totalPage = totalCount/perPage + (totalCount%perPage > 0 ? 1 : 0);
				
				//현재 페이지 읽기
				
				if(currentPage>totalPage) {
					currentPage = totalPage;
				}
				
				//각 블럭의 시작페이지와 끝페이지를 구한다
//				startPage = perBlock*((currentPage-1)/perBlock) + 1 ;
//				endPage = startPage -1 + perBlock;
				
				//아래는 구글 스타일의 페이징을 위한 startPage, endPage변수
				startPage = currentPage-2 ;
				endPage = currentPage+2  ;
				//마지막 블럭의 끝페이지는 총 페이지수와 같아야함 
				if(currentPage < (Math.ceil((double)perBlock/2))) {
					startPage = 1;
					endPage = perBlock;
				}
				if(currentPage > totalPage - (Math.ceil((double)perBlock/2))) {
					startPage = totalPage - perBlock +1;
					endPage = totalPage;
				}
				if(totalPage <= perBlock) {
					startPage =1;
					endPage = totalPage;
				}
				//각 페이지의 시작번호와 끝번호를 구한다
				start = (currentPage-1)*perPage +1;
				end = start -1 + perPage;
				//마지막페이지의 끝번호는 총 글의 갯수와 같아야함 
				if(end > totalCount) {
					end = totalCount;
				}
				//각 페이지마다 출력할 시작번호
				no = totalCount -(currentPage-1)*perPage;		
				
		List<MemberDto> list = aservice.getMemberList(start, end);		

		request.setAttribute("totalCount",totalCount);
		request.setAttribute("list", list);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("no", no);
		request.setAttribute("perPage", perPage);
		request.setAttribute("perBlock", perBlock);
		request.setAttribute("currentPage", currentPage);
		
		request.setAttribute("container", "../admin/db/member/list.jsp");

		return "layout/home";
	}
	
	//관리자 -> 메뉴 db관리 리스트
	@RequestMapping("/adminMenuList.do")
	public String adminMenuList(HttpServletRequest request, @RequestParam(value="pageNum", defaultValue="1") int currentPage, HttpSession session) {
		
		
		//페이징 처리에 필요한 변수들 선언
		int totalCount; //전체 갯수
		int totalPage; //총 페이지 수 
		int start; //각 페이지의 시작 번호
		int end; //각 페이지의 끝번호		
		int startPage; //블럭의 시작페이지 
		int endPage; //블럭의 끝페이지
		int no; //출력을 시작할 번호
		int perPage = 10; //한페이지당 보여질 글의 갯수  이건 나중에 알아서 조절해보자 
		int perBlock = 5; //한블럭당 보여질 페이지의 갯수 
		
		//1. dao선언
	
		//총 글의 갯수를 구한다.
		totalCount = aservice.getMenuTotalCount();
		
		//총 페이지수를 구한다.
//		totalPage = (int)Math.ceil((double)totalPage/perBlock);
		totalPage = totalCount/perPage + (totalCount%perPage > 0 ? 1 : 0);
		
		//현재 페이지 읽기
		
		if(currentPage>totalPage) {
			currentPage = totalPage;
		}
		
		//각 블럭의 시작페이지와 끝페이지를 구한다
//		startPage = perBlock*((currentPage-1)/perBlock) + 1 ;
//		endPage = startPage -1 + perBlock;
		
		//아래는 구글 스타일의 페이징을 위한 startPage, endPage변수
		startPage = currentPage-2 ;
		endPage = currentPage+2  ;
		//마지막 블럭의 끝페이지는 총 페이지수와 같아야함 
		if(currentPage < (Math.ceil((double)perBlock/2))) {
			startPage = 1;
			endPage = perBlock;
		}
		if(currentPage > totalPage - (Math.ceil((double)perBlock/2))) {
			startPage = totalPage - perBlock +1;
			endPage = totalPage;
		}
		if(totalPage <= perBlock) {
			startPage =1;
			endPage = totalPage;
		}
		//각 페이지의 시작번호와 끝번호를 구한다
		start = (currentPage-1)*perPage +1;
		end = start -1 + perPage;
		//마지막페이지의 끝번호는 총 글의 갯수와 같아야함 
		if(end > totalCount) {
			end = totalCount;
		}
		//각 페이지마다 출력할 시작번호
		no = totalCount -(currentPage-1)*perPage;		
				
		List<MenuDto> list = aservice.getMenuList(start, end);		
		
		request.setAttribute("totalCount",totalCount);
		request.setAttribute("list", list);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("no", no);
		request.setAttribute("perPage", perPage);
		request.setAttribute("perBlock", perBlock);
		request.setAttribute("currentPage", currentPage);

		
		
		request.setAttribute("container", "../admin/db/menu/list.jsp");

		return "layout/home";
	}
	
	
	//관리자 -> 호텔 db관리 리스트
	@RequestMapping("/adminHotelList.do")
	public String adminHotelList(HttpServletRequest request, @RequestParam(value="pageNum", defaultValue="1") int currentPage, HttpSession session) {
		
		List<RoomDto> list1 = aservice.getRoomListByHotel(10);
		List<RoomDto> list2 = aservice.getRoomListByHotel(11);
		
		String hotel_local1 = aservice.getHotelLocalByHotelNum(10);
		String hotel_local2 = aservice.getHotelLocalByHotelNum(11);
		

		request.setAttribute("list1", list1);
		request.setAttribute("list2", list2);
		request.setAttribute("hotel_local1", hotel_local1);
		request.setAttribute("hotel_local2", hotel_local2);
		request.setAttribute("container", "../admin/db/hotel/list.jsp");

		return "layout/home";
	}
	
	
	
	
}
