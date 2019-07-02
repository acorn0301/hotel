package spring.data;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao extends SqlSessionDaoSupport{
	
	// 회원 추가
	public void insertMember(MemberDto mbdto)
	{
		getSqlSession().insert("member.memberInsert", mbdto);
	}
	
}
