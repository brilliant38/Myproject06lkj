<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!Doctype html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import="kr.co.lkj.driverDB.DriverDB" %>
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
					<table class="type11">
						<thead>
							<tr>
								<th>���̵�</th><th>����</th><th>�̸�</th><th>�ּ�</th><th>�̸���</th><th>��ϳ�¥</th><th>����</th><th>����</th>
							</tr>
						</thead>
						<%	
							request.setCharacterEncoding("euc-kr");
							
							Connection conn = null;
							PreparedStatement pstmt = null;
							ResultSet rs = null;
							
							try {
								
								DriverDB db = new DriverDB();  
								conn = db.driverdb();
								
								if(conn == null) {
									System.out.println("01 �����ͺ��̽� ���� ����");
								} else {
									System.out.println("02 �����ͺ��̽� ���� ����");
								}
							
								pstmt = conn.prepareStatement("select pb_studentnumber, pb_id, pb_pw, pb_level, pb_name, pb_address, pb_email, left(pb_date,10) as pb_date from join_member");
								System.out.println(pstmt + "<---pstmt�� ��� ��");
								rs = pstmt.executeQuery();
								System.out.println(rs + "<---rs�� ��� ��");
								while(rs.next()) { //next �޼ҵ尡 true�� �����ϴ��� Ȯ���ؾ��Ѵ�.(���̺� �����Ͱ� �ִ����� Ȯ��.)
						%>
									<tr>
										<td><%=rs.getString("pb_id") %></td>
										<td><%=rs.getString("pb_level") %></td>
										<td><%=rs.getString("pb_name") %></td>
										<td><%=rs.getString("pb_address") %></td>
										<td><%=rs.getString("pb_email") %></td>
										<td><%=rs.getString("pb_date") %></td>
										<td><a href="<%=request.getContextPath() %>/pbupdate/pb_update_form.jsp?send_nb=<%= rs.getString("pb_studentnumber") %>">����</a></td>
										<td><a href="<%=request.getContextPath() %>/pbdelete/pb_delete_pro.jsp?send_nb=<%= rs.getString("pb_studentnumber") %>">����</a></td>
									</tr>
						<%
								}
							}catch (SQLException ex) {
								out.println(ex.getMessage());
								ex.printStackTrace();
							} finally {
								if (rs != null) try { rs.close(); } catch (SQLException ex) {}
								if (pstmt != null) try { pstmt.close();} catch (SQLException ex) {}
								if (conn != null) try { conn.close(); } catch (SQLException ex) {}
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



































