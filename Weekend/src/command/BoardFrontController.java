package command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.Dao.BoardDao;
import Board.model.BoardBean;

/**
 * Servlet implementation class BoardFrontController
 */

public class BoardFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardFrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		
		String url=request.getRequestURI();
		CommandHandler c=null;
		ActionForward a=null;
		System.out.println(url);
		
		if(url.equals("/Weekend/write.bo")) {
			RequestDispatcher D=request.getRequestDispatcher("map.jsp?pagefile=board/write");
			D.forward(request, response);
		}
	
		else if(url.equals("/Weekend/Usercheck.bo")) {
			String name=request.getParameter("userName");
			
			response.getWriter().write(getJSON(name));
			
		}
		else if(url.equals("/Weekend/Login.bo")) {
			c=new LonginHandler();
			try {
				a=c.process(request, response);
			}catch(Exception e) {
				e.printStackTrace();
				
			}
		}
		else if(url.equals("/Weekend/deleteUser.bo")) {
			c=new DeleteUserHandler();
			try {
				a=c.process(request, response);
			}catch(Exception e) {
				e.printStackTrace();
				
			}
		}
		else if(url.equals("/Weekend/NickAdd.bo")) {
			c=new NewUserHandler();
			try {
				a=c.process(request, response);
			}catch(Exception e) {
				e.printStackTrace();
				
			}
		}
		else if(url.equals("/Weekend/Logout.bo") ) {
			RequestDispatcher D=request.getRequestDispatcher("/logout.jsp");
			D.forward(request, response);
		}
		else if(url.equals("/Weekend/addUser.bo")) {
			c=new NewUserHandler();
			try {
				a=c.process(request, response);
			}catch(Exception e) {
				e.printStackTrace();
				
			}
		}
		else if(url.equals("/Weekend/delete.bo")) {
			c=new DeleteHandler();
			try {
				a=c.process(request, response);
			}catch(Exception e) {
				e.printStackTrace();
				
			}
		}
		else if(url.equals("/Weekend/deleteRe.bo")) {
			c=new DeleteReplyHandler();
			try {
				a=c.process(request, response);
			}catch(Exception e) {
				e.printStackTrace();
				
			}
		}
	
		
		else if(url.equals("/Weekend/writePro.bo")) {
			c=new WriteHandler();
			try {
				a=c.process(request, response);
			}catch(Exception e) {
				e.printStackTrace();
				
			}
		}
		
		else if(url.equals("/Weekend/reply.bo")) {
			c=new BoardReplyHandler();
			try {
				a=c.process(request, response);
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		
		else if(url.equals("/Weekend/boardList.bo")) {
			
			try {
				c=new BoardListHandler();
				a=c.process(request, response);
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		else if(url.equals("/Weekend/read.bo")) {
			c=new ReadHandler();
			try {
				a=c.process(request, response);
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		if(a!=null) {
			
				RequestDispatcher D=request.getRequestDispatcher(a.getPath());
				D.forward(request, response);
			
		}
	}
	
	
	public String getJSON(String name) {
		if(name == null) {
			name="";
		}
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		BoardDao B=new BoardDao();
		ArrayList<BoardBean> L=B.search(name);
		
		if(L.isEmpty()) {
			result.append("[{\"value\":\""+""+"\"}],");
		}
		else {
		result.append("[{\"value\":\""+L.get(0).getName()+"\"}],");
		}
		L.clear();	
		
		result.append("]}");
		
		return result.toString();
		
	}

}
