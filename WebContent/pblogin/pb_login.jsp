<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="kr">
	<head>
		<meta charset="EUC-KR">
		<title>�α��� ȭ��</title>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/nav.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/body.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/content.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/container.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/footer.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/header.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/login.css">
	</head>
	<body>
		<div class="frame">
			<%@ include file="../pbmodule/top.jsp" %>
			
			<div class="container">
			<%@ include file="../pbmodule/left.jsp" %>
			
				<div class="content">
					<form class="signUp" id="signupForm" action="<%=request.getContextPath() %>/pblogin/pb_login_pro.jsp" method="post">
					   <h1 class="signUpTitle">�α���</h1>
					   <input type="text" class="signUpInput" name="pb_id" placeholder="���̵� �Է�" autofocus required>
					   <input type="password" class="signUpInput" name="pb_pw" placeholder="��й�ȣ �Է�" required>
					   <input type="submit" value="Ȯ��!" class="signUpButton">
					</form>
				</div>
			</div>
			
			<!-- //container -->
			<%@ include file="../pbmodule/bottom.jsp" %>
			
		</div>
		<!-- //frame -->
	</body>
</html>
