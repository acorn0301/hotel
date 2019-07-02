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
}
