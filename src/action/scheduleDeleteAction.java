package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MapDAO;

/**
 * Servlet implementation class sDeleteAction
 */
@WebServlet("/main/sDelete.do")
public class scheduleDeleteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int idx = Integer.parseInt(request.getParameter("idx"));
		MapDAO dao = MapDAO.getInstance();
		
		String resultStr="";
		String result = "no";
		
		int res = dao.sDelete(idx);

		if(res == 1) {
			result = "yes";
		}
		resultStr = String.format("[{'result':'%s'}]", result);
		response.getWriter().println(resultStr);
	}

}
