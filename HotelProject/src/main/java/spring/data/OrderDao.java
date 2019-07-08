package spring.data;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDao extends SqlSessionDaoSupport{
	//룸서비스 주문시 db 인서트
	public void roomOrderInsert(OrderDto odto)
	{
		getSqlSession().insert("roomOrderInsert",odto);
	}
	
	//room_order 테이블 max 숫자 구하기
	public int roomOrderMax(){
		int n = getSqlSession().selectOne("roomOrderMax");
		return n;
	}
}
