package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.data.BookDao;
import spring.data.BookDto;
import spring.data.HotelDto;
import spring.data.RoomDto;

@Service
public class BookService {

	@Autowired
	BookDao bdao;
	
	// bdao에서 가져온 값 list HotelLocalList() 메소드에 저장
	//호텔 지점 리스트
	public List<HotelDto> HotelLocalList()
	{
		return bdao.HotelLocalList();
	}
	
	
	//객실 리스트
	public List<RoomDto> RoomList(BookDto bdto)
	{
		return bdao.RoomList(bdto);
	}
	
	
	//룸num에 따른 호텔지점명
	public List<HotelDto> hotelLocal(int num)
	{
		return bdao.hotelLocal(num);
	}
	
	
	//예약정보 DB에 삽입
	public void insertBook(BookDto dto)
	{
		bdao.insertBook(dto);
	}
	
	
	//비예약정보 DB에 삽입
	public void insertBook_notMember(BookDto dto)
	{
		bdao.insertBook_notMember(dto);
	}

}
