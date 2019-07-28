<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">

<title>1st Hotel</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> 

<!-- 공용 css -->
<link rel="stylesheet" href="css/mainStyle.css">
<!-- 공용 js -->
<script src="js/myScript.js"></script>

</head>


<body>


<!--  header 와 footer는 고정된 내용이고, container만 매번 바뀌어서 출력된다 -->
<header>
	<nav class="navbar navbar-inverse">
	  <div class="container-fluid">
		
			<jsp:include page="header.jsp"></jsp:include>
		
	  </div>
	</nav>
</header>

<div id="mainContainer">
	<jsp:include page="${container }"></jsp:include>
</div>


<footer>
	<div id="mainFooter">
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</footer>

</body>
</html>

