package mysns.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/**
 * File : DBManager.java
 * Desc : 占쎈쐻占쎈윥占쎈ぅ占쎈쐻占쎈윪�얠±�쐻占쎈윞占쎈뙃占쎈탶�⑥�ъ첓�뜝�럥�꼧占쎈쐻占쎈윥獒뺧옙 占쎈쐻占쎈윥占쎈옘占쎈눇�뙼蹂��굲 癲ル슪�맋�몭�씛�삕�걡占� 占쎈쐻占쎈윞繹먯궍�쐻占쎈윪占쎄데占쎈쐻占쎈윥獒뺧옙
 * @author 占쎈쐻占쎈윪占쎄쉴占쎈쐻占쎈윪�얜틶�쐻占쎈윪占쎌젳(dinfree@dinfree.com)
 * 
 */
public class DBManager {
	// 占쎈쐻占쎈윥占쎈ぅ占쎈쐻占쎈윪�얠±�쐻占쎈윞占쎈뙃占쎈탶�⑥�ъ첓�뜝�럥�꼧占쎈쐻占쎈윥獒뺧옙 �뜝�럡�뒋占쎈쐻占쎈짗占쎌굲�뜝�럩二� 占쎈쨬占쎈즵�뜮�꼯�쇊�뜝占� 占쎈쐻占쎈윞占쎈쭡占쎈쐻占쎈윥占쎄퐯
	Statement stmt = null;
	PreparedStatement pstmt = null;
	
	/**
	 * JNDI �뜝�럥�걫占쎈쐻�뜝占� 占쎈쐻占쎈윪�얠±�쐻占쎈윪占쎈츛占쎈쐻占쎈윥占쎈뤅 Connection 占쎈쨬占쎈즵�뜮�꼯�쇊�뜝占� �뜝�럥�렓�뜝�럥肉わ옙�룈
	 * @return
	 */
	public static Connection getConnection() {
		Connection conn;
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource) envContext.lookup("jdbc/winbo121");
			conn = ds.getConnection();
		}
		catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
			return null;
		}
		return conn;
	}
}