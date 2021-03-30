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
 * Servlet implementation class aaa
 */
@WebServlet("/main/oneboard.do")
public class OneboardAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String id=request.getParameter("id");
		int idx=Integer.parseInt(request.getParameter("idx"));
		
		
		MapDAO.getInstance().update_readhit(idx);
		
		List<MapVO> list=MapDAO.getInstance().commentsel(idx);
		
		MapVO vo=MapDAO.getInstance().shareone(idx);
		 
		request.setAttribute("list", list);
		request.setAttribute("idx", idx);
		request.setAttribute("id", id);
		request.setAttribute("vo", vo);
		
		RequestDispatcher disp=request.getRequestDispatcher("oneboard.jsp");
		disp.forward(request, response);
		
	}

}
