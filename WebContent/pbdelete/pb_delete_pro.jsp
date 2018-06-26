<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<!DOCTYPE html>
<% 
	request.setCharacterEncoding("euc-kr");
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	
	String send_nb = request.getParameter("send_nb");
	System.out.println(send_nb + " : confirm send_nb");
	
	
	Class.forName("com.mysql.jdbc.Driver");
	try{
			
		String dbdriver = "jdbc:mysql://localhost:3306/pbproject?useUnicode=true&characterEncoding=euckr";
		String dbid = "pbproject06id";
		String dbpw = "pbproject06pw";
		
		conn = DriverManager.getConnection(dbdriver, dbid, dbpw);
		System.out.println(conn + "<---conn");
		
		String sql = "DELETE FROM join_member WHERE pb_studentnumber=?";
		pstmt = conn.prepareStatement(sql);
		System.out.println(pstmt + "<---pstmt");
		
		pstmt.setString(1, send_nb);
		System.out.println(pstmt + "<---pstmt 입력 후");
		
		if (pstmt.executeUpdate() == 1){
			System.out.println("삭제가 완료되었습니다.");
			response.sendRedirect(request.getContextPath()+ "/pblist/pb_list.jsp");
		} else {
			System.out.println("잘못된 값이 입력되었으니 다시 입력해 주십시오.");
			response.sendRedirect("./pblist/pb_list.jsp");
		}
		
		
	} catch(SQLException ex) {
		out.println(ex.getMessage());
		ex.printStackTrace();
		} finally {
		if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		
		if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	}
%>