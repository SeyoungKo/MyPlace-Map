package action;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.MapDAO;
import vo.MapVO;

/**
 * Servlet implementation class OneBoardAction
 */
@WebServlet("/main/oneshow.do")
public class OneShowAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String id, category, latlng, area, place, memo, content, photo_name, photo_show, share;
		int res, res2 = 0;
		
		String web_path="/upload/";
		ServletContext application=request.getServletContext();
		String path=application.getRealPath(web_path);
		
		int max_size=1024 * 1024 * 100;
		
		MultipartRequest mr=new MultipartRequest(
				request, 
				path, 
				max_size, 
				"utf-8", 
				new DefaultFileRenamePolicy());
		
		File f=mr.getFile("photo_name");
		
		id=mr.getParameter("id");
		category=mr.getParameter("category");
		latlng=mr.getParameter("latlng");
		area=mr.getParameter("area");
		place=mr.getParameter("place");
		memo=mr.getParameter("memo");
		content=mr.getParameter("content");
		photo_name=f.getName();
		photo_show=mr.getParameter("photo_show");
		share=mr.getParameter("share");
		
		MapVO vo=new MapVO();
		vo.setId(id);
		vo.setCategory(category);
		vo.setLatlng(latlng);
		vo.setArea(area);
		vo.setPlace(place);
		vo.setMemo(memo);
		vo.setContent(content.replaceAll("\n","<br>"));
		vo.setPhoto_name(photo_name);
		vo.setPhoto_show(photo_show);
		
		if(share.equals("1")) {
			 res=MapDAO.getInstance().insert(vo);
			 res2=MapDAO.getInstance().shareinsert(vo);
			
		}else{
			 res=MapDAO.getInstance().insert(vo);
			
		}//else_if
		
		request.setAttribute("vo",vo);
		request.setAttribute("res", res);
		request.setAttribute("res2", res2);
		request.setAttribute("id", id);
		request.setAttribute("share", share);
		
		RequestDispatcher disp=request.getRequestDispatcher("oneshow.jsp");
		disp.forward(request, response);
	
	}
	
}
