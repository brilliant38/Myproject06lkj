<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<div class="header">
<div><a href="<%=request.getContextPath() %>/index/index.jsp"><img src="<%=request.getContextPath() %>/image/pb_top.PNG"></a></div><br><br>

<%
		String S_ID = (String)session.getAttribute("S_ID");
		String S_NAME = (String)session.getAttribute("S_NAME");
		String S_LEVEL = (String)session.getAttribute("S_LEVEL");
		
		if(S_LEVEL == null) {
%>
			<!-- �α��� �� ����ȭ�� -->
			<div id="signup">
				<a href="<%=request.getContextPath() %>/pbinsert/pb_insert_form.jsp"><img src="<%=request.getContextPath() %>/image/sign_up.PNG"></a>
				<a href="<%=request.getContextPath() %>/pblogin/pb_login.jsp"><img src="<%=request.getContextPath() %>/image/log_in.PNG"></a>
			</div>
			<%
		}else{
			
			%>
			<h2><%= S_ID %></h2>
			<%= S_NAME %>�� <%= S_LEVEL %> �� �α����� 
			<a href="<%= request.getContextPath() %>/pblogin/pb_logout.jsp"> �α׾ƿ� </a><br><br>
			<%
			if(S_LEVEL.equals("�л�")){
				%>
				
				<a href="#">04��ǰ�˻�</a>
				<%
			}else if(S_LEVEL.equals("����")){
				%>
				
				<a href="<%= request.getContextPath() %>/goods/goods_insert_form.jsp">03��ǰ���</a>
				<a href="#">04��ǰ�˻�</a>	
				<%
					}else if(S_LEVEL.equals("������")){
				%>	
				<a href="<%= request.getContextPath() %>/pbinsert/pb_insert_form.jsp">01ȸ������</a>
				<a href="<%= request.getContextPath() %>/pbsearch/pb_search_list.jsp">02��üȸ���˻�</a>
				<a href="<%= request.getContextPath() %>/goods/goods_insert_form.jsp">03��ǰ���</a>
				<a href="#">04��ǰ�˻�</a>	
				<%
					}
				}
		%>
	
	
</div>
		<!-- //header -->