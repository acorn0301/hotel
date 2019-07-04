package spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.data.AdminDao;
import spring.data.BookDao;

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
			
}
