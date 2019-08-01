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
	@RequestMapping("/roomaservice.do")
	public String menuList(HttpSession session,
			HttpServletRequest request)
	{

		if(session.getAttribute("mnlist")!=null){
			List<MenuDto> size=(ArrayList<MenuDto>)session.getAttribute("mnlist");
			request.setAttribute("size",size.size());
		}else{
			request.setAttribute("size", 0);
		}
		
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
			@ModelAttribute MenuDto mndto,
			@RequestParam(value="qty",defaultValue="1") int qty,
			@RequestParam(value="page",defaultValue="0") int page)
	{
		//System.out.println("페이지"+page);
		//System.out.println("hi");
		
		
		List<MenuDto> mnlist = new ArrayList<MenuDto>();
		
		if(session.getAttribute("mnlist")!=null) { //기존에 세션에 저장된 장바구니가 있는 경우 
			
			//기존 세션값을 받아온다.
			mnlist = (List<MenuDto>)session.getAttribute("mnlist");
			
			//기존 세션값에 이미 이 메뉴가 있는지 검사한다.
			//이미 있던 메뉴라면 수량만 늘려주고, 없던 메뉴라면 새로 추가한다.
			
			int already = 0; //이미 장바구니에 담겨져 있는 메뉴인지 확인할 변수 
			
			for(MenuDto mm:mnlist) { //mnlist를 쭉 살펴본다.
				
				if(mm.getMenu_num() == mndto.getMenu_num()) { //이미 존재하는 메뉴인 것으로 발견된다면 
					mm.setQty(mm.getQty() + mndto.getQty()); //기존 수량 더하기 새로 담은 수량을 합쳐서 저장 
					already = 1; //이미 장바구니에 담겨진 메뉴임을 변수에 반영한다.
					break; //for문을 빠져나간다.
				}
			}
			
			if(already == 0) { //위에 for문을 돌렸음에도 불구하고 already가 0이라는건 장바구니에 처음 담기는 메뉴라는 의미이므로 
					mnlist.add(mndto); //mnlist에 받아온거 그대로 추가한다.
			}
			
		}else { //기존에 세션에 저장된 장바구니가 없는 경우 
			
			//받아온 정보를 집어넣어준다.
			
			mnlist.add(mndto);
			
			
		}
			
			//세션에 mnlist를 올린다.
			session.setAttribute("mnlist", mnlist);
			session.setAttribute("page", page);


	return "redirect:roomaservice.do";
}

//장바구니 버튼 눌렀을때
//장바구니로 이동(menu_num 가지고 이동)
@RequestMapping("/cart.do")
public String cart(HttpServletRequest request,
		HttpSession session)
{
	//세션에서 mnlist 받아다가 request로 cart.jsp에 보내주기만 하면 끝! 
	if(session.getAttribute("mnlist") == null){  //세션에 mnlist가 비어있다면 그냥 빈 채로 보내고 
		request.setAttribute("mnlist", null);
	
	}else{ //세션에 mnlist가 비어있지 않다면 메뉴정보를 함께 담아서(이름,사진,가격 등등) 
				
		List<MenuDto> mnlist = (List<MenuDto>)session.getAttribute("mnlist");
		
		for(MenuDto mm : mnlist) {
			MenuDto mndto = mnservice.menuCartList(mm.getMenu_num());
			mm.setMenu_img(mndto.getMenu_img());
			mm.setMenu_name_eng(mndto.getMenu_name_eng());
			mm.setMenu_name_kor(mndto.getMenu_name_kor());
			mm.setMenu_price(mndto.getMenu_price());
			mm.setMenu_type(mndto.getMenu_type());
			mm.setMenu_type_num(mndto.getMenu_type_num());
		}
		
		request.setAttribute("mnlist", mnlist);
		session.setAttribute("mnlist", mnlist);
	}
	
	request.setAttribute("container", "../roomservice/cart.jsp");
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
		@RequestParam(value="qty",defaultValue="1") int qty,
		@RequestParam int member_num){
	
	//주문 1개 값 얻어서 데이터 저장
	List<MenuDto> onelist=new ArrayList<MenuDto>();
	onelist.add(mnservice.menuCartList(menu_num));
	
	
	//member_num 이용해서 name 얻고 보내기
	session.getAttribute("member_num");
	
	oservice.roomOrderInsert(odto);
	
	//member_num 사용해서 주문자명, 주문자호수 가져오기
	String name = mnservice.MemberName(member_num);
	int room_local = mnservice.MemberRoom(member_num);
	
	request.setAttribute("room_local", room_local);
	request.setAttribute("member_name",name);
	
	//max order_num 얻기
	int maxOrderNum = oservice.roomOrderMax();	
	
	request.setAttribute("maxOrderNum", maxOrderNum);	
	
	//orderdetail 테이블에 데이터 보내기

	
	oddto.setOrder_num(maxOrderNum);
	for(MenuDto dto : onelist) {
		oddto.setMenu_num(menu_num);
		oddto.setQty(qty);
		oddservice.OrderDetailInsert(oddto);
	}
	
		
	request.setAttribute("qty", qty);
	request.setAttribute("onelist", onelist);
	
	request.setAttribute("container", "../roomservice/oneordercomplete.jsp");
	return "layout/home";
}

