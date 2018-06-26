<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("EUC-KR");	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String pb_id = request.getParameter("pb_id");
	String pb_pw = request.getParameter("pb_pw");
	String pb_name = request.getParameter("pb_name");
	String pb_address = request.getParameter("pb_address");
	String pb_email = request.getParameter("pb_email");
	String pb_studentnumber = request.getParameter("pb_studentnumber");
	System.out.println(pb_id + "<-- pb_id");
	System.out.println(pb_pw + "<-- pb_pw");
	System.out.println(pb_name + "<-- pb_name");
	System.out.println(pb_address + "<-- pb_address");
	System.out.println(pb_email + "<-- pb_email");
	System.out.println(pb_studentnumber + "<-- pb_studentnumber");
		
	Class.forName("com.mysql.jdbc.Driver");
	
	String jdbcDriver = "jdbc:mysql://localhost:3306/pbproject?useUnicode=true&characterEncoding=euckr";
	String dbUser = "pbproject06id";
	String dbPass = "pbproject06pw";
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	System.out.println(conn + "<-- conn");
	
	
	pstmt = conn.prepareStatement("UPDATE join_member SET pb_id=?,pb_pw=?,pb_name=?,pb_address=?,pb_email=? WHERE pb_studentnumber=?");
	
	pstmt.setString(1, pb_id);
	pstmt.setString(2, pb_pw);
	pstmt.setString(3, pb_name);
	pstmt.setString(4, pb_address);
	pstmt.setString(5, pb_email);
	pstmt.setString(6, pb_studentnumber);
	
	
	pstmt.executeUpdate();
	
	response.sendRedirect(request.getContextPath() + "/pblist/pb_list.jsp");

%>