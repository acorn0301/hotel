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
	
	
	
	// '예약하기' 버튼을 눌렀을 때 예약폼으로 이동
	@RequestMapping("/booking.do")
	public String toStep1(HttpServletRequest request, 
			@RequestParam(value="step",defaultValue="0") int step,
			@RequestParam(value="head_count", required=false, defaultValue="0") int head_count,
			@RequestParam(value="room_name", required=false, defaultValue="0") String room_name,
			@RequestParam(value="check_in",  required=false, defaultValue="0") String check_in,
			@RequestParam(value="check_out",  required=false, defaultValue="0") String check_out,
			@RequestParam(value="hotel_num", required=false, defaultValue="0") int hotel_num,
			@RequestParam(value="room_num", required=false, defaultValue="0") int room_num,
			@RequestParam(value="room_config", required=false, defaultValue="0") String room_config,
			@RequestParam(value="price", required=false, defaultValue="0") String price,
			@RequestParam(value="type", required=false, defaultValue="0") String type,
			@RequestParam(value="add_bed", required=false, defaultValue="0") int add_bed,
			@RequestParam(value="breakfast_count", required=false, defaultValue="0") int breakfast_count,
			@RequestParam(value="book_memo", required=false, defaultValue="요청사항 없음") String book_memo,
			@RequestParam(value="bedCountPrice", required=false, defaultValue="0") int bedCountPrice,
			@RequestParam(value="breakfastCountPrice", required=false, defaultValue="0") int breakfastCountPrice,
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
			
			session.setAttribute("head_count",head_count); //세션에 인원 저장
			session.setAttribute("check_in", check_in); //세션에 체크인날짜 저장
			session.setAttribute("check_out", check_out); //세션에 체크아웃날짜 저장
			session.setAttribute("hotel_num", hotel_num); //세션에 호텔지점숫자 저장
			
			BookDto bdto=new BookDto();
			
			bdto.setHead_count(head_count);
			bdto.setCheck_in(check_in);
			bdto.setCheck_out(check_out);
			bdto.setHotel_num(hotel_num);
			
			
			//객실 리스트
			List<RoomDto> roomList=bookService.RoomList(bdto);
			request.setAttribute("roomList", roomList);
			
			
			//호텔지점에 따라 호텔 이름 출력
			HotelDto hdto=new HotelDto();
			List<HotelDto> hotelList=bookService.hotelLocal(hotel_num);
			request.setAttribute("hotelList", hotelList);
			
		}
		
		//'STEP 3 옵션 선택' 페이지로 넘어갈 때
		else if(step==2)
		{
			session.setAttribute("room_num", room_num); //세션에 룸넘버 저장
			session.setAttribute("room_config", room_config); //세션에 룸구성 저장
			session.setAttribute("price", price); //세션에 룸가격 저장
			session.setAttribute("room_name", room_name); //세션에 객실이름 저장
			session.setAttribute("type", type); //세션에 침대타입 저장 
			request.setAttribute("head_count", head_count); //세션에 인원수 저장 
			
		}
		
		
		//'STEP 4 예약확인(비회원)' 페이지로 넘어갈 때
		else if(step==3)
		{
			session.setAttribute("room_num", room_num); //세션에 룸넘버 저장
			session.setAttribute("add_bed", add_bed); //세션에 침대추가갯수 저장
			session.setAttribute("breakfast_count", breakfast_count); //세션에 조식인원 저장
			session.setAttribute("bedCountPrice", bedCountPrice); //세션에 침대추가 금액 저장
			session.setAttribute("breakfastCountPrice", breakfastCountPrice); //세션에 조식금액 저장
			session.setAttribute("book_memo", book_memo); //세션에 요청사항 저장
			
			//System.out.println(hotel_num);
			
			//호텔지점에 따라 호텔 이름 출력
			HotelDto hdto=new HotelDto();
			List<HotelDto> hotelList=bookService.hotelLocal(hotel_num);
			request.setAttribute("hotelList", hotelList);

		}
		
		
		//'STEP 4 예약확인(회원)' 페이지로 넘어갈 때
		else if(step==4)
		{
			session.setAttribute("room_num", room_num); //세션에 룸넘버 저장
			session.setAttribute("add_bed", add_bed); //세션에 침대갯수 저장
			session.setAttribute("breakfast_count", breakfast_count); //세션에 조식인원 저장
			session.setAttribute("bedCountPrice", bedCountPrice); //세션에 침대추가 금액 저장
			session.setAttribute("breakfastCountPrice", breakfastCountPrice); //세션에 조식금액 저장
			session.setAttribute("book_memo", book_memo); //세션에 요청사항 저장
			
			//호텔지점에 따라 호텔 이름 출력
			HotelDto hdto=new HotelDto();
			List<HotelDto> hotelList=bookService.hotelLocal(hotel_num);
			request.setAttribute("hotelList", hotelList);
		}
		
		
		
			
		// 다음 페이지로 이동
		request.setAttribute("container", "../book/bookform.jsp");

		return "layout/home";
	}
	
	
	
	//비회원예약 - 예약하기 버튼 클릭시
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
	}
	
	@PostMapping("/insertNC.do")
	public String insertnc(@ModelAttribute MemberDto mbdto){
				
		bookService.insertInfo_notMember(mbdto);
		
		return "redirect:booking.do?step=5";

	}
	
	@RequestMapping("/test1.do")
	public String test(@RequestParam(value="name", defaultValue="alice") String name){
		System.out.println(name);

		
		return "redirect:booking.do?step=5";

	}
	
	
	
	

	
	//회원예약 - 예약하기 버튼 클릭시
	@RequestMapping(value="/insert.do", method=RequestMethod.POST)
	public String insertBook(@ModelAttribute BookDto bdto)
	{
		
		//BookDto에 저장
		bookService.insertBook(bdto);
		
		//완료 페이지로 이동
		return "redirect:booking.do?step=5";
	}
	
}
