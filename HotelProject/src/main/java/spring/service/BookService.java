package spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.data.BookDao;

@Service
public class BookService {

	@Autowired
	BookDao bdao;
	
}
