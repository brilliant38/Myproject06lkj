<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<!DOCTYPE html>
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
				
		<div><%@ include file="/pbsearch/pb_search_form.jsp" %></div>
		
		
		<table class="type11">
			<thead>
			<tr>
				<th>학번</th><th>아이디</th><th>권한</th><th>이름</th><th>주소</th><th>이메일</th><th>등록날짜</th><th>수정</th><th>삭제</th>
			</tr>
			</thead>
		<% 
			request.setCharacterEncoding("euc-kr");
			
			String sk = request.getParameter("sk");
			String sv = request.getParameter("sv");
			String st = request.getParameter("st");
			
			System.out.println(sk + "<----sk");
			System.out.println(sv + "<----sv");
			System.out.println(st + "<----st");
			System.out.println();
			
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
				
				if (sk == null && sv == null){
					System.out.println("1조건_sk null sv는 null");
					String sql = "select pb_studentnumber,pb_id, pb_pw, pb_level, pb_name, pb_address, pb_email, left(pb_date,10) as pb_date from join_member";
					pstmt = conn.prepareStatement(sql);
					
					} else if (sk != null && sv.equals("")) {
					System.out.println("2조건_sk 값이있고, sv는 공백");
					String sql = "select pb_studentnumber,pb_id, pb_pw, pb_level, pb_name, pb_address, pb_email, left(pb_date,10) as pb_date from join_member where " + sk + "=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, sv);
					
					} else if (sk != null && sv != null) {
						if(sk.equals("pb_date")) {
							
							pstmt = conn.prepareStatement("select pb_studentnumber,pb_id, pb_pw, pb_level, pb_name, pb_address, pb_email, left(pb_date,10) as pb_date from join_member where pb_date between ? and ?");
							System.out.println(pstmt + "<---pstmt");
							pstmt.setString(1, sv);
							pstmt.setString(2, st);
							
						} else {
						System.out.println("3조건_sk 값이있고, sv도 값이있다.");
						pstmt = conn.prepareStatement("select pb_studentnumber,pb_id, pb_pw, pb_level, pb_name, pb_address, pb_email, left(pb_date,10) as pb_date from join_member where " + sk +"=?");
						System.out.println(pstmt + "<---pstmt");
						pstmt.setString(1, sv);
						}
					}
				System.out.println(pstmt + "<-- pstmt");
				
				rs = pstmt.executeQuery();
				System.out.println(rs + "<-- rs");
				
				while(rs.next()){
		%>
			<tr>
				<td><%= rs.getString("pb_studentnumber")%></td>
				<td><%= rs.getString("pb_id")%></td>
				<td><%= rs.getString("pb_level")%></td>
				<td><%= rs.getString("pb_name")%></td>
				<td><%= rs.getString("pb_address")%></td>
				<td><%= rs.getString("pb_email")%></td>
				<td><%= rs.getString("pb_date")%></td>
				<td>
					<a href="<%= request.getContextPath() %>/pbupdate/pb_update_form.jsp?send_nb=<%= rs.getString("pb_studentnumber")%>">수정버튼</a>			
				</td>
				<td>
					<a href="<%= request.getContextPath() %>/pbdelete/pb_delete_pro.jsp?send_nb=<%= rs.getString("pb_studentnumber")%>">삭제버튼</a>			
				</td>
			</tr>
		
		<%			
				
				}
			} catch(SQLException ex) {
				out.println(ex.getMessage());
				ex.printStackTrace();
			} finally {
				// 6. 사용한 Statement 종료
				if (rs != null) try { rs.close(); } catch(SQLException ex) {}
				if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
				
				// 7. 커넥션 종료
				if (conn != null) try { conn.close(); } catch(SQLException ex) {}
			}
		%>
			
			
		</table>
				</div>
			</div>
			<!-- //container -->
			<%@ include file="../pbmodule/bottom.jsp" %>
		</div>
		<!-- //frame -->
	</body>
</html>