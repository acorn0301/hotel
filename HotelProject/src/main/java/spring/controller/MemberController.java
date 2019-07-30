package spring.controller;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.JsonNode;

import spring.data.AdminBookDto;
import spring.data.AdminOrderDetailDto;
import spring.data.AdminOrderDto;
import spring.data.BookDto;
import spring.data.EmailDto;
import spring.data.EmailSender;
import spring.data.MemberDto;
import spring.data.ReviewDao;
import spring.service.KakaoAPI;
import spring.service.MemberService;
import upload.file.SpringFileWriter;

@Controller
public class MemberController {
   
   @Autowired
   private MemberService mservice;
   @Autowired
   private EmailSender emailSender;
   @Autowired
   private EmailDto emdto;
   
   @Autowired
   private BCryptPasswordEncoder passEncoder;
   
   @Autowired
   private KakaoAPI kakao;
   

   // 로그인 버튼 클릭시  -> 로그인 폼 
   @RequestMapping("/login.do")
   public String loginForm(HttpServletRequest request, HttpSession session, @RequestParam(value="url", defaultValue="") String url) {
	  
	  session.setAttribute("url", url);
      request.setAttribute("container", "../member/login/loginmain.jsp");
	  request.setAttribute("msg", "");

      return "layout/home";
   }
   
   
   //로그인 버튼 클릭시 실행되어야 할 기능들
   // 1. 이 회원이 현재날짜 우리 객실에 머무는 사람인지 -> 그렇다면 세션에 currentCustomer 값을 yes로 저장할것
   // 2. 이 회원이 관리자 계정인지 -> 그렇다면 세션에 admin 값을 'yes'로 저장할것 
   // 3. 이 회원의 member_num을 session에 저장해야 로그인중일때와 로그아웃중일때 나타나는 메뉴 구성을 다르게 할 수 있음.
   // 또한 member_num이 있어야 예약확인 페이지나 마이페이지를 불러올 수 있음 
   
   	// 로그인 처리
//   @RequestMapping(value="/loginProcess.do", method=RequestMethod.POST)
//   public String loginProcess(HttpServletRequest request, HttpSession session)
//   {
//	   String id = request.getParameter("id");
//	   String pwd = request.getParameter("password");
////	   String member_num = (String)session.getAttribute("member_num");
//	   
//	   int chk = mservice.loginCheck1(id, pwd);
//
////	   System.out.println(chk);
//	   if(chk > 0){
//		   
//		   if(session.getAttribute("url") != null ){
//			   
//			   String url = (String)session.getAttribute("url");
//			   session.removeAttribute("url");
//			   session.setAttribute("member_num", mservice.getMembernum(id, pwd));
//
//			   
//			   return "redirect:" + url;
//		   }
//		   
//		   request.setAttribute("container", "../layout/indexmain.jsp");
//		   request.setAttribute("msg", "환영합니다 ");
//		   
//		   session.setAttribute("member_num", mservice.getMembernum(id, pwd));
//		   
//		   return "layout/home"; 
//	   }else{
//		   request.setAttribute("msg", " ※ 아이디 or 비밀번호를 다시 확인해주세요");
//		   request.setAttribute("container", "../member/login/loginmain.jsp");
//
//		   return "layout/home";
//	   }
//   }
   
   
   //장희 추가 시작
   @RequestMapping(value="/reactLogin.do")
   public String reactlogin(HttpServletRequest request) {
	   System.out.println("react login do");
	   	 
	      return "member/login/reactLogin";
   }
   //리액트 용 로그인프로세스 
   @RequestMapping(value="/reactLoginProcess.do", method=RequestMethod.POST)
   public String reactLoginProcess(HttpServletRequest request, HttpSession session,
         @ModelAttribute MemberDto mbdto, RedirectAttributes rttr)
   {
	  if(mservice.idExist(mbdto)==1){ //일단 아이디가 존재하는지 확인  
	   
      MemberDto login = mservice.loginCheck1(mbdto);

      boolean passMatch = passEncoder.matches(mbdto.getPassword(), login.getPassword());

      //로그인 성공시
      if(login != null && passMatch){
         session.setAttribute("member", login);

         if(session.getAttribute("url") != null )
         {
            String url = (String)session.getAttribute("url");
            session.removeAttribute("url");
            session.setAttribute("member_num", mservice.getMembernum(mbdto.getId(), login.getPassword()));

            return "redirect:" + url;
         }
         
         request.setAttribute("container", "../layout/indexmain.jsp");
         request.setAttribute("msg", "환영합니다 ");
         
         //멤버 넘 받아서 세션에 올려주기 
         int member_num = mservice.getMembernum(mbdto.getId(), login.getPassword());
         session.setAttribute("member_num", member_num);
    
         
         int ishere = mservice.isHere(member_num);
         System.out.println("ishere " + ishere);
         if(ishere==1) {
        	 session.setAttribute("ishere", 1);
         }else {
        	 session.setAttribute("ishere", 0);
         }
         
         int book_num = 0;
         // 문희쌤 왈 트라이 캐치를 해주자!!
         try {
        	 book_num = mservice.isReviewAvailable(member_num);
         }catch(Exception e) {
        	 System.out.println(e);
         }
         
    	 session.setAttribute("book_num", book_num);
    	 
    	 //로그인 한 고객의 grade를 세션에 올려준다.
    	 String grade = mservice.getMemberData(member_num).getGrade();
    	 session.setAttribute("grade", grade);
    	 
    	 //로그인 한 고객의 이름을 세션에 올려준다 
    	 String name = mservice.getMemberData(member_num).getName();
    	 session.setAttribute("name", name);

         
         return "review/reactlist"; 
         
	      }else{ //아이디는 존재하지만 비밀번호가 틀린 경우
	    	  session.setAttribute("member", null);
	          rttr.addFlashAttribute("msg",false);
	          request.setAttribute("msg", " ※ 아이디와 비밀번호를 다시 확인해주세요");
	          request.setAttribute("container", "../member/login/reactLogin.jsp");
	          return "layout/home";
	      }
	  
	  }else{ //아이디가 존재하지 않는 경우 
	     session.setAttribute("member", null);
	     rttr.addFlashAttribute("msg",false);
	     request.setAttribute("msg", " ※ 아이디와 비밀번호를 다시 확인해주세요");
	     request.setAttribute("container", "../member/login/reactLogin.jsp");
	     return "layout/home";
	  }
         
   }
   
   
   
