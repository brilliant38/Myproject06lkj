<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%> 
<%@ page import="java.sql.*" %>
<%@ page import="kr.co.lkj.driverDB.DriverDB" %>
<!DOCTYPE html>
<% 
	request.setCharacterEncoding("euc-kr"); 
	
	Connection conn = null;	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String pb_id = request.getParameter("pb_id");
	String pb_pw = request.getParameter("pb_pw");
	
	System.out.println(pb_id + "<--pb_id");
	System.out.println(pb_pw + "<--pb_pw");
	
	DriverDB db = new DriverDB(); // 메소드를 참조할 클래스의 객체 생성
	conn = db.driverdb(); //드라이버 연결 완료 후 리턴된 객체의 주소값 저장
	
	String sql = "select pb_studentnumber, pb_id, pb_pw, pb_level, pb_name from join_member where pb_id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, pb_id);
	System.out.println(pstmt + "<---- pstmt");
	
	rs = pstmt.executeQuery();
	
	if(rs.next()) {
		if(pb_id.equals(rs.getString(2))) {
			if(pb_pw.equals(rs.getString(3))) {
				System.out.println("로그인 성공");
				session.setAttribute("S_ID", rs.getString(2));
				session.setAttribute("S_NAME", rs.getString(5));
				session.setAttribute("S_LEVEL", rs.getString(4));
%>
				<script type="text/javascript">
					alert('로그인 성공');
					location.href='<%= request.getContextPath()%>/index/index.jsp';
				</script>
<%				
				
			} else {
				System.out.println("비밀번호가 틀립니다.");
%>
				<script type="text/javascript">
						alert('비밀번호가 틀립니다.');
						location.href='<%= request.getContextPath()%>/index/index.jsp';
					</script>
<%
			}
		} else {
			System.out.println("가입된 아이디가 없습니다.");
%>
			<script type="text/javascript">
					alert('가입된 아이디가 없습니다.');
					location.href='<%= request.getContextPath()%>/index/index.jsp';
				</script>
<%
		}
	}
%>

