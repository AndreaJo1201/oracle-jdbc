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
 * Servlet implementation class AddMemberController
 */
@WebServlet("/member/addMember")
public class AddMemberController extends HttpServlet {
	private MemberService memberService;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddMemberController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    // addMemberForm(회원가입 폼)
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember"); // Object -> Member 형변환
		if(loginMember!=null) {
			response.sendRedirect(request.getContextPath()+"/home");
			return;
		}
		request.getRequestDispatcher("/WEB-INF/view/member/addMember.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	// addMemberAction(회원가입 액션)
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
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
			request.getRequestDispatcher("/WEB-INF/view/member/addMember.jsp").forward(request, response);
			return;
		}
		
		response.sendRedirect(request.getContextPath()+"/home");
	}

}
