<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/jhStyle.css">

</head>
<body>
	<div class="react_body"> 
	
	<embed src="http://localhost:3000/${sessionScope.member_num ==null ? 0 : sessionScope.member_num }"  style="width:100%; height:-webkit-fill-available;">
	</div>
</body>
</html>

