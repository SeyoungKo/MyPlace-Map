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

@WebServlet("/main/sInsert.do")
public class scheduleInsertAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String year, day, month, endyear, endmonth, endday, splace, scontent, id;
		
		id = request.getParameter("id");
		year = request.getParameter("year");
		month = request.getParameter("month");
		day = request.getParameter("day");
		endyear = request.getParameter("endyear");
		endmonth = request.getParameter("endmonth");
		endday = request.getParameter("endday");
		splace = request.getParameter("splace");
		scontent = request.getParameter("scontent");
		
		System.out.println(id);
		
		MapVO vo = new MapVO();
		vo.setId(id);
		vo.setYear(year);
		vo.setMonth(month);
		vo.setDay(day);
		vo.setEndyear(endyear);
		vo.setEndmonth(endmonth);
		vo.setEndday(endday);
		vo.setSplace(splace);
		vo.setScontent(scontent);
		
		int res = MapDAO.getInstance().sInsert(vo);
		
		List<MapVO> list = MapDAO.getInstance().sSelect(id);
		
		request.setAttribute("id", id);
		request.setAttribute("list", list);
		
		if(res == 1) {
		
			RequestDispatcher disp = request.getRequestDispatcher("scheduleView.jsp");
			disp.forward(request, response);
			
			
		} else { // DB insert 실패 시
			/*RequestDispatcher disp = request.getRequestDispatcher("loginInsert.jsp");
			disp.forward(request, response);*/
		}
	}

}
