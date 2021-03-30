package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.eclipse.jdt.internal.compiler.ast.MemberValuePair;

import dao.MapDAO;
import vo.MapVO;

/**
 * Servlet implementation class LoginAction
 */
@WebServlet("/main/login.do")
public class LoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id, pwd, back ;
		String result="no";
		
		id=request.getParameter("id");
		pwd=request.getParameter("pwd");
		
		MapVO vo=new MapVO();
		vo.setId(id);
		vo.setPwd(pwd);
		
		MapVO user=MapDAO.getInstance().selectlogin(vo);
		
		if(user!=null) {	
			HttpSession session=request.getSession();

			session.setAttribute("user", user);
			session.setMaxInactiveInterval(7200);
			result="yes";
			
		}//if
		
		back=String.format("[{'result':'%s'}]",result);
		response.getWriter().println(back);
	
	}

}
