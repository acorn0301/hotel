package spring.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import spring.data.BookDto;
import spring.data.HotelDto;
import spring.data.MemberDto;
import spring.data.RoomDto;
import spring.service.BookService;


@Controller
public class BookingController {

	//bookService에서 메소드 의존성 주입
	@Autowired
	private BookService bookService;
	
	int bedPrice = 40000;
	int breakfastPrice = 25000;
	
	
	//예약확인 버튼을 눌렀을 때
	@RequestMapping("/bookingCheck.do")
	public String booking(HttpSession session,HttpServletRequest request) {
		
		//만약 로그인 후에 예약확인 버튼을 눌렀다면 분명 세션에 member_num이 저장되어있을 것이다.
		
		int member_num = 0;
		if(session.getAttribute("member_num")!=null){
			member_num = (Integer)session.getAttribute("member_num");
		}
				
		
		//로그인이 된 상태에서 예약확인을 눌렀을 때
		if(member_num != 0) {
			
			//받아온 member_num으로 부터 book 테이블을 조회해서 해당 member_num을 가진 예약내역을 출력하시오 
			
			request.setAttribute("container", "../member/mypage/mybooking.jsp");
		
			
		//로그인 되지 않은 상태에서 예약확인을 눌렀을 때
		}else {
			
			//로그인 할지 비회원으로 조회할지를 묻는 페이지로 넘겨준다. 
			request.setAttribute("container", "../member/askLogin.jsp");

		}
		
		return "layout/home";
	}
	
	
	
