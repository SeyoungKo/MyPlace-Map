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
 * Servlet implementation class SearchAction
 */
@WebServlet("/main/search.do")
public class SearchAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String id=request.getParameter("id");
		String area=request.getParameter("area");
		String category=request.getParameter("category");
		
		List<MapVO> list=null;
		MapVO vo=new MapVO();
		
		vo.setArea(area);
		vo.setCategory(category);
		
		if(area.equals("지역") && category==""){
			list=MapDAO.getInstance().searchall();
	
		}else if(category==""){
			list=MapDAO.getInstance().searcharea(area);
			
		}else if(area.equals("지역")) {
			list=MapDAO.getInstance().searchcate(category);
			
		}else {
			list=MapDAO.getInstance().search(vo);
			
		}
		
		request.setAttribute("list", list);
		request.setAttribute("id", id);
		
		RequestDispatcher disp=request.getRequestDispatcher("board.jsp");
		disp.forward(request, response);
		
	}

}
