package kr.co.lkj.driverDB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DriverDB {
	
	public Connection driverdb() throws ClassNotFoundException, SQLException {
		System.out.println("드라이버 로딩 완료");
		
		Class.forName("com.mysql.jdbc.Driver");
		
		String jdbcDriver = "jdbc:mysql://localhost:3306/pbproject?useUnicode=true&characterEncoding=euckr";
		String dbid = "pbproject06id";
		String dbpw = "pbproject06pw";
		
		Connection conn = DriverManager.getConnection(jdbcDriver, dbid, dbpw);
		System.out.println(conn + " : conn");
		
		return conn;
	}

}
