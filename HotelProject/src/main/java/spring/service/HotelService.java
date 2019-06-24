package spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.data.HotelDao;

@Service
public class HotelService {

	@Autowired
	HotelDao hdao;
	
	public int getTotalCount() {
		
		return hdao.getTotalCount();
	}
	
}
