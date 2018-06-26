<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>학사 정보 시스템</title>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/nav.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/body.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/content.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/container.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/footer.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/header.css">
	</head>
	<body>
		<div class="frame">
			<%@ include file="../pbmodule/top.jsp" %>
			<div class="container">
			<%@ include file="../pbmodule/left.jsp" %>
				<div class="content">
<%	
	request.setCharacterEncoding("EUC-KR");	
	
	String send_nb = request.getParameter("send_nb");
	System.out.println(send_nb + "<-- send_nb");

	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	Class.forName("com.mysql.jdbc.Driver");
	try{
		String jdbcDriver = "jdbc:mysql://localhost:3306/pbproject?useUnicode=true&characterEncoding=euckr";
		String dbUser = "pbproject06id";
		String dbPass = "pbproject06pw";
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		System.out.println(conn + "<-- conn");
		
		pstmt = conn.prepareStatement("select * from join_member where pb_studentnumber=?");
		pstmt.setString(1, send_nb);
		
		rs = pstmt.executeQuery();
		System.out.println(rs + "<-- rs");

		if(rs.next()){
			rs.getString("pb_id");
			rs.getString("pb_pw");
			rs.getString("pb_name");
			rs.getString("pb_address");
			rs.getString("pb_email");
			rs.getString("pb_studentnumber");
		}
		
		String pb_id = rs.getString("pb_id");
		String pb_pw = rs.getString("pb_pw");
		String pb_name = rs.getString("pb_name");
		String pb_address = rs.getString("pb_address");
		String pb_email = rs.getString("pb_email");
		String pb_studentnumber = rs.getString("pb_studentnumber");
		System.out.println(pb_id + "<-- pb_id");
		System.out.println(pb_pw + "<-- pb_pw");
		System.out.println(pb_name + "<-- pb_name");
		System.out.println(pb_address + "<-- pb_address");
		System.out.println(pb_email + "<-- pb_email");
		System.out.println(pb_studentnumber + "<-- pb_studentnumber");
%>

<form action="<%= request.getContextPath() %>/pbupdate/pb_update_pro.jsp" method="post">
<input type="hidden" name="pb_studentnumber" value="<%=pb_studentnumber %>">
<table border="1">
<tr>
	<td>아이디</td>
	<td><input type="text" name="pb_id" size="20" value="<%= pb_id %>" readonly></td>
<tr>
<tr>
	<td>비밀번호</td>
	<td><input type="text" name="pb_pw" size="20" value="<%= pb_pw %>"></td>
<tr>
<tr>
	<td>이름</td>
	<td><input type="text" name="pb_name" size="20" value="<%= pb_name %>"></td>
<tr>
<tr>
	<td>주소</td>
	<td><input type="text" name="pb_address" size="20" value="<%= pb_address %>"></td>
<tr>
<tr>
	<td>이메일</td>
	<td><input type="text" name="pb_email" size="20" value="<%= pb_email %>"></td>
<tr>
<tr>
	<td colspan="4"><input type="submit" value="회원수정버튼"></td>
</tr>
</table>
</form>

<% 
	} catch(SQLException ex) {
		out.println(ex.getMessage());
		ex.printStackTrace();
	} finally {
		if (rs != null) try { rs.close(); } catch(SQLException ex) {}
		if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	}
%>

				</div>
			</div>
			<!-- //container -->
			<%@ include file="../pbmodule/bottom.jsp" %>
		</div>
		<!-- //frame -->
	</body>
</html>