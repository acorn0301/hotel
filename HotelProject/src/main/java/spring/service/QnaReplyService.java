package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.data.QnaDao;
import spring.data.QnaReplyDao;
import spring.data.QnaReplyDto;

@Service
public class QnaReplyService {

	@Autowired
	QnaDao qdao;
	
	@Autowired
	QnaReplyDao qrdao;
	
	//qna reply 리스트 출력
	public List<QnaReplyDto> getQnaReplyList(int board_num){
		return qrdao.getQnaReplyList(board_num);
	}
	
	//댓글 추가 
	public void insertReply(QnaReplyDto qrdto) {		
		qrdao.insertReply(qrdto);
	}
}
