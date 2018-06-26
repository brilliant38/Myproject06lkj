<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<div class="header">
<div><a href="<%=request.getContextPath() %>/index/index.jsp"><img src="<%=request.getContextPath() %>/image/pb_top.PNG"></a></div><br><br>

<%
		String S_ID = (String)session.getAttribute("S_ID");
		String S_NAME = (String)session.getAttribute("S_NAME");
		String S_LEVEL = (String)session.getAttribute("S_LEVEL");
		
		if(S_LEVEL == null) {
%>
			<!-- 로그인 전 시작화면 -->
			<div id="signup">
				<a href="<%=request.getContextPath() %>/pbinsert/pb_insert_form.jsp"><img src="<%=request.getContextPath() %>/image/sign_up.PNG"></a>
				<a href="<%=request.getContextPath() %>/pblogin/pb_login.jsp"><img src="<%=request.getContextPath() %>/image/log_in.PNG"></a>
			</div>
			<%
		}else{
			
			%>
			<h2><%= S_ID %></h2>
			<%= S_NAME %>님 <%= S_LEVEL %> 로 로그인중 
			<a href="<%= request.getContextPath() %>/pblogin/pb_logout.jsp"> 로그아웃 </a><br><br>
			<%
			if(S_LEVEL.equals("학생")){
				%>
				
				<a href="#">04상품검색</a>
				<%
			}else if(S_LEVEL.equals("교수")){
				%>
				
				<a href="<%= request.getContextPath() %>/goods/goods_insert_form.jsp">03상품등록</a>
				<a href="#">04상품검색</a>	
				<%
					}else if(S_LEVEL.equals("관리자")){
				%>	
				<a href="<%= request.getContextPath() %>/pbinsert/pb_insert_form.jsp">01회원가입</a>
				<a href="<%= request.getContextPath() %>/pbsearch/pb_search_list.jsp">02전체회원검색</a>
				<a href="<%= request.getContextPath() %>/goods/goods_insert_form.jsp">03상품등록</a>
				<a href="#">04상품검색</a>	
				<%
					}
				}
		%>
	
	
</div>
		<!-- //header -->