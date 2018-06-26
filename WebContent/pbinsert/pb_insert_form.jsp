 <!-- 이 페이지의 언어는 java를 사용한다. -->
 <!-- 이 페이지의 종류는 text/html이며, euc-kr방식으로 인코딩된다. -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
 <!-- 이 페이지는 html 문서이다. -->
 <!Doctype html>
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
					<form action="<%=request.getContextPath() %>/pbinsert/pb_insert_pro.jsp" method="post">
						<table>
							<tr>
								<td>아이디</td>
								<td><input type="text" name="pb_id" size="20"></td>
							</tr>
							<tr>
								<td>비밀번호</td>
								<td><input type="text" name="pb_pw" size="20"></td>
							</tr>
							<tr>
								<td>권한</td>
								<td><input type="text" name="pb_level" size="20"></td>
							</tr>
							<tr>
								<td>이름</td>
								<td><input type="text" name="pb_name" size="20"></td>
							</tr>
							<tr>
								<td>주소</td>
								<td><input type="text" name="pb_address" size="20"></td>
							</tr>
							<tr>
								<td>이메일</td>
								<td><input type="text" name="pb_email" size="20"></td>
							</tr>
							<tr>
								<td colspan="2"><input type="submit" value="회원가입하기"></td>
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