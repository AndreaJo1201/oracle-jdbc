package service;

import java.sql.*;
import dao.MemberDao;
import util.DBUtil;
import vo.Member;

public class MemberService {
	private MemberDao memberDao;
	
	public Member getLogIn(Member member) {
		Member returnMember = null;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			memberDao = new MemberDao();
			returnMember = memberDao.logIn(conn, member);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch(Exception e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return returnMember;
	}
	
	public int getInsertMember(Member member) {
		int result = 0;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			memberDao = new MemberDao();
			boolean duplicate = memberDao.duplicateMemberId(conn, member);
			System.out.println("중복검사 확인");
			if(!duplicate) {
				result = memberDao.insertMember(conn, member);
				System.out.println("인설트 확인");
			}
			conn.commit();
		} catch(Exception e) {
			try {
				conn.rollback();
			} catch(Exception e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public int getModifyMember(Member member) {
		int result = 0;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			memberDao = new MemberDao();
			result = memberDao.modifyMember(conn, member);
			conn.commit();
		} catch(Exception e) {
			try {
				conn.commit();
			} catch(Exception e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public int getRemoveMember(Member member) {
		int result = 0;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			memberDao = new MemberDao();
			result = memberDao.removeMember(conn, member);
			conn.commit();
		} catch(Exception e) {
			try {
				conn.commit();
			} catch(Exception e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
}
