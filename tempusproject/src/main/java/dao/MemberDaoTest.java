package dao;

import dto.MemberDto;

public class MemberDaoTest {
	static MemberDao dao = new MemberDao(); 
	
	public static void main(String[] args) {
		MemberDaoTest test = new MemberDaoTest();
//		test.save();
		test.update();
		
	}

	public void save() {
		MemberDto dto = new MemberDto("nickname", "id", "password", "address", "email", "phoneNumber");
		dao.save(dto);
	}
	
	public void update() {
		MemberDto dto = new MemberDto("nickname", "chlwnsdud111", "password", "address", "email", "phoneNumber");
		dao.update(dto);
	}
}
