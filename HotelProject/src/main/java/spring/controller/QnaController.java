package spring.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import spring.data.QnaDto;
import spring.data.QnaReplyDto;
import spring.data.jhClass;
import spring.service.QnaReplyService;
import spring.service.QnaService;

@Controller
public class QnaController {
	
	@Autowired
	QnaService qservice;
	
	@Autowired
	QnaReplyService qrservice;

	//문의게시판 버튼을 눌렀을때 
	@RequestMapping("/qnalist.do")
	public String list(HttpServletRequest request, 
			@RequestParam(value="pageNum", defaultValue="1") int currentPage, 
			@RequestParam(value="category", defaultValue="all") String category,
			@RequestParam(value="fromWhere", defaultValue="menu") String fromWhere,
			@RequestParam(value="board_status", defaultValue="-1") int board_status,
			HttpSession session) {
			
			
		
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
				totalCount = qservice.getTotalCount(category, board_status);
				
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
				
		List<QnaDto> list = qservice.getList(start, end, category, board_status);
		
	
		

		Date now = new Date();
		
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    TimeZone tz = TimeZone.getTimeZone("Asia/Seoul"); 
	    df.setTimeZone(tz);
	    Calendar cal = df.getCalendar();
	   
	    cal = jhClass.CalendarFromString(df.format(now));
		
		for(QnaDto d:list) {
						
			//작성일을 좀더 심플하게 표현하기 
			long timediff = cal.getTime().getTime()-d.getWriteday().getTime();
						
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
		
		for(QnaDto q:list) {
			
			q.setReplyCount(qservice.getReplyTotalCount(q.getBoard_num()));
		
		}
		
		int size = list.size();
		
		request.setAttribute("totalCount",totalCount);
		request.setAttribute("list", list);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("no", no);
		request.setAttribute("perPage", perPage);
		request.setAttribute("perBlock", perBlock);
		request.setAttribute("currentPage", currentPage);
		
		request.setAttribute("fromWhere", fromWhere);
		request.setAttribute("category", category);
		request.setAttribute("board_status", board_status);
		request.setAttribute("size", size);

			
		request.setAttribute("container", "../qna/list.jsp");
		
		return "layout/home";
	}
	
	
	
	//문의게시판 내 문의하기 버튼을 눌렀을 때 
	@RequestMapping("/qnaform.do")
	public String form(HttpServletRequest request, HttpSession session, @RequestParam String pageNum) {
		
		//로그인 회원의 경우 작성자 이름 넘어가도록 하기 
		if(session.getAttribute("member_num")!=null) {
			
			int member_num = (Integer)session.getAttribute("member_num");
			request.setAttribute("writer", qservice.getWriter(member_num));
			
		}
		
		//pageNum 넘어가도록 하기
		request.setAttribute("pageNum", pageNum);
				
		request.setAttribute("container", "../qna/writeform.jsp");
		
		return "layout/home";
	}
	
	
	
	//글 내용 보기
	@RequestMapping("/qnacontent.do")
	public String content(HttpServletRequest request, HttpSession session,
			@RequestParam int board_num, @RequestParam String pageNum, 
			@RequestParam String fromWhere, @RequestParam String category,
			@RequestParam int board_status) {
		
		// 해당 글의 조회수를 ++ 한다.
		qservice.updateReadCount(board_num);
		
		// 해당 글의 내용을 db로부터 가져온다.
		QnaDto qdto = qservice.getData(board_num);
				
		//해당 글에 달린 댓글들을 db로부터 가져온다.
		List<QnaReplyDto> replylist = qrservice.getQnaReplyList(board_num);
		
		//세션에 저장된 member_num을 가져온다.
		int member_num = 0;
		String member_name = "";
		if(session.getAttribute("member_num")!=null) {
			member_num = (Integer)session.getAttribute("member_num");
			member_name = qservice.getWriter(member_num);
		}else {
			member_num = 0;
		}

		request.setAttribute("member_num", member_num);
		request.setAttribute("member_name", member_name);
		//member_num != "no"일 때에만 댓글 작성창을 보여주려고 한다. 
		
		
		//댓글들의 총 갯수를 가져온다.
		int replyTotalCount = qservice.getReplyTotalCount(board_num);
		
		request.setAttribute("board_num", board_num);
		request.setAttribute("replyTotalCount", replyTotalCount);
		request.setAttribute("replylist", replylist);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("qdto", qdto);
		request.setAttribute("container", "../qna/content.jsp");
		
		request.setAttribute("fromWhere", fromWhere);
		request.setAttribute("category", category);
		request.setAttribute("board_status", board_status);
		
		return "layout/home";
	}
	
	//글 추가하기 기능 
	@RequestMapping(value="/qnawrite.do", method=RequestMethod.POST)
	public String write(HttpServletRequest request, @RequestParam String pageNum, @ModelAttribute QnaDto qdto) {
		
		if(qdto.getSubject()!="") {
			
			qservice.insertData(qdto);

		}
		
		return "redirect:qnalist.do?pageNum=" + pageNum;
	}
	
	
	//삭제하기 버튼을 눌렀을 때 
	@RequestMapping("/qnadeleteform.do")
	public String deleteForm(HttpServletRequest request, @RequestParam int board_num, @RequestParam String pageNum) {
			
		request.setAttribute("password", qservice.getPass(board_num));
		request.setAttribute("board_num", board_num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("container", "../qna/deleteform.jsp");

		return "layout/home";
	}
	
	//삭제처리
	@RequestMapping("/qnadelete.do")
	public String deleteData(HttpServletRequest request, @RequestParam int board_num, @RequestParam String pageNum) {
	
		qservice.deleteData(board_num);
		request.setAttribute("pageNum", pageNum);
		
		return "redirect:qnalist.do?pageNum=" + pageNum;
	}
	
	//수정하기 버튼을 눌렀을 때
	@RequestMapping("/qnaeditform.do")
	public String editForm(HttpServletRequest request, 
			@RequestParam int board_num, @RequestParam String pageNum,
			@RequestParam String fromWhere, @RequestParam String category,
			@RequestParam int board_status
			) {
			
		request.setAttribute("password", qservice.getPass(board_num));
		request.setAttribute("qdto", qservice.getData(board_num));
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("container", "../qna/editform.jsp");
		
		
		request.setAttribute("fromWhere", fromWhere);
		request.setAttribute("category", category);
		request.setAttribute("board_status", board_status);

		return "layout/home";
	}
	
	//수정처리
	@RequestMapping(value="/qnaedit.do", method=RequestMethod.POST)
	public String edit(HttpServletRequest request, 
			@RequestParam int board_num, @RequestParam String pageNum, 
			@RequestParam String fromWhere, @RequestParam String category,
			@RequestParam int board_status,
			@ModelAttribute QnaDto qdto) {
		
	
		qservice.updateData(qdto);
		request.setAttribute("board_num", board_num);
		request.setAttribute("pageNum", pageNum);
		return "redirect:qnacontent.do?pageNum=" + pageNum + "&board_num=" + board_num + "&fromWhere=" + fromWhere + "&category=" + category +"&board_status=" + board_status ;

	}
	
	//댓글 등록 버튼을 눌렀을 때 
	@RequestMapping(value="/qnareplyinsert.do", method=RequestMethod.POST)
	public String insertReply(HttpServletRequest request, 
			@RequestParam int board_num, @RequestParam String pageNum, 
			@RequestParam String fromWhere, @RequestParam String category,
			@RequestParam int board_status,
			@ModelAttribute QnaReplyDto qrdto, HttpSession session) {		
		
		
		qrservice.insertReply(qrdto);
		
		//만약 댓글을 작성한 사람이 관리자라면
		//해당 글의 board_status를 1로 변경한다.
		if(session.getAttribute("grade").equals("a")) {
			qservice.adminReplyComplete(board_num);
		}
		
		
		//메서드 간 한글 값 교환시 깨지는 현상이 있다. 되도록 한글 안써야 하는데...
		//카테고리는 값이 한글이라서 이렇게 처리해서 보내주도록 하자.
		String category_enc = "";
		try {
			category_enc = URLEncoder.encode(category,"utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e);
		}
				
		return "redirect:qnacontent.do?pageNum=" + pageNum + "&board_num=" + board_num + "&fromWhere=" + fromWhere + "&category=" + category_enc +"&board_status=" + board_status ;

	}
}
