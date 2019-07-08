package spring.data;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class QnaReplyDao extends SqlSessionDaoSupport{

	//qna reply 리스트 출력
	public List<QnaReplyDto> getQnaReplyList(int board_num){
		return getSqlSession().selectList("qnaReplyList", board_num);
	}
	
	//댓글 추가 
	public void insertReply(QnaReplyDto qrdto) {		
		getSqlSession().insert("qnaReplyInsertData", qrdto);
	}
}
