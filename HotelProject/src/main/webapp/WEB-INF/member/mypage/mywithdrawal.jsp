<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/yeStyle.css">
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

<div class="withdrawalForm">
<form action="withdrawalOk.do" method="post">
<div class="headTit">
	<h4 class="tit">회원 탈퇴&nbsp;&nbsp;</h4>
</div><br><br>
<p class="text-center">아래 가입하신 비밀번호를 입력하세요<br><br>

	<div class="form_group"></div>
	<!-- 아이디 -->
	<div class="form_group">
		<input type="text" class="inputbox" id="user_id" name="id" placeholder="아이디"> <!--  value="${mbdto.id }"  -->
	</div>
	<div class="check_font" id="id_check"></div>

	<!-- 비밀번호 -->
	<div class="form_group">
		<input type="password" class="inputbox" id="user_pw" name="password" placeholder="비밀번호" required="required">
	</div><br>
	
	<b id="chkmsg">${msg}</b><br><br>
	<div class="btncenter">
		<input type="submit" value="회원 탈퇴" id="withdrawalOk">
		<input type="button" value="취소" id="withdrawalCancel" onclick="history.back()">
	</div>
	<br>
	
</form>
</div>

</body>
</html>

