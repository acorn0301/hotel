<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/073cb107c5.js"></script>
<link rel="stylesheet" href="css/yeStyle.css">
<script src="js/yeScript.js"></script>

</head>
<body>
<script type="text/javascript">
	
</script>
<div id="loginForm">
<form class="form-inline" action="loginProcess.do" method="post">
<div class="headTit">
	<h2 class="tit">로그인&nbsp;&nbsp;<i class="fas fa-sign-in-alt"></i></h2>
</div>
<br>
<div class="loginMsg">
<b>1st HOTEL</b>에 오신 것을 환영합니다.<br>
회원 아이디와 비밀번호를 입력해 주시기 바랍니다.<br><br>
</div>

<div class="form_group"></div>

<!-- 아이디 -->
<div id="formid">
	<div class="form_group">
	<input type="text" class="inputbox" id="user_id" name="id" placeholder="아이디를 입력해주세요" >
	</div>
</div>

<!-- 비밀번호 -->
<div>
	<div class="form_group">
	<input type="password" class="inputbox" id="user_pw" name="password" placeholder="비밀번호를 입력해주세요">
	</div>
</div>

<b id="chkmsg">${msg}</b><br><br>
<div class="col-sm-3 text-center">
	<input type="submit" value="로그인" id="loginOk">
</div>
<br>

<div id="loginPlus">
<a href="joinagree.do" id="joinPage">회원가입</a>
|
<a href="findIdform.do" id="findId">아이디 찾기</a>
|
<a href="findPwform.do" id="findPw">비밀번호 찾기</a>
</div>
</form>
</div>
</body>
</html>
