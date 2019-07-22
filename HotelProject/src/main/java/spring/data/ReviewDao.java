package spring.data;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.imgscalr.Scalr;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDao extends SqlSessionDaoSupport{

	//reivew 리스트 출력 
	public List<ReviewDto> getList(int start, int end){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);	
		return getSqlSession().selectList("reviewGetList", map);
	}
	
	//총 리뷰 갯수 출력
	public int getTotalCount() {
		return getSqlSession().selectOne("reviewTotalCount");
	}
	
	//좋아요 +1 
	public void updateLike(int review_num) {
		getSqlSession().update("reviewUpdateLike", review_num);
	}
	
	//좋아요 -1
	public void updateUnlike(int review_num) {
		getSqlSession().update("reviewUpdateUnlike", review_num);
	}
	
	//게시물 별 댓글 갯수 출력
	public int getReplyTotalCount(int review_num) {
		return getSqlSession().selectOne("reviewReplyGetCount", review_num);
	}
	
	//게시물 별 댓글 리스트 출력
	public List<ReviewReplyDto> getReplyList(int review_num){
		return getSqlSession().selectList("reviewReplyGetList", review_num);
	}
	
	//현재 로그인 중인 사용자의 정보 가져오기
	public MemberDto getUserInfo(int member_num) {
		return getSqlSession().selectOne("reviewGetUserInfo", member_num);
	}
	
	//리뷰 데이터 삽입하기
	public void insertReviewData(ReviewDto rvdto) {
		getSqlSession().insert("reviewInsertReview", rvdto);
	}
	
	//리뷰 댓글 삽입하기
	public void insertReviewReply(ReviewReplyDto rrdto) {
		getSqlSession().insert("reviewReplyInsert", rrdto);
	}
	
	//리뷰 글 삭제하기
	public void deleteData(int review_num) {
		getSqlSession().delete("reviewDeleteReplies", review_num);
		getSqlSession().delete("reviewDeleteData", review_num);
	}
	
	//댓글 삭제하기
	public void deleteReply(int review_reply_num) {
		getSqlSession().delete("reviewDeleteReply", review_reply_num);
	}
	
	//리뷰 넘 넣으면 해당 데이타 가져오게하기 
	public ReviewDto getData(int review_num) {
		return getSqlSession().selectOne("reviewGetData", review_num);
	}
	
	
	
	
	
	//이미지 리사이징을 위한 메서드 (출처 : https://gubok.tistory.com/423)
	
	public static void imageResize(String orgFilePath, String targetFilePath, String imageType) throws Exception{

		BufferedImage originalImage = ImageIO.read(new File(orgFilePath));			

		int imgwidth = Math.min(originalImage.getHeight(),  originalImage.getWidth());
		int imgheight = imgwidth;
		
		BufferedImage scaledImage = Scalr.crop(originalImage, (originalImage.getWidth() - imgwidth)/2, (originalImage.getHeight() - imgheight)/2, imgwidth, imgheight, null);
		BufferedImage resizedImage = Scalr.resize(scaledImage, 300, 300, null);

		ImageIO.write(resizedImage, imageType, new File(targetFilePath));

	}
	
	
	// 이미지 리사이징을 위한 메서드 2	(출처: https://offbyone.tistory.com/114)

	public static void makeThumbnail(String filePath, String fileName, String fileExt, String path) throws Exception {
		
		// 저장된 원본파일로부터 BufferedImage 객체를 생성합니다. 
		BufferedImage srcImg = ImageIO.read(new File(filePath)); 
		// 썸네일의 너비와 높이 입니다. 
		int dw = 1500, dh = 1500; 
		// 원본 이미지의 너비와 높이 입니다. 
		int ow = srcImg.getWidth(); 
		int oh = srcImg.getHeight(); 
		// 원본 너비를 기준으로 하여 썸네일의 비율로 높이를 계산합니다. 
		int nw = ow; 
		int nh = (ow * dh) / dw; 
		// 계산된 높이가 원본보다 높다면 crop이 안되므로 // 원본 높이를 기준으로 썸네일의 비율로 너비를 계산합니다. 
		if(nh > oh) { nw = (oh * dw) / dh; nh = oh; } 
		// 계산된 크기로 원본이미지를 가운데에서 crop 합니다. 
		BufferedImage cropImg = Scalr.crop(srcImg, (ow-nw)/2, (oh-nh)/2, nw, nh); 
		// crop된 이미지로 썸네일을 생성합니다. 
		BufferedImage destImg = Scalr.resize(cropImg, dw, dh); 
		// 썸네일을 저장합니다. 이미지 이름 앞에 "THUMB_" 를 붙여 표시했습니다. 
		String thumbName = path + "/" + fileName; 
		File thumbFile = new File(thumbName); 
		ImageIO.write(destImg, fileExt.toUpperCase(), thumbFile); 
	}

	

		
}
