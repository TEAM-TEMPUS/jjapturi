package data.dao.member;

import data.dto.member.MemberDto;
import data.dto.member.MemberProfileDto;

public class MemberDaoTest {
	static MemberDao dao = new MemberDao(); 
	
	public static void main(String[] args) {
		MemberDaoTest test = new MemberDaoTest();
//		test.save();
//		test.update();
//		test.findByMemberId(1L);
//		test.findById("id");
		test.findMemberProfileByMemberId(1L);
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
	
	public void findMemberProfileByMemberId(Long memberId) {
		MemberProfileDto memberProfile = dao.findMemberProfileByMemberId(memberId);
		System.out.println(memberProfile);
	}
}
