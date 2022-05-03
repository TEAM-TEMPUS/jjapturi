package data.dao.service;

import java.util.List;

import data.dto.service.MyServiceDto;
import data.dto.service.ServiceDto;
import data.dto.service.ServiceInqueryDto;

public class ServiceDaoTest {

	static ServiceDao dao = new ServiceDao();

	public static void main(String[] args) {

		ServiceDaoTest test = new ServiceDaoTest();
//		test.store();
//		test.modify();
//		test.delete(21L);
//		test.changeStatus();
//		test.findInqueryServiceId(1L);
//		test.findAll("walk","grasshopper", 0, 10);
//		test.getTotalCountByCategory("walk","grasshopper");

		test.findMyServicesByMemberId(1L, 0, 10);
	}

	public void store() {
		ServiceDto dto = new ServiceDto("ant", "test컴퓨터 설치 도와주세요~", "install", "basic", "서울시", "2022-05-05",
				"2022-05-05", 30000, "설명");
		System.out.print(dao.store(dto));
	}

	public void modify() {

		ServiceDto dto = new ServiceDto("grasshopper", "컴퓨터 설치 해드릴게요~(수정)", "install", "basic", "서울시", "2022-05-15",
				"2022-05-25", 35000, "설명2", 19L);
		dao.modify(dto);

	}

	public void delete(Long serviceId) {
		dao.delete(serviceId);
	}

	public void changeStatus() {
		ServiceDto dto = new ServiceDto("basic", 6L);
		dao.changeStatus(dto);
	}

	public void findByServiceId(Long serviceId) {
		ServiceInqueryDto sid=dao.findByServiceId(serviceId);

		System.out.println(sid);

	}

	public void findAll(String category, String types,int offset, int size) {
		for (ServiceInqueryDto service : dao.findAll(category, types, offset, size)) {
			System.out.println(service);
		}
	}
	
	public void getTotalCountByCategory(String category, String types) {
		System.out.println(dao.getTotalCountByCategory(category, types));
	}

	public void findMyServicesByMemberId(Long memberId, int offset, int limit) {
		for (MyServiceDto myService : dao.findMyServicesByMemberId(memberId, offset, limit)) {
			System.out.println(myService);
		}
	}
	
}
