<!-- ������ ���� �ڹ��Դϴ�.JSP �������� ��ũ��Ʈ ���� ����� �� �����ϴ� �Ӽ� -->
<!-- JSP �������� ������ �������� ������ text/html�����Դϴ�. -->
<!-- �� JSP �������� euc-kr�� ���ڵ��˴ϴ�. -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!Doctype html>
<!-- �� JSP���������� import�Ͽ� ����� Ŭ������ -->
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="kr.co.lkj.driverDB.DriverDB" %>

<!-- �̻� 4���� Ŭ�������� import �Ǿ����� -->

<%
	request.setCharacterEncoding("euc-kr"); //euc-kr�� ���� ���ڵ��� �Ѵٰ� �����Ѵ�.
	
	Connection conn = null;	// Connection ��ü�� conn ��ü���������� �����Ѵ�. �ʱ�ȭ.
	PreparedStatement pstmt = null;	//Preparedstatement ��ü�� pstmt ��ü���������� �����Ѵ�. �ʱ�ȭ 
	
	String pb_id = request.getParameter("pb_id");
	String pb_pw = request.getParameter("pb_pw");
	String pb_level = request.getParameter("pb_level");
	String pb_name = request.getParameter("pb_name");
	String pb_address = request.getParameter("pb_address");
	String pb_email = request.getParameter("pb_email");
	System.out.println(pb_id + "<--pb_id");
	System.out.println(pb_pw + "<--pb_pw");
	System.out.println(pb_name + "<--pb_name");
	System.out.println(pb_address + "<--pb_address");
	System.out.println(pb_email + "<--pb_email");
	
	//01 ����̹� �ε�
	
	DriverDB db = new DriverDB();  
	conn = db.driverdb();
	
	
	//conn�� �Էµ� �� ���
	System.out.println(conn + "<---- conn");
	
	//03 Quary �غ�(Statement,Prestatement ��ü ����)
	pstmt = conn.prepareStatement("INSERT INTO join_member (pb_id,pb_pw,pb_level,pb_name,pb_address,pb_email,pb_date) VALUES (?,?,?,?,?,?,now())");
	//pstmt�� ������ ���� �ּҰ��� �� �ԷµǾ����� ����Ѵ�. 
	System.out.println(pstmt + "<---pstmt 1");
	System.out.println(pstmt.getClass() + "<---pstmt.getClass()");
	
	//04 Quary ���
	pstmt.setString(1, pb_id);
	pstmt.setString(2, pb_pw);
	pstmt.setString(3, pb_level);
	pstmt.setString(4, pb_name);
	pstmt.setString(5, pb_address);
	pstmt.setString(6, pb_email);
	System.out.println(pstmt + "<---pstmt 2");
	
	pstmt.executeUpdate();
	//05 Statement,Prestatement ��ü ����
	pstmt.close();
	
	//06 DB ����(Connection ��ü ����)
	conn.close();
	
	response.sendRedirect(request.getContextPath() + "/pblist/pb_list.jsp");
%>





































