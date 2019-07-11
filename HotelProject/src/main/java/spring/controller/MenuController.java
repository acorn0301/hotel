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

import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;

import spring.data.CartDto;
import spring.data.MemberDto;
import spring.data.MenuDto;
import spring.data.OrderDetailDto;
import spring.data.OrderDto;
import spring.service.MenuService;
import spring.service.OrderDetailService;
import spring.service.OrderService;

@Controller
public class MenuController {
	@Autowired
	private MenuService mnservice;
	@Autowired
	private OrderService oservice;
	@Autowired
	private OrderDetailService oddservice;


	//룸서비스 눌렀을때
	@RequestMapping("roomaservice.do")
	public String menuList(HttpSession session,
			HttpServletRequest request)
	{
		//session.setAttribute("mnlist", null);
		//메뉴에서 룸서비스를 눌렀을 때 실행 할 일
		//1. 메뉴를 예쁘게 보여준다.
		
		// 메뉴 리스트 출력 반복
		int menuMaxNum = mnservice.menuTypeMaxNum() + 1;

		String menuList[] = new String[menuMaxNum];

		for(int i=0 ; i < menuMaxNum ; i++){
			menuList[i] = "list" + i;
		}

		//System.out.println("menu list name : " + menuList);

		List<List<MenuDto>> list = new ArrayList<List<MenuDto>>();

		for(int i = 0 ; i < menuMaxNum ; i++){
			list.add(mnservice.menuList(i));
		}

		for(int i = 0 ; i <menuMaxNum ; i++){
			request.setAttribute(menuList[i], list.get(i));
		}

		request.setAttribute("container", "../roomservice/menulist.jsp");
		return "layout/home";
	}


