package mysns.sns;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


import mysns.util.*;

public class MessageDAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	
	
	public ArrayList<MessageSet> getAll(int cnt, String suid) {
		ArrayList<MessageSet> datas = new ArrayList<MessageSet>();
		conn = DBManager.getConnection();
		String sql;

		try {
			/*占쎌뒙占쎈룱獒뺢쒀�삕占쎌읇占쎈쐻占쎈윪�억옙 占쎈쐻占쎈윥�뵳�뜴�쐻占쎈윞占쎈�э옙�쐻占쎈윪�굢酉대쐻占쎈윪甕곤옙 占쎈섀占쎈Ŋ�굲占쎈쐻占쎈윪獄�占� 癲ル슢�뀈泳�怨뀀눀�뜝占� 占쎌녃域민삳땫�솻洹λ닰占쎌굲濚밸㉡�삕 占쎈쐻占쎈윥占쎈떋占쎈쐻占쎈윥�뜮�씤異�嚥〓끃�굲 占쎌쐺獄쏅챷援←뭐癒뀁삕 占쎈쐻占쎈윪占쎌벁癲ル슪�맔占쎌굲 占쎈눇�뙼�봿�뮝�뜝�럥六ｅ뜝�럥�떛�뜝�럥�땾�뜝�럥援� 占쎈쐻占쎈윥�젆袁ㅼ녃域민삳땫�뜝�럥�맪占쎈쐻占쎈윪�앓띕쨬占쎈즸占쎌굲 占쎈눇�뙼�맪占쏙퐦�삕占쎌젳占쎈쐻占쎈윥�뵳占쏙옙�쐻占쎈윥獒뺣맢�눇�뙼蹂��굲*/
			if((suid == null) || (suid.equals(""))) {
				sql = "select * from s_message order by date desc limit 0,?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, cnt);
			}
			
			else{
				sql = "select * from s_message where uid=? order by date desc limit 0,?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,suid);
				pstmt.setInt(2,cnt);
			}

			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				MessageSet ms = new MessageSet();
				Message m = new Message();
				ArrayList<Reply> rlist = new ArrayList<Reply>(); /*占쎈쨬占쎈즲占쎄텠占쎈슪�삕 占쎈눇�뙼�봿�뮝�뜝�럥六ｅ뜝�럥�떛�뜝�럥�땻鶯ㅼ룆履뗰옙�굲�뜝�럥�렡 �뜝�럥苑욃뜝�럥�뿴占쎈눀占쎄섶占쎌굲�뜝�럥萸� 占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈윥占쎈꺔占쎈섀占쎈Ŋ�굲占쎈쐻占쎈윪�억옙 占쎈쐻占쎈윥�젆袁ъ삕筌뤿뙋�삕�뜝�뜴�쐻占쎈쑞占쎈퓠占쎈쐻�뜝占� �뜝�럥竊뤷뜝�럥�맃占쎈뎨�ⓦ끉�굲�뜝�럥瑗�*/
				ArrayList<Goods> glist = new ArrayList<Goods>(); /*占쎈쨬占쎈즲占쎄텠占쎈슪�삕 占쎈눇�뙼�봿�뮝�뜝�럥六ｅ뜝�럥�떛�뜝�럥�땻鶯ㅼ룆履뗰옙�굲�뜝�럥�렡 �뜝�럥苑욃뜝�럥�뿴占쎈눀占쎄섶占쎌굲�뜝�럥萸� 占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈윥占쎈꺔占쎈섀占쎈Ŋ�굲占쎈쐻占쎈윪�억옙 占쎈쐻占쎈윥�젆袁ъ삕筌뤿뙋�삕�뜝�뜴�쐻占쎈쑞占쎈퓠占쎈쐻�뜝占� �뜝�럥竊뤷뜝�럥�맃占쎈뎨�ⓦ끉�굲�뜝�럥瑗�*/
				m.setMid(rs.getInt("mid"));
				m.setMsg(rs.getString("msg"));
				m.setDate(rs.getDate("date")+" / "+rs.getTime("date"));
				m.setUid(rs.getString("uid"));
				m.setImg(rs.getString("img"));
				String rsql = "select *  from s_reply where mid=? order by date desc";
				pstmt = conn.prepareStatement(rsql);
				pstmt.setInt(1,rs.getInt("mid"));
				ResultSet rrs = pstmt.executeQuery();
				while(rrs.next()) {
					Reply r = new Reply();
					r.setRid(rrs.getInt("rid"));
					r.setUid(rrs.getString("uid"));
					r.setRmsg(rrs.getString("rmsg"));
					r.setDate(rrs.getDate("date")+"/"+rrs.getTime("date"));
					rlist.add(r);
				}
				String gsql="select * from goods where mid=?";
				pstmt = conn.prepareStatement(gsql);
				pstmt.setInt(1,rs.getInt("mid"));
				ResultSet grs = pstmt.executeQuery();
				while(grs.next()) {
					Goods g=new Goods();
					g.setMid(grs.getInt(1));
					g.setUid(grs.getString(2));
					glist.add(g);
				}
				
				m.setFavcount(glist.size()); /*�뜝�럥苑욃뜝�럥�뿴占쎈눀占쎄섶占쎌굲�뜝�럥萸� 占쎈쨬占쎈즸占쎌굲占쎈쐻占쎈윥占쎈묄占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈윪占쎄텑*/
				m.setReplycount(rlist.size()); /*占쎈쐻占쎈윥占쎈꺔占쎈섀占쎈Ŋ�굲 占쎈쨬占쎈즸占쎌굲占쎈쐻占쎈윥占쎈묄 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈윪占쎄텑*/
				
				ms.setMessage(m);
				ms.setRlist(rlist); /*占쎈쐻占쎈윥占쎈꺔占쎈섀占쎈Ŋ�굲�뜝�럥�렓�뜝�럥遊얕짆�쉩�쐻占쎈윥獄��뭿�쐻占쎈윥�뤃占�*/
				ms.setGlist(glist); /*�뜝�럥苑욃뜝�럥�뿴占쎈눀占쎄섶占쎌굲�뜝�럥萸� �뜝�럥�렓�뜝�럥遊얕짆�쉩�쐻占쎈윥獄��뭿�쐻占쎈윥�뤃占�*/
				datas.add(ms); 
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getErrorCode());
		}
		finally {
			try {
				
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println(e.getErrorCode());
			}
		}		
		return datas;
	}
	
	
	public boolean newMsg(Message msg) {
		conn = DBManager.getConnection();
		String sql = "insert into s_message(uid, msg, date,img) values(?,?,now(),?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, msg.getUid());
			pstmt.setString(2, msg.getMsg());
			pstmt.setString(3, msg.getImg());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getErrorCode());
			return false;
		}
		finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return true;	
}
	
	
	public boolean newReply(Reply reply) {
		conn = DBManager.getConnection();
		String sql = "insert into s_reply(mid,uid,rmsg,date) values(?,?,?,now())";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reply.getMid());
			pstmt.setString(2, reply.getUid());
			pstmt.setString(3, reply.getRmsg());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getErrorCode());
			return false;
		}
		finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return true;
	}
	
	
	public boolean delReply(int rid) {
		conn = DBManager.getConnection();
		String sql = "delete from s_reply where rid = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rid);;
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getErrorCode());
			return false;
		}
		finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return true;
	}
	public boolean delMsg(int mid) {
		conn = DBManager.getConnection();
		String sql="delete from goods where mid = ?";
		String sql1 = "delete from s_reply where mid = ?";
		String sql2 = "delete from s_message where mid = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mid);
			pstmt.executeUpdate();
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, mid);
			pstmt.executeUpdate();
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, mid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getErrorCode());
			return false;
		}
		finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return true;	
	}
	
	
	public void favorite(int mid,String uid) throws SQLException {
		conn = DBManager.getConnection();
	
		
		try {
			String sql = "insert into goods values (?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mid);
			pstmt.setString(2, uid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			String sql = "delete from goods where mid=? and uid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mid);
			pstmt.setString(2, uid);
			pstmt.executeUpdate();
			
		}
		finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public ArrayList<Goods> showfavor(int mid) {
		conn = DBManager.getConnection();
		
		ArrayList<Goods> g=new ArrayList<Goods>();
		try {
			
			String sql = "select * from goods where mid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mid);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Goods g1=new Goods();
				g1.setMid(rs.getInt(1));
				g1.setUid(rs.getString(2));
				g.add(g1);
			}
				
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}

		return g;	
		
	}
	public ArrayList<Reply> showreply(int mid) {
		conn = DBManager.getConnection();
		
		ArrayList<Reply> R=new ArrayList<Reply>();
		try {
			
			String sql = "select * from s_reply where mid=? order by date desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mid);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Reply r=new Reply();
				r.setRid(rs.getInt(1));
				r.setMid(rs.getInt(2));
				r.setUid(rs.getString(3));
				r.setDate(rs.getDate("date")+"/"+rs.getTime("date"));
				r.setRmsg(rs.getString(5));
			R.add(r);
			}
				
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}

		return R;	
		
	}
	public ArrayList<Message> showImg() {
		conn = DBManager.getConnection();
		
		ArrayList<Message> M=new ArrayList<Message>();
		try {
			
			String sql = "select img,msg from s_message order by date desc";
			pstmt = conn.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Message m1=new Message();
				m1.setMsg(rs.getString("msg"));
				m1.setImg(rs.getString("img"));
				
				M.add(m1);
			}
			rs.close();
			pstmt.close();
			conn.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}

		return M;	
		
	}
	
		
	}

