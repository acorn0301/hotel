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
	public HotelDto getHotel(int num)
	{
		return getSqlSession().selectOne("getHotel", num);
	}
	

	//예약정보 DB에 삽입
	public void insertBook(BookDto dto)
	{
		getSqlSession().insert("insertBook",dto);	
	}
	
	
	//비회원 최소정보 member DB 삽입
	public void insertInfo_notMember(MemberDto mbdto)
	{
		getSqlSession().insert("insertInfo_notMember", mbdto);
	}
	
	
	//비예약정보 DB에 삽입
	public void insertBook_notMember(BookDto bdto)
	{
		getSqlSession().insert("insertBook_notMember", bdto);	
	}
	
	
	//(비회원 예약시) 최대member_num 구하기
	public int maxMemberNum()
	{
		return getSqlSession().selectOne("maxMemberNum");
	}
	
	//룸 넘버로 룸정보 모두 가져오기
	public RoomDto getRoomData(int room_num){
		return getSqlSession().selectOne("getRoomData", room_num);
	}
}
