package spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.data.MemberDao;
import spring.data.MemberDto;

@Service
public class MemberService {

	@Autowired
	MemberDao mbdao;
	
	public void insertMember(MemberDto mbdto)
	{
		mbdao.insertMember(mbdto);
	}
	
}