	// '예약하기' 버튼을 눌렀을 때 예약폼으로 이동
	@RequestMapping("/booking.do")
	public String toStep1(HttpServletRequest request, 
			@RequestParam(value="step",defaultValue="0") int step,
			@RequestParam(value="repeat",defaultValue="0") int repeat,
			@ModelAttribute BookDto bdto,
			@ModelAttribute RoomDto rmdto,
			@ModelAttribute HotelDto hdto,
			HttpSession session
			)
	{
		request.setAttribute("step", step);
		
		//'STEP 1 호텔/날짜 선택' 페이지로 넘어갈 때
		if(step==0)
		{	
			//호텔지점 리스트 출력
			List<HotelDto> Locallist=bookService.HotelLocalList(); //bookService에 있는 HotelLocalList 가져오기
			request.setAttribute("localList", Locallist); //리스트에 리스트 저장
		}
		
		//'STEP 2 객실 선택' 페이지로 넘어갈 때
		// 값 넘기기
		else if(step==1)
		{
			// bdto에 해당하는 값을 mybdto에 저장
			session.setAttribute("mybdto", bdto);
			
			
		/*	// roomdto에 해당하는 값을 myrmdto에 저장
			session.setAttribute("myrmdto", rmdto);*/
			
		
			//호텔지점에 따라 호텔 이름 출력
			System.out.println("hotel_num " + hdto.getHotel_num());
			HotelDto hdto2 = bookService.getHotel(hdto.getHotel_num());
			request.setAttribute("hdto", hdto2);
			session.setAttribute("myhdto", hdto2);
			
			//객실 리스트 출력
			List<RoomDto> roomList=bookService.RoomList(bdto);
			request.setAttribute("roomList", roomList);
			
			
		}
		
		//'STEP 3 옵션 선택' 페이지로 넘어갈 때
		else if(step==2)
		{
			// BookDto 클래스 bdto1 생성
			BookDto bdto1 = new BookDto();
			
			// bdto1에 mybdto 세션 값 삽입 
			bdto1 = (BookDto)session.getAttribute("mybdto");
			
			// bdto1에 room_num 값 삽입
			bdto1.setRoom_num(bdto.getRoom_num());
			
			// 세션에 bdto1를 mybdto에 넣기
			session.setAttribute("mybdto", bdto1);			
			
			
			
			
			
		/*	// RoomDto 클래스 rmdto1 생성
			RoomDto rmdto1 = new RoomDto();
						*/
			// rmdto1에 myrmdto 세션 값 삽입 
			/*rmdto1 = (RoomDto)session.getAttribute("myrmdto");
			
			
						
			// bdto1에 데이터 삽입
			rmdto1.setRoom_num(rmdto.getRoom_num());
			rmdto1.setPrice(rmdto.getPrice());
			rmdto1.setType(rmdto.getType());
			rmdto1.setRoom_img(rmdto.getRoom_img());
			rmdto1.setRoom_config(rmdto.getRoom_config());
			rmdto1.setMax(rmdto.getMax());
						*/
			int room_num = rmdto.getRoom_num();
			
			RoomDto rmdto1 = bookService.getRoomData(room_num);
			
			session.setAttribute("myrmdto", rmdto1);
			
			System.out.println("bed" + bdto.getAdd_bed());
			
			session.setAttribute("bedCountPrice", bdto.getAdd_bed()*bedPrice);
			session.setAttribute("breakfastCountPrice", bdto.getBreakfast_count()*breakfastPrice);
			
//			session.setAttribute("myrmdto", rmdto);
//			
//			// 세션에 rmdto1를 myrmdto에 넣기
//			session.setAttribute("myrmdto", rmdto);
//			
			
			
			// hoteldto에 해당하는 값을 myhdto에 저장
/*
			// HotelDto 클래스 hdto1 생성
			HotelDto hdto3 = new HotelDto();

			// hdto1에 myhdto 세션 값 삽입 
			hdto3 = (HotelDto)session.getAttribute("myhdto");

			// 세션에 hdto1를 myhdto에 넣기
			session.setAttribute("myhdto", hdto3);*/
		}
		
		
		//'STEP 4 예약확인(비회원)' 페이지로 넘어갈 때
		else if(step==3)
		{
			// hdto2를 새로 만들어 myhdto 값을 받아온 후 사용한다
			HotelDto hdto2=new HotelDto();
			hdto2 = (HotelDto)session.getAttribute("myhdto");
			request.setAttribute("hdto", hdto2);
			
			
			// rmdto2를 새로 만들어 myrmdto 값을 받아온 후 사용한다
			RoomDto rmdto2=new RoomDto();
			rmdto2 = (RoomDto)session.getAttribute("myrmdto");
			request.setAttribute("rmdto", rmdto2);
			
			
			
			
			// BookDto 클래스 bdto2 생성
			BookDto bdto2 = new BookDto();
			
			
			// bdto2에 mybdto 세션 값 삽입 
			bdto2 = (BookDto)session.getAttribute("mybdto");
			
			//요청사항없을 시 표기
			if(bdto.getBook_memo() == "")
			{
				bdto.setBook_memo("요청사항 없음");
			}
			
			// bdto2에 데이터 삽입
			bdto2.setAdd_bed(bdto.getAdd_bed());
			bdto2.setBook_memo(bdto.getBook_memo());
			bdto2.setBreakfast_count(bdto.getBreakfast_count());
			
			
			
			
			// 세션에 bdto2를 mybdto에 넣기
			session.setAttribute("mybdto", bdto2);
		}
		
		
		//'STEP 4 예약확인(회원)' 페이지로 넘어갈 때
		else if(step==4)
		{	
			if(repeat!=1){
				
			HotelDto hdto2=new HotelDto();
			hdto2 =bookService.getHotel(hdto.getHotel_num());
			request.setAttribute("hdto", hdto2);
			
			
			// BookDto 클래스 bdto2 생성
			BookDto bdto2 = new BookDto();

			// bdto2에 mybdto 세션 값 삽입 
			bdto2 = (BookDto)session.getAttribute("mybdto");
			
			System.out.println("memo: " + bdto.getBook_memo());
			
			//요청사항없을 시 표기
			if(bdto.getBook_memo() == "")
			{
				bdto.setBook_memo("요청사항 없음");
			}

			// bdto2에 데이터 삽입
			bdto2.setAdd_bed(bdto.getAdd_bed());
			bdto2.setBook_memo(bdto.getBook_memo());
			bdto2.setBreakfast_count(bdto.getBreakfast_count());

			// 세션에 bdto2를 mybdto에 넣기
			session.setAttribute("mybdto", bdto2);
			}
			
			
			

			if(session.getAttribute("member_num")==null)
			{
				session.setAttribute("url", "booking.do?step=4&repeat=1");
				return "redirect:login.do";
			}
		}
		
		
		
			
		// 다음 페이지로 이동
		request.setAttribute("container", "../book/bookform.jsp");

		return "layout/home";
	}
	
	
	
/*	//비회원예약 - 예약하기 버튼 클릭시
	@RequestMapping(value="/insertNotMember.do")
	public String insertBook_notMember(
			@RequestParam(value="name", defaultValue="alice") String name,
			HttpRequest request, HttpSession session)
	{	
		System.out.println("ddd");
		System.out.println(name);
//		//비회원 최소 정보 member DB에 저장
//		bookService.insertInfo_notMember(mbdto);
//		//BookDto에 저장
//		bookService.insertBook_notMember(bdto);
//		
		//완료 페이지로 이동
		return "redirect:booking.do?step=5";
	}*/
	
	
	
	//비회원예약페이지에서 - 예약하기 버튼 클릭시
	@RequestMapping(value="/insertNC.do", method=RequestMethod.POST)
	public String insertnc(@ModelAttribute MemberDto mbdto,HttpSession session,
			@ModelAttribute BookDto bdto)
	{		
		//비회원 정보를 member테이블에 저장
		bookService.insertInfo_notMember(mbdto);
		
		//member_num 의 최대값(방금 가입한 회원) 을 예약정보에 삽입
		int member_num = bookService.maxMemberNum();
		
		
		BookDto bdto3= new BookDto();
		bdto3 = (BookDto)session.getAttribute("mybdto");
		bdto3.setMember_num(member_num);
		session.setAttribute("mybdto",bdto3);
		
		
		//예약정보 저장
		bookService.insertBook(bdto3);
		
		
		return "redirect:booking.do?step=5";
	}
	
	

	
	//회원예약 - 예약하기 버튼 클릭시
	@RequestMapping(value="/insert.do", method=RequestMethod.POST)
	public String insertBook(HttpSession session,@ModelAttribute BookDto bdto)
	{
		BookDto bdto3= new BookDto();
		bdto3 = (BookDto)session.getAttribute("mybdto");
		bdto3.setMember_num((Integer)session.getAttribute("member_num"));
		session.setAttribute("mybdto",bdto3);
		
		
		//예약정보 저장
		bookService.insertBook(bdto3);
		
		return "redirect:booking.do?step=5";
	}
}