   // 로그인 처리 - 혜수수정
   @RequestMapping(value="/loginProcess.do", method=RequestMethod.POST)
   public String loginProcess(HttpServletRequest request, HttpSession session,
         @ModelAttribute MemberDto mbdto, RedirectAttributes rttr)
   {
	  if(mservice.idExist(mbdto)==1){ //일단 아이디가 존재하는지 확인 
	  
	      MemberDto login = mservice.loginCheck1(mbdto);
	
	      boolean passMatch = passEncoder.matches(mbdto.getPassword(), login.getPassword());
	
	      //로그인 성공시
	      if(login != null && passMatch){
	         session.setAttribute("member", login);
	
	
	         
	         request.setAttribute("container", "../layout/indexmain.jsp");
	         request.setAttribute("msg", "환영합니다 ");
	         
	         int member_num = mservice.getMembernum(mbdto.getId(), login.getPassword());
	         session.setAttribute("member_num", member_num);
	         
	         //장희 수정 시작 
	
	         //현재 로그인 한 고객이 숙박중이거나 혹은 체크아웃한지 일주일 이내인지 알아낸다.
	         //이 고객에 한 해 리뷰 작성하기 버튼이 보이기 때문임.
	         // 현재 숙박중 여부를 ishere에 저장, 숙박 or 일주일이내 여부를 book_num 으로 저장 
	         
	         int ishere = mservice.isHere(member_num);
	         System.out.println("ishere " + ishere);
	         if(ishere==1) {
	        	 session.setAttribute("ishere", 1);
	         }else {
	        	 session.setAttribute("ishere", 0);
	         }
	         
	         // 아래 방법으로 북넘을 얻으면 널포인트 익셉션이 뜬다...
	//         int book_num = mservice.isReviewAvailable(member_num);
	//         System.out.println("isreview book num " + book_num);
	//         if(book_num != 0) {
	//        	 session.setAttribute("book_num", book_num);
	//         }else {
	//        	 session.setAttribute("book_num", book_num);
	//         }
	         
	         int book_num = 0;
	         // 문희쌤 왈 트라이 캐치를 해주자!!
	         try {
	        	 //리뷰 작성이 가능한 고객(숙박중이거나 체크아웃한지 일주일 이내)의 예약번호를 세션에 저장한다.
	        	 book_num = mservice.isReviewAvailable(member_num);
	         }catch(Exception e) {
	        	 System.out.println(e);
	         }
	         
	    	 session.setAttribute("book_num", book_num);
	    	 
	    	 //로그인 한 고객의 grade를 세션에 올려준다.
	    	 String grade = mservice.getMemberData(member_num).getGrade();
	    	 session.setAttribute("grade", grade);
	    	 
	    	 //로그인 한 고객의 이름을 세션에 올려준다 
	    	 String name = mservice.getMemberData(member_num).getName();
	    	 session.setAttribute("name", name);
	    	 
	         if(((String)session.getAttribute("url")).length() > 0)
	         {
	            String url = (String)session.getAttribute("url");
	            session.removeAttribute("url");
	            session.setAttribute("member_num", mservice.getMembernum(mbdto.getId(), login.getPassword()));
	
	            return "redirect:" + url;
	         }
	    	 
	    	 //만약 로그인 한 회원이 관리자 일 경우 메인페이지가 아닌 관리자 페이지로 바로 보내준다. 
	    	 if(grade.equals("a")) {
	    		 return "redirect:admin.do";
	    	 }
	         
	         //장희 수정 끝 
	
	         return "redirect:home.do"; 
         
	      }else{ //아이디는 존재하지만 비밀번호가 틀린 경우
	    	  session.setAttribute("member", null);
	          rttr.addFlashAttribute("msg",false);
	          request.setAttribute("msg", " ※ 아이디와 비밀번호를 다시 확인해주세요");
	          request.setAttribute("container", "../member/login/loginmain.jsp");
	          return "layout/home";
    	  
	      }
	      
	  }else{ //아이디가 존재하지 않는 경우 
         session.setAttribute("member", null);
         rttr.addFlashAttribute("msg",false);
         request.setAttribute("msg", " ※ 아이디와 비밀번호를 다시 확인해주세요");
         request.setAttribute("container", "../member/login/loginmain.jsp");
         return "layout/home";
      }
   }
   
   
   // 로그아웃 버튼 클릭시 
   @RequestMapping("/logout.do")
   public String logout(HttpSession session) {
      
//	  session.removeAttribute("member_num");
//	  session.removeAttribute("book_num");
//	  session.removeAttribute("grade");
//	  session.removeAttribute("ishere");
//	  session.removeAttribute("name");
//	  session.removeAttribute("container");
//	  session.removeAttribute("msg");
//	  session.removeAttribute("fbdto");
//	  session.removeAttribute("url");
	  
	   //카카오 로그인 한 경우에는 이것도 삭제해야 한다.
	   //사실 이건 없어도 된다..
//	  if(session.getAttribute("access_Token")!=null){
//		  kakao.kakaoLogout((String)session.getAttribute("access_Token"));
//	      session.removeAttribute("access_Token");
//	      session.removeAttribute("userId");
//	  }
	  
	  session.invalidate();

      //로그아웃 되는 로직을 짜보세요.
      //세션도 깔끔하게 지워줍시다. 
      return "redirect:home.do";
   }
   
   
   // 회원가입 버튼 클릭시 (회원가입 이용약관 동의 페이지)
   @RequestMapping("/joinagree.do")
   public String joinagree(HttpServletRequest request) {
            
      request.setAttribute("container", "../member/join/joinagree.jsp");
      
      return "layout/home";
   }
   
   
   // 회원가입 폼 (이용약관에서 동의-> 클릭시 회원가입 폼 이동)
   @RequestMapping("/join.do")
   public String joinform(HttpServletRequest request) {
            
      request.setAttribute("container", "../member/join/joinform.jsp");
      
      return "layout/home";
   }
   
