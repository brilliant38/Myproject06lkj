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
	
	DriverDB db = new DriverDB(); // �޼ҵ带 ������ Ŭ������ ��ü ����
	conn = db.driverdb(); //����̹� ���� �Ϸ� �� ���ϵ� ��ü�� �ּҰ� ����
	
	String sql = "select pb_studentnumber, pb_id, pb_pw, pb_level, pb_name from join_member where pb_id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, pb_id);
	System.out.println(pstmt + "<---- pstmt");
	
	rs = pstmt.executeQuery();
	
	if(rs.next()) {
		if(pb_id.equals(rs.getString(2))) {
			if(pb_pw.equals(rs.getString(3))) {
				System.out.println("�α��� ����");
				session.setAttribute("S_ID", rs.getString(2));
				session.setAttribute("S_NAME", rs.getString(5));
				session.setAttribute("S_LEVEL", rs.getString(4));
%>
				<script type="text/javascript">
					alert('�α��� ����');
					location.href='<%= request.getContextPath()%>/index/index.jsp';
				</script>
<%				
				
			} else {
				System.out.println("��й�ȣ�� Ʋ���ϴ�.");
%>
				<script type="text/javascript">
						alert('��й�ȣ�� Ʋ���ϴ�.');
						location.href='<%= request.getContextPath()%>/index/index.jsp';
					</script>
<%
			}
		} else {
			System.out.println("���Ե� ���̵� �����ϴ�.");
%>
			<script type="text/javascript">
					alert('���Ե� ���̵� �����ϴ�.');
					location.href='<%= request.getContextPath()%>/index/index.jsp';
				</script>
<%
		}
	}
%>

