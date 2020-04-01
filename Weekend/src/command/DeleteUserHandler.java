package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Board.Dao.BoardDao;

public class DeleteUserHandler implements CommandHandler{

	private ActionForward A =new ActionForward();
	private BoardDao B=new BoardDao();
	
	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String nickname=request.getParameter("nickname");
		HttpSession s=request.getSession();
		s.removeAttribute("uid");
		B.deleteUser(nickname);
		
		
		A.setPath("home.jsp");
		
		return A;
	}

}
