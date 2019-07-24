package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.data.QnaDao;
import spring.data.QnaDto;
import spring.data.QnaReplyDao;

@Service
public class QnaService {

	@Autowired
	QnaDao qdao;
	
	@Autowired
	QnaReplyDao qrdao;
	
	public List<QnaDto> getList(int start, int end, String category, int board_status){
		
		return qdao.getList(start, end, category, board_status);
	}
	
	public int getTotalCount(String category, int board_status) {
		
		return qdao.getTotalCount(category, board_status);
	}
	
	//member_num을 통해 name->writer 얻기
	public String getWriter(int member_num) {
			
		return qdao.getWriter(member_num);
	}
	
	//qna 테이블에 데이타 집어넣기
	public void insertData(QnaDto dto) {
		
		qdao.insertData(dto);
	}
	
	//qna 테이블로부터 자료 가져오기 
	public QnaDto getData(int board_num) {
		
		return qdao.getData(board_num);
	}
	
	//qna 테이블로부터 특정 게시물의 비밀번호 가져오기(qnadeleteform.do)
	public String getPass(int board_num) {
			
		return qdao.getPass(board_num);		
	}
		

	//qna 테이블에서 데이타 삭제하기 
	public void deleteData(int board_num) {
	
		qdao.deleteData(board_num);
	}
	
	//총 댓글 갯수를 출력한다 
	public int getReplyTotalCount(int board_num) {
		
		return qdao.getReplyTotalCount(board_num);
	}
	
	//데이타 수정하기 
	public void updateData(QnaDto qdto) {
		
		qdao.updateData(qdto);
	}
	
	//조회수 올리기
	public void updateReadCount(int board_num) {
		qdao.updateReadCount(board_num);
	}
	
	//관리자 답변 완료된 게시물 상태 변경하기
	public void adminReplyComplete(int board_num) {
		qdao.adminReplyComplete(board_num);
	}
}
