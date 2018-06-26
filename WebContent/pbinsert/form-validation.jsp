<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>form-validation</title>
	</head>
	<body>
		<form name="signUpForm" class="form" role="form">
		  <legend>회원가입</legend>
		  <h4>AngularJS 폼 데모</h4>
		  <div class="row">
		    <div class="col-xs-6 col-md-6">
		      <input type="text" name="firstname" class="form-control input-lg" placeholder="성" />
		    </div>
		    <div class="col-xs-6 col-md-6">
		      <input type="text" name="lastname" class="form-control input-lg" placeholder="이름" />
		    </div>
		  </div>
		  <br>
		  <input type="text" name="email" class="form-control input-lg" placeholder="Email" />
		  <br>
		  <input type="password" name="password" class="form-control input-lg" placeholder="패스워드" />
		  <br>
		  <input type="password" name="confirm_password" class="form-control input-lg" placeholder="패스워드 재입력" />
		  <br>
		  <label>성별 : </label>
		  <input type="radio" name="gender" value="M">남자
		  <input type="radio" name="gender" value="F">여자
		  <br>
		  <button class="btn btn-lg btn-primary btn-block signup-btn" type="submit">회원가입</button>
		</form>
	</body>
</html>