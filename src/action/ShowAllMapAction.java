package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MapDAO;
import vo.MapVO;

/**
 * Servlet implementation class ShowAllMapAction
 */
@WebServlet("/main/showall.do")
public class ShowAllMapAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String id=request.getParameter("id");
		List<MapVO> list=null;
		
		list=MapDAO.getInstance().select(id);
				
		request.setAttribute("list", list);
		request.setAttribute("id", id);
		
		RequestDispatcher disp=request.getRequestDispatcher("showallmap.jsp");
		disp.forward(request, response);
		
	}

}
