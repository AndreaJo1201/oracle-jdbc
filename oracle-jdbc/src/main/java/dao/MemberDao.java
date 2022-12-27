package dao;

import java.sql.*;
import vo.Member;

public class MemberDao {
	public Member signIn(Connection conn, Member member) throws Exception {
		Member returnMember = null;
		String sql = "SELECT member_name memberName FROM member WHERE member_id = ? AND member_pw = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberId());
		stmt.setString(2, member.getMemberPw());
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			returnMember = new Member();
			returnMember.setMemberName(rs.getString("memberName"));	
		}
		return returnMember;
	}
	
	public int insertMember(Connection conn, Member member) throws Exception {
		int result = 0;
		String sql = "INSERT INTO member(member_id, member_pw, member_name, updatedate, createdate) VALUES (?, ?, ?, sysdate, sysdate)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberId());
		stmt.setString(2, member.getMemberPw());
		stmt.setString(3, member.getMemberName());
		
		result = stmt.executeUpdate();
		
		return result;
	}
	
	public boolean duplicateMemberId(Connection conn, Member member) throws Exception {
		boolean result = false;
		String sql ="SELECT member_id FROM member WHERE member_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberId());
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			result = true;
		}
		
		rs.close();
		stmt.close();
		
		return result;
	}
}
