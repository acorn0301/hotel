package spring.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import spring.data.BookDao;
import spring.data.HotelDto;
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
			@RequestParam(value="headCount", required=false, defaultValue="0") int headCount,
			@RequestParam(value="roomType", required=false, defaultValue="0") String roomType,
			@RequestParam(value="checkIn",  required=false, defaultValue="0") String checkIn,
			@RequestParam(value="checkOut",  required=false, defaultValue="0") String checkOut,
			@RequestParam(value="hotelLocal", required=false, defaultValue="0") String hotelLocal,
			@RequestParam(value="room_num", required=false, defaultValue="0") int room_num,
			@RequestParam(value="room_config", required=false, defaultValue="0") String room_config,
			@RequestParam(value="room_price", required=false, defaultValue="0") String room_price,
			@RequestParam(value="bedType", required=false, defaultValue="0") String bedType,
			@RequestParam(value="bedCount", required=false, defaultValue="0") int bedCount,
			@RequestParam(value="breakfastCount", required=false, defaultValue="0") int breakfastCount,
			@RequestParam(value="requestContents", required=false, defaultValue="0") String requestContents,
			HttpSession session
			)
	{
		request.setAttribute("step", step);
		
		//'STEP 1 호텔/날짜 선택' 페이지로 넘어갈 때
		if(step==0)
		{
			//호텔지점 리스트
			List<HotelDto> Locallist=bookService.HotelLocalList(); //bookService에 있는 HotelLocalList 가져오기
			request.setAttribute("localList", Locallist); //리스트에 리스트 저장
		}
		
		//'STEP 2 객실 선택' 페이지로 넘어갈 때
		// 값 넘기기
		else if(step==1)
		{
			session.setAttribute("headCount",headCount); //세션에 인원 저장
			session.setAttribute("roomType", roomType); //세션에 객실타입 저장
			session.setAttribute("checkIn", checkIn); //세션에 체크인날짜 저장
			session.setAttribute("checkOut", checkOut); //세션에 체크아웃날짜 저장
			session.setAttribute("hotelLocal", hotelLocal); //세션에 호텔지점 저장
			
			//객실 리스트
			List<RoomDto> roomList=bookService.RoomList();
			request.setAttribute("roomList", roomList);
			
		}
		
		//'STEP 3 옵션 선택' 페이지로 넘어갈 때
		else if(step==2)
		{
			session.setAttribute("room_num", room_num); //세션에 룸넘버 저장
			session.setAttribute("room_config", room_config); //세션에 룸구성 저장
			session.setAttribute("room_price", room_price); //세션에 룸가격 저장
		}
		
		
		//'STEP 4 예약확인(비회원)' 페이지로 넘어갈 때
		else if(step==3)
		{
			session.setAttribute("bedType", bedType); //세션에 침대타입 저장 
			session.setAttribute("bedCount", bedCount); //세션에 침대갯수 저장
			session.setAttribute("breakfastCount", breakfastCount); //세션에 조식인원 저장
			session.setAttribute("requestContents", requestContents); //세션에 요청사항 저장
		}
		
		
		//'STEP 4 예약확인(회원)' 페이지로 넘어갈 때
		else if(step==4)
		{
			session.setAttribute("bedType", bedType); //세션에 침대타입 저장 
			session.setAttribute("bedCount", bedCount); //세션에 침대갯수 저장
			session.setAttribute("breakfastCount", breakfastCount); //세션에 조식인원 저장
			session.setAttribute("requestContents", requestContents); //세션에 요청사항 저장
		}
		
			
		// 다음 페이지로 이동
		request.setAttribute("container", "../book/bookform.jsp");

		return "layout/home";
	}
	
}
