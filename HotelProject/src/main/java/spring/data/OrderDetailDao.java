package spring.data;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDetailDao extends SqlSessionDaoSupport{
	//order_detail 테이블에 데이터 인서트 하기
	public void OrderDetailInsert(OrderDetailDto oddto)
	{
		getSqlSession().insert("OrderDetailInsert",oddto);
	}
}
