package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Board.Dao.BoardDao;
import Board.model.BoardUser;

public class NewUserHandler implements CommandHandler{
	private ActionForward A=new ActionForward();
	private BoardUser U=new BoardUser();
	private BoardDao B=new BoardDao();
	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		 request.setCharacterEncoding("utf-8");

		HttpSession s=request.getSession();
		
		// TODO Auto-generated method stub
		String id=request.getParameter("uid");
		String site=request.getParameter("site");
		String nickname=request.getParameter("nickname");
		
	
		
		U.setUid(id);
		U.setSite(site);
		U.setNickname(nickname);
		
		B.addUser(U);
		
		s.setAttribute("uid", nickname);
		
		A.setPath("Weekend/home.jsp");
		
		
		return A;
	}

}
