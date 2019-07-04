package spring.data;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao extends SqlSessionDaoSupport{
   
   // 회원 추가
   public void insertMember(MemberDto mbdto)
   {
      getSqlSession().insert("member.memberInsert", mbdto);
   }
   
   // 로그인
   public int loginCheck1(String id, String password)
   {
	   Map<String, String> map = new HashMap<String, String>();
	   map.put("id", id);
	   map.put("password", password);
	   
	   return getSqlSession().selectOne("member.login", map);
   }
   
   // member_num 값 얻기
   public int getMembernum(String id, String password)
   {
	   Map<String, String> map = new HashMap<String, String>();
	   map.put("id", id);
	   map.put("password", password);
	   
	   return getSqlSession().selectOne("member.getMembernum", map);
   }
}