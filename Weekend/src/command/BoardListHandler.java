package command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.Dao.BoardDao;
import Board.model.BoardBean;

public  class BoardListHandler implements CommandHandler{

	BoardDao B=new BoardDao();
	ActionForward A=new ActionForward();
	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String pageNum=request.getParameter("pageNo");
		String keyWord = request.getParameter("keyWord");
		String keyField = request.getParameter("keyField");
		
		int page=1;
		String word="";
		String Feild="";
		if(pageNum!=null) {
			page=Integer.parseInt(pageNum);
		}
		if(keyWord!=null ) {
			word=keyWord;
			Feild=keyField;
		}
	
	
		ArrayList<BoardBean> L=B.showga((page - 1) * 10, Feild, word);
		int count = B.countga(Feild, word);
		PageInfo P=new PageInfo(count, 10, L, page,word,Feild);
		request.setAttribute("ga", P);
		
		A.setPath("map.jsp?pagefile=board/list");
		
		return A;
	}

}
