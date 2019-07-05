package spring.data;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
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
	public List<RoomDto> RoomList(BookDto bdto)
	{
		return getSqlSession().selectList("RoomList",bdto);
	}
	

	//룸num에 따른 호텔 지점명 출력
	public List<HotelDto> hotelLocal(int num)
	{
		return getSqlSession().selectList("hotelLocal", num);
	}
	

	
	//예약정보 DB에 삽입
	public void insertBook(BookDto dto)
	{
		getSqlSession().insert("insertBook",dto);	
	}
	
	
	//비예약정보 DB에 삽입
	public void insertBook_notMember(BookDto dto)
	{
		getSqlSession().insert("insertBook_notMember",dto);	
	}
}