   // 아이디 중복확인 
   @RequestMapping(value="/idCheck.do", method=RequestMethod.GET)
   public @ResponseBody HashMap<String, Integer> idcheck(HttpServletRequest request, @RequestParam("id") String id) {
	  
	   HashMap<String, Integer> map = new HashMap<String, Integer>();
	   
	   int idChk = mservice.userIdCheck(id);
	   map.put("count", idChk);
	   
	   return map;
	   
   }
   
   
   // 비회원으로 로그인 버튼 클릭시
   @RequestMapping("/nonMemberLogin.do")
   public String nonMemberLogin(HttpServletRequest request) {
      
      request.setAttribute("container", "../member/login/nonmemberlogin.jsp");
      
      return "layout/home";
   }
   
   // 마이페이지 버튼 클릭시
   @RequestMapping("/mypage.do")
   public String mypage(HttpServletRequest request, HttpSession session) {
	   // String member_num = (String)session.getAttribute("member_num");
	   //넘겨받은 member_num을 이용해 mypage 를 보여줍니다.
	   int member_num = (Integer)session.getAttribute("member_num");
	   MemberDto mbdto = mservice.getMemberData(member_num);
	   request.setAttribute("mbdto", mbdto);
	   request.setAttribute("container", "../member/mypage/mypage.jsp");

	   return "layout/home";
   }
   
