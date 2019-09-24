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
 * Servlet implementation class LoginInsertAction
 */
@WebServlet("/main/loginInsert.do")
public class LoginInsertAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String id, pwd, name, gender, age, tel;
		
		id = request.getParameter("id");
		pwd = request.getParameter("pwd");
		name = request.getParameter("name");
		gender = request.getParameter("gender");
		age = request.getParameter("age");
		tel = request.getParameter("tel");
		
		MapVO vo=new MapVO();
		vo.setId(id);
		vo.setPwd(pwd);
		vo.setName(name);
		vo.setGender(gender);
		vo.setAge(age);
		vo.setTel(tel);
		
		int res = MapDAO.getInstance().userInsert(vo);
		
		request.setAttribute("res",res);
		
		RequestDispatcher disp=request.getRequestDispatcher("login.jsp");
		disp.forward(request, response);

	}
	
}
