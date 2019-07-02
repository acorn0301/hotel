package spring.controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import spring.data.MenuDto;
import spring.data.OrderDto;
import spring.service.MenuService;
import spring.service.OrderService;

@Controller
public class MenuController {
	@Autowired
	private MenuService mnservice;
	@Autowired
	private OrderService oservice;
	
	//룸서비스 눌렀을때
	@RequestMapping("roomaservice.do")
	public String menuList(HttpSession session,
			HttpServletRequest request,
			@RequestParam(value="menu_num",defaultValue="0") String menu_num)
	{
		
		session.removeAttribute("cart_list");
		
		//장바구니에 아무것도 없으면 "" 저장
		if(session.getAttribute("cart_list") == null)
		{
			session.setAttribute("cart_list", "");
		}
		
		
		//담기 버튼을 눌렀을때
		if(menu_num != "0" ){
			String cartlist = "";
			
			//기존에 담겨있던 세션값이 있을때
			if(session.getAttribute("cart_list") != ""){
				cartlist = (String)session.getAttribute("cart_list");
			}
			
			//담기했던 음식에 대한 넘버를 카트리스트(변수)에 추가
			cartlist += "," + menu_num ;

			//세션 카트리스트에 변수 카트리스트 값 저장
			session.setAttribute("cart_list", cartlist);
		}	
		
		int menuTotalCount=mnservice.menuTotalCount();
		
		int menuMaxNum = mnservice.menuTypeMaxNum() + 1;
		
		String menuList[] = new String[menuMaxNum];
		
		for(int i=0 ; i < menuMaxNum ; i++){
			menuList[i] = "list" + i;
		}
		
		System.out.println("menu list name : " + menuList);
	
		List<List<MenuDto>> list = new ArrayList<List<MenuDto>>();
		
		for(int i = 0 ; i < menuMaxNum ; i++){
			list.add(mnservice.menuList(i));
		}
		
		for(int i = 0 ; i <menuMaxNum ; i++){
			request.setAttribute(menuList[i], list.get(i));
		}
		
		request.setAttribute("menu_num", menu_num);
		request.setAttribute("container", "../roomservice/menulist.jsp");
		request.setAttribute("menuTotalCount", menuTotalCount);
		
		return "layout/home";
	}
	
	//장바구니로 이동(menu_num 가지고 이동)
	@RequestMapping("/cart.do")
	public String cart(HttpServletRequest request,
			HttpSession session,
			@RequestParam(value="menu_num", defaultValue="0") int menu_num)
	{
		System.out.println("카트두 실행시 메뉴넘"+menu_num);
		String cartlist = (String)session.getAttribute("cart_list");
		
		if(cartlist == "")
		{
			System.out.println("장바구니 널널널널널널널");
		}
		
		System.out.println(cartlist);
		
		while(cartlist.contains(",,")){
			cartlist=cartlist.replace(",,", ",");

		}
		cartlist=cartlist.replace(",,", ",");

		cartlist=cartlist.substring(1,cartlist.length()).trim();
		
		//카트리스트를 배열로 만들어서 cartarr 에 담기
		String cartarr[]=cartlist.split(",");
		
		
		List<MenuDto> list=new ArrayList<MenuDto>();
		
		for(String s:cartarr)
		{
			list.add(mnservice.menuCartList(Integer.parseInt(s)));
		}
		
		//sql menulist에서 menu_num where 해서 name,price 얻어오기
		request.setAttribute("menu_num", menu_num);
		request.setAttribute("list", list);
		request.setAttribute("size", list.size());
		request.setAttribute("cart_list", cartlist);
		request.setAttribute("container", "../roomservice/cart.jsp");
		
		return "layout/home";
		
	}
	
	//장바구니 일부 품목 삭제
	@RequestMapping("/cartdelete.do")
	public String cartDelete(HttpServletRequest request,
			HttpSession session)
	{
		session.removeAttribute("cart_list");
		request.setAttribute("container", "../roomservice/menulist.jsp");
		return "layout/home";
	}
	
	
	//주문상세페이지로 이동
	@RequestMapping("/orderform.do")
	public String orderform(HttpSession session,
			HttpServletRequest request,
			@RequestParam int menu_num)
	{
		String cartlist = (String)session.getAttribute("cart_list");
		
		while(cartlist.contains(",,")){
			cartlist=cartlist.replace(",,", ",");

		}
		cartlist=cartlist.substring(1,cartlist.length()).trim();
		cartlist=cartlist.replace(",,", ",");
		List<MenuDto> list=new ArrayList<MenuDto>();
		String cartarr[]=cartlist.split(",");
		System.out.println(cartarr);
		for (String s:cartarr)
		{
			list.add(mnservice.menuCartList(Integer.parseInt(s)));
		}

		request.setAttribute("list", list);
		request.setAttribute("container", "../roomservice/orderform.jsp");
		return "layout/home";
	}
	
	
	//최종 주문 받아서 db에 저장
	@RequestMapping("/ordercomplete.do")
	public String orderComplete(HttpSession session,
			HttpServletRequest request,
			@ModelAttribute OrderDto odto)
	{
		String cartlist = (String)session.getAttribute("cart_list");
		
		while(cartlist.contains(",,")){
			cartlist=cartlist.replace(",,", ",");

		}
		cartlist=cartlist.substring(1,cartlist.length()).trim();
		cartlist=cartlist.replace(",,", ",");
		List<MenuDto> list=new ArrayList<MenuDto>();
		String cartarr[]=cartlist.split(",");
		System.out.println(cartarr);
		for (String s:cartarr)
		{
			list.add(mnservice.menuCartList(Integer.parseInt(s)));
		}
		
		//room_order 테이블에 저장
		oservice.roomOrderInsert(odto);
		//장바구니 비우기
		session.removeAttribute("cart_list");
		
		request.setAttribute("list", list);
		request.setAttribute("container", "../roomservice/ordercomplete.jsp");
		return "layout/home";
	}
	
}
