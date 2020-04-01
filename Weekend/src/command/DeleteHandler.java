package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.Dao.BoardDao;

public class DeleteHandler implements CommandHandler{

	
	private ActionForward A=new ActionForward();
	private BoardDao B=new BoardDao();
	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int idx=Integer.parseInt(request.getParameter("idx"));
		
		B.deletega(idx);
		
		A.setPath("boardList.bo");
		
		
		
		
		return A;
	}

}
