package spring.data;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class BookDao extends SqlSessionDaoSupport{

	//호텔 지점 리스트 출력
	public List<HotelDto> HotelLocalList()
	{
		return getSqlSession().selectList("HotelLocalList");
	}
	
	//객실 리스트 출력
	public List<RoomDto> RoomList()
	{
		return getSqlSession().selectList("RoomList");
	}
	

}
