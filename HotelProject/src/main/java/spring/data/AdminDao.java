package spring.data;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDao extends SqlSessionDaoSupport{

	//예약접수 상태인 예약건수를 출력 
	public int getBookListStatus0() {	
		return getSqlSession().selectOne("adminGetBookListStatus0");
	}
	
	//오늘 체크인하는 예약 건수를 출력
	public int getBookListCheckIn() {
		return getSqlSession().selectOne("adminGetBookListCheckIn");				
	}
	
	//오늘 체크아웃하는 예약 건수를 출력
	public int getBookListCheckOut() {
		return getSqlSession().selectOne("adminGetBookListCheckOut");				
	}
	
	//예약 완료된 건수를 출력
	public int getBookListWaiting() {
		return getSqlSession().selectOne("adminGetBookListWaiting");
	}
	
	//접수된 룸서비스 건수를 출력
	public int getOrderListStatus0() {
		return getSqlSession().selectOne("adminGetOrderListStatus0");
	}
	
	//준비중인 룸서비스 건수를 출력
	public int getOrderListStatus1() {
		return getSqlSession().selectOne("adminGetOrderListStatus1");
	}
}