   // 마이페이지 예약내역 메뉴
   @RequestMapping("/m_bookinglist.do")
   public String m_bookinglist(HttpServletRequest request, HttpSession session) {
	   
	   try{
		   // member_num으로 예약한 정보리스트를 가져와야함
		   int member_num = (Integer)session.getAttribute("member_num");
		   
		   MemberDto mbdto = mservice.getMemberData(member_num);
		   request.setAttribute("mbdto", mbdto);

		   List<AdminBookDto> list = null;

		   list = mservice.m_getBookList(member_num);
		   
		   int bookCount = mservice.m_GetBookListCount(member_num);

		   request.setAttribute("bookCount", bookCount);
		   request.setAttribute("member_num", member_num);
		   request.setAttribute("list", list);

		   request.setAttribute("container", "../member/mypage/mybooking.jsp");
		   return "layout/home";

	   }catch(Exception e){
		   session.setAttribute("url", "m_bookinglist.do");
		   session.setAttribute("msg", "accessErr");
		   return "redirect:login.do";
	   }
   }
   
   // 마이페이지 예약내역 자세히보기 
   @RequestMapping("/m_bookinglistDetail.do")
   public String m_bookinglistDetail(HttpServletRequest request, HttpSession session, @RequestParam int book_num) {
	   //int member_num = (Integer)session.getAttribute("member_num");
	   AdminBookDto abdto = mservice.m_GetBookDetail(book_num);

	   request.setAttribute("abdto", abdto);

	   request.setAttribute("container", "../member/mypage/mybookingDetail.jsp");
	   return "layout/home";
   }
   
   // 예약내역 개별 삭제
   @RequestMapping("/m_bookCancelOne.do")
   public String m_bookCancelOne(HttpServletRequest request, @RequestParam int book_num, @RequestParam int book_status) {
	   mservice.m_bookCancel(book_num);
	   
	   return "redirect:m_bookinglist.do?book_status=" + book_status;
   }
   
   // 마이페이지 룸서비스 주문내역 메뉴
   @RequestMapping("/m_roomservicelist.do")
   public String m_roomservicelist(HttpServletRequest request, HttpSession session) {
	   try{
		   // member_num으로 주문한 룸서비스 리스트를 가져와야함
		   int member_num = (Integer)session.getAttribute("member_num");
		   
		   MemberDto mbdto = mservice.getMemberData(member_num);
		   request.setAttribute("mbdto", mbdto);

		   List<AdminOrderDto> list = mservice.m_GetOrderList(member_num);

		   for(AdminOrderDto a:list) {
			   List<AdminOrderDetailDto> temp = mservice.m_getOrderDetailByOrderNum(a.getOrder_num());
			   a.setOrder_detail(temp);
		   }

		   int size = list.size();
		   
		   int RoomsCount = mservice.m_GetOrderListCount(member_num);
		   request.setAttribute("RoomsCount", RoomsCount);

		   request.setAttribute("size", size);
		   request.setAttribute("room_status", member_num);
		   request.setAttribute("list", list);

		   request.setAttribute("container", "../member/mypage/myorder.jsp");
		   return "layout/home";
	   }catch(Exception e){
		   System.out.println("mypage error : " + e);
		   session.setAttribute("url", "m_roomservicelist.do");
		   session.setAttribute("msg", "accessErr");
		   return "redirect:login.do";
	   }
   }
   
   
   
   // 마이페이지 룸서비스내역 자세히 보기
   @RequestMapping("/m_roomservicelistDetail.do")
   public String m_roomservicelistDetail(HttpServletRequest request, HttpSession session, @RequestParam int order_num) {

	   AdminOrderDto aodto = mservice.m_GetOrderDataDetail(order_num);
	   List<AdminOrderDetailDto> oddto = mservice.m_getOrderDetailByOrderNum(order_num);
	   aodto.setOrder_detail(oddto);

	   int totalPrice = 0;

	   for(AdminOrderDetailDto a:oddto) {
		   totalPrice += a.getMenu_price()*a.getQty();
	   }

	   request.setAttribute("totalPrice", totalPrice);
	   request.setAttribute("aodto", aodto);

	   request.setAttribute("container", "../member/mypage/myorderDetail.jsp");
	   return "layout/home";
   }
   
