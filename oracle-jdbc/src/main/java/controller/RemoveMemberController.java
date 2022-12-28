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
 * Servlet implementation class RemoveMemberController
 */
@WebServlet("/member/removeMember")
public class RemoveMemberController extends HttpServlet {
	private MemberService memberService;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveMemberController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    // remove Form
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * view -> /WEB-INF/view/member/removeMember.jsp
		 */
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) {
			response.sendRedirect(request.getContextPath()+"/home");
			return;
		}
		
		request.getRequestDispatcher("/WEB-INF/view/member/removeMember.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	// remove action
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * redirect -> member/logout
		 */
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) {
			response.sendRedirect(request.getContextPath()+"/home");
			return;
		}
		
		Member paramMember = new Member();
		paramMember.setMemberId(loginMember.getMemberId());
		paramMember.setMemberPw(request.getParameter("memberPw"));
		
		this.memberService = new MemberService();
		int result = memberService.getRemoveMember(paramMember);
		if(result != 1) {
			request.getRequestDispatcher("WEB-INF/view/member/removeMember.jsp").forward(request, response);
			return;
		}
		
		response.sendRedirect(request.getContextPath()+"/member/logout");
	}

}
