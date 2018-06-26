<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<style>
		.green_window {
			display: inline-block;
			width: 200px; height: 34px;
			border: 3px solid #2db400;
			background: white;
		}
		.input_text {
			width: 348px; height: 21px;
			margin: 6px 0 0 9px;
			border: 0;
			line-height: 21px;
			font-weight: bold;
			font-size: 16px;
			outline: none;
		}
		.sch_smit {
			width: 54px; height: 40px;
			margin: 0; border: 0;
			vertical-align: top;
			background: #22B600;
			color: white;
			font-weight: bold;
			border-radius: 1px;
			cursor: pointer;
		}
		.sch_smit:hover {
			background: #56C82C;
		}
		body {
		  margin: 10px;
		  font-size: 14px;
		}
		select {
		  width: 100px;
		  padding: .8em .5em;
		  font-family: inherit;
		  background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%;
		  -webkit-appearance: none;
		  -moz-appearance: none;
		  appearance: none;
		  border: 1px solid #2DB400;
		  border-radius: 0px;
		}
		select::-ms-expand {
		  /* for IE 11 */
		  display: none;
		}
		</style>
	</head>
	<body>
		<form action="<%=request.getContextPath()%>/pbsearch/pb_search_list.jsp" method="post">
			<select name="sk">
				<option value="pb_id">아이디</option>
				<option value="pb_level">권한</option>
				<option value="pb_name">이름</option>
				<option value="pb_address">주소</option>
				<option value="pb_email">이메일</option>
				<option value="pb_date">등록날짜</option>
			</select>
			<span class='green_window'>
				<input type='text' class='input_text' name="sv">
			</span>
			<span class='green_window'>
				<input type='text' class='input_text' name="st">
			</span>
			<button type='submit' class='sch_smit'>검색</button>
		</form>
	</body>
</html>