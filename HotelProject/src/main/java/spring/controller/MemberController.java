package spring.controller;

import java.util.HashMap;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import spring.data.EmailDto;
import spring.data.EmailSender;
import spring.data.MemberDto;
import spring.service.MemberService;

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

   // 로그인 버튼 클릭시  -> 로그인 폼 
   @RequestMapping("/login.do")
   public String loginForm(HttpServletRequest request) {
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
   
   
   // 로그인 처리 - 혜수수정
   @RequestMapping(value="/loginProcess.do", method=RequestMethod.POST)
   public String loginProcess(HttpServletRequest request, HttpSession session,
         @ModelAttribute MemberDto mbdto, RedirectAttributes rttr)
   {
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

         session.setAttribute("member_num", mservice.getMembernum(mbdto.getId(), login.getPassword()));

         return "layout/home"; 
         
      }else{ //실패시
         session.setAttribute("member", null);
         rttr.addFlashAttribute("msg",false);
         request.setAttribute("msg", " ※ 아이디 or 비밀번호를 다시 확인해주세요");
         request.setAttribute("container", "../member/login/loginmain.jsp");
         return "layout/home";
      }
   }
   
   
   // 로그아웃 버튼 클릭시 
   @RequestMapping("/logout.do")
   public String logout(HttpSession session) {
      
	  session.removeAttribute("member_num");
	   
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
      
//      String member_num = (String)session.getAttribute("member_num");
      
      //넘겨받은 member_num을 이용해 mypage 를 보여줍니다.

      request.setAttribute("container", "../member/mypage/mypage.jsp");
      
      return "layout/home";
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
   public String infoEditComplete(HttpServletRequest request,
         @ModelAttribute MemberDto mbdto) {
      String inputPass = mbdto.getPassword();
      String pass = passEncoder.encode(inputPass);
      mbdto.setPassword(pass);
      mservice.updateMember(mbdto);

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
   public String joinok(HttpServletRequest request, @ModelAttribute MemberDto mbdto,
         @RequestParam("year")String year, @RequestParam("month")String month,
         @RequestParam("day")String day) {
      String inputPass = mbdto.getPassword();
      String pass = passEncoder.encode(inputPass);
      mbdto.setPassword(pass);

      mbdto.setBirth(year + "-" + month +"-" + day); // 생년월일 값 따로 전송

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
   public String sendPwMail(@RequestParam Map<String, Object> paramMap, HttpServletRequest request){
	   
	   
	   String name = (String) paramMap.get("name");
	   String e_mail = (String) paramMap.get("email");
       String password = mservice.getPw(paramMap);
		
       if(password != null){
    	   
    	   emdto.setContent("귀하의 비밀번호는 "+password+" 입니다."); // 이메일로 보낼 내용
    	   emdto.setReceiver(e_mail); // 받는이의 이메일 주소
    	   emdto.setSubject("[ 1st Hotel ] "+name+"님의 임시 비밀번호 안내 메일입니다."); // 이메일 제목 

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
   
   
   
}