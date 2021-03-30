package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.MapVO;

/**
 * Servlet implementation class InputAction
 */
@WebServlet("/main/input.do")
public class InputAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String id, latlng, area, place, memo;
		id=request.getParameter("id");
		latlng=request.getParameter("latlng");
		area=request.getParameter("area");
		place=request.getParameter("place");
		memo=request.getParameter("memo");
		
		MapVO vo=new MapVO();
		vo.setId(id);
		vo.setLatlng(latlng);
		vo.setArea(area);
		vo.setPlace(place);
		vo.setMemo(memo);
		
		request.setAttribute("vo", vo);
		request.setAttribute("id", id);
		
		RequestDispatcher disp=request.getRequestDispatcher("input.jsp");
		disp.forward(request, response);
		
	}

}
