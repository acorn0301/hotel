package spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.data.ReviewDao;

@Service
public class ReviewService {

	@Autowired
	ReviewDao rvdao;
}
