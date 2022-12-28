package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.BoardService;
import vo.Board;
import vo.Member;

/**
 * Servlet implementation class RemoveBoardController
 */
@WebServlet("/board/removeBoard")
public class RemoveBoardController extends HttpServlet {
	private BoardService boardService;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveBoardController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * view -> boardList
		 * alert창으로 진짜 삭제할것인지 확인
		 */
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) {
			response.sendRedirect(request.getContextPath()+"/home");
			return;
		}
		
		Board paramBoard = new Board();
		paramBoard.setBoardNo(Integer.parseInt(request.getParameter("boardNo")));
		paramBoard.setMemberId(loginMember.getMemberId());
		this.boardService = new BoardService();
		int result = boardService.getDeleteBoard(paramBoard);
		if(result == 0) {
			response.sendRedirect(request.getContextPath()+"/board/boardOne?boardNo="+paramBoard.getBoardNo());
			return;
		}
		
		response.sendRedirect(request.getContextPath()+"/board/boardList");
	}

}
