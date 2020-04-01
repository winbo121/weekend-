package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Board.Dao.BoardDao;
import Board.model.BoardBean;




public class WriteHandler implements CommandHandler{

	private BoardBean data=new BoardBean();
	private ActionForward A=new ActionForward();
	private BoardDao B=new BoardDao();
	
	
	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		
			
	
			request.setCharacterEncoding("utf-8");
			
			MultipartRequest M=new MultipartRequest(request,request.getRealPath("Weekend/upload"),10*1024*1024,"utf-8",new DefaultFileRenamePolicy());
				
			data.setName(M.getParameter("mem_name"));
			data.setContent(M.getParameter("content"));
			data.setTitle(M.getParameter("title"));
			try {
			data.setFilename(M.getFilesystemName("filename"));
			data.setFilesize((int) M.getFile("filename").length());
			}catch(Exception e) {
				System.out.println(e);
			}
			B.addga(data);
		
			A.setPath("boardList.bo");
			
			
			return A;
		
		
	}
	
	
	

}
