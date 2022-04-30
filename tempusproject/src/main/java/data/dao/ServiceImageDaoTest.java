package data.dao;

import data.dto.ServiceDto;
import data.dto.ServiceImageDto;

public class ServiceImageDaoTest {

	static ServiceImageDao dao = new ServiceImageDao();
	
	public static void main(String[] args) {
		ServiceImageDaoTest test = new ServiceImageDaoTest();
		
		test.store();
	}
	
	public void store() {
		ServiceImageDto dto = new ServiceImageDto(21L,"testImg23123.png");
		dao.store(dto);
	}
}
