<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/yeStyle.css">
<script src="js/yeScript.js"></script>
<script src="https://kit.fontawesome.com/073cb107c5.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>

<script type="text/javascript">
function check(){
	
	if(join.id.value.length < 7){
 		$('#user_id').val('');
		$('#user_id').attr('placeholder','아이디는 7자리 이상 입력해주세요!');
		return false;
	}
	
	if(join.password.value.length < 8){
		$('#user_pw').val('');
		$('#user_pw').attr('placeholder','비밀번호는 8자리 이상 입력해주세요!');
		return false;
	}
	
	if(join.password.value != join.password2.value){
		$('#user_pw2').val('');
		$('#user_pw2').attr('placeholder','비밀번호가 맞지않습니다 다시확인해주세요!');
		return false;
	}
	
	if(join.name.value.length < 2){
		$('#user_name').val('');
		$('#user_name').attr('placeholder', '이름 2자리 이상 입력해주세요!');
		return false;
	}
	
	if(isNaN(join.phone.value)){
		$('#user_phone').val('');
		$('#user_phone').attr('placeholder','11자리 숫자만 입력해주세요!');
		return false;
	}
	
	// 이메일 유효성 정규식검사
    var regExp = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	if(!regExp.test(join.email.value)) {
        $('#user_email').val('');
		$('#user_email').attr('placeholder','이메일 주소가 유효하지 않습니다!');
    	return false;
	}
	 
	return true;
	
}
</script>

<div id="joinForm">
<div class="headTit">
	<h2 class="tit">회원가입&nbsp;&nbsp;<i class="fas fa-user-plus"></i></h2>
</div>
<br>
<form name="join" class="form-inline" action="joinok.do" method="post" onsubmit="return check()">
	<div class="form_group"></div>
	<!-- 아이디 -->
	<div id="formid">
		<div class="form_group">
		<input type="text" class="inputbox" id="user_id" name="id" placeholder="아이디" required="required">
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
		<input type="text" class="inputbox" id="user_name" name="name" placeholder="이름" required="required">
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
			<c:set var="n" value="2019" />
			<c:forEach begin="1940" end="2019">
				<option value="${n}">${n}</option>
				<c:set var="n" value="${n-1}" />
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
		<input type="submit"  value="가입 완료" id="joinOk">
	</div><br>

</form>
</div>
</body>
</html>
