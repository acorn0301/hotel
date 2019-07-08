package spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.data.OrderDetailDao;
import spring.data.OrderDetailDto;

@Service
public class OrderDetailService {
	@Autowired
	OrderDetailDao oddao;
	
	public void OrderDetailInsert(OrderDetailDto oddto)
	{
		oddao.OrderDetailInsert(oddto);
	}
}
