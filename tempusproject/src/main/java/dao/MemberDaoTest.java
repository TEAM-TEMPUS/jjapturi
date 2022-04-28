package dao;

import dto.MemberDto;

public class MemberDaoTest {
	static MemberDao dao = new MemberDao(); 
	
	public static void main(String[] args) {
		MemberDaoTest test = new MemberDaoTest();
		test.save();
//		test.update();
//		test.findByMemberId(1L);
		test.findById("id");
	}

	public void save() {
		MemberDto dto = new MemberDto("nickname2", "id2", "password2", "address2", "email2", "phoneNumber2");
		dao.save(dto);
	}
	
	public void update() {
		MemberDto dto = new MemberDto("nickname", "chlwnsdud111", "password", "address", "email", "phoneNumber");
		dao.update(dto);
	}
	
	public void findByMemberId(Long memberId) {
		MemberDto member = dao.findByMemberId(memberId);
		System.out.println(member);
	}
	
	public void findById(String id) {
		MemberDto member = dao.findById(id);
		System.out.println(member);
	}
}