//장바구니 개별 품목 삭제
@RequestMapping("/cartdelete.do")
public String cartDelete(HttpServletRequest request,
		HttpSession session,
		@RequestParam int menu_num)
{

	//세션에서 mnlist를 가져온다.
	List<MenuDto> mnlist = (ArrayList<MenuDto>)session.getAttribute("mnlist");
	
	//받아온 menu_num과 일치하는 데이타를 찾아준다
	for(int i = 0 ; i < mnlist.size() ; i++ ) {
		
		if(menu_num == mnlist.get(i).getMenu_num()) { //해당 데이타를 찾았다면 
			mnlist.remove(i); //삭제한다.
		}
	}
	
	//새로 재정비 된 mnlist를 다시 세션에 보내준다. 
		session.setAttribute("mnlist", mnlist);
	
	//만약 전부 삭제되었다면 mnlist도 비워준다. 
	if(mnlist.size()==0) {
		session.removeAttribute("mnlist");
	}
	
	
	
//	if(mnlist == null){
//		request.setAttribute("container", "../roomservice/cart.jsp");
//	}
//	if(mnlist != null){
//		
//		for(int i=0 ; i<mnlist.size() ; i++){
//			if(cdto.getMenu_num() == mnlist.get(i).getMenu_num()){
//				mnlist.remove(i);
//			}
//		}
//	
//		session.setAttribute("mnlist", mnlist);
//		
//		List<CartDto> clist = (ArrayList<CartDto>)session.getAttribute("cdtolist");
//		
//		for(int i=0 ; i<clist.size() ; i++){
//			if(cdto.getMenu_num() == clist.get(i).getMenu_num()){
//				clist.remove(i);
//			}
//		}
//		
//		session.setAttribute("clist", clist);
//		
//		int m = mnlist.size();
//		if( m == 0 )
//		{
//			session.setAttribute("mnlist", null);
//		}
//	}
	
	return "redirect:cart.do";
}

//장바구니 선택 품목 삭제
@RequestMapping("/manycartdelete.do")
public String manycartDelete(HttpServletRequest request,
		HttpSession session,
		@RequestParam String menu_nums)
{
	List<MenuDto> mnlist = (ArrayList<MenuDto>)session.getAttribute("mnlist");
	
	//받아온 menu_nums를 배열로 변환 (바로 숫자형 배열로는 저장이 안되는구만!)
	String []nums = menu_nums.split(",");
	
	//숫자형 배열로 변환 
	int []intnums = new int[nums.length];
	
	for(int i = 0 ; i < nums.length ; i++){
		intnums[i] = Integer.parseInt(nums[i]);
	}
	
	
	for(int nn:intnums)
	{
		for(int j = 0; j < mnlist.size() ; j++){
			
			//만약 menu_num이 세션에 있는것과 일치한다면 모두 삭제해준다.
			if(nn == mnlist.get(j).getMenu_num()){
				mnlist.remove(j);
			}
		}
		
	}
	
	//세션에 새로 저장한다. 
	session.setAttribute("mnlist", mnlist);
	
		
	//만약 모두 삭제된 경우 mnlist를 세션에서 삭제한다. => 이거 굳이 해야됨? -장희-
	int m = mnlist.size();
	if( m == 0 ){
		session.removeAttribute("mnlist");
	}
	
	return "redirect:cart.do";
}

