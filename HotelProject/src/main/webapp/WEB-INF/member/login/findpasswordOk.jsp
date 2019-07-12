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
<div id="findPwOkForm">
<form class="form-inline" action="login.do" method="post">
<br>
<!-- <h1><i class="fas fa-bullhorn"></i></h1> -->
<h4>귀하의 이메일 주소로 임시 비밀번호를 발송 하였습니다</h4>
<h5>이메일 확인 후 로그인 해주시기 바랍니다</h5>
<br>
<br>
<div class="col-sm-3 text-center">
<input type="submit" id="loginGo" value="로그인 하러가기">
</div>
</form>
</div>

</body>
</html>

