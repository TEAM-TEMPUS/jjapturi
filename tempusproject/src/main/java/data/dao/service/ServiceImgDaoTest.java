package data.dao.service;

import java.util.List;

import data.dto.service.ServiceImgDto;

public class ServiceImgDaoTest {
	static ServiceImgDao dao= new ServiceImgDao();
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ServiceImgDaoTest test = new ServiceImgDaoTest();
		
		test.findByServiceImage(1L);
	}
	
	public void findByServiceImage(Long serviceId) {
		List<ServiceImgDto> list=dao.findByServiceImage(serviceId);
		
		
		for(int i=0; i<list.size(); i++) {
			System.out.println(list.get(i));

		}

	}

}
