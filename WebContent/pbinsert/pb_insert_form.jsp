 <!-- �� �������� ���� java�� ����Ѵ�. -->
 <!-- �� �������� ������ text/html�̸�, euc-kr������� ���ڵ��ȴ�. -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
 <!-- �� �������� html �����̴�. -->
 <!Doctype html>
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
					<form action="<%=request.getContextPath() %>/pbinsert/pb_insert_pro.jsp" method="post">
						<table>
							<tr>
								<td>���̵�</td>
								<td><input type="text" name="pb_id" size="20"></td>
							</tr>
							<tr>
								<td>��й�ȣ</td>
								<td><input type="text" name="pb_pw" size="20"></td>
							</tr>
							<tr>
								<td>����</td>
								<td><input type="text" name="pb_level" size="20"></td>
							</tr>
							<tr>
								<td>�̸�</td>
								<td><input type="text" name="pb_name" size="20"></td>
							</tr>
							<tr>
								<td>�ּ�</td>
								<td><input type="text" name="pb_address" size="20"></td>
							</tr>
							<tr>
								<td>�̸���</td>
								<td><input type="text" name="pb_email" size="20"></td>
							</tr>
							<tr>
								<td colspan="2"><input type="submit" value="ȸ�������ϱ�"></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
			<!-- //container -->
			<%@ include file="../pbmodule/bottom.jsp" %>
		</div>
		<!-- //frame -->
	</body>
</html>