package command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.Dao.BoardDao;
import Board.model.BoardBean;
import Board.model.BoardReply;

public class BoardReplyHandler implements CommandHandler{

	
	private BoardReply r =new BoardReply();
	private ActionForward A=new ActionForward();
	private BoardDao B=new BoardDao();
	private ArrayList<BoardReply> R=new ArrayList<>();
	private BoardBean B1=new BoardBean();
	
	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		int boardNum=Integer.parseInt(request.getParameter("num"));
		String pageNo=request.getParameter("pageNo");
		String keyWord = request.getParameter("keyWord");
		String keyField = request.getParameter("keyField");
		String name=request.getParameter("mem_name");
		String content=request.getParameter("content");
		
		
		r.setBoard_no(boardNum);
		r.setMem_name(name);
		r.setContent(content);
		
		B.addreply(r);
		
		B1=B.selectga(boardNum);
		
		R=B.showRe(boardNum);
		request.setAttribute("r", R);
		request.setAttribute("selectga", B1);
		request.setAttribute("num", boardNum);
		request.setAttribute("page", pageNo);
		request.setAttribute("keyword", keyWord);
		request.setAttribute("keyfield", keyField);
		A.setPath("map.jsp?pagefile=/board/read");
		return A;
	}

}
