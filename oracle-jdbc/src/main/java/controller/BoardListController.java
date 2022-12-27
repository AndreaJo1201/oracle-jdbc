package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import service.BoardService;
import vo.Board;


/**
 * Servlet implementation class BoardListController
 */
@WebServlet("/BoardListController")
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
		
		int currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			if(currentPage < 1) {
				currentPage = 1;
			}
		}
		
		int rowPerPage = 10;
		if(request.getParameter("rowPerPage") != null) {
			rowPerPage = Integer.parseInt(request.getParameter("rowPerPage"));
		}
		
		this.boardService = new BoardService();
		ArrayList<Board> list = boardService.getBoardListByPage(currentPage, rowPerPage);
		request.setAttribute("boardList", list);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("rowPerPage", rowPerPage);
		
		request.getRequestDispatcher("/WEB-INF/view/boardList.jsp").forward(request, response);
	}

}
