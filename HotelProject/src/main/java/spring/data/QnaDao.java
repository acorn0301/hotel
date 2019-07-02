package spring.data;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class QnaDao extends SqlSessionDaoSupport{

	
	//qna 리스트 출력 
	public List<QnaDto> getList(int start, int end){
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		
		return getSqlSession().selectList("qnaList", map);
		
	}
	
	//qna 게시물 총 갯수 얻기
	public int getTotalCount() {
		
		return getSqlSession().selectOne("qnaTotalCount");
	}
	
	//member_num을 통해 name->writer 얻기
	public String getWriter(int member_num) {
		
		return getSqlSession().selectOne("qnaGetWriter", member_num);
	}
	
	//qna 테이블에 데이타 집어넣기 
	public void insertData(QnaDto dto) {
		
		getSqlSession().insert("qnaInsertData", dto);

	}
	
	//qna 테이블로부터 내용 가져오기(content.do)
	public QnaDto getData(int board_num) {
		
		return getSqlSession().selectOne("qnaGetData",board_num);
	}
	
	//qna 테이블로부터 특정 게시물의 비밀번호 가져오기(qnadeleteform.do)
	public String getPass(int board_num) {
		
		return getSqlSession().selectOne("qnaGetPassword", board_num);
	}
	
	
	//qna 테이블에서 데이타 삭제하기 
	public void deleteData(int board_num) {
		
		getSqlSession().delete("qnaDeleteData",board_num);
	}
	
	//총 댓글 갯수를 출력한다 
	public int getReplyTotalCount(int board_num) {
		
		return getSqlSession().selectOne("qnaReplyTotalCount", board_num);
	}
	
	//데이타 수정하기 
	public void updateData(QnaDto qdto) {
		
		getSqlSession().update("qnaUpdateData", qdto);
	}
}
