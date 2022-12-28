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
 * Servlet implementation class BoardOneController
 */
@WebServlet("/board/boardOne")
public class BoardOneController extends HttpServlet {
	private BoardService boardService;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardOneController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 1) 수정기능(세션id = 작성자아이디일치) / 끝
		 * 2) 삭제기능(세션id = 작성자아이디일치) / 끝
		 */
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) {
			response.sendRedirect(request.getContextPath()+"/home");
			return;
		}
		Board paramBoard = new Board();
		if(request.getParameter("boardNo") == null || request.getParameter("boardNo").equals("")) {
			response.sendRedirect(request.getContextPath()+"/board/boardList");
			return;
		}
		paramBoard.setBoardNo(Integer.parseInt(request.getParameter("boardNo")));
		this.boardService = new BoardService();
		
		Board resultBoard = boardService.getBoardListByNo(paramBoard);
		request.setAttribute("boardOne", resultBoard);
		
		request.getRequestDispatcher("/WEB-INF/view/board/boardOne.jsp").forward(request, response);
		
	}

}
