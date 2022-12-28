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
 * Servlet implementation class ModifyMemberController
 */
@WebServlet("/member/modifyMember")
public class ModifyMemberController extends HttpServlet {
	private MemberService memberService;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyMemberController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    //MODIFY FORM
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * VIEW -> /WEB-INF/view/member/modifyMember.jsp
		 */
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) {
			response.sendRedirect(request.getContextPath()+"/home");
			return;
		}
		
		request.getRequestDispatcher("/WEB-INF/view/member/modifyMember.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	// modify action
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 
		 * redirect -> post 방식 /member/memberOne/key값
		 * 
		 */
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) {
			response.sendRedirect(request.getContextPath()+"/home");
			return;
		}
		Member paramMember = new Member();
		paramMember.setMemberId(request.getParameter("memberId"));
		paramMember.setMemberName(request.getParameter("afterName"));
		paramMember.setMemberPw(request.getParameter("memberPw"));
		
		this.memberService = new MemberService();
		int result = memberService.getModifyMember(paramMember);
		if(result != 1) {
			request.getRequestDispatcher("/WEB-INF/view/member/modifyMember.jsp").forward(request, response);
			return;
		}
		
		loginMember.setMemberName(request.getParameter("afterName"));
		session.setAttribute("loginMember", loginMember);
		
		response.sendRedirect(request.getContextPath()+"/member/memberOne");
	}

}
