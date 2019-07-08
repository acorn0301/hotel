package spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.data.OrderDao;
import spring.data.OrderDto;

@Service
public class OrderService {
	@Autowired
	 OrderDao odao;
	
	public void roomOrderInsert(OrderDto odto)
	{
		odao.roomOrderInsert(odto);
	}
	
	public int roomOrderMax()
	{
		return odao.roomOrderMax();
	}
}
