package command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.Dao.BoardDao;
import Board.model.BoardBean;
import Board.model.BoardReply;

public class ReadHandler implements CommandHandler{

	
	BoardDao B1=new BoardDao();
	BoardBean B2=new BoardBean(); 
	ActionForward A=new ActionForward();
	ArrayList<BoardReply> r=new ArrayList<>();
	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int boardNum=Integer.parseInt(request.getParameter("num"));
		String pageNo=request.getParameter("pageNo");
		String keyWord = request.getParameter("keyWord");
		String keyField = request.getParameter("keyField");
		B1.updategaCa(boardNum);
		B2=B1.selectga(boardNum);
		r=B1.showRe(boardNum);
		request.setAttribute("r", r);
		request.setAttribute("selectga", B2);
		request.setAttribute("page", pageNo);
		request.setAttribute("keyword", keyWord);
		request.setAttribute("keyfield", keyField);
		A.setPath("/map.jsp?pagefile=Weekend/board/read");
		
		
		
		return A;
	}

}
