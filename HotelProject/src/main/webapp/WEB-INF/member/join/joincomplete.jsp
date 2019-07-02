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
<style type="text/css">
   #joincomplete{margin: 20px; text-align: center;}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="joincomplete">
<form class="form-inline" action="login.do" method="post">
<h1><i class="fas fa-bullhorn"></i></h1>
<h3>가입을 축하합니다 !</h3>
<b>1st HOTEL</b> 가입이 완료되었습니다<br>
로그인 후 다양한 서비스를 이용하실 수 있습니다<br>
<br>
<div class="col-sm-3 text-center">
<input type="submit" class="btn btn-basic" value="로그인 하러가기">
</div>
</form>
</div>
</body>
</html>