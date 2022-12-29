package controller;

import java.io.IOException;
import java.util.ArrayList;

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
 * Servlet implementation class BoardListController
 */
@WebServlet("/board/boardList")
public class BoardListController extends HttpServlet {
	private BoardService boardService;
	private static final long serialVersionUID = 1L;
        
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) {
			response.sendRedirect(request.getContextPath()+"/home");
			return;
		}
		
		int currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int rowPerPage = 10;
		if(request.getParameter("rowPerPage") != null) {
			rowPerPage = Integer.parseInt(request.getParameter("rowPerPage"));
		}
		
		if(currentPage < 1) {
			currentPage = 1;
			response.sendRedirect(request.getContextPath()+"/board/boardList?currentPage=1"+"&rowPerPage="+rowPerPage);
			return;
		}
		
		//lastPage = 전체갯수 / rowPerPage
		
		
		this.boardService = new BoardService();
		int lastPage = (int)Math.ceil((double)boardService.getBoardCount() / (double)rowPerPage);
		if(currentPage > lastPage) {
			currentPage = lastPage;
			response.sendRedirect(request.getContextPath()+"/board/boardList?currentPage="+lastPage+"&rowPerPage="+rowPerPage);
			return;
		}
		
		final int PAGE_COUNT = 10;
		int beginPage = (currentPage-1)/PAGE_COUNT*PAGE_COUNT+1;
		int endPage = beginPage+PAGE_COUNT-1;
		
		
		ArrayList<Board> list = boardService.getBoardListByPage(currentPage, rowPerPage);
		request.setAttribute("boardList", list);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("lastPage", lastPage);
		request.setAttribute("rowPerPage", rowPerPage);
		request.setAttribute("beginPage", beginPage);
		request.setAttribute("endPage", endPage);
		
		/*
		 * VIEW 메뉴구성
		 * 1) 글입력 / 끝 
		 * 2) 글 상세보기 / 끝
		 */
		request.getRequestDispatcher("/WEB-INF/view/board/boardList.jsp").forward(request, response);
	}

}
