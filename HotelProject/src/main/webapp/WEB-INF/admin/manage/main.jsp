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


<div class="dashboard_div">
	<div class="dashboard_div_title">
		<h3>객실예약</h3>
	</div>
	<div class="dashboard_div_table">
		<ul>
			<li><div class="dashboard_li_div">신규 예약 접수 <div class="dashboard_li_number"> ${status0 } </div></div></li>
			<li><div class="dashboard_li_div">오늘의 체크인 	<div class="dashboard_li_number"> ${statusCheckIn } </div></div></li>
			<li><div class="dashboard_li_div">오늘의 체크아웃 <div class="dashboard_li_number"> ${statusCheckOut } </div></div></li>
			<li><div class="dashboard_li_div li_last">접수 예약 완료 <div class="dashboard_li_number"> ${status1 } </div></div></li>
		</ul>
	</div>	
</div>
<div class="dashboard_div">
	<div class="dashboard_div_title">
		<h3>룸서비스</h3>
	</div>
	<div class="dashboard_div_table">
		<ul>
			<li><div class="dashboard_li_div">신규 주문 <div class="dashboard_li_number">${ostatus0 }</div></div></li>
			<li><div class="dashboard_li_div">준비 중 <div class="dashboard_li_number">${ostatus1 }</div></div></li>
		</ul>
	</div>	
</div>
<div class="dashboard_div">
	<div class="dashboard_div_title">
		<h3>문의사항</h3>
	</div>
	
</div>


</body>
</html>

