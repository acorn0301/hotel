package spring.data;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class QnaDao extends SqlSessionDaoSupport{

	
	//qna 리스트 출력 
	public List<QnaDto> getList(int start, int end, String category, int board_status){
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		
		if(category.equals("all")) {
			if(board_status == 0) {
				return getSqlSession().selectList("qnaListStatus0", map);
			}else {
				return getSqlSession().selectList("qnaList", map);
			}
			

		}else if(category.equals("완료")) {
			return getSqlSession().selectList("qnaListStatus1", map);
			
		}else {
			map.put("category", category);
			if(board_status == 0) {
				map.put("board_status", board_status);
				return getSqlSession().selectList("qnaListByCategoryStatus0", map);
			}else {
				return getSqlSession().selectList("qnaListByCategory", map);
			}
		}
		
	}
	
	//qna 게시물 총 갯수 얻기
	public int getTotalCount(String category, int board_status) {
		
		if(category.equals("all")) {
			if(board_status == 0) {
				return getSqlSession().selectOne("qnaTotalCountStatus0");
			}else {
				return getSqlSession().selectOne("qnaTotalCount");
			}
			
		}else if(category.equals("완료")) {
			return getSqlSession().selectOne("qnaTotalCountStatus1");
		}else {
			if(board_status == 0) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("category",category);
				map.put("board_status", board_status);
				return getSqlSession().selectOne("qnaTotalCountByCategoryStatus0", map);
			}else {
				return getSqlSession().selectOne("qnaTotalCountByCategory", category);
			}
		}
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
	
	//조회수 올리기
	public void updateReadCount(int board_num) {
		
		getSqlSession().update("qnaReadCount", board_num);
	}
	
	
	//관리자 답변 완료된 게시물 상태 변경하기
	public void adminReplyComplete(int board_num) {
		getSqlSession().update("qnaAdminReplyComplete", board_num);
	}
	
}
