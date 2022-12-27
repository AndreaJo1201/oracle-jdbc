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
 * Servlet implementation class RegisterActionController
 */
@WebServlet("/RegisterActionController")
public class RegisterActionController extends HttpServlet {
	private MemberService memberService;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterActionController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember"); // Object -> Member 형변환
		if(loginMember!=null) {
			response.sendRedirect(request.getContextPath()+"/BoardListController");
			return;
		}
		
		Member paramMember = new Member();
		paramMember.setMemberId(request.getParameter("memberId"));
		paramMember.setMemberPw(request.getParameter("memberPw"));
		paramMember.setMemberName(request.getParameter("memberName"));
		
		this.memberService = new MemberService();
		int result = memberService.getInsertMember(paramMember);
		if(result == 0) {
			response.sendRedirect(request.getContextPath()+"/RegisterFormController");
			return;
		}
		
		response.sendRedirect(request.getContextPath()+"/SignInFormController");
	}

}
