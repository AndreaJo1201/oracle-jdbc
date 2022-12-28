package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.Member;

/**
 * Servlet implementation class HomeController
 */
@WebServlet("/home")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 *  VIEW -> forward -> /WEB-INF/view/home.jsp
		 *  메뉴 구성(로그인 전 후 분기)
		 *  로그인 전
		 *  1) 로그인 / 끝
		 *  2) 회원가입 / 끝
		 *  
		 *  로그인 후
		 *  1) 로그아웃 / 끝
		 *  2) 회원 정보 / 끝
		 *  3) 게시판 리스트 / 끝
		 */
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		@SuppressWarnings("unused")
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		request.getRequestDispatcher("/WEB-INF/view/home.jsp").forward(request, response);
		
	}

}
