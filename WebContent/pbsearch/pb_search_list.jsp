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
		<title>�л� ���� �ý���</title>
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
				<th>�й�</th><th>���̵�</th><th>����</th><th>�̸�</th><th>�ּ�</th><th>�̸���</th><th>��ϳ�¥</th><th>����</th><th>����</th>
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
					System.out.println("1����_sk null sv�� null");
					String sql = "select pb_studentnumber,pb_id, pb_pw, pb_level, pb_name, pb_address, pb_email, left(pb_date,10) as pb_date from join_member";
					pstmt = conn.prepareStatement(sql);
					
					} else if (sk != null && sv.equals("")) {
					System.out.println("2����_sk �����ְ�, sv�� ����");
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
						System.out.println("3����_sk �����ְ�, sv�� �����ִ�.");
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
					<a href="<%= request.getContextPath() %>/pbupdate/pb_update_form.jsp?send_nb=<%= rs.getString("pb_studentnumber")%>">������ư</a>			
				</td>
				<td>
					<a href="<%= request.getContextPath() %>/pbdelete/pb_delete_pro.jsp?send_nb=<%= rs.getString("pb_studentnumber")%>">������ư</a>			
				</td>
			</tr>
		
		<%			
				
				}
			} catch(SQLException ex) {
				out.println(ex.getMessage());
				ex.printStackTrace();
			} finally {
				// 6. ����� Statement ����
				if (rs != null) try { rs.close(); } catch(SQLException ex) {}
				if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
				
				// 7. Ŀ�ؼ� ����
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