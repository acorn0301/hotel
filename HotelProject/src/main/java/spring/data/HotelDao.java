package spring.data;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class HotelDao  extends SqlSessionDaoSupport{

	public int getTotalCount() {
		
		return getSqlSession().selectOne("adminTotalCount");
		
	}
	
}
