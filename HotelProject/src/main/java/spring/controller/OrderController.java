package spring.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import spring.service.MenuService;
import spring.service.OrderService;

@Controller
public class OrderController {
	@Autowired
	private OrderService oservice;
	
	
}
