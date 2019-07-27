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
	public List<RoomDto> RoomList(FinalBookDto fbdto)
	{
		String check_in = fbdto.getCheck_in();
		check_in += " 15:00";
		String check_out = fbdto.getCheck_out();
		check_out += " 11:00";
		fbdto.setCheck_in(check_in);		
		fbdto.setCheck_out(check_out);
		return getSqlSession().selectList("RoomList",fbdto);
	}
	

	//룸num에 따른 호텔 지점명 출력
	public FinalBookDto getHotel(int num)
	{
		return getSqlSession().selectOne("getHotel", num);
	}
	

	//예약정보 DB에 삽입
	public void insertBook(FinalBookDto fdto)
	{
		//체크인 , 체크아웃 시간 디폴트값 설정 - 장희 수정 
		String check_in = fdto.getCheck_in();
		check_in += " 15:00";
		String check_out = fdto.getCheck_out();
		check_out += " 11:00";
		fdto.setCheck_in(check_in);		
		fdto.setCheck_out(check_out);
		getSqlSession().insert("insertBook",fdto);	
	}
	
	
	//비회원 최소정보 member DB 삽입
	public void insertInfo_notMember(MemberDto mbdto)
	{
		getSqlSession().insert("insertInfo_notMember", mbdto);
	}
	
	
	//(비회원 예약시) 최대member_num 구하기
	public int maxMemberNum()
	{
		return getSqlSession().selectOne("maxMemberNum");
	}
	
	//룸 넘버로 룸정보 모두 가져오기
	public FinalBookDto getRoomData(int room_num){
		return getSqlSession().selectOne("getRoomData", room_num);
	}
}
