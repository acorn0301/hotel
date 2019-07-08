<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/yeStyle.css">
<style type="text/css">

</style>
<script src="js/yeScript.js"></script>
<script src="https://kit.fontawesome.com/073cb107c5.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>

<div id="EditForm">
<form class="form-inline" action="mypage.do" method="post">
<h4>내 정보 수정&nbsp;&nbsp;<i class="fas fa-user-edit"></i></h4>
<br>
	<div class="form_group"></div>
	<!-- 아이디 -->
	<div id="formid">
		<div class="form_group">
		<input type="text" class="inputbox" id="user_id" name="id" placeholder="아이디" readonly="readonly" value="${mbdto.id}">
		</div>
	</div>

	<!-- 비밀번호 -->
	<div>
		<div class="form_group">
		<input type="password" class="inputbox" id="user_pw" name="password" placeholder="비밀번호" required="required">
		</div>
	</div>

	<!-- 비밀번호 확인 -->
	<div>
		<div class="form_group">
		<input type="password" class="inputbox" id="user_pw2" name="password2" placeholder="비밀번호 확인" required="required">
		</div>
	</div>
	
	<!-- 이름 -->
	<div>
		<div class="form_group">
		<input type="text" class="inputbox" id="user_name" name="name" placeholder="이름" required="required" value="${mbdto.name}">
		</div>
	</div><br>

	<!-- 전화번호 -->
	<div class="telForm">
		<div class="form_group">
		<input type="text" class="inputbox" id="user_phone" name="phone" placeholder="전화번호" required="required" maxlength="11">
		</div>
	</div><br>

	<!-- 생년월일 -->
	<div class="dateForm">
		<select id="year" name="year" class="custom-select">
			<c:set var="n" value="1900" />
			<c:forEach begin="1900" end="2019">
				<option value="${n}">${n}</option>
				<c:set var="n" value="${n+1}" />
			</c:forEach>
		</select>
		<span>년 &nbsp;</span>
		
		<select id="month" name="month" class="custom-select">
			<c:set var="n" value="1" />
			<c:forEach begin="1" end="12">
				<option value="${n}">${n}</option>
				<c:set var="n" value="${n+1}" />
			</c:forEach>
		</select>
		<span>월 &nbsp;</span>
		
		<select id="day" name="day" class="custom-select">
			<c:set var="n" value="1" />
			<c:forEach begin="1" end="31">
				<option value="${n}">${n}</option>
				<c:set var="n" value="${n+1}" />
			</c:forEach>
		</select>
		<span>일 &nbsp;</span>
	</div>

  	<div class="form_group"></div>
	
	<!-- 이메일 -->
	<div>
		<div class="form_group">
		<input type="text" class="inputbox" name="email" id="user_email" placeholder="이메일  (ex) acorn@acorn.com" required="required">
		</div>
	</div><br>
	
	<div class="col-sm-3 text-center">
		<input type="submit"  value="수정 완료" id="editOk">
	</div><br>

</form>
</div>
</body>
</html>
