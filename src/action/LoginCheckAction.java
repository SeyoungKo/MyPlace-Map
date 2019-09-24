package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MapDAO;
import vo.MapVO;

/**
 * Servlet implementation class LoginCheckAction
 */
@WebServlet("/main/loginCheck.do")
public class LoginCheckAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		
		MapVO vo = MapDAO.getInstance().selectOne(id);
		
		String res = "no";
		if( vo == null ) {
			res = "yes";
			
		}//if
		
		String resultStr = String.format("[{'result':'%s'}, {'id':'%s'}]", res, id);
		response.setContentType("text/plain;charset=UTF-8");
		response.getWriter().println(resultStr);
		
	}
	
}
