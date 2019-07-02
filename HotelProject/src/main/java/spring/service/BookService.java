package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.data.BookDao;
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
	public List<RoomDto> RoomList()
	{
		return bdao.RoomList();
	}

}
