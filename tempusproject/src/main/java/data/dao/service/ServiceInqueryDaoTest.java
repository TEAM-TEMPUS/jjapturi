package data.dao.service;

import data.dto.service.ServiceInqueryDto;

public class ServiceInqueryDaoTest {
	static ServiceInqueryDao dao = new ServiceInqueryDao();
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ServiceInqueryDaoTest test = new ServiceInqueryDaoTest();
		
		test.findInqueryServiceId(1L);
	}
	public void findInqueryServiceId(Long serviceId) {
		ServiceInqueryDto sid=dao.findInqueryServiceId(serviceId);
		System.out.println(sid);

	}
}
