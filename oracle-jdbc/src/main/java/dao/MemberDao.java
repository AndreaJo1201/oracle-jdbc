package dao;

import java.util.ArrayList;
import java.sql.*;
import vo.Member;

public class MemberDao {
	public ArrayList<Member> signIn(Connection conn, Member member) throws Exception {
		ArrayList<Member> list = new ArrayList<Member>();
		String sql = "SELECT member_name memberName FROM member WHERE member_id = ? AND member_pw = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberId());
		stmt.setString(2, member.getMemberPw());
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			Member m = new Member();
			m.setMemberName(rs.getString("memberName"));
			
			list.add(m);
		}
		return list;
	}
}
