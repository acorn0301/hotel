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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>

</head>


<body>

<div id="mainContainer">
	<div class="review_body"> 
	
	<iframe style="border:0; width:100%; height: -webkit-fill-available;" src="http://firsthotel-review.herokuapp.com/${sessionScope.member_num ==null ? 0 : sessionScope.member_num }">
	</iframe>
	</div>
</div>

<%-- 
<!--  header 와 footer는 고정된 내용이고, container만 매번 바뀌어서 출력된다 -->
<header>
	<nav class="navbar navbar-inverse">
	  <div class="container-fluid">
		
			<!-- 아래 코드는 그냥 부트스트랩에서 가져온 네비게이션 태그임. 추후 우리에게 맞게 수정할 예정!! -->

 <div class="navbar-header my-navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand my-navbar-brand" href="home.do">
      	<img id="titleLogo" width="70px" src="images/logo/titleLogo2.svg">
      </a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
<!--         <li class="active"><a href="#">Home</a></li>
 -->  <!--       <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">Page 1 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Page 1-1</a></li>
            <li><a href="#">Page 1-2</a></li>
            <li><a href="#">Page 1-3</a></li>
          </ul>
        </li> -->
        
        
		<c:if test="${admin != null }"> <!-- 관리자 아이디로 접속시에만 보이는 메뉴 -->
			<li>관리자 메뉴</li>		
			
			<li><a href="adminMain.do">관리자메인</a></li>
			<li><a href="adminBook.do">예약현황</a></li>
			<li><a href="adminOrder.do">주문현황</a></li>
			<li><a href="adminDb.do">DB관리</a></li>
			
		</c:if>
	
		<c:if test="${member_num == null }"> <!-- 로그아웃 상태에서만 보이는 메뉴 -->
			<li><a href="login.do"><span class="glyphicon glyphicon-log-in"></span>&nbsp;로그인</a></li>
			<li><a href="joinagree.do"><span class="glyphicon glyphicon-user"></span>&nbsp;회원가입</a></li>
		</c:if>
		<c:if test="${member_num != null }"> <!-- 로그인 상태에서만 보이는 메뉴 -->
			<li><a href="logout.do"><span class="glyphicon glyphicon-log-out"></span>&nbsp;로그아웃</a></li>		
			<li><a href="mypage.do"><span class="glyphicon glyphicon-user"></span>&nbsp;마이페이지</a></li>		
		</c:if>
		
		<li class="padding_li"></li>
		
		<c:if test="${sessionScope.grade=='a' }">
			<li><a href="admin.do">관리자페이지</a></li>
			<li class="padding_li"></li>
		</c:if>
		
		
		
		
		<c:if test="${sessionScope.ishere==1 }">
			<li><a href="roomaservice.do">룸서비스</a></li>
		</c:if>
		
		
		
		
		 <!-- 로그인 되어있으면 바로 보여주고 안되어있으면 로그인할래 비회원조회할래 물어볼것 (컨트롤러에서 처리함) -->
<!-- 		<li><a href="bookingCheck.do">예약확인</a></li>
 -->		
		<li><a href="booking.do">빠른예약</a></li>
		
		
		<li><a href="reviewlist.do">리뷰게시판</a></li>
		<li><a href="qnalist.do">문의게시판</a></li>
		
		<li class="padding_li"></li>
		
		<li><a href="hotelroom.do">객실안내</a></li>		
		<li><a href="hotellist.do">지점안내</a></li>
		
		
		
        
        
      </ul>
      

    </div>

		
	  </div>
	</nav>
</header>

<div id="mainContainer">
	<div class="review_body"> 
	
	<iframe style="border:0; width:100%; height: -webkit-fill-available;" src="http://firsthotel-review.herokuapp.com/${sessionScope.member_num ==null ? 0 : sessionScope.member_num }">
	</iframe>
	</div>
</div>


<footer>
	<div id="mainFooter">
		<div id="footer_div">

	<div id="footer_menu_div">
		<span>1:1문의</span>|
		<span>법적고지 확인</span>|
		<span>사이트맵</span>
	</div>
	<div id="footer_sns_div">
		<span id="footer_sns_language"><i class="fa fa-globe"></i> Language &nbsp;&nbsp;<i class='fas fa-angle-down'></i>
		</span>
		
		<span class="sns_icons">
			<span class="sns_icon"><i class="fab fa-facebook-square"></i></span>
			<span class="sns_icon"><i class="fab fa-instagram"></i></span>
			<span class="sns_icon"><i class="fab fa-twitter"></i></span>
		</span>
	</div>

</div>
<div id="footer_copyright_div">
	<span>COPYRIGHT (c) THE 1st HOTEL CO., LTD. ALL RIGHTS RESERVED.</span>
</div>
	</div>
</footer> --%>

</body>
</html>


