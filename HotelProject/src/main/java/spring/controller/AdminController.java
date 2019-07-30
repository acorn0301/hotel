package spring.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import spring.data.AdminBookDto;
import spring.data.AdminOrderDetailDto;
import spring.data.AdminOrderDto;
import spring.data.AdminlogDto;
import spring.data.BookDto;
import spring.data.MemberDto;
import spring.data.MenuDto;
import spring.data.OrderDetailDto;
import spring.data.OrderDto;
import spring.data.QnaDto;
import spring.data.ReviewDao;
import spring.data.RoomDto;
import spring.service.AdminService;
import spring.service.MemberService;
import spring.service.MenuService;
import spring.service.OrderDetailService;
import spring.service.QnaService;
import upload.file.SpringFileWriter;

@Controller
public class AdminController {

	@Autowired
	AdminService aservice;
	
	@Autowired
	QnaService qservice;
	
	@Autowired
	MenuService mnservice;
	
	@Autowired
	OrderDetailService odservice;
	
	@Autowired
	MemberService mbservice;
	
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
		//전체 답변처리 되지 않은 문의 건수 얻기
		int qcategoryAll = qservice.getTotalCount("all", 0);
		
		request.setAttribute("qcategory1", qcategory1);
		request.setAttribute("qcategory2", qcategory2);
		request.setAttribute("qcategory3", qcategory3);
		request.setAttribute("qcategoryAll", qcategoryAll);
		
		
		request.setAttribute("container", "../admin/manage/main.jsp");