   // 개별 룸서비스 주문취소
 	@RequestMapping("/m_OrderCancelOne.do")
 	public String orderCancelOne(HttpServletRequest request, @RequestParam int room_status, @RequestParam int order_num) {
 		
 		mservice.m_orderCancel(order_num);

 		return "redirect:m_roomservicelist.do?room_status=" + room_status;

 	}
   
   // 내 정보수정 클릭 (수정 폼 이동)
   @RequestMapping("/infoEdit.do")
   public String infoEdit(HttpServletRequest request, HttpSession session) {

	   /*int member_num = (Integer)session.getAttribute("member_num");*/
//	  System.out.println(session.getAttribute("member_num"));

	  int member_num = (Integer)session.getAttribute("member_num");
	  
	  MemberDto mbdto = mservice.getMemberData(member_num);
	  request.setAttribute("mbdto", mbdto);
	  
      request.setAttribute("container", "../member/mypage/infoedit.jsp");
      
      return "layout/home";
   }
   
   // 내 정보수정 처리
//   @RequestMapping("/infoEditComplete.do")
//   public String infoEditComplete(HttpServletRequest request, @ModelAttribute MemberDto mbdto) {
//     
//	   mservice.updateMember(mbdto);
//	   
//	   request.setAttribute("container", "../member/mypage/infoeditcomplete.jsp");
//	   return "layout/home";
//
//   }
   
