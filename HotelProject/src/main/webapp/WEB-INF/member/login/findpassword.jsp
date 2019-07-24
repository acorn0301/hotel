<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/yeStyle.css">
<script src="js/yeScript.js"></script>

</head>
<body>
<div id="findPwForm">
	<form action="findPw.do" method="post">
	<div class="headTit">
		<h2 class="tit">비밀번호 찾기</h2>
	</div><br><br>
		<p class="text-center">아래 가입하신 이름과 이메일주소를 입력하시면,<br>입력하신 이메일로 임시 비밀번호를 보내드립니다<br><br>
		<div class="form_group"></div>
		
		<div class="form_group">
			<input type="text" name="id" placeholder="아이디" class="inputbox" />
		</div>

		<div class="form_group">
			<input type="email" name="email" placeholder="이메일 주소" class="inputbox" />
		</div>
	
		<b id="chkmsg">${msg}</b><br><br>
		<div class="btncenter">
			<button id="findPwOk" type="submit">비밀번호 전송</button>
		</div>
	</form>
</div>

</body>
</html>

