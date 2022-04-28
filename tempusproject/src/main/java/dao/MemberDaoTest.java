package dao;

import dto.MemberDto;

public class MemberDaoTest {

	public static void main(String[] args) {
		MemberDao dao = new MemberDao();
		MemberDto dto = new MemberDto("nickname", "id", "password", "address", "email", "phoneNumber");
		
		dao.save(dto);
	}

}