   // 내 정보수정 처리
   @RequestMapping("/infoEditComplete.do")
   public String infoEditComplete(HttpServletRequest request, @ModelAttribute MemberDto mbdto, @RequestParam int isPicChanged, @RequestParam int isPicDel) {
	   String inputPass = mbdto.getPassword();
	   String pass = passEncoder.encode(inputPass);
	   mbdto.setPassword(pass);
	   //mservice.updateMember(mbdto);

	   // 프로필 이미지 수정 부분
//	   System.out.println(isPicChanged); // 1로 변경하면 이미지 체인지
	   
	   // mbdto에서 기존 사진파일 가져옴
	   MultipartFile image = mbdto.getUpfile();
//	   System.out.println(image);

	   if(mbdto.getMember_pic().equals("user.svg") && isPicChanged==1){ // 기본 이미지 일때
//		   System.out.println("aa");
		   
		   if(isPicChanged != 1){ // 이미지 변경안할경우 (나머지만 업데이트)
			   mservice.updateMember(mbdto);
			   
		   }else{ // 기본 이미지 일때는 원래 이미지 삭제X
			   //이미지를 업로드할 경로 구하기
			   String path = request.getSession().getServletContext().getRealPath("/save/member_pic");		
			   String member_pic = image.getOriginalFilename();
		
			   // 중복되는 파일명을 막기위해 현재 시간을 파일명 끝에 넣어준다.
			   Date now = new Date();
			   String nowstr = String.valueOf(now.getTime());
		
			   int index = member_pic.lastIndexOf(".");
			   String fileExt = member_pic.substring(index + 1);
			   member_pic = member_pic.substring(0, index);
			   member_pic = member_pic + nowstr + "." +fileExt;
			
			   //이미지 저장 메서드 호출
			   SpringFileWriter fileWriter = new SpringFileWriter();
		
			   //writeFile(실제이미지파일, 저장할 경로, 저장될 이름) 
			   fileWriter.writeFile(image, path, member_pic);
		
			   //이미지 리사이징을 위한 부분2
			   String orgFilePath = path + "/" + member_pic;
		
			   try {
				   ReviewDao.makeThumbnail(orgFilePath, member_pic, fileExt, path);
		
			   }catch(Exception e) {
				   System.out.println(e);
			   }
		
			   mbdto.setMember_pic(member_pic);
			   System.out.println("memberpic change!!");
		   
			   mservice.updateMember(mbdto);
		   }
		   
	   }
	   else if(isPicChanged == 1){ // 기본이미지 말고 다른(예전에 변경된)이미지 있을때 기존 이미지 삭제
//		   System.out.println("bb");
		   String path = request.getSession().getServletContext().getRealPath("/save/member_pic");		
		   String member_pic = image.getOriginalFilename();
		   
		   // 이미지 삭제 부분
		   File f = new File(path + "/" + mbdto.getMember_pic());
		   if(f.exists())
			   f.delete();
//		   int member_num = mbdto.getMember_num();
//		   mservice.pic_delete(member_num);
	
		   // 중복되는 파일명을 막기위해 현재 시간을 파일명 끝에 넣어준다.
		   Date now = new Date();
		   String nowstr = String.valueOf(now.getTime());
	
		   int index = member_pic.lastIndexOf(".");
		   String fileExt = member_pic.substring(index + 1);
		   member_pic = member_pic.substring(0, index);
		   member_pic = member_pic + nowstr + "." +fileExt;
		
		   //이미지 저장 메서드 호출
		   SpringFileWriter fileWriter = new SpringFileWriter();
	
		   //writeFile(실제이미지파일, 저장할 경로, 저장될 이름) 
		   fileWriter.writeFile(image, path, member_pic);
	
		   //이미지 리사이징을 위한 부분2
		   String orgFilePath = path + "/" + member_pic;
	
		   try {
			   ReviewDao.makeThumbnail(orgFilePath, member_pic, fileExt, path);
	
		   }catch(Exception e) {
			   System.out.println(e);
		   }
	
		   mbdto.setMember_pic(member_pic);
//		   System.out.println("memberpic change!!");
		 
		   mservice.updateMember(mbdto);
		   
	   }else if(isPicDel == 1){ // 삭제버튼 클릭시 기존사진 삭제되면서 기본 프로필사진으로 바뀜
		   System.out.println(isPicDel);
		   String path = request.getSession().getServletContext().getRealPath("/save/member_pic");		
//		   String member_pic = image.getOriginalFilename();
		   
		   // 이미지 삭제 부분
		   File f = new File(path + "/" + mbdto.getMember_pic());
		   if(f.exists())
			   f.delete();
		   
		   mbdto.setMember_pic("user.svg");
//		   mbdto.setMember_pic(member_pic);
		   mservice.updateMember(mbdto);
		   
	   }else{ // 이미지 변경안하고 다른 정보만 수정할 때
		   mservice.updateMember(mbdto);
	   }
	   
	   request.setAttribute("container", "../member/mypage/infoeditcomplete.jsp");
	   return "layout/home";

   }
   
   
   // 가입완료 버튼 클릭시
//   @RequestMapping(value="/joinok.do", method=RequestMethod.POST)
//   public String joinok(HttpServletRequest request, @ModelAttribute MemberDto mbdto,
//                     @RequestParam("year")String year, @RequestParam("month")String month, @RequestParam("day")String day) {
//     
//    mbdto.setBirth(year + "-" + month +"-" + day); // 생년월일 값 따로 전송
//    
//     mservice.insertMember(mbdto);
//     request.setAttribute("container", "../member/join/joincomplete.jsp");
//      
//     return "layout/home";
//   }
   
   
 //가입완료 버튼 클릭시 - 혜수수정
   @RequestMapping(value="/joinok.do", method=RequestMethod.POST)
   public String joinok(HttpServletRequest request, @ModelAttribute MemberDto mbdto) {
      String inputPass = mbdto.getPassword();
      String pass = passEncoder.encode(inputPass);
      mbdto.setPassword(pass);

      mservice.insertMember(mbdto);
      request.setAttribute("container", "../member/join/joincomplete.jsp");

      return "layout/home";
   }
   
   
   // 아이디 찾기 입력폼
   @RequestMapping(value="/findIdform.do", method={RequestMethod.GET, RequestMethod.POST})
   public String findId(HttpServletRequest request) {
	   
      request.setAttribute("container", "../member/login/findid.jsp");
      
      return "layout/home";
   }
   
   
   // 아이디 찾기 (이메일,이름받아서 일치하면 다음 폼에서 아이디 확인 가능)
   @RequestMapping(value="/findId.do", method=RequestMethod.POST)
   public String findIdOk(@RequestParam Map<String, Object> paramMap, HttpServletRequest request){
       String id = mservice.getId(paramMap);
       
       if(id != null){
    	   request.setAttribute("findId", id);
    	   
    	   request.setAttribute("container", "../member/login/findIdOk.jsp");
    	   return "layout/home";
       }else{
    	   request.setAttribute("msg", " ※ 이름과 이메일주소를 다시 확인해주세요"); // 이름/이메일주소 DB정보와 일치하지 않을때 메세지
    	   request.setAttribute("container", "../member/login/findid.jsp");
    	   return "layout/home";
       }
	   
   }
   
   // 비밀번호 찾기 입력폼
   @RequestMapping(value="/findPwform.do", method={RequestMethod.GET, RequestMethod.POST})
   public String findPw(HttpServletRequest request) {
	   
      request.setAttribute("container", "../member/login/findpassword.jsp");
      
      return "layout/home";
   }
   
