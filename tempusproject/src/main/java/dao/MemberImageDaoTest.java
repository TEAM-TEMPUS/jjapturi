package dao;

public class MemberImageDaoTest {
	static MemberImageDao dao = new MemberImageDao();

	public static void main(String[] args) {
		MemberImageDaoTest test = new MemberImageDaoTest();
		test.save(1L);
	}

	public void save(Long memberId) {
		dao.save(memberId);
	}
}
