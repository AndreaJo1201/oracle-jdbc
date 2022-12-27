package dao;
import java.sql.*;
import java.util.*;
import vo.*;
public class BoardDao {
	//검색기능 추가하기
	public ArrayList<Board> selectBoardListByPage(Connection conn, int beginRow, int endRow) throws Exception {
		ArrayList<Board> list = new ArrayList<Board>();
		String sql = "SELECT board_no boardNo, board_title boardTitle, createdate"
				+ " FROM (SELECT rownum rnum, board_no, board_title, createdate"
				+ "			FROM (SELECT board_no, board_title, createdate"
				+ "					FROM board ORDER BY board_no DESC))"
				+ " WHERE rnum BETWEEN ? AND ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow);
		stmt.setInt(2, endRow);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Board b = new Board();
			b.setBoardNo(rs.getInt("boardNo"));
			b.setBoardTitle(rs.getString("boardTitle"));
			b.setCreatedate(rs.getString("createdate"));
			
			list.add(b);
		}
		
		rs.close();
		stmt.close();
		
		return list;
	}
	
	public boolean insertBoard(Connection conn, Board board) throws Exception {
		boolean result = false;
		String sql = "INSERT INTO board(board_no, board_title, board_content, member_id, updatedate, createdate)"
				+ " VALUES (BOARD_SEQ.NEXTVAL, ?, ?, ?, sysdate, sysdate)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, board.getBoardTitle());
		stmt.setString(2, board.getBoardContent());
		stmt.setString(3, board.getMemberId());
		
		if(stmt.executeUpdate() == 1) {
			result = true;
		}
		
		stmt.close();
		
		return result;
	}
}
