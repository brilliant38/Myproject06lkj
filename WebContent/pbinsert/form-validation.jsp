<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>form-validation</title>
	</head>
	<body>
		<form name="signUpForm" class="form" role="form">
		  <legend>ȸ������</legend>
		  <h4>AngularJS �� ����</h4>
		  <div class="row">
		    <div class="col-xs-6 col-md-6">
		      <input type="text" name="firstname" class="form-control input-lg" placeholder="��" />
		    </div>
		    <div class="col-xs-6 col-md-6">
		      <input type="text" name="lastname" class="form-control input-lg" placeholder="�̸�" />
		    </div>
		  </div>
		  <br>
		  <input type="text" name="email" class="form-control input-lg" placeholder="Email" />
		  <br>
		  <input type="password" name="password" class="form-control input-lg" placeholder="�н�����" />
		  <br>
		  <input type="password" name="confirm_password" class="form-control input-lg" placeholder="�н����� ���Է�" />
		  <br>
		  <label>���� : </label>
		  <input type="radio" name="gender" value="M">����
		  <input type="radio" name="gender" value="F">����
		  <br>
		  <button class="btn btn-lg btn-primary btn-block signup-btn" type="submit">ȸ������</button>
		</form>
	</body>
</html>