		return "layout/home";
	}
	
	
	//예약리스트를 상태별로 가져온다.
	@RequestMapping("/adminBookList.do")
	public String adminBookList(HttpServletRequest request, @RequestParam int book_status) {
		
		List<AdminBookDto> list = null;
		
		if(book_status == -1) {
			list = aservice.getBookListCheckInToday();
		}else if(book_status == -2) {
			list = aservice.getBookListCheckOutToday();
		}else {
			list = aservice.getBookListByStatus(book_status);
		}
		
		int size = list.size();
		
		request.setAttribute("size", size);
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
	public String adminOrderList(HttpServletRequest request, @RequestParam int room_status) {
		
		List<AdminOrderDto> list = aservice.getOrderListByStatus(room_status);
		
		for(AdminOrderDto a:list) {
			List<AdminOrderDetailDto> temp = aservice.getOrderDetailByOrderNum(a.getOrder_num());
			a.setOrder_detail(temp);
		}
		
		int size = list.size();
		
		request.setAttribute("size", size);
		request.setAttribute("room_status", room_status);
		
		request.setAttribute("list", list);
		request.setAttribute("container", "../admin/manage/orders.jsp");

		return "layout/home";
		
	}
	
	//개별 주문 내역 상세 조회 
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
	
	
	@RequestMapping("/adminMemberDetail.do")
	public String memberDetail(HttpServletRequest request, @RequestParam int member_num) {
		
		//받아온 member_num으로 회원정보를 받아온다. 
		MemberDto mbdto = mbservice.getMemberData(member_num);
		
		request.setAttribute("mbdto", mbdto);
		request.setAttribute("container", "../admin/db/member/detail.jsp");

		return "layout/home";
	}
	
	@RequestMapping("/adminMemberDelete.do")
	public String memberDelete(HttpServletRequest request, @RequestParam int member_num, HttpSession session) {
		
		MemberDto mbdto = new MemberDto();
		mbdto.setMember_num(member_num);
		
		//로그남기기
		AdminlogDto ldto = new AdminlogDto();
		ldto.setMember_num((Integer)session.getAttribute("member_num"));
		ldto.setLog_table("member");
		ldto.setLog_attr("all");
		ldto.setLog_act("delete");
		ldto.setLog_memo(" ");
		aservice.insertLog(ldto);
		
		//회원 탈퇴 처리 
		mbservice.withdrawal(mbdto);
		
		return "redirect:adminMemberList.do";
		
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
	
	//개별 메뉴 상세페이지 띄우기
	@RequestMapping("/adminMenuListDetail.do")
	public String menuListDetail(HttpServletRequest request, @RequestParam int menu_num) {
		
		MenuDto mndto = aservice.getMenuData(menu_num);
		
		request.setAttribute("mndto", mndto);
		request.setAttribute("container", "../admin/db/menu/detail.jsp");
		return "layout/home";
		
	}
	
	//메뉴 추가 폼 띄우기 
	@RequestMapping("/adminMenuAddForm.do")
	public String menuAddForm(HttpServletRequest request) {
		
		//메뉴 카테고리 가져오기..
		List<MenuDto> list = aservice.getAllMenuType();
		
		request.setAttribute("list", list);
		request.setAttribute("container", "../admin/db/menu/addform.jsp");
		return "layout/home";
	}
	
	//메뉴 추가 처리하기
	@PostMapping("/adminMenuAdd.do")
	public String menuAdd(HttpServletRequest request, @ModelAttribute MenuDto mndto, HttpSession session) {
				
		//이미지 파일  처리 
		MultipartFile image = mndto.getUpfile();
		
		//이미지를 업로드할 경로 구하기
		String path = request.getSession().getServletContext().getRealPath("/save/images/menu");	
		System.out.println("path: " + path);
		
		//파일명
		String menu_img = image.getOriginalFilename();
		
		//중복되는 파일명을 막기위해 현재 시간을 파일명 끝에 넣어준다.
		Date now = new Date();
		String nowstr = String.valueOf(now.getTime());
		
		int index = menu_img.lastIndexOf("."); 
		String fileExt = menu_img.substring(index + 1); 
		menu_img = menu_img.substring(0, index); 		
		menu_img = menu_img + nowstr + "." + fileExt;

		
				
		//이미지 저장 메서드 호출
		SpringFileWriter fileWriter = new SpringFileWriter();
		
		//writeFile(실제이미지파일, 저장할 경로, 저장될 이름) 
		fileWriter.writeFile(image, path, menu_img);
		

		//이미지 리사이징을 위한 부분2
		String orgFilePath = path + "/" + menu_img;
		
		try {
			ReviewDao.makeThumbnail(orgFilePath, menu_img, fileExt, path);
			
		}catch(Exception e) {
			System.out.println(e);
		}
		
		
		mndto.setMenu_img(menu_img);
		
		
		aservice.insertMenu(mndto);
		
		
		//로그 남기기
		AdminlogDto ldto = new AdminlogDto();
		ldto.setMember_num((Integer)session.getAttribute("member_num"));
		ldto.setLog_table("menu");
		ldto.setLog_attr("all");
		ldto.setLog_act("insert");
		ldto.setLog_memo(" ");
		aservice.insertLog(ldto);
		
		return "redirect:adminMenuList.do";
	}
	
	//메뉴 수정 폼 띄우기
	@RequestMapping("/adminMenuEditForm.do")
	public String menuEditForm(HttpServletRequest request, @RequestParam int menu_num) {
		
		MenuDto mndto = aservice.getMenuData(menu_num);
		//메뉴 카테고리 가져오기..
		List<MenuDto> list = aservice.getAllMenuType();
		
		request.setAttribute("list", list);
		request.setAttribute("mndto", mndto);
		request.setAttribute("container", "../admin/db/menu/editform.jsp");
		return "layout/home";
	}
	
	
	//메뉴 수정 처리
	@PostMapping("/adminMenuEdit.do")
	public String menuEdit(HttpServletRequest request,HttpSession session, @ModelAttribute MenuDto mndto, @ModelAttribute AdminlogDto ldto) {
		
		
		//로그 남기기 
		ldto.setMember_num((Integer)session.getAttribute("member_num"));
		ldto.setLog_table("menu");
		ldto.setLog_act("update");
	
		aservice.insertLog(ldto);
		
		//수정 메서드 
		aservice.updateMenu(mndto);
		
		return "redirect:adminMenuListDetail.do?menu_num=" + mndto.getMenu_num();
	}
	
	
	//메뉴 삭제 처리 
	@RequestMapping("/adminMenuDelete.do")
	public String menuDelete(HttpServletRequest request, @RequestParam int menu_num, HttpSession session) {
		
		//로그 남기기
		AdminlogDto ldto = new AdminlogDto();
		ldto.setMember_num((Integer)session.getAttribute("member_num"));
		ldto.setLog_table("menu");
		ldto.setLog_attr("all");
		ldto.setLog_act("delete");
		ldto.setLog_memo(" ");
		aservice.insertLog(ldto);
		
		//삭제 메서드 
		aservice.deleteMenu(menu_num);
		return "redirect:adminMenuList.do";
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
	
	@RequestMapping("/adminRoomDetail.do")
	public String roomDetail(HttpServletRequest request, int room_num) {
		
		RoomDto rmdto = aservice.getRoomdetail(room_num);
		
		request.setAttribute("rmdto", rmdto);
		request.setAttribute("container", "../admin/db/hotel/detail.jsp");

		return "layout/home";
	}
	
	
	
	
	
	
	
	
	//예약건 다음 스텝으로 넘기는 메서드
	@RequestMapping("/adminBookNestStep.do")
	public String bookNextStep(HttpServletRequest request, @RequestParam int book_status, @RequestParam String book_nums_str, HttpSession session) {
		
		String[] book_nums = book_nums_str.split(",");
		
		//다음 스텝으로 넘기는 작업을 for문으로 처리한다.
		for(String b:book_nums) {
			int b_int = Integer.parseInt(b);
			aservice.bookNextStep(b_int, book_status);
		}
		
				//로그남기기
				AdminlogDto ldto = new AdminlogDto();
				ldto.setMember_num((Integer)session.getAttribute("member_num"));
				ldto.setLog_table("book");
				ldto.setLog_attr("book_status");
				ldto.setLog_act("update");
				ldto.setLog_memo(" ");
				aservice.insertLog(ldto);
		
		return "redirect:adminBookList.do?book_status=" + book_status;
	}
	
	//개별 예약건 다음 스텝으로 넘기는 메서드
	@RequestMapping("/adminBookNestStepOne.do")
	public String bookNextStepOne(HttpServletRequest request, @RequestParam int book_num, @RequestParam int book_status, HttpSession session) {
		aservice.bookNextStep(book_num, book_status);
		
		//로그남기기
		AdminlogDto ldto = new AdminlogDto();
		ldto.setMember_num((Integer)session.getAttribute("member_num"));
		ldto.setLog_table("book");
		ldto.setLog_attr("book_status");
		ldto.setLog_act("update");
		ldto.setLog_memo(" ");
		aservice.insertLog(ldto);
		
		return "redirect:adminBookListDetail.do?book_num=" + book_num;
	}
	
	//예약 내역 취소하는 메서드
	@RequestMapping("/adminBookCancel.do")
	public String bookCancel(HttpServletRequest request, @RequestParam int book_status, @RequestParam String book_nums_str, HttpSession session) {
		
		String[] book_nums = book_nums_str.split(",");


		//예약내역을 취소하는 작업을 for문으로 처리한다.
		for(String b:book_nums) {
			int b_int = Integer.parseInt(b);
			aservice.bookCancel(b_int);
			
		}
		
		
		//로그남기기
		AdminlogDto ldto = new AdminlogDto();
		ldto.setMember_num((Integer)session.getAttribute("member_num"));
		ldto.setLog_table("book");
		ldto.setLog_attr("book_status");
		ldto.setLog_act("update");
		ldto.setLog_memo(" ");
		aservice.insertLog(ldto);
		
		return "redirect:adminBookList.do?book_status=" + book_status;

	}
	
	
	//예약 내역 취소를 철회하는 메서드
	@RequestMapping("/adminBookCancelRevoke.do")
	public String bookCancelRevoke(HttpServletRequest request, @RequestParam int book_status, @RequestParam String book_nums_str, HttpSession session) {
		
		String[] book_nums = book_nums_str.split(",");


		//예약내역을 취소를 철회하는 작업을 for문으로 처리한다.
		for(String b:book_nums) {
			int b_int = Integer.parseInt(b);
			aservice.bookCancelRevoke(b_int);
			
		}
		
		//로그남기기
		AdminlogDto ldto = new AdminlogDto();
		ldto.setMember_num((Integer)session.getAttribute("member_num"));
		ldto.setLog_table("book");
		ldto.setLog_attr("book_status");
		ldto.setLog_act("update");
		ldto.setLog_memo(" ");
		aservice.insertLog(ldto);
		
		return "redirect:adminBookList.do?book_status=" + book_status;

	}
	
	
	//개별 예약 내역 취소하는 메서드
	@RequestMapping("/adminBookCancelOne.do")
	public String bookCancelOne(HttpServletRequest request, @RequestParam int book_num, @RequestParam int book_status, HttpSession session) {
		aservice.bookCancel(book_num);
		
		//로그남기기
		AdminlogDto ldto = new AdminlogDto();
		ldto.setMember_num((Integer)session.getAttribute("member_num"));
		ldto.setLog_table("book");
		ldto.setLog_attr("book_status");
		ldto.setLog_act("update");
		ldto.setLog_memo(" ");
		aservice.insertLog(ldto);
		
		return "redirect:adminBookList.do?book_status=" + book_status;
	}
	
	
	//개별 예약 내역 취소를 철회하는 메서드
		@RequestMapping("/adminBookCancelRevokeOne.do")
		public String bookCancelRevokeOne(HttpServletRequest request, @RequestParam int book_num, @RequestParam int book_status, HttpSession session) {
			aservice.bookCancelRevoke(book_num);
			
			//로그남기기
			AdminlogDto ldto = new AdminlogDto();
			ldto.setMember_num((Integer)session.getAttribute("member_num"));
			ldto.setLog_table("book");
			ldto.setLog_attr("book_status");
			ldto.setLog_act("update");
			ldto.setLog_memo(" ");
			aservice.insertLog(ldto);
			
			return "redirect:adminBookList.do?book_status=" + book_status;
		}

	//예약내역 수정 폼을 호출하는 메서드
		@RequestMapping("/adminBookEditForm.do")
		public String bookEditForm(HttpServletRequest request, @RequestParam int book_num) {
			

			AdminBookDto abdto = aservice.getBookDetail(book_num);
			
			
			//객실 정보 리스트를 받아서 넘겨준다.
			//이건 원래 ajax로 처리하는게 맞는데,. (인원수와 체크인 체크아웃 시간을 고려해서) 시간관계상 생략한다.
			
			int hotel_num = abdto.getHotel_num(); 
			List<RoomDto> list = aservice.getRoomListByHotel(hotel_num);
			
			request.setAttribute("list", list);
			request.setAttribute("abdto", abdto);
			request.setAttribute("container", "../admin/manage/bookedit.jsp");
			return "layout/home";

		}	
	
		
	//예약내역 수정 처리 메서드
		@PostMapping("/adminBookEdit.do")
		public String bookEdit(@ModelAttribute BookDto bdto, HttpSession session, @ModelAttribute AdminlogDto ldto) {
			
			aservice.updateBook(bdto);
			
			//로그남기기
			ldto.setMember_num((Integer)session.getAttribute("member_num"));
			ldto.setLog_table("book");
			ldto.setLog_act("update");
			ldto.setLog_memo(" ");
			aservice.insertLog(ldto);
			
			return "redirect:adminBookListDetail.do?book_num=" + bdto.getBook_num();
//			return "redirect:home.do";
		}
		
		
		
		
		
		
	
	//주문건 다음 스텝으로 넘기는 메서드
	@RequestMapping("/adminOrderNextStep.do")
	public String orderNextStep(HttpServletRequest request, @RequestParam int room_status, @RequestParam String order_nums_str, HttpSession session) {

		String[] order_nums = order_nums_str.split(",");
		
		//다음 스텝으로 넘기는 작업을 for문으로 처리한다.
		for(String o:order_nums) {
			int o_int = Integer.parseInt(o);
			aservice.orderNextStep(o_int);
		}	
		//로그남기기
		AdminlogDto ldto = new AdminlogDto();
		ldto.setMember_num((Integer)session.getAttribute("member_num"));
		ldto.setLog_table("order");
		ldto.setLog_attr("order_status");
		ldto.setLog_act("update");
		ldto.setLog_memo(" ");
		aservice.insertLog(ldto);
		
		
		return "redirect:adminOrderList.do?room_status=" + room_status;
	}
	
	//개별 주문건 다음 스텝으로 넘기는 메서드
	@RequestMapping("/adminOrderNextStepOne.do")
	public String orderNextStepOne(HttpServletRequest request, @RequestParam int order_num, @RequestParam int room_status, HttpSession session) {
		aservice.orderNextStep(order_num);
		
		//로그남기기
		AdminlogDto ldto = new AdminlogDto();
		ldto.setMember_num((Integer)session.getAttribute("member_num"));
		ldto.setLog_table("order");
		ldto.setLog_attr("order_status");
		ldto.setLog_act("update");
		ldto.setLog_memo(" ");
		aservice.insertLog(ldto);
		
		return "redirect:adminOrderList.do?room_status=" + room_status;
	}
	
	//주문내역 취소하는 메서드
	@RequestMapping("/adminOrderCancel.do")
	public String orderCancel(HttpServletRequest request, @RequestParam int room_status, @RequestParam String order_nums_str, HttpSession session) {
		
		String[] order_nums = order_nums_str.split(",");

		//예약내역을 취소하는 작업을 for문으로 처리한다.
		for(String o:order_nums) {
			int o_int = Integer.parseInt(o);
			aservice.orderCancel(o_int);		
		}
		
		//로그남기기
		AdminlogDto ldto = new AdminlogDto();
		ldto.setMember_num((Integer)session.getAttribute("member_num"));
		ldto.setLog_table("order");
		ldto.setLog_attr("order_status");
		ldto.setLog_act("update");
		ldto.setLog_memo(" ");
		aservice.insertLog(ldto);
		
		return "redirect:adminOrderList.do?room_status=" + room_status;

	}
	
	//개별 주문 내역 취소
	@RequestMapping("/adminOrderCancelOne.do")
	public String orderCancelOne(HttpServletRequest request, @RequestParam int room_status, @RequestParam int order_num, HttpSession session) {
		
		aservice.orderCancel(order_num);
		
		//로그남기기
		AdminlogDto ldto = new AdminlogDto();
		ldto.setMember_num((Integer)session.getAttribute("member_num"));
		ldto.setLog_table("order");
		ldto.setLog_attr("order_status");
		ldto.setLog_act("update");
		ldto.setLog_memo(" ");
		aservice.insertLog(ldto);
		
		return "redirect:adminOrderList.do?room_status=" + room_status;

	}
	
	
	//개별 주문 내역 취소 철회 
	@RequestMapping("/adminOrderCancelRevokeOne.do")
	public String orderCancelRevokeOne(HttpServletRequest request, @RequestParam int room_status, @RequestParam int order_num, HttpSession session) {
		
		aservice.orderCancelRevoke(order_num);
		
		//로그남기기
		AdminlogDto ldto = new AdminlogDto();
		ldto.setMember_num((Integer)session.getAttribute("member_num"));
		ldto.setLog_table("order");
		ldto.setLog_attr("order_status");
		ldto.setLog_act("update");
		ldto.setLog_memo(" ");
		aservice.insertLog(ldto);
		
		return "redirect:adminOrderList.do?room_status=" + room_status;

	}
	
	
	//주문내역 취소를 철회하는 메서드
		@RequestMapping("/adminOrderCancelRevoke.do")
		public String orderCancelRevoke(HttpServletRequest request, @RequestParam int room_status, @RequestParam String order_nums_str, HttpSession session) {
			
			String[] order_nums = order_nums_str.split(",");

			//예약내역을 취소하는 작업을 for문으로 처리한다.
			for(String o:order_nums) {
				int o_int = Integer.parseInt(o);
				aservice.orderCancelRevoke(o_int);
			}
			
			//로그남기기
			AdminlogDto ldto = new AdminlogDto();
			ldto.setMember_num((Integer)session.getAttribute("member_num"));
			ldto.setLog_table("order");
			ldto.setLog_attr("order_status");
			ldto.setLog_act("update");
			ldto.setLog_memo(" ");
			aservice.insertLog(ldto);
			
			return "redirect:adminOrderList.do?room_status=" + room_status;

		}
		
	//주문내역 수정 폼을 호출하는 메서드
		@RequestMapping("/adminOrderEditForm.do")
		public String orderEditForm(HttpServletRequest request, @RequestParam int order_num) {
			
			//order_num으로 부터 정보를 받아와서 넘겨주자 
			AdminOrderDto aodto = aservice.getOrderData(order_num); 
			List<AdminOrderDetailDto> oddto = aservice.getOrderDetailByOrderNum(order_num);
			aodto.setOrder_detail(oddto);
			int oddtoSize = oddto.size();
			
			//메뉴 추가를 위해 메뉴 리스트를 가져온다 
			List<MenuDto> menulist = aservice.getAllMenu();
			
			request.setAttribute("menulist", menulist);
			request.setAttribute("aodto", aodto);
			request.setAttribute("oddtoSize", oddtoSize);
			request.setAttribute("container", "../admin/manage/orderedit.jsp");
			return "layout/home";

		}
		
	//주문내역 수정 처리 메서드 
		@PostMapping("/adminOrderEdit.do")
		public String orderEditForm(HttpServletRequest request, @RequestParam int oddto_index, @ModelAttribute OrderDto odto, HttpSession session, @ModelAttribute AdminlogDto ldto) {
		
			int order_num = odto.getOrder_num();
			
			
			//기존 order_detail db 삭제 
			aservice.removeAllOrderDetail(order_num);
			
			//받아온 order deteil 값들은 모두 순서대로 order_detail 테이블에 넣어줘야...
			for(int i = 0 ; i <= oddto_index ; i++ ) {
				
				int menu_num = Integer.parseInt(request.getParameter("menu_num" + i));
				int qty = Integer.parseInt(request.getParameter("qty" + i));
				
				//메뉴를 선택하지 않았거나, 수량이 0개이면 db에 삽입하지 않습니다.
				if(menu_num == 0 || qty == 0) {
					continue;
				}
				
				OrderDetailDto oddto = new OrderDetailDto();
				oddto.setMenu_num(menu_num);
				oddto.setQty(qty);
				oddto.setOrder_num(order_num);
				
				//db에 새로 저장하기 
				odservice.OrderDetailInsert(oddto);
			}
			
			//변경된 주문상태, 요청사항을 room_order 테이블에 update 시켜준다.
			aservice.updateOrder(odto);
			
			//로그남기기
			ldto.setMember_num((Integer)session.getAttribute("member_num"));
			ldto.setLog_table("order");
			ldto.setLog_act("update");
			ldto.setLog_memo(" ");
			aservice.insertLog(ldto);
			
			
			return "redirect:adminOrderListDetail.do?order_num=" + order_num;

		}
	
		
		
		
		@RequestMapping("/adminLogList.do")
		public String logList(HttpServletRequest request, HttpSession session, @RequestParam(value="pageNum", defaultValue="1") int currentPage) {
			
			
			//페이징 처리에 필요한 변수들 선언
			int totalCount; //전체 갯수
			int totalPage; //총 페이지 수 
			int start; //각 페이지의 시작 번호
			int end; //각 페이지의 끝번호		
			int startPage; //블럭의 시작페이지 
			int endPage; //블럭의 끝페이지
			int no; //출력을 시작할 번호
			int perPage = 15; //한페이지당 보여질 글의 갯수  이건 나중에 알아서 조절해보자 
			int perBlock = 5; //한블럭당 보여질 페이지의 갯수 
			
			//1. dao선언
		
			//총 글의 갯수를 구한다.
			totalCount = aservice.getLogTotalCount();
			
			//총 페이지수를 구한다.
//			totalPage = (int)Math.ceil((double)totalPage/perBlock);
			totalPage = totalCount/perPage + (totalCount%perPage > 0 ? 1 : 0);
			
			//현재 페이지 읽기
			
			if(currentPage>totalPage) {
				currentPage = totalPage;
			}
			
			//각 블럭의 시작페이지와 끝페이지를 구한다
//			startPage = perBlock*((currentPage-1)/perBlock) + 1 ;
//			endPage = startPage -1 + perBlock;
			
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
					
			List<AdminlogDto> list = aservice.getLogList(start, end);	
		
			//name 설정하기
			for(AdminlogDto d:list) {
				int member_num = d.getMember_num();
				MemberDto mbdto = mbservice.getMemberData(member_num);
				String name = mbdto.getName();
				d.setName(name);
			}
			
			//simpletime 처리

			Date now = new Date();
			
			for(AdminlogDto d:list) {
							
				//작성일을 좀더 심플하게 표현하기 
				long timediff = now.getTime()-d.getLog_time().getTime();
							
				timediff /= 1000*60;
				
				
				if(timediff < 1) {
					d.setSimpletime("방금전");
				}else if(timediff < 60) {
					d.setSimpletime(String.valueOf(timediff) + "분전");
				}else if(timediff < 60*24) {
					d.setSimpletime(String.valueOf(timediff/60) + "시간전");
				}else if(timediff < 60*24*30 ) {
					d.setSimpletime(String.valueOf(timediff/(60*24)) + "일전");
				}else if(timediff < 60*24*30*12) {
					d.setSimpletime(String.valueOf(timediff/(60*24*30)) + "달전");
				}else {
					d.setSimpletime(String.valueOf(timediff/(60*24*30*12)) + "년전");
				}
				
	        }		
			
			
			//log_attr 배열 처리해서 보내기 
			for(AdminlogDto d:list) {
				String log_attr = d.getLog_attr();
				List<String> log_attr_arr = new ArrayList<String>();
		
				String[] log_attr_arr_str = log_attr.split(",");
				for(String l: log_attr_arr_str) {
					log_attr_arr.add(l);
				}
				d.setLog_attr_arr(log_attr_arr);
				
				if(log_attr_arr.size() >= 2) { //바뀐 속성이 2개 이상이면 간단하게 표시하기 
					String txt = log_attr_arr.get(0) + " 외 " + (log_attr_arr.size()-1) + "건의";
					d.setLog_attr(txt);
				}
			}
			
			//member_pic 데이타 집어넣기
			for(AdminlogDto d:list) {
				int member_num = d.getMember_num();
				String member_pic = mbservice.getMemberData(member_num).getMember_pic();
				d.setMember_pic(member_pic);
				
			}
			
						
			request.setAttribute("totalCount",totalCount);
			request.setAttribute("list", list);
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("no", no);
			request.setAttribute("perPage", perPage);
			request.setAttribute("perBlock", perBlock);
			request.setAttribute("currentPage", currentPage);
	
			request.setAttribute("container", "../admin/db/log/list.jsp");
			return "layout/home";
			
		}
	
}
