<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/yeStyle.css">
<style type="text/css">
	#joinForm {margin: 20px;}
	/* div #user_id {display: inline-block; float: left;} */
	#idBtn {display: inline-block; float: left;}
	#joinOk {width: 150px;}
</style>
<script src="js/yeScript.js"></script>
<script src="https://kit.fontawesome.com/073cb107c5.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<script type="text/javascript">

</script>

<div id="joinForm">
<h3>회원가입&nbsp;&nbsp;<i class="fas fa-user-plus"></i></h3>
<br>
<form class="form-inline" action="joinok.do" method="post">
	<!-- 아이디 -->
	<div class="form-group" id="formid">
		<label for="user_id">아이디</label> 
		<input type="text" class="form-control" id="user_id" name="id" placeholder="아이디">
		<button type="button" class="btn pull-right" id="idBtn" onclick="checkId()">중복확인</button>
		<span id="chkMsg"></span>
	</div><br>

	<!-- 비밀번호 -->
	<div class="form-group">
		<label for="user_pw">비밀번호</label>
		<input type="password" class="form-control" id="user_pw" name="password" placeholder="비밀번호">
	</div><br>

	<!-- 비밀번호 확인 -->
	<div class="form-group">
		<label for="user_pw2">비밀번호 확인</label> 
		<input type="password" class="form-control" id="user_pw2" name="password2" placeholder="비밀번호 확인">
	</div><br>

	<!-- 이름 -->
	<div class="form-group">
		<label for="user_name">이름</label> 
		<input type="text" class="form-control" id="user_name" name="name" placeholder="이름">
	</div><br>

	<!-- 성별 -->
	<div class="form-group">
	<label for="user_gender">성별</label><br>
	<div class="btn-group" data-toggle="buttons">
		<label for="user_gender" class="btn btn-default active"> 
		<input type="radio" name="gender" id="gen_m" autocomplete="off" checked value="M">남성
		</label> 
		
		<label class="btn btn-default active"> 
		<input type="radio" name="gender" id="gen_f" autocomplete="off" value="F">여성
		</label> 
			
		<label class="btn btn-default active"> 
		<input type="radio" name="gender" id="gen_n" autocomplete="off" value="N">비공개
		</label>
	</div>
	
	</div><br>

	<!-- 전화번호 -->
	<div class="form-group">
		<label for="user_phone">전화번호</label> 
		<input type="text" class="form-control" id="user_phone" name="phone" placeholder="하이픈(-) 없이 입력해주세요">
	</div><br>

	<!-- 생년월일 -->
	<div class="form-group">
		<label for="user_birth">생년월일</label><br>
		
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
		
	</div><br>
	
	<!-- 이메일 -->
	<div class="form-group">
		<label for="user_email">이메일</label> 
		<input type="text" class="form-control" name="email" id="user_email" placeholder="acorn@acorn.com">
	</div><br>
	
	<div class="col-sm-3 text-center">
		<input type="submit" class="btn btn-basic" value="가입 완료" id="joinOk">
	</div>

</form>
</div>
</body>
</html>
