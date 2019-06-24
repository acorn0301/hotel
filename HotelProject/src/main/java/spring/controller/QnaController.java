package spring.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class QnaController {

	//문의게시판 버튼을 눌렀을때 
	@RequestMapping("/qnalist.do")
	public String list(HttpServletRequest request) {
		
		//여기에 qna 데이타베이스 테이블로부터 리스트를 가져오는 코드를 짭니다.(dao, dto 클래스파일은 이미 spring.data에 있어요)
		//많이 해봤죠?? 페이징 처리해서 하면 됨! 
		//주석은 최대한 친절하고 꼼꼼하게 달아주세요 *^^*
		
		request.setAttribute("container", "../qna/list.jsp");
		
		return "layout/home";
	}
	
	
	
	//문의게시판 내 문의하기 버튼을 눌렀을 때 
	@RequestMapping("/qnaform.do")
	public String form(HttpServletRequest request) {
				
		request.setAttribute("container", "../qna/writeform.jsp");
		
		return "layout/home";
	}
	
	
	
	//문의게시판에서 게시글을 눌렀을 때 
	@RequestMapping("/qnacontent.do")
	public String content(HttpServletRequest request, @RequestParam int qna_num) {

		//qna_num을 받아왔으니 db로부터 해당 글의 내용을 가져올 수 있습니다.
		//받아서 넘겨보아요~
		
		request.setAttribute("container", "../qna/content.jsp");
		
		return "layout/home";
	}
	
}