	//담기버튼 눌렀을때 담아준다
	@RequestMapping("/insertcart.do")
	public String insertCart(HttpServletRequest request,
			HttpSession session,
			@ModelAttribute CartDto cdto,
			@RequestParam(value="qty",defaultValue="1") int qty)
	{
		//session.removeAttribute("cdtolist");
		//담기버튼을 눌렀을 때 할 일
		//1. 기존 세션에 cdtolist가 있는가?(널인가 아닌가?)
		//2. 없으면 세션에 새로 하나 만든다.
		//3. clist 선언한다
		//4. clist 에 세션에서 받아온 cdtolist를 담는다
		//방금 받아온 걔의 memu_num이 기존 clist에 있는지 확인 후 있으면 수량만 ++ 해줌 없으면 clist.add
		//6. 세션에 다시 clist 를 올린다. session.setAttribute("cdtolist",clist)
		//7. 다시 roomaservice.do 를 호출한다.

		//ArrayList<CartDto> clist = new ArrayList<CartDto>(); 
		
		if(cdto.getMenu_num() == 0)
		{
			session.setAttribute("cdtolist", "");
			request.setAttribute("container", "../roomservice/menulist.jsp");
			
		}else{

			List<CartDto> clist = new ArrayList<CartDto>();
			if(session.getAttribute("cdtolist") != null){
				clist = (ArrayList<CartDto>) session.getAttribute("cdtolist");
			}
			
			clist.add(cdto);
			session.setAttribute("cdtolist", clist);

			//list에 잘 담겼는지 확인용
//			for(CartDto c:clist){
//				System.out.println(c.getMenu_num());
//				System.out.println(c.getQty());
//
//			}
			
			List<CartDto> finallist = new ArrayList<CartDto>();

			//수량 증가
			for(CartDto c:clist)
			{
				int already = 0;
				//메뉴넘 꺼내서 파이널리스트에 가지고 있는지 파악
				for(CartDto f:finallist){
					if(c.getMenu_num()==f.getMenu_num()){
						f.setQty(f.getQty()+qty);
						already++;
						break;
					}
				}
				if(already==0)
					finallist.add(c);
			}

			//수량 증가 후 mnlist에 최종으로 추가
			List<MenuDto> mnlist=new ArrayList<MenuDto>();
			for(CartDto ff:finallist)
			{
				MenuDto temp = new MenuDto();
				temp = mnservice.menuCartList(ff.getMenu_num());
				temp.setQty(ff.getQty());
				mnlist.add(temp);
			}

			request.setAttribute("mnlist", mnlist);
			session.setAttribute("mnlist", mnlist);
			request.setAttribute("container", "../roomservice/cart.jsp");
		}

	return "redirect:roomaservice.do";
}

//장바구니 버튼 눌렀을때
//장바구니로 이동(menu_num 가지고 이동)
@RequestMapping("/cart.do")
public String cart(HttpServletRequest request,
		HttpSession session,
		@ModelAttribute CartDto cdto)
{

	//장바구니 버튼을 눌렀을 때 할일
	//1. 세션에 cdtolist가 비어있는지 확인 -> 비어있으면 "" 빈거 하나 만들기
	//2. 비어있지 않다면 세션으로부터 받아서 clist에 추가
	//3. request.setAttribute("mnlist",clist) 해서 jsp 로 예쁘게 보내준다.

	if(session.getAttribute("cdtolist") == null){
		request.setAttribute("cdtolist", "");
		request.setAttribute("container", "../roomservice/cart.jsp");

	}else{
		
		request.setAttribute("mnlist", session.getAttribute("mnlist"));
		request.setAttribute("container", "../roomservice/cart.jsp");
	}

	return "layout/home";
}


//바로 주문
@RequestMapping("/onecart.do")
public String oneCart(HttpServletRequest request,
		HttpSession session,
		@RequestParam(value="menu_num", defaultValue="0") int menu_num,
		@RequestParam(value="qty",defaultValue="1") int qty)
{
	List<MenuDto> onelist=new ArrayList<MenuDto>();
	onelist.add(mnservice.menuCartList(menu_num));
	
	request.setAttribute("qty", qty);
	request.setAttribute("onelist", onelist);
	request.setAttribute("container", "../roomservice/oneorderform.jsp");
	return "layout/home";
}

//바로 주문 성공
@RequestMapping("/oneordercomplete.do")
public String oneCartComplete(HttpSession session,
		HttpServletRequest request,
		@ModelAttribute OrderDto odto,
		@ModelAttribute OrderDetailDto oddto,
		@ModelAttribute MemberDto mbdto,
		@RequestParam(value="menu_num", defaultValue="0") int menu_num,
		@RequestParam(value="pty",defaultValue="1") int qty,
		@RequestParam int member_num){
	
	//주문 1개 값 얻어서 데이터 저장
	List<MenuDto> onelist=new ArrayList<MenuDto>();
	onelist.add(mnservice.menuCartList(menu_num));
	
	
	//member_num 이용해서 name 얻고 보내기
	session.getAttribute("member_num");
	
	oservice.roomOrderInsert(odto);
	String name = mnservice.MemberName(member_num);
	
	
	request.setAttribute("member_name",name);
	
	//max order_num 얻기
	int maxOrderNum = oservice.roomOrderMax();	
	
	request.setAttribute("maxOrderNum", maxOrderNum);	
	
	//orderdetail 테이블에 데이터 보내기
	session.getAttribute("mnlist");
	
	oddto.setOrder_num(maxOrderNum);
	for(MenuDto dto : onelist) {
		oddto.setMenu_num(menu_num);
		oddto.setQty(qty);
		oddservice.OrderDetailInsert(oddto);
	}
	
//	session.removeAttribute("cdtolist");
	
	request.setAttribute("qty", qty);
	request.setAttribute("onelist", onelist);
	request.setAttribute("container", "../roomservice/oneordercomplete.jsp");
	return "layout/home";
}

//장바구니 일부 품목 삭제
@RequestMapping("/cartdelete.do")
public String cartDelete(HttpServletRequest request,
		HttpSession session,
		@RequestParam int menu_num,
		@RequestParam int qty,
		@ModelAttribute CartDto cdto
		)
{
	//System.out.println("메뉴넘!:"+menu_num);
	//System.out.println("수량!:"+qty);
	
	//세션 카트리스트 전체 삭제
	//session.getAttribute("cdtolist");
	
	
	List<MenuDto> mnlist = (ArrayList<MenuDto>)session.getAttribute("mnlist");
	
	for(int i=0 ; i<mnlist.size() ; i++){
		if(cdto.getMenu_num() == mnlist.get(i).getMenu_num()){
			mnlist.remove(i);
		}
	}
	
	session.setAttribute("mnlist", mnlist);
	
	List<CartDto> clist = (ArrayList<CartDto>)session.getAttribute("cdtolist");
	
	for(int i=0 ; i<clist.size() ; i++){
		if(cdto.getMenu_num() == clist.get(i).getMenu_num()){
			clist.remove(i);
		}
	}
	
	session.setAttribute("clist", clist);
	
	int m = mnlist.size();
	if( m == 0 )
	{
		session.setAttribute("mnlist", null);
	}
	
	return "redirect:cart.do";
}

//장바구니 일부 품목 삭제
@RequestMapping("/manycartdelete.do")
public String manycartDelete(HttpServletRequest request,
		HttpSession session,
		@RequestParam String menu_nums,
		@ModelAttribute CartDto cdto
		)
{
	List<MenuDto> mnlist = (ArrayList<MenuDto>)session.getAttribute("mnlist");
	
	String []nums=menu_nums.split(",");
	int []intnums = new int[nums.length];
	for(int i = 0 ; i < nums.length ; i++){
		intnums[i] = Integer.parseInt(nums[i]);
	}
	
	for(int nn:intnums)
	{
		for(int j = 0; j < mnlist.size() ; j++){
			
			if(nn == mnlist.get(j).getMenu_num()){
				mnlist.remove(j);
			}
		}
		
	}
	
	session.setAttribute("mnlist", mnlist);
	
	int m = mnlist.size();
	if( m == 0 ){
		session.setAttribute("mnlist", null);
	}
	
	menu_nums= "";
	return "redirect:cart.do";
}

//주문상세페이지로 이동
@RequestMapping("/orderform.do")
public String orderform(HttpSession session,
		HttpServletRequest request,
		@RequestParam String menu_nums,
		@ModelAttribute MenuDto mndto)
{
	
	ArrayList<MenuDto> mnlist = (ArrayList<MenuDto>)session.getAttribute("mnlist");
	
	String []nums=menu_nums.split(",");
	int []intnums = new int[nums.length];
	
	for(int i=0;i<intnums.length;i++){
		intnums[i] = Integer.parseInt(nums[i]);
	}
	
	for(int i=0; i<intnums.length; i++){
		int alive = 0;
		for(int j=0; j<mnlist.size(); j++){
			if(intnums[i] == mnlist.get(i).getMenu_num()){
				alive ++;
				break;
			}
		}
		if(alive == 0){
			mnlist.remove(i);
		}
	}

	session.setAttribute("mnlist", mnlist);
	request.setAttribute("mnlist", mnlist);
	request.setAttribute("container", "../roomservice/orderform.jsp");
	return "layout/home";
}




//최종 주문 받아서 db에 저장
@RequestMapping("/ordercomplete.do")
public String orderComplete(HttpSession session,
		HttpServletRequest request,
		@ModelAttribute OrderDto odto,
		@ModelAttribute OrderDetailDto oddto,
		@RequestParam(value="menu_num", defaultValue="0") int menu_num,
		@RequestParam(value="pty",defaultValue="1") int qty,
		@RequestParam int member_num)
{
	
	//member_num 이용해서 name 얻고 보내기
	session.getAttribute("member_num");
	
	oservice.roomOrderInsert(odto);
	String name = mnservice.MemberName(member_num);
	
	request.setAttribute("member_name",name);
	
	//room_order 테이블에 저장
	oservice.roomOrderInsert(odto);
	
	//max order_num 얻기
	int maxOrderNum = oservice.roomOrderMax();	
	
	request.setAttribute("maxOrderNum", maxOrderNum);	
	
	
	//room_order에 저장한 후 max 넘을 구해서
	//orderdetail 테이블에 넣어야 하는데 세션에 저장되어있는 cdtolist가 있으니
	//세션에 저장한 cdtolist를 orderdetailtable에 넣어주면 됨!
	
	//orderdetail 테이블에 데이터 보내기
	session.getAttribute("mnlist");
	
	List<MenuDto> mndto=(ArrayList)session.getAttribute("mnlist");
	
	oddto.setOrder_num(maxOrderNum);
	for(MenuDto dto : mndto) {
		oddto.setMenu_num(dto.getMenu_num());
		oddto.setQty(dto.getQty());
		oddservice.OrderDetailInsert(oddto);
	}
	
	session.removeAttribute("cdtolist");

	request.setAttribute("container", "../roomservice/ordercomplete.jsp");
	return "layout/home";
}


//////호텔 소개 페이지////////

	//룸 소개
	@RequestMapping("/room.do")
	public String hotelRoom(HttpServletRequest request){
		
		request.setAttribute("container", "../hotel/room.jsp");
		return "layout/home";
	}

	//위치
	@RequestMapping("/hoteladdress.do")
	public String hotelAddr(HttpServletRequest request){
		
		request.setAttribute("container", "../hotel/address.jsp");
		return "layout/home";
	}
}
