package spring.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReviewController {

	@RequestMapping("/reviewlist.do")
	public String list(HttpServletRequest request) {
		
		//여기에 review 데이타베이스 테이블로부터 리스트를 가져오는 코드를 짭니다.(dao, dto 클래스파일은 이미 spring.data에 있어요)
		//게시판 형식은 아닙니다 (추후 회의해서 자세한 형식을 정하도록 해요)
		//주석은 최대한 친절하고 꼼꼼하게 달아주세요 *^^*
		
		request.setAttribute("container", "../review/list.jsp");
		
		return "layout/home";
	}
	
}
