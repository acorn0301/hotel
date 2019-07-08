package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.data.AdminBookDto;
import spring.data.AdminDao;
import spring.data.BookDao;
import spring.data.BookDto;

@Service
public class AdminService {
	
	@Autowired
	AdminDao adao;

	//예약접수 상태인 예약건수를 출력 
	public int getBookListStatus0() {
	
		return adao.getBookListStatus0();
	}
	
	
	//오늘 체크인하는 예약 건수를 출력
	public int getBookListCheckIn() {
		
		return adao.getBookListCheckIn();
	}
	//오늘 체크아하는 예약 건수를 출력
	public int getBookListCheckOut() {
		
		return adao.getBookListCheckOut();
	}
	

	//예약 완료된 건수를 출력
	public int getBookListWaiting() {
		return adao.getBookListWaiting();
	}
	
	//접수된 룸서비스 건수를 출력
	public int getOrderListStatus0() {
		return adao.getOrderListStatus0();
	}
	
	//준비중인 룸서비스 건수를 출력
	public int getOrderListStatus1() {
		return adao.getOrderListStatus1();
	}
	
	//카테고리별 문의 수 출력
	public int getQnaByCategory(String category) {
		return adao.getQnaByCategory(category);
	}
	
	//예약 내역 디테일하게 가져오기
	public AdminBookDto getBookList(BookDto bdto){
			return adao.getBookList(bdto);
	}
	
	//북넘으로 룸넘 구하기
	public BookDto getBookDto(int book_num) {
		return adao.getBookDto(book_num);
	}
	
	//예약 상태에 따른 리스트 분류
	public List<AdminBookDto> getBookListByStatus(String book_status){
		return adao.getBookListByStatus(book_status);
	}
}
