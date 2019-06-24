package spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.data.RoomDao;

@Service
public class RoomService {

	@Autowired
	RoomDao rmdao;
}
