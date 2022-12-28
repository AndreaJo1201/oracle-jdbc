package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.MemberService;
import vo.Member;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/member/login")
public class LoginController extends HttpServlet {
	private MemberService memberService;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    // 로그인 폼
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 *  VIEW = /WEB-INF/view/member/login.jsp
		 */
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember != null) {
			response.sendRedirect(request.getContextPath()+"/home");
			return;
		}
		
		request.getRequestDispatcher("/WEB-INF/view/member/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	//로그인 액션
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 로그인 세션 정보 : session.setAttribute("loginMember",Member타입)
		 * 
		 * redirect -> get방식 home 
		 */
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember != null) {
			response.sendRedirect(request.getContextPath()+"/home");
			return;
		}
		
		Member paramMember = new Member();
		paramMember.setMemberId(request.getParameter("memberId"));
		paramMember.setMemberPw(request.getParameter("memberPw"));
		
		this.memberService = new MemberService();
		Member returnMember = memberService.getLogIn(paramMember);
		if(returnMember == null) {
			request.getRequestDispatcher("/WEB-INF/view/member/login.jsp").forward(request, response);
			return;
		}
		session.setAttribute("loginMember", returnMember);
		
		response.sendRedirect(request.getContextPath()+"/home");	
		
	}

}
