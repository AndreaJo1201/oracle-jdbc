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
	
	public Board selectBoardListByNo(Connection conn, Board board) throws Exception {
		Board returnBoard = new Board();
		String sql = "SELECT * FROM board WHERE board_no = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, board.getBoardNo());
		
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			returnBoard.setBoardNo(rs.getInt("board_no"));
			returnBoard.setBoardTitle(rs.getString("board_title"));
			returnBoard.setBoardContent(rs.getString("board_content"));
			returnBoard.setMemberId(rs.getString("member_id"));
			returnBoard.setCreatedate(rs.getString("createdate"));
			returnBoard.setUpdatedate(rs.getString("updatedate"));
		}
		return returnBoard;
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
	
	public boolean updateBoard(Connection conn, Board board) throws Exception {
		boolean result = false;
		String sql = "UPDATE board SET board_title = ?, board_content = ?, updatedate = sysdate WHERE board_no = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, board.getBoardTitle());
		stmt.setString(2, board.getBoardContent());
		stmt.setInt(3, board.getBoardNo());
		if(stmt.executeUpdate() == 1) {
			result = true;
		}
		
		return result;
	}
	
	public int removeBoard(Connection conn, Board board) throws Exception {
		int result = 0;
		String sql = "DELETE FROM board WHERE board_no = ? AND member_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, board.getBoardNo());
		stmt.setString(2, board.getMemberId());
		result = stmt.executeUpdate();
		return result;
	}
}
