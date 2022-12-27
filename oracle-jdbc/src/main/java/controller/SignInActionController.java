package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.MemberService;
import vo.Member;

/**
 * Servlet implementation class SignInActionController
 */
@WebServlet("/SignInActionController")
public class SignInActionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignInActionController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember != null) {
			response.sendRedirect(request.getContextPath()+"BoardListController");
		}
		
		Member paramMember = new Member();
		paramMember.setMemberId(request.getParameter("memberId"));
		paramMember.setMemberPw(request.getParameter("memberPw"));
		
		MemberService memberService = new MemberService();
		ArrayList<Member> returnMember = memberService.getSignIn(paramMember);
		if(returnMember == null) {
			request.setAttribute("loginFalse", true);
			response.sendRedirect(request.getContextPath()+"/SingInFormController");
		}
		session.setAttribute("loginMember", returnMember);
		
		response.sendRedirect(request.getContextPath()+"/BoardListController");
	}

}
