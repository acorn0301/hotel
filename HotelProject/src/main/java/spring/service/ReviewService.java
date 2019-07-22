package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.data.MemberDto;
import spring.data.ReviewDao;
import spring.data.ReviewDto;
import spring.data.ReviewReplyDto;

@Service
public class ReviewService {

	@Autowired
	ReviewDao rvdao;
	

	//reivew 리스트 출력 
	public List<ReviewDto> getList(int start, int end){
		return rvdao.getList(start, end);
	}
	
	//총 리뷰 갯수 출력
	public int getTotalCount() {
		return rvdao.getTotalCount();
	}
	
	//좋아요 +1 
	public void updateLike(int review_num) {
		rvdao.updateLike(review_num);
	}
	
	//좋아요 -1
	public void updateUnlike(int review_num) {
		rvdao.updateUnlike(review_num);
	}
	
	//게시물 별 댓글 갯수 출력
	public int getReplyTotalCount(int review_num) {
		return rvdao.getReplyTotalCount(review_num);
	}
	
	//게시물 별 댓글 리스트 출력
	public List<ReviewReplyDto> getReplyList(int review_num){
		return rvdao.getReplyList(review_num);
	}
	
	//현재 로그인 중인 사용자의 정보 가져오기
	public MemberDto getUserInfo(int member_num) {
		return rvdao.getUserInfo(member_num);
	}
	
	//리뷰 데이터 삽입하기
	public void insertReviewData(ReviewDto rvdto) {
		rvdao.insertReviewData(rvdto);
	}
	
	//리뷰 댓글 삽입하기
	public void insertReviewReply(ReviewReplyDto rrdto) {
		rvdao.insertReviewReply(rrdto);
	}
		
	//리뷰 글 삭제하기
	public void deleteData(int review_num) {
		rvdao.deleteData(review_num);
	}
	
	//댓글 삭제하기
	public void deleteReply(int review_reply_num) {
		rvdao.deleteReply(review_reply_num);
	}
	
	//리뷰 넘 넣으면 해당 데이타 가져오게하기 
	public ReviewDto getData(int review_num) {
		return rvdao.getData(review_num);
	}
}
