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
 * Servlet implementation class CommentAction
 */
@WebServlet("/main/comment.do")
public class CommentAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String place, category, id, memo, area, photo_show, content, photo_name, text, ip;
		
		int idx=Integer.parseInt(request.getParameter("idx"));
		place=request.getParameter("place");
		category=request.getParameter("category");
		id=request.getParameter("id");
		memo=request.getParameter("memo");
		area=request.getParameter("area");
		photo_show=request.getParameter("photo_show");
		content=request.getParameter("content");
		photo_name=request.getParameter("photo_name");
		text=request.getParameter("text");
		ip=request.getRemoteAddr();
		
		MapVO vo=new MapVO();
		vo.setIdx(idx);
		vo.setPlace(place);
		vo.setCategory(category);
		vo.setId(id);
		vo.setMemo(memo);
		vo.setArea(area);
		vo.setPhoto_show(photo_show);
		vo.setContent(content);
		vo.setPhoto_name(photo_name);
		vo.setText(text);
		vo.setIp(ip);
		
		int res=MapDAO.getInstance().comment(vo);
		
		List<MapVO> list=MapDAO.getInstance().commentsel(idx);
		
		request.setAttribute("idx", idx);
		request.setAttribute("id", id);
		request.setAttribute("res", res);
		request.setAttribute("list", list);
		request.setAttribute("vo", vo);
	
		RequestDispatcher disp=request.getRequestDispatcher("oneboard.jsp");
		disp.forward(request, response);
		
	}

}
