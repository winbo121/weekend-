package Test;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class gta
 */

public class gta extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public gta() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		doPost(request,response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		String suid=request.getParameter("suid");
		String cnt=request.getParameter("cnt");
		String action=request.getParameter("action");
		String curmsg=request.getParameter("curmsg");
		String uid=request.getParameter("uid");
		String mid=request.getParameter("mid");
		String rid=request.getParameter("rid");
		String rmsg=request.getParameter("rmsg");
		String msg=request.getParameter("msg");
		String img=request.getParameter("img");
		String action1=request.getParameter("action1");
		
		
		
		request.setAttribute("img", img);
		request.setAttribute("msg", msg);
		request.setAttribute("suid", suid);
		request.setAttribute("cnt", cnt);
		request.setAttribute("action", action);
		request.setAttribute("curmsg", curmsg);
		request.setAttribute("mid", mid);
		request.setAttribute("rid", rid);
		request.setAttribute("rmsg", rmsg);
		request.setAttribute("uid", uid);
	
		try {
		if(action1.equals("login1")) {
			RequestDispatcher D=request.getRequestDispatcher("/Weekend/home.jsp");
			D.forward(request, response);
		}
	
		}catch(Exception e) {
		
			RequestDispatcher D=request.getRequestDispatcher("/Weekend/sns_control.jsp");
			D.forward(request, response);
		}
		
		
	
		
	}
	

	
}
