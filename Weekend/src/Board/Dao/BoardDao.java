package Board.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import Board.model.BoardBean;
import Board.model.BoardReply;
import Board.model.BoardUser;
import jdbc.DBManager;

public class BoardDao {
	Connection a;
	PreparedStatement b;
	PreparedStatement b1;
	ResultSet r;
	
	public boolean deleteUser(String nickname) {
		a=DBManager.getConnection();
		String sql="delete from s_member where nickname= ?";
		try {
			b=a.prepareStatement(sql);
			b.setString(1, nickname);
			b.executeUpdate();
			return true;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
			b.close();
			a.close();
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		}
		return false;
	}
	
	
	
	
	public boolean addUser(BoardUser U) {
		a=DBManager.getConnection();
		String sql="insert into s_member values (?,?,?)";
		try {
			b=a.prepareStatement(sql);
			b.setString(1, U.getUid());
			b.setString(2, U.getSite());
			b.setString(3, U.getNickname());
			b.executeUpdate();
		
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e);
			return false;
		}
		finally {
			try {
				b.close();
				a.close();	
			} catch (SQLException e) {
			
				e.printStackTrace();
			}
			
		}
		return true;
	}
	
	public String Login(String id,String password) {
		a=DBManager.getConnection();
		
		String sql="select * from s_member where uid=?";
		try {
		
			b=a.prepareStatement(sql);
			b.setString(1, id);
			r=b.executeQuery();
			while(r.next()) {
			
				if(r.getString(1).equals(id) && r.getString(2).equals(password)) {
					return r.getString(3);
					
				}
				
			}


			
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				r.close();
				b.close();
				a.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return "0";
	
	}
	
	
	public boolean addga(BoardBean B) {
		a=DBManager.getConnection();
		String sql="insert into board(mem_name,content,title,replycount,reg_date,count,filename,filesize) values (?, ?,?, 0, now(),0, ?, ?)";
		try {
			b=a.prepareStatement(sql);
			b.setString(1, B.getName());
			b.setString(2, B.getContent());
			b.setString(3, B.getTitle());
			b.setString(4, B.getFilename());
			b.setInt(5, B.getFilesize());
			b.executeUpdate();
			
			
			b.close();
			a.close();
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e);
			return false;
		}
		return true;
	}
	public ArrayList<BoardBean> showga(int page,String keyFeild,String keyWord){
		a=DBManager.getConnection();
		ArrayList<BoardBean> L=new ArrayList<BoardBean>();
		try {
			if(keyWord.equals("") || keyWord.equals("null")) {
				String sql="select * from board order by idx desc limit ?,10";
				b=a.prepareStatement(sql);
				b.setInt(1, page);
			}
			else {
				String sql="select * from board where " + keyFeild + " like ?" + "order by idx desc limit ?,10";
				b=a.prepareStatement(sql);
				b.setString(1, "%" + keyWord + "%");
				b.setInt(2, page);
			}
			r=b.executeQuery();
			
			while(r.next()) {
				BoardBean B=new BoardBean();
				B.setIdx(r.getInt("idx"));
				B.setTitle(r.getString("title"));
				B.setName(r.getString("mem_name"));
				B.setReg_date(r.getString("reg_date"));
				B.setCount(r.getInt("count"));
				B.setReplycount(r.getInt("replycount"));
				L.add(B);
			}
			r.close();
			b.close();
			a.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return L;
	}
	public int countga(String keyFeild,String keyWord) {
		a=DBManager.getConnection();
		int count=0;
		
		try {
			if(keyWord.equals("") || keyWord.equals("null")) {
				String sql="select count(*) from board";
				b=a.prepareStatement(sql);
				
			}
			else {
				String sql="select count(*) from board where title like ?";
				b=a.prepareStatement(sql);
				b.setString(1, "%" + keyWord + "%");
				
			
			}
			r=b.executeQuery();
			
			while(r.next()) {
				count=r.getInt(1);
			}
			r.close();
			b.close();
			a.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public BoardBean selectga(int boardNum) {
		a=DBManager.getConnection();
		BoardBean B=new BoardBean();
		try {
			String sql="select * from board where idx=?";
			
			b=a.prepareStatement(sql);
			b.setInt(1, boardNum);
			r=b.executeQuery();
			
			while(r.next()) {
				
				B.setIdx(r.getInt(1));
				B.setName(r.getString(2));
				B.setTitle(r.getString(3));
				B.setContent(r.getString(4));
				B.setReplycount(r.getInt(5));
				B.setReg_date(r.getString(6));
				B.setCount(r.getInt(7));
				B.setFilename(r.getString(8));
				B.setFilesize(r.getInt(9));
			}
			r.close();
			b.close();
			a.close();	
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return B;
	}
	public boolean updategaCa(int boardNum) {
		a=DBManager.getConnection();
		try {
			String sql="update board set count=count+1 where idx=?";
			b=a.prepareStatement(sql);
			b.setInt(1, boardNum);
			b.executeUpdate();
			
			b.close();
			a.close();	
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public boolean addreply(BoardReply r) {
		a=DBManager.getConnection();
		try {
			String sql="insert into board_reply (board_no,mem_name,content,reg_date)values(?,?,?,now())";
			b=a.prepareStatement(sql);
			b.setInt(1, r.getBoard_no());
			b.setString(2, r.getMem_name());
			b.setString(3, r.getContent());
			b.executeUpdate();
			
			b.close();
			a.close();
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public ArrayList<BoardReply> showRe (int boardNum){
		 a=DBManager.getConnection();
		ArrayList<BoardReply> A=new ArrayList<>();
		try {
			
			String sql="select * from board_reply where board_no=? order by idx desc";
			b=a.prepareStatement(sql);
			b.setInt(1, boardNum);
			r=b.executeQuery();
			
			while(r.next()) {
				BoardReply R=new BoardReply();
				R.setIdx(r.getInt(1));
				R.setBoard_no(r.getInt(2));
				R.setMem_name(r.getString(3));
				R.setContent(r.getString(4));
				R.setReg_date(r.getString(5));
				A.add(R);
			}
			r.close();
			b.close();
			a.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return A;
		
		
	}
	public ArrayList<BoardBean> search(String userName){
		a=DBManager.getConnection();
		ArrayList<BoardBean> L=new ArrayList<>(); 
		try {
		String sql="select nickname from s_member where nickname=?";
		b=a.prepareStatement(sql);
		b.setString(1, userName);
		r=b.executeQuery();
		while(r.next()) {
			BoardBean b=new BoardBean();
			b.setName(r.getString(1));
			L.add(b);
		}
		r.close();
		b.close();
		a.close();
		}catch(Exception e) {
			e.printStackTrace();
			
			
		}
		return L;
	}
	public boolean deletega(int idx) {
		a=DBManager.getConnection();
		try {
			String sql="delete from board_reply where board_no=?";
			b=a.prepareStatement(sql);
			b.setInt(1, idx);
			b.executeUpdate();
			String sql1="delete from board where idx=?";
			b1=a.prepareStatement(sql1);
			b1.setInt(1, idx);
			b1.executeUpdate();
			
			b.close();
			a.close();
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	public boolean deleteRe(int idx) {
		a=DBManager.getConnection();
		try {
			String sql="delete from board_reply where idx=?";
			b=a.prepareStatement(sql);
			b.setInt(1, idx);
			b.executeUpdate();
			
			b.close();
			a.close();
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
}
