package spring.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.imgscalr.Scalr;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import spring.data.MemberDto;
import spring.data.ReviewDao;
import spring.data.ReviewDto;
import spring.data.ReviewReplyDto;
import spring.data.jhClass;
import spring.service.MemberService;
import spring.service.ReviewService;
import upload.file.SpringFileWriter;

@Controller
public class ReviewController {
	
	@Autowired
	ReviewService rservice;
	
	@Autowired
	MemberService mservice;
	
	// 리뷰 게시판은 인스타그램 스타일로 제작됩니다. 리액트를 사용할 예정이므로, 여기서는 db만 처리만해주면 됩니다.

	
	
	//후기 게시판 버튼을 눌렀을 때 
	@RequestMapping("/reviewlist.do")
	public String reviewlist(HttpServletRequest request, HttpSession session) {
		
		int member_num = 0;
		if(session.getAttribute("member_num") != null) {
			member_num = (Integer)session.getAttribute("member_num");
		}
		
		return "redirect:http://firsthotel-review.herokuapp.com/" + member_num;
	}
	
	

	//리스트 출력 
	@RequestMapping(value="/reviewList", method=RequestMethod.GET)
	@CrossOrigin
	public @ResponseBody List<ReviewDto> getList(int currentPage){ //@ResponseBody가 있으면 반환값이 제이슨 형식으로 바뀐다 
		

		
//		int member_num = (Integer)session.getAttribute("member_num");
		
		//페이징 처리에 필요한 변수들 선언
		int totalCount; //전체 갯수
		int totalPage; //총 페이지 수 
		int start; //각 페이지의 시작 번호
		int end; //각 페이지의 끝번호		
		int startPage; //블럭의 시작페이지 
		int endPage; //블럭의 끝페이지
		int no; //출력을 시작할 번호
		int perPage = 5; //한페이지당 보여질 글의 갯수  이건 나중에 알아서 조절해보자 
		int perBlock = 5; //한블럭당 보여질 페이지의 갯수 
		
		//1. dao선언
	
		//총 글의 갯수를 구한다.
		totalCount = rservice.getTotalCount();
		
		//총 페이지수를 구한다.
		totalPage = totalCount/perPage + (totalCount%perPage > 0 ? 1 : 0);
		
		//현재 페이지 읽기
		
		//totalPage보다 큰 currentPage가 들어오면 빈 어레이를 반환한다. 
		if(currentPage>totalPage) {
			currentPage = totalPage;
			return new ArrayList<ReviewDto>();
		}
		
		//각 블럭의 시작페이지와 끝페이지를 구한다
//		startPage = perBlock*((currentPage-1)/perBlock) + 1 ;
//		endPage = startPage -1 + perBlock;
		
		//아래는 구글 스타일의 페이징을 위한 startPage, endPage변수
//		startPage = currentPage-2 ;
//		endPage = currentPage+2  ;
//		//마지막 블럭의 끝페이지는 총 페이지수와 같아야함 
//		if(currentPage < (Math.ceil((double)perBlock/2))) {
//			startPage = 1;
//			endPage = perBlock;
//		}
//		if(currentPage > totalPage - (Math.ceil((double)perBlock/2))) {
//			startPage = totalPage - perBlock +1;
//			endPage = totalPage;
//		}
//		if(totalPage <= perBlock) {
//			startPage =1;
//			endPage = totalPage;
//		}
//		
		
		//각 페이지의 시작번호와 끝번호를 구한다
		start = (currentPage-1)*perPage +1;
		end = start -1 + perPage;
		//마지막페이지의 끝번호는 총 글의 갯수와 같아야함 
		if(end > totalCount) {
			end = totalCount;
		}
		//각 페이지마다 출력할 시작번호
		no = totalCount -(currentPage-1)*perPage;		
		
		List<ReviewDto> list = rservice.getList(start, end);
		
		
		Date now = new Date();
		
		for(ReviewDto d:list) {
						
			//작성일을 좀더 심플하게 표현하기 
			long timediff = now.getTime()-d.getReview_writeday().getTime();
						
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
		
		
		//댓글 갯수 출력 
//		for(ReviewDto q:list) {
//			
//			q.setReplyCount(rservice.getReplyTotalCount(q.getBoard_num()));
//		
//		}
//		
		
		//페이징 처리를 해야하는데.. 리액트로 가면 이게 아무소용이 없어지네^^... 
//		request.setAttribute("totalCount",totalCount);
//		request.setAttribute("list", list);
//		request.setAttribute("totalPage", totalPage);
//		request.setAttribute("startPage", startPage);
//		request.setAttribute("endPage", endPage);
//		request.setAttribute("no", no);
//		request.setAttribute("perPage", perPage);
//		request.setAttribute("perBlock", perBlock);
//		request.setAttribute("currentPage", currentPage);
			
		
		//댓글 갯수, 댓글 리스트 입력해주기
		for(ReviewDto d:list) {
			
			int review_reply_count = rservice.getReplyTotalCount(d.getReview_num());
			d.setReview_reply_count(review_reply_count);
			
			List<ReviewReplyDto> reply_list = rservice.getReplyList(d.getReview_num());
			
			//댓글의 작성일을 좀더 심플하게 표현하기 
			for(ReviewReplyDto r: reply_list) {
				
				long timediff = now.getTime()-r.getReview_reply_writeday().getTime();
							
				timediff /= 1000*60;
				
				
				if(timediff < 1) {
					r.setSimpletime("방금전");
				}else if(timediff < 60) {
					r.setSimpletime(String.valueOf(timediff) + "분전");
				}else if(timediff < 60*24) {
					r.setSimpletime(String.valueOf(timediff/60) + "시간전");
				}else if(timediff < 60*24*30 ) {
					r.setSimpletime(String.valueOf(timediff/(60*24)) + "일전");
				}else if(timediff < 60*24*30*12) {
					r.setSimpletime(String.valueOf(timediff/(60*24*30)) + "달전");
				}else {
					r.setSimpletime(String.valueOf(timediff/(60*24*30*12)) + "년전");
				}
				
			}
	
			d.setReply_list(reply_list);
		}
		
		
		//현재 로그인 중인 사용자의 정보를 담아서 보내기

//		if(member_num == 0) {
//			//로그인 중이 아닐 때
//			for(ReviewDto r:list) {
//				r.setUser_member_num(0);
//				r.setUser_id("none");
//				r.setUser_member_pic("noimg");
//			}
//		}else {
//			
//			//로그인 중일 때
//			for(ReviewDto r:list) {
//				System.out.println("member unm from temp" + member_num);
//				r.setUser_member_num(member_num);
//				r.setUser_id(rservice.getUserInfo(member_num).getId());
//				r.setUser_member_pic(rservice.getUserInfo(member_num).getMember_pic());
//			}
//		}
		
				
		return list;
	}
	
	
	//하트 클릭시 좋아요 수 올려주기 
	@RequestMapping(value="/reviewUpdateLike", method=RequestMethod.GET)
	@CrossOrigin
	public @ResponseBody int updateLike(int review_num){
		rservice.updateLike(review_num);
		return rservice.getData(review_num).getReview_like();
	}
	
	//하트 재클릭시 좋아요 수 내려주기
	@RequestMapping(value="/reviewUpdateUnlike", method=RequestMethod.GET)
	@CrossOrigin
	public @ResponseBody int updateUnlike(int review_num){
		rservice.updateUnlike(review_num);
		return rservice.getData(review_num).getReview_like(); 
	}
	
	
	//리뷰 작성하기 버튼 클릭 시
	@RequestMapping("/reviewwriteform.do")
	public String reviewwriteform(HttpServletRequest request, HttpSession session) {
		
		//멤버 넘이랑, 북 넘 받아서 넘겨줄것
		
		//멤버 넘 전달하기
		int member_num = (Integer)session.getAttribute("member_num");
		request.setAttribute("member_num", member_num);
		
		//북 넘 전달하기
		int book_num = (Integer)session.getAttribute("book_num");
		request.setAttribute("book_num", book_num);
		
		request.setAttribute("container", "../review/writeform.jsp");
		return "layout/home";
	}
	
	
	//리뷰 글 등록하기
	@PostMapping("/reviewwrite.do")
	public String reviewwrtie(@ModelAttribute ReviewDto rvdto, HttpServletRequest request) {
		
		MultipartFile image = rvdto.getUpfile();
		
		//이미지를 업로드할 경로 구하기
		String path = request.getSession().getServletContext().getRealPath("/save/review");	
		System.out.println("path: " + path);
		
		//파일명
		String review_img = image.getOriginalFilename();
		
		//중복되는 파일명을 막기위해 현재 시간을 파일명 끝에 넣어준다.
		Date now = new Date();
		String nowstr = String.valueOf(now.getTime());
		
		int index = review_img.lastIndexOf("."); 
		String fileExt = review_img.substring(index + 1); 
		review_img = review_img.substring(0, index); 		
		review_img = review_img + nowstr + "." + fileExt;
		
				
		//이미지 저장 메서드 호출
		SpringFileWriter fileWriter = new SpringFileWriter();
		
		//writeFile(실제이미지파일, 저장할 경로, 저장될 이름) 
		fileWriter.writeFile(image, path, review_img);
		

		//이미지 리사이징을 위한 부분2
		String orgFilePath = path + "/" + review_img;
		
		try {
			ReviewDao.makeThumbnail(orgFilePath, review_img, "jpg", path);
			
		}catch(Exception e) {
			System.out.println(e);
		}
		
		
		rvdto.setReview_img(review_img);
		rservice.insertReviewData(rvdto);
		
		
		return "redirect:reviewlist.do";
		
	}
	
	

	//현재 로그인된 사용자의 정보를 댓글창(replyform)컴포넌트에 넘겨준다 
	@RequestMapping(value="/reviewGetMember", method=RequestMethod.GET)
	@CrossOrigin
	public @ResponseBody MemberDto getMemberData(int member_num){ 
					
		return   mservice.getMemberData(member_num);
	
	}
	

	//댓글 삽입하기 : 삽입하고 새로 갱신된 댓글 리스트를 반환한다.	
	@RequestMapping(value="/reviewReplyAdd",method=RequestMethod.GET)
	@CrossOrigin 
	public @ResponseBody List<ReviewReplyDto> dataAdd(int review_num, int member_num, String review_reply_comment)
	{	
		ReviewReplyDto rrdto = new ReviewReplyDto();
		rrdto.setReview_num(review_num);
		rrdto.setMember_num(member_num);
		rrdto.setReview_reply_comment(review_reply_comment);
		rservice.insertReviewReply(rrdto);
		
		List<ReviewReplyDto> list = rservice.getReplyList(review_num);
		
		return jhClass.getSimpletime(list);

	}
	
	//리뷰 글 삭제하기
	@RequestMapping(value="/reviewDelete",method=RequestMethod.DELETE)
	@CrossOrigin 
	public @ResponseBody void dataDelete(@RequestParam int review_num)
	{		
		rservice.deleteData(review_num);
	}
	
	//댓글 삭제하기 : 삭제하고 새로 갱신된 댓글 리스트를 반환한다.
	@RequestMapping(value="/reviewReplyDelete", method=RequestMethod.GET)
	@CrossOrigin 
	public @ResponseBody List<ReviewReplyDto> replyDelete(int review_reply_num, int review_num)
	{		
		rservice.deleteReply(review_reply_num);
		List<ReviewReplyDto> list = rservice.getReplyList(review_num);
		
		return jhClass.getSimpletime(list);

	}


	
	
}



