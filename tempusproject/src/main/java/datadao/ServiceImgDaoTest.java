package datadao;

import java.util.List;

import datadto.ServiceImgDto;

public class ServiceImgDaoTest {

	static ServiceImageDao dao=new ServiceImageDao();
	
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
