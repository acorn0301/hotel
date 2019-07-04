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
<style type="text/css">
	#loginBtn {width: 150px;}
	a {color: gray; text-align:right;}
	a:HOVER{ text-decoration: none; font-weight: bold;}
	#loginForm {margin: 20px;}
</style>
<script src="js/yeScript.js"></script>
</head>
<body>
<div id="loginForm">
<form class="form-inline" action="loginProcess.do" method="post">
<h3>로그인&nbsp;&nbsp;<i class="fas fa-sign-in-alt"></i></h3><br>
<b>1st HOTEL</b>에 오신 것을 환영합니다.<br>
회원 아이디와 비밀번호를 입력해 주시기 바랍니다.<br><br>
<input name="id" type="text" class="form-control" placeholder="아이디를 입력해주세요"><br>
<input name="password" type="password" class="form-control" placeholder="비밀번호를 입력해주세요"><br>
<b>${msg }</b><br>
<a href="join.do" id="joinPage">회원가입</a>
<div class="col-sm-3 text-center">
	<input type="submit" class="btn btn-basic" value="로그인" id="loginBtn">
</div>
</form>
</div>
</body>
</html>
