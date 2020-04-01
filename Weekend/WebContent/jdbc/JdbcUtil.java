package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
public class JdbcUtil {
public static Connection getConnection() {
Connection con = null;
try {
Context initCtx = new InitialContext();
Context envCtx = (Context) initCtx.lookup("java:comp/env");
DataSource ds = (DataSource) envCtx.lookup("jdbc/mysql");
con = ds.getConnection();
con.setAutoCommit(false);
} catch (Exception e) {
e.printStackTrace();
}
return con;
}
public static void close(ResultSet rs) {
if (rs != null) {
try {
rs.close();
} catch (SQLException ex) {
}
}
}
public static void close(PreparedStatement stmt) {
if (stmt != null) {
try {
stmt.close();
} catch (SQLException ex) {
}
}
}
public static void close(Connection conn) {
if (conn != null) {
try {
conn.close();
} catch (SQLException ex) {
}
}
}
public static void commit(Connection con) {
try {
con.commit();
System.out.println("commit success");
} catch (Exception e) {
e.printStackTrace();
}
}
public static void rollback(Connection conn) {
if (conn != null) {
try {
conn.rollback();
} catch (SQLException ex) {
}
}
}
}