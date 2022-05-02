package data.dao.service;

import java.util.List;

import data.dto.service.ServiceImageDto;

public class ServiceImageDaoTest {

	static ServiceImageDao dao = new ServiceImageDao();
	
	public static void main(String[] args) {
		ServiceImageDaoTest test = new ServiceImageDaoTest();
		
//		test.store();
		test.findAllByServiceId(1L);
	}
	
	public void store() {
		ServiceImageDto dto = new ServiceImageDto(21L,"testImg23123.png");
		dao.store(dto);
	}
	
	public void findAllByServiceId(Long serviceId) {
		List<ServiceImageDto> list=dao.findAllByServiceId(serviceId);
		
		for(int i=0; i<list.size(); i++){
			System.out.println(list.get(i));
			System.out.println(list.get(i).getServiceId());
			System.out.println(list.get(i).getServiceImageId());
			System.out.println(list.get(i).getStoreImageName());
		}
	}
}
