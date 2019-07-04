<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/mainStyle.css">

</head>
<body>

<!-- 아래 코드는 그냥 부트스트랩에서 가져온 네비게이션 태그임. 추후 우리에게 맞게 수정할 예정!! -->

 <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="home.do">1st HOTEL</a>
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
			<li><a href="join.do"><span class="glyphicon glyphicon-user"></span>&nbsp;회원가입</a></li>
		</c:if>
		<c:if test="${member_num != null }"> <!-- 로그인 상태에서만 보이는 메뉴 -->
			<li><a href="logout.do"><span class="glyphicon glyphicon-log-out"></span>&nbsp;로그아웃</a></li>		
			<li><a href="mypage.do"><span class="glyphicon glyphicon-user"></span>&nbsp;마이페이지</a></li>		
		</c:if>
		
		 <!— 로그인 되어있으면 바로 보여주고 안되어있으면 로그인할래 비회원조회할래 물어볼것 (컨트롤러에서 처리함) —>
		<li><a href="bookingCheck.do">예약확인</a></li>
		
		<li><a href="hotellist.do">지점안내</a></li>
		<li><a href="reviewlist.do">후기게시판</a></li>
		<li><a href="qnalist.do">문의게시판</a></li>
		<li><a href="roomaservice.do">룸서비스</a></li>
		<li><a href="booking.do">예약하기</a></li>
		
        
        
      </ul>
      

    </div>

</body>
</html>