package spring.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import spring.data.FinalBookDto;
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
			@RequestParam(value="step3check",defaultValue="0") int step3check,
			@ModelAttribute FinalBookDto fbdto,
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
			System.out.println("hotel_num" + fbdto.getHotel_num());
			
			
			//step1 에서 넘어온 경우
			if(fbdto.getHotel_num() != 0){ //<이곳의 fbdto는 세션이 아닌 자동으로 들어온 파라미터 fbdto이다.
				
				//fbdto1 선언
				//fbdto1 = new FinalBookDto();
				
				//빈 dto인 fbdto1 선언
				FinalBookDto fbdto1 = new FinalBookDto();
				
				// fbdto의 값을 가져와 fbdto1에 삽입
				//fbdto1 = (FinalBookDto)session.getAttribute("fbdto");
				
				//fbdto1에 데이터 넣기
				fbdto1.setHotel_num(fbdto.getHotel_num());
				fbdto1.setCheck_in(fbdto.getCheck_in());
				fbdto1.setCheck_out(fbdto.getCheck_out());
				fbdto1.setHead_count(fbdto.getHead_count());
				//getHotel 함수에 특정 Hotel_num을 넣어 받은 fbdto 해당 호텔 정보리스트 중 Hotel_local를 얻어 fbdto1의 Hotel_local에 삽입
				fbdto1.setHotel_local(bookService.getHotel(fbdto1.getHotel_num()).getHotel_local());
				
				//fbdto1를 fbdto에 삽입
				session.setAttribute("fbdto",fbdto1);
				
			}
			//step3 혹은 step4 에서 넘어온 경우
			else{ 
				//fbdto1 선언
				//fbdto1 = new FinalBookDto();
				
				//빈 dto인 fbdto1 선언
				FinalBookDto fbdto1 = new FinalBookDto();
				
				// fbdto의 값을 가져와 fbdto1에 삽입
				//fbdto1 = (FinalBookDto)session.getAttribute("fbdto");
				
				//fbdto1에 데이터 넣기
				fbdto1.setHotel_num(fbdto.getHotel_num());
				fbdto1.setCheck_in(fbdto.getCheck_in());
				fbdto1.setCheck_out(fbdto.getCheck_out());
				fbdto1.setHead_count(fbdto.getHead_count());
				//getHotel 함수에 특정 Hotel_num을 넣어 받은 fbdto 해당 호텔 정보리스트 중 Hotel_local를 얻어 fbdto1의 Hotel_local에 삽입
				fbdto1.setHotel_local(bookService.getHotel(fbdto1.getHotel_num()).getHotel_local());
				
				//fbdto1를 fbdto에 삽입
				session.setAttribute("fbdto",fbdto1);
			}
			// name이 일치하는 값을 fbdto에 저장
			/*session.setAttribute("fbdto", fbdto);
			*/
			// BookDto 클래스 bdto1 생성
			/*FinalBookDto fbdto1 = new FinalBookDto();
			
			// bdto1에 mybdto 세션 값 삽입 
			fbdto1 = (FinalBookDto)session.getAttribute("fbdto");*/
			
			/*// bdto1에 room_num 값 삽입
			fbdto1.setHotel_num(fbdto.getHotel_num());
			fbdto1.setCheck_in(fbdto.getCheck_in());
			fbdto1.setCheck_out(fbdto.getCheck_out());
			fbdto1.setHead_count(fbdto.getHead_count());
			
			//호텔지점에 따라 호텔 이름 출력*/
			/*String hotel_local = bookService.getHotel(fbdto1.getHotel_num()).getHotel_local();*/
			
			
			//객실 리스트 출력
			List<RoomDto> roomList=bookService.RoomList(fbdto);
			
			/*request.setAttribute("hotel_local", hotel_local);*/
			request.setAttribute("roomList", roomList);
			
			System.out.println("head_count: "+fbdto.getHead_count());
			System.out.println("check_in: "+fbdto.getCheck_in());
			System.out.println("hotel_num: "+fbdto.getHotel_num());
		}
		
		
		//'STEP 3 옵션 선택' 페이지로 넘어갈 때
		else if(step==2)
		{
			System.out.println("get room num " + fbdto.getRoom_num());
			
			// STEP 2 에서 넘어온 경우 !!!!!!!!!!!!!!!!!!!!!!!!조건 확인하기
			if(fbdto.getRoom_num() != 0)
			{
				//빈 dto인 fbdto2 선언
				FinalBookDto fbdto2 = new FinalBookDto();
				
				// fbdto의 값을 가져와 fbdto2에 삽입
				fbdto2 = (FinalBookDto)session.getAttribute("fbdto");
				
				//여기까지 값이 유지됨
				
				// rbdto2에 room_num 삽입
				fbdto2.setRoom_num(fbdto.getRoom_num());
				
				// room_num 불러오기
				int room_num = fbdto.getRoom_num();
				

				//빈 dto인 fbdto3 선언
				FinalBookDto fbdto3 = new FinalBookDto();
				
				//room_num로 알게된 룸데이터를 fbdto3에 삽입
				fbdto3 = bookService.getRoomData(room_num);
				
				fbdto2.setRoom_config(fbdto3.getRoom_config());
				System.out.println("room name chk " +fbdto3.getRoom_name());
				
				fbdto2.setRoom_name(fbdto3.getRoom_name());
				fbdto2.setPrice(fbdto3.getPrice());
				fbdto2.setType(fbdto3.getType());
				
				
				//덮어쓰기
				session.setAttribute("fbdto", fbdto2);
				
				
			}
			// STEP 4 에서 넘어온 경우
			else
			{
				//빈 dto인 fbdto3 선언
				FinalBookDto fbdto4 = new FinalBookDto();
				
				// fbdto의 값을 가져와 fbdto2에 삽입
				fbdto4 = (FinalBookDto)session.getAttribute("fbdto");
				
				// rbdto2에 room_num 삽입
				fbdto4.setAdd_bed(fbdto.getAdd_bed());
				fbdto4.setBreakfast_count(fbdto.getBreakfast_count());
				
				//덮어쓰기
				session.setAttribute("fbdto", fbdto4);
			}
				
			

			
			//session.setAttribute("bedCountPrice", fbdto.getAdd_bed()*bedPrice);
			//session.setAttribute("breakfastCountPrice", fbdto.getBreakfast_count()*breakfastPrice);
		}
		
		
		//'STEP 4 예약확인(비회원)' 페이지로 넘어갈 때
		else if(step==3)
		{
			// fbdto3를 새로 만들어 fbdto 값을 받아오기
			FinalBookDto fbdto3=new FinalBookDto();
			fbdto3 = (FinalBookDto)session.getAttribute("fbdto");
			
			// fbdto4에 데이터 삽입
			fbdto3.setAdd_bed(fbdto.getAdd_bed());
			
			//요청사항없을 시 표기
			if(fbdto.getBook_memo() == "")
			{
				fbdto.setBook_memo("요청사항 없음");
			}
			
			fbdto3.setBook_memo(fbdto.getBook_memo());
			fbdto3.setBreakfast_count(fbdto.getBreakfast_count());
			
			System.out.println(fbdto.getBook_memo());
			

			// 세션에 fbdto4를 fbdto에 넣기
			session.setAttribute("fbdto", fbdto3);
		}
		
		
		//'STEP 4 예약확인(회원)' 페이지로 넘어갈 때
		else if(step==4)
		{	
			step3check = 1;
			
			//로그인상태일때
			if(repeat!=1){
				
				// fbdto4를 새로 만들어 fbdto 값을 받아오기
				FinalBookDto fbdto4=new FinalBookDto();
				fbdto4 = (FinalBookDto)session.getAttribute("fbdto");

				//요청사항없을 시 표기
				if(fbdto.getBook_memo() == "")
				{
					fbdto.setBook_memo("요청사항 없음");
				}
				
				// fbdto4에 데이터 삽입
				fbdto4.setAdd_bed(fbdto.getAdd_bed());
				fbdto4.setBook_memo(fbdto.getBook_memo());
				fbdto4.setBreakfast_count(fbdto.getBreakfast_count());
				
				
	
				// 세션에 fbdto4를 fbdto에 넣기
				session.setAttribute("fbdto", fbdto4);
			}
			

			//로그아웃 상태일때
			if(session.getAttribute("member_num")==null)
			{
				// fbdto4를 새로 만들어 fbdto 값을 받아오기
				FinalBookDto fbdto4=new FinalBookDto();
				fbdto4 = (FinalBookDto)session.getAttribute("fbdto");

				//요청사항없을 시 표기
				if(fbdto.getBook_memo() == "")
				{
					fbdto.setBook_memo("요청사항 없음");
				}
				
				// fbdto4에 데이터 삽입
				fbdto4.setAdd_bed(fbdto.getAdd_bed());
				fbdto4.setBook_memo(fbdto.getBook_memo());
				fbdto4.setBreakfast_count(fbdto.getBreakfast_count());
				
				
	
				// 세션에 fbdto4를 fbdto에 넣기
				session.setAttribute("fbdto", fbdto4);
				
				session.setAttribute("url", "booking.do?step=4&repeat=1");
				return "redirect:login.do";
			}
		}
		
		
		// 다음 페이지로 이동
		request.setAttribute("container", "../book/bookform.jsp");

		return "layout/home";
	}
	
		
	
	//비회원예약페이지에서 - 예약하기 버튼 클릭시
	@RequestMapping(value="/insertNC.do", method=RequestMethod.POST)
	public String insertnc(HttpSession session,
			@ModelAttribute FinalBookDto fbdto,
			@ModelAttribute MemberDto mbdto)
	{		
		//비회원 정보를 member테이블에 저장
		bookService.insertInfo_notMember(mbdto);
		
		//member_num 의 최대값(방금 가입한 회원) 을 예약정보에 삽입
		int member_num = bookService.maxMemberNum();
		
		
		FinalBookDto fbdto5= new FinalBookDto();
		fbdto5 = (FinalBookDto)session.getAttribute("fbdto");
		fbdto5.setMember_num(member_num);
		session.setAttribute("fbdto",fbdto5);
		
		//예약정보 저장
		bookService.insertBook(fbdto5);
		
		session.removeAttribute("fbdto");
		
		return "redirect:booking.do?step=5";
	}
	
	
	
	//회원예약 - 예약하기 버튼 클릭시
	@RequestMapping(value="/insert.do", method=RequestMethod.POST)
	public String insertBook(HttpSession session,
			@ModelAttribute FinalBookDto fbdto)
	{
		FinalBookDto fbdto6= new FinalBookDto();
		fbdto6 = (FinalBookDto)session.getAttribute("fbdto");
		fbdto6.setMember_num((Integer)session.getAttribute("member_num"));
		session.setAttribute("fbdto",fbdto6);
		
		//예약정보 저장
		bookService.insertBook(fbdto6);
		
		session.removeAttribute("fbdto");
		
		return "redirect:booking.do?step=5";
	}
}
