package command;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Board.Dao.BoardDao;

public class LonginHandler implements CommandHandler{
	private ActionForward A=new ActionForward();
	private BoardDao B=new BoardDao();
	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		 request.setCharacterEncoding("utf-8");
		String uid=request.getParameter("uid");
		String password=request.getParameter("site");
	
		HttpSession s=request.getSession();
	
		String kk=B.Login(uid, password);
		
		System.out.println("3"+uid);
	
		if(kk.equals("0")) {
		
			s.setAttribute("id", uid);
			s.setAttribute("site", password);
		
			A.setPath("newAddNickName.jsp");
			return A;
		}
		else  {
			
			s.setAttribute("uid", kk);
			A.setPath("home.jsp");
			return A;
			
		}
	}

}
