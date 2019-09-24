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
 * Servlet implementation class show
 */
@WebServlet("/main/show.do")
public class ShowAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String id=request.getParameter("id");
		String place=request.getParameter("place");
		String category=request.getParameter("category");
		
		MapVO vo=new MapVO();
		vo.setId(id);
		vo.setPlace(place);
		vo.setCategory(category);
		
		vo=MapDAO.getInstance().selectone(vo);
		
		request.setAttribute("vo",vo);
		request.setAttribute("id",id);
		
		RequestDispatcher disp=request.getRequestDispatcher("show.jsp");
		disp.forward(request, response);
		
	}

}
