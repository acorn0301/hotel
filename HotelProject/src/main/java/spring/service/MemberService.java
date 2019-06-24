package spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.data.MemberDao;

@Service
public class MemberService {

	@Autowired
	MemberDao mbdao;
}
