package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.data.MenuDao;
import spring.data.MenuDto;

@Service
public class MenuService {
	@Autowired
	private MenuDao mndao;
	
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
	
}
