package spring.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.data.HotelDao;
import spring.service.HotelService;

@Controller
public class GeneralController {
	
	@Autowired
	HotelService hservice;
	
	//어떤 컨트롤러에 메서드를 넣어야할까 고민이 될땐 General Controller에 모두 때려넣으세요!
	//꼼꼼한 주석은 소통의 기본입니다!! 
	

	//메인 페이지를 구성하는 메서드 입니다.
	//우리는 tiles를 안쓸거라서 항상 모든 페이지가 home.do를 호출하되, container 파라미터값만 변경시켜주도록 할거에요.(request.setAttribute로)
	//더 좋은 방법이 생각나면 나중에 수정하겠지만 일단은 이렇게... 
	@RequestMapping("/home.do")
	public String home(@RequestParam(value = "container", required = false) String container, 
			HttpSession session,
			HttpServletRequest request) {
		
		//넘겨받은 container값이 없을 때는 항상 메인 홈을 호출합니다. 
		if(container == null) {
			container = "indexmain.jsp";
		}
		request.setAttribute("container", container);

		//만약 로그인 후에 이 메서드를 호출한거라면 현재 객실에 머물고 있는 고객인지 여부가 currentCustomer에 저장되기 때문에
		//그 값을 받아서 넘겨주도록 합시다. 
		//이 세션값은 로그아웃시 삭제되도록 설계되어야 합니다. 
		request.setAttribute("currentCustomer", session.getAttribute("currentCustomer"));
		
		//만약 관리자 아이디로 로그인 후에 이 메서드가 호출된거라면 그 값을 받아서 넘겨주도록 합시다.
		//왜나하면 관리자로 로그인했을때만 볼 수 있는 메뉴들이 있거든요
		//이 세션값은 로그아웃시 삭제되도록 설계되어야 합니다.
		request.setAttribute("admin", session.getAttribute("admin"));
		
		
		
//		//아래는 db연결 테스트용 코드입니다.
		int hotelTotalCount = hservice.getTotalCount();
		request.setAttribute("hotelTotalCount", hotelTotalCount);
	
		
		return "layout/home";
	}
	
	
	
	
	
	//지점 안내 버튼을 눌렀을 때
	@RequestMapping("hotellist.do")
	public String list(HttpServletRequest request) {
		
		// hotel 데이타베이스 테이블로부터 자료를 가져와서 넘겨주면 됩니다.
		// 지점이 많지 않을테니 페이징 처리는 필요없을듯.. 그냥 List 형식으로 받아다가 넘겨주면 되겠네요 
		
		request.setAttribute("container", "../hotel/list.jsp");
		
		return "layout/home";
	}
	
	
}
