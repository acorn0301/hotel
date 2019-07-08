package spring.data;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;

@Repository
public class MenuDao extends SqlSessionDaoSupport{
	
	//menu table count
	public int menuTotalCount()
	{
		int n=getSqlSession().selectOne("menu.menuTotalCount");
		return n;
	}
	
	//menuListType
	public List<MenuDto> menuList(int menu_type_num)
	{
		return getSqlSession().selectList("menu.menuList",menu_type_num);
	}
	
	//메뉴 카테고리 수를 가져옴 (max num)
	public int menuTypeMaxNum()
	{
		return getSqlSession().selectOne("menuTypeMaxNum");
	}
	
	//num 값에 따른 메뉴이름, 메뉴값
	public MenuDto menuCartList(int menu_num)
	{
		
		return getSqlSession().selectOne("menuCartList", menu_num);
	}
	
}
