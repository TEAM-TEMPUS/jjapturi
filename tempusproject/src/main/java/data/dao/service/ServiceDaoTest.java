package data.dao.service;

import data.dto.service.ServiceDto;

public class ServiceDaoTest {
	
	static ServiceDao dao = new ServiceDao(); 
	
	public static void main(String[] args) {
		
		ServiceDaoTest test = new ServiceDaoTest();
//		test.store();
//		test.modify();
		test.delete(21L);
//		test.status();
//		change status
	}

	public void store() {
		ServiceDto dto = new ServiceDto("ant", "test컴퓨터 설치 도와주세요~", "install", "basic", "서울시", "2022-05-05", "2022-05-05", 30000, "설명");
		System.out.print(dao.store(dto));
	}
	
	public void modify() {
		
		ServiceDto dto = new ServiceDto("grasshopper", "컴퓨터 설치 해드릴게요~(수정)", "install", "basic", "서울시", "2022-05-15", "2022-05-25", 35000, "설명2", 19L);
		dao.modify(dto);
		
	}
	
	public void delete(Long serviceId) {
		dao.delete(serviceId);
	}
	
	public void status() {
		ServiceDto dto = new ServiceDto("basic",3L);
		dao.status(dto);
	}
	
}

