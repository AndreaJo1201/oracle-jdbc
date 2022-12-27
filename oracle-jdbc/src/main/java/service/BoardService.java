package service;

import java.sql.*;
import java.util.*;
import vo.*;
import dao.*;
import util.DBUtil;

public class BoardService {
	private BoardDao boardDao;
	
	public ArrayList<Board> getBoardListByPage(int currentPage, int rowPerPage) {
		ArrayList<Board> list = null;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			int beginRow = (currentPage-1) * rowPerPage + 1;
			int endRow = beginRow + rowPerPage -1;
			boardDao = new BoardDao();
			list = boardDao.selectBoardListByPage(conn, beginRow, endRow);
			conn.commit();
			
		} catch(Exception e) {
			try {
				conn.rollback();
			} catch (Exception e1) {
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
		
		return list;
	}
}
