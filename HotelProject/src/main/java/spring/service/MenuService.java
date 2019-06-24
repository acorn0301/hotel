package spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.data.MenuDao;

@Service
public class MenuService {

	@Autowired
	MenuDao mndao;
}
