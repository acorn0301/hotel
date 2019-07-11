package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.data.MemberDto;
import spring.data.MenuDao;
import spring.data.MenuDto;
import spring.data.OrderDao;
import spring.data.OrderDetailDao;
import spring.data.OrderDetailDto;
import spring.data.OrderDto;

@Service
public class MenuService {
	@Autowired
	private MenuDao mndao;
	
	///////// menu TABLE /////////
	public int menuTotalCount()
	{
		return mndao.menuTotalCount();
	}
	
	public List<MenuDto> menuList(int menu_type_num)
	{
		
		return mndao.menuList(menu_type_num);
	}

	public int menuTypeMaxNum()
	{
		return mndao.menuTypeMaxNum();
	}
	
	public MenuDto menuCartList(int menu_num)
	{
		
		return mndao.menuCartList(menu_num);
	}
	
	public String MemberName(int member_num)
	{
		return mndao.MemberName(member_num);
	}
	
}