//주문상세페이지로 이동
//체크로 선택된 주문들만 menu_nums로 넘어옵니다 
@RequestMapping("/orderform.do")
public String orderform(HttpSession session,
		HttpServletRequest request,
		@RequestParam String menu_nums)
{
	
	//세션에 저장된 mnlist 받아온다. 
	ArrayList<MenuDto> mnlist = (ArrayList<MenuDto>)session.getAttribute("mnlist");
	
	
	//받아온 menu_nums를 정수형 배열로 변환합니다.
	String []nums=menu_nums.split(",");
	int []intnums = new int[nums.length];
	
	for(int i=0;i<intnums.length;i++){
		intnums[i] = Integer.parseInt(nums[i]);
	}
	
	
	//기존 세션에 저장된 mnlist와 비교해서 살아남는 주문들만 최종적으로 mnlist에 담겨져야 합니다. 
	for(int i=0; i<intnums.length; i++){
		
		int alive = 0;
		
		for(int j=0; j<mnlist.size(); j++){
			if(intnums[i] == mnlist.get(i).getMenu_num()){
				alive ++;
				break;
			}
		}
		if(alive == 0){ //살아남지 못한것들은 삭제 
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
		@ModelAttribute OrderDetailDto oddto)
		
{
	
	//member_num 이용해서 name 얻고 보내기
	int member_num = (Integer)session.getAttribute("member_num");
	
	String name = mnservice.MemberName(member_num);
	int room_local = mnservice.MemberRoom(member_num);
	
	request.setAttribute("room_local", room_local);
	request.setAttribute("member_name",name);
	
	//현재 묵고있는 예약건의 book_num을 알아내야 한다. 
	
	int book_num = (Integer)session.getAttribute("book_num");
	System.out.println("book_num : " + book_num);
	
	odto.setBook_num(book_num);
	
	//room_order 테이블에 저장
	oservice.roomOrderInsert(odto);
	
	//max order_num 얻기
	int maxOrderNum = oservice.roomOrderMax();	
	
	request.setAttribute("maxOrderNum", maxOrderNum);	
	
	
	
	List<MenuDto> mnlist=(ArrayList)session.getAttribute("mnlist");
	
	
	//orderdetail 테이블에 데이터 보내기
	oddto.setOrder_num(maxOrderNum);
	for(MenuDto dto : mnlist) {
		oddto.setMenu_num(dto.getMenu_num());
		oddto.setQty(dto.getQty());
		oddservice.OrderDetailInsert(oddto);
	}
	
	request.setAttribute("mnlist", mnlist);
	
	session.removeAttribute("mnlist");
	session.removeAttribute("cdtolist");
	
	request.setAttribute("container", "../roomservice/ordercomplete.jsp");
	return "layout/home";
}


//////호텔 소개 페이지////////

	//위치
	@RequestMapping("/hoteladdress.do")
	public String hotelAddr(HttpServletRequest request){
		
		request.setAttribute("container", "../hotel/address.jsp");
		return "layout/home";
	}
	
///////객실 소개 페이지////////
	
	//룸 소개
	@RequestMapping("/hotelroom.do")
	public String hotelRoom(HttpServletRequest request){
		
		request.setAttribute("container", "../hotel/room.jsp");
		return "layout/home";
	}	
	
	//스탠다드 룸 소개
	@RequestMapping("/standard.do")
	public String hotelStandardRoom(HttpServletRequest request){
		
		request.setAttribute("container", "../hotel/standard.jsp");
		return "layout/home";
	}
	
	//디럭스 룸 소개
	@RequestMapping("/deluxe.do")
	public String hotelDeluxeRoom(HttpServletRequest request){
		
		request.setAttribute("container", "../hotel/deluxe.jsp");
		return "layout/home";
	}
	
	//그랜드 룸 소개
	@RequestMapping("/grand.do")
	public String hotelGrandRoom(HttpServletRequest request){
		
		request.setAttribute("container", "../hotel/grand.jsp");
		return "layout/home";
	}
}
