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
 * Servlet implementation class ModifyBoardController
 */
@WebServlet("/board/modifyBoard")
public class ModifyBoardController extends HttpServlet {
	private BoardService boardService;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyBoardController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    //글 수정 폼
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		
		Board selectBoard = boardService.getBoardListByNo(paramBoard);
		request.setAttribute("modifyBoard", selectBoard);
		
		request.getRequestDispatcher("/WEB-INF/view/board/modifyBoard.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	// 글 수정 액션
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) {
			response.sendRedirect(request.getContextPath()+"/home");
			return;
		}
		Board paramBoard = new Board();
		paramBoard.setBoardNo(Integer.parseInt(request.getParameter("boardNo")));
		paramBoard.setBoardTitle(request.getParameter("boardTitle"));
		paramBoard.setBoardContent(request.getParameter("boardContent"));
		this.boardService = new BoardService();
		boolean result = boardService.getUpdateBoard(paramBoard);
		if(!result) {
			request.getRequestDispatcher("/WEB-INF/view/board/modifyBoard.jsp").forward(request, response);
			return;
		}
		
		response.sendRedirect(request.getContextPath()+"/board/boardOne?boardNo="+paramBoard.getBoardNo());
	}

}
