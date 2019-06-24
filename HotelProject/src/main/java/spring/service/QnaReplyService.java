package spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.data.QnaDao;
import spring.data.QnaReplyDao;

@Service
public class QnaReplyService {

	@Autowired
	QnaDao qdao;
	
	@Autowired
	QnaReplyDao qrdao;
}
