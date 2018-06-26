<!-- 페이지 언어는 자바입니다.JSP 페이지의 스크립트 언어로 사용할 언어를 지정하는 속성 -->
<!-- JSP 페이지가 생성할 페이지의 종류는 text/html문서입니다. -->
<!-- 본 JSP 페이지는 euc-kr로 인코딩됩니다. -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!Doctype html>
<!-- 본 JSP페이지에서 import하여 사용할 클래스들 -->
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="kr.co.lkj.driverDB.DriverDB" %>

<!-- 이상 4개의 클래스들이 import 되어있음 -->

<%
	request.setCharacterEncoding("euc-kr"); //euc-kr로 문자 인코딩을 한다고 선언한다.
	
	Connection conn = null;	// Connection 객체를 conn 객체참조변수에 선언한다. 초기화.
	PreparedStatement pstmt = null;	//Preparedstatement 객체를 pstmt 객체참조변수에 선언한다. 초기화 
	
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
	
	//01 드라이버 로딩
	
	DriverDB db = new DriverDB();  
	conn = db.driverdb();
	
	
	//conn에 입력된 값 출력
	System.out.println(conn + "<---- conn");
	
	//03 Quary 준비(Statement,Prestatement 객체 생성)
	pstmt = conn.prepareStatement("INSERT INTO join_member (pb_id,pb_pw,pb_level,pb_name,pb_address,pb_email,pb_date) VALUES (?,?,?,?,?,?,now())");
	//pstmt에 쿼리문 포함 주소값이 잘 입력되었는지 출력한다. 
	System.out.println(pstmt + "<---pstmt 1");
	System.out.println(pstmt.getClass() + "<---pstmt.getClass()");
	
	//04 Quary 사용
	pstmt.setString(1, pb_id);
	pstmt.setString(2, pb_pw);
	pstmt.setString(3, pb_level);
	pstmt.setString(4, pb_name);
	pstmt.setString(5, pb_address);
	pstmt.setString(6, pb_email);
	System.out.println(pstmt + "<---pstmt 2");
	
	pstmt.executeUpdate();
	//05 Statement,Prestatement 객체 종료
	pstmt.close();
	
	//06 DB 종료(Connection 객체 종료)
	conn.close();
	
	response.sendRedirect(request.getContextPath() + "/pblist/pb_list.jsp");
%>





