   // 임시비밀번호 생성 (이메일 보내기)
   @Autowired
   private JavaMailSender mailSender;
	
   @RequestMapping(value="/findPw.do", method=RequestMethod.POST)
   public String sendPwMail(
		   //@RequestParam Map<String, Object> paramMap,
		   HttpServletRequest request, @ModelAttribute MemberDto mbdto){
	   
//	   String name = (String) paramMap.get("name");
//	   String e_mail = (String) paramMap.get("email");
//	   String pw = mservice.getPw(paramMap);
	   
	   int chk = mservice.IdEmailMatchCount(mbdto);
	   
	   // 임시비밀번호 생성 (난수 발생)
	   String pwpw = ""; 
	   for(int i=0; i<8; i++) { 
		   int rndVal = (int)(Math.random() * 62); 
		   if(rndVal < 10) { 
			   pwpw += rndVal; 
		   } else if(rndVal > 35) { 
			   pwpw += (char)(rndVal + 61); 
		   } else { 
			   pwpw += (char)(rndVal + 55); 
		   } 
	   } System.out.println("tempPassword : " + pwpw);
	   
       if(chk > 0){
    	   
    	   emdto.setContent("귀하의 임시 비밀번호는 "+pwpw+" 입니다."); // 이메일로 보낼 내용
    	   emdto.setReceiver(mbdto.getEmail()); // 받는이의 이메일 주소
    	   emdto.setSubject("[ 1st Hotel ] "+mbdto.getId()+"님의 임시 비밀번호 안내 메일입니다."); // 이메일 제목 
    	   
    	   String inputPass = pwpw;
    	   String pass = passEncoder.encode(inputPass);
    	   mbdto.setPassword(pass);
    	   mservice.setPw(mbdto);
	      	
    	   try{
    		   MimeMessage message = mailSender.createMimeMessage();
    		   MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

    		   messageHelper.setSubject(emdto.getSubject());
    		   messageHelper.setText(emdto.getContent());
    		   messageHelper.setTo(emdto.getReceiver());
    		   messageHelper.setFrom("0301acorn@gmail.com"); // 관리자 이메일 주소
    		   message.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(emdto.getReceiver()));
    		   mailSender.send(message);
    	   }catch(MessagingException e){
    		   System.out.println("MessagingException");
    		   e.printStackTrace();
    	   }
    	   
    	   request.setAttribute("container", "../member/login/findpasswordOk.jsp"); // 임시 비밀번호 생성완료 페이지
    	   return "layout/home";
       }else{
    	   request.setAttribute("msg", " ※ 이름과 이메일주소를 다시 확인해주세요"); // 이름/이메일주소 DB정보와 일치하지 않을때 메세지
    	   request.setAttribute("container", "../member/login/findpassword.jsp");
    	   return "layout/home";
       }
		
	}
   
   // 회원탈퇴 메뉴 클릭
   @RequestMapping(value="/withdrawal.do", method={RequestMethod.GET, RequestMethod.POST})
   public String withdrawal(HttpServletRequest request) {
	
	   request.setAttribute("container", "../member/mypage/mywithdrawal.jsp");
	   return "layout/home";
   }
   
   
   // 회원탈퇴 처리
   @RequestMapping(value="/withdrawalOk.do", method=RequestMethod.POST)
   public String withdrawalOk(HttpServletRequest request, HttpSession session, @ModelAttribute MemberDto mbdto){
	   try{ 
		   int member_num = (Integer)session.getAttribute("member_num"); // 로그인된 세션 멤버넘가져오기
		   
		   MemberDto member = mservice.getMemberData(member_num); // 멤버넘으로 멤버데이터 가져옴
		   request.setAttribute("member", member);
		   MemberDto check = mservice.loginCheck1(mbdto);

		   if(check != null)
		   {
			   //		  System.out.println(mbdto.getId().equals(member.getId()) && (passEncoder.matches(mbdto.getPassword(), member.getPassword())));
			   if(mbdto.getId().equals(member.getId()) && (passEncoder.matches(mbdto.getPassword(), member.getPassword()))){
				   
				   member.setMember_num((Integer)session.getAttribute("member_num"));
				   mservice.withdrawal(mbdto);
				   mservice.withdrawal(member);
				   session.removeAttribute("member_num");

				   request.setAttribute("container", "../member/mypage/mywithdrawalOk.jsp");
				   return "layout/home";
			   }else{
				   request.setAttribute("msg", " ※ 아이디 or 비밀번호를 다시 확인해주세요");
				   request.setAttribute("container", "../member/mypage/mywithdrawal.jsp");
				   return "layout/home";
			   }
		   }else{
			   request.setAttribute("msg", " ※ 아이디 or 비밀번호를 다시 확인해주세요");
			   request.setAttribute("container", "../member/mypage/mywithdrawal.jsp");
			   return "layout/home";
		   }
	   }catch(Exception e){
		   session.setAttribute("url", "withdrawal.do");
		   session.setAttribute("msg", "accessErr");
		   return "redirect:login.do";
	   }
	  
   }
   
   // 카카오 로그인
   @RequestMapping(value="/kakaoLogin")
   public String login(@RequestParam("code") String code, HttpSession session, HttpServletRequest request) {
	   //, @RequestParam(value="id") String id 
       System.out.println("code : " + code);
       String access_Token = kakao.getAccessToken(code);
       HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
       
       System.out.println("login Controller : " + userInfo);
       
       //    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
       if (userInfo.get("email") != null) {
           session.setAttribute("userId", userInfo.get("email"));
           session.setAttribute("access_Token", access_Token);
       }
       System.out.println("controller access_token : " + access_Token);
       
       //얻어온 정보로 회원 가입 강제로 시킴
       //기존에 이미 가입된 회원인지 확인
       //만약 가입되지 않았다면 새로 가입시키고 , 가입 된 사람이라면 그냥 그 가입된 아이디의 멤버넘을 받아서 세션으로 올려준다.
       String user_email = (String)userInfo.get("email");
       String user_id = "kakao_" + userInfo.get("id");
       String user_name = (String)userInfo.get("nickname");
       
       MemberDto mbdto = new MemberDto();
       mbdto.setId(user_id);
       mbdto.setPassword("********");
       mbdto.setName(user_name);
       mbdto.setPhone("00000000000");
       mbdto.setEmail(user_email);
       
       String id = mbdto.getId();
       int idchk = mservice.userIdCheck(id);
       int member_num = 0;
       if(idchk == 0) // 가입되지 않음 (아이디=0)
       {
    	   
    	   mservice.insertMember(mbdto);
//    	   session.setAttribute("member_num", mbdto.getMember_num());
    	   session.setAttribute("mbdto", mbdto);
    	   member_num =  mservice.getMembernum_kakao(id);
    	  
       }else{ // 가입된 아이디있음 (아이디=1)
    	  member_num =  mservice.getMembernum_kakao(id);
       }
       
       //현재 로그인 한 고객이 숙박중이거나 혹은 체크아웃한지 일주일 이내인지 알아낸다.
       //이 고객에 한 해 리뷰 작성하기 버튼이 보이기 때문임.
       // 현재 숙박중 여부를 ishere에 저장, 숙박 or 일주일이내 여부를 book_num 으로 저장 
       int ishere = mservice.isHere(member_num);
       System.out.println("ishere " + ishere);
       if(ishere==1) {
      	 session.setAttribute("ishere", 1);
       }else {
      	 session.setAttribute("ishere", 0);
       }
       
       int book_num = 0;
       // 문희쌤 왈 트라이 캐치를 해주자!!
       try {
      	 //리뷰 작성이 가능한 고객(숙박중이거나 체크아웃한지 일주일 이내)의 예약번호를 세션에 저장한다.
      	 book_num = mservice.isReviewAvailable(member_num);
       }catch(Exception e) {
      	 System.out.println(e);
       }
       
  	 session.setAttribute("book_num", book_num);
  	 
  	 //로그인 한 고객의 grade를 세션에 올려준다.
  	 String grade = mservice.getMemberData(member_num).getGrade();
  	 session.setAttribute("grade", grade);
  	 
  	 //로그인 한 고객의 이름을 세션에 올려준다 
  	 String name = mservice.getMemberData(member_num).getName();
  	 session.setAttribute("name", name);

  	 session.setAttribute("member_num", member_num);
//  	 request.setAttribute("container", "../layout/indexmain.jsp");
//  	 return "layout/home";
  	 return "redirect:home.do";
       
//       return "/member/login/kakaologin";
   }
   

   // 카카오 로그아웃
//   @RequestMapping(value="/kakaoLogout.do")
//   public String kakaologout(HttpSession session) {
//       kakao.kakaoLogout((String)session.getAttribute("access_Token"));
//       session.removeAttribute("access_Token");
//       session.removeAttribute("userId");
//       return "redirect:home.do";
//   }
   
}