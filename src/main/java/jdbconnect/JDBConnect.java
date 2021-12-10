package jdbconnect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletContext;

public class JDBConnect {
	public Connection con;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;

	//기본생성자부터 만들어보자
	public JDBConnect() {
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			
			String url = "jdbc:oracle:thin:@localhost:1521:xe";			
			String id = "musthave";
			String pwd = "1234";
			con = DriverManager.getConnection(url, id, pwd);
			System.out.println("기본생성자로 연결 성공!");
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	//다른 생성자를 통해 연결해보장
	public JDBConnect(String driver, String url, 
			String id, String pwd) {
		try{
			Class.forName(driver);
			con = DriverManager.getConnection(url, id, pwd);
			
			System.out.println("다른 생성자로 연결에 성공했다!");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	//세번째 생성자를 만들어보장
	public JDBConnect(ServletContext application) {
		
		try {
			String driver = application.getInitParameter("OracleDriver");
			Class.forName(driver);
			String url = application.getInitParameter("OracleURL");
			String id = application.getInitParameter("OracleID");
			String pwd = application.getInitParameter("OraclePwd");
			
			con = DriverManager.getConnection(url, id, pwd);
			
			System.out.println("세번째 생성자로도 연결을 성공하나..");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//자원 반납 및 해제를 위한 close()함수입니다.
	public void close() {
		try {
			if(rs!=null)rs.close();
			if(psmt!=null)psmt.close();
			if(stmt!=null)stmt.close();
			if(con!=null)con.close();
			
			System.out.println("jdbc 자원 해제!");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}