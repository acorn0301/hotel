<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/073cb107c5.js"></script>
<link rel="stylesheet" href="css/yeStyle.css">
<link rel="stylesheet" href="css/jhStyle.css">

<script src="js/yeScript.js"></script>

<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>
<script type="text/javascript">
	
</script>
<div id="loginForm">
<form class="form-inline" action="loginProcess.do" method="post">
<div class="headTit">
	<h2 class="tit">로그인&nbsp;&nbsp;<i class="fas fa-sign-in-alt"></i></h2>
</div>
<br>



	<!-- logo svg  -->
	
	<div class="logo_div">
	<?xml version="1.0" encoding="utf-8"?>
	<!-- Generator: Adobe Illustrator 22.0.1, SVG Export Plug-In . SVG Version: 6.00 Build 0)  -->
	<svg version="1.1" id="레이어_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px"
		 y="0px" viewBox="0 0 587 478.1" style="enable-background:new 0 0 587 478.1;" xml:space="preserve">
	<style type="text/css">
		.st0{fill:#60584D;}
		.st1{fill:#60584D;stroke:#60584D;stroke-width:0.75;stroke-miterlimit:10;}
		.st2{fill:#FFFFFF;}
		.st3{fill:#FFFFFF;stroke:#60584D;stroke-width:0.75;stroke-miterlimit:10;}
	</style>
	<g>
	<g>
		<path class="st0" d="M23.6,323.8l-18.5,4.5l-4.9-19.1l30.5-9.1h15.9V407h-23C23.6,407,23.6,323.8,23.6,323.8z"/>
		<path class="st0" d="M56.9,396.2l9.9-15.2c8.8,6.4,18,9.7,25.6,9.7c6.7,0,9.7-2.4,9.7-6.1v-0.3c0-5-7.9-6.7-16.8-9.4
			c-11.4-3.3-24.3-8.6-24.3-24.4v-0.3c0-16.5,13.3-25.8,29.7-25.8c10.3,0,21.5,3.5,30.3,9.4l-8.8,15.9c-8-4.7-16.1-7.6-22-7.6
			c-5.6,0-8.5,2.4-8.5,5.6v0.3c0,4.5,7.7,6.7,16.5,9.7c11.4,3.8,24.6,9.2,24.6,24.1v0.3c0,18-13.5,26.2-31.1,26.2
			C80.4,408.5,67.7,404.7,56.9,396.2z"/>
		<path class="st0" d="M134.1,384v-38.5h-9.7v-19.7h9.7V305h23v20.8h19.1v19.7h-19.1v34.7c0,5.3,2.3,7.9,7.4,7.9
			c4.2,0,8-1.1,11.4-2.9v18.5c-4.9,2.9-10.5,4.7-18.2,4.7C143.6,408.4,134.1,402.8,134.1,384z"/>
		<path class="st0" d="M225.9,300.9h23.3v42h43v-42h23.3V407h-23.3v-42.6h-43V407h-23.3L225.9,300.9L225.9,300.9z"/>
		<path class="st0" d="M327.2,366.8v-0.3c0-23.3,18.8-42.3,44.1-42.3c25.2,0,43.8,18.6,43.8,42v0.3c0,23.3-18.8,42.3-44.1,42.3
			C345.8,408.8,327.2,390.2,327.2,366.8z M392.4,366.8v-0.3c0-12-8.6-22.4-21.4-22.4c-13.2,0-21.1,10.2-21.1,22.1v0.3
			c0,12,8.6,22.4,21.4,22.4C384.5,389,392.4,378.8,392.4,366.8z"/>
		<path class="st0" d="M428,384v-38.5h-9.7v-19.7h9.7V305h23v20.8h19.1v19.7H451v34.7c0,5.3,2.3,7.9,7.4,7.9c4.2,0,8-1.1,11.4-2.9
			v18.5c-4.9,2.9-10.5,4.7-18.2,4.7C437.5,408.4,428,402.8,428,384z"/>
		<path class="st0" d="M473.3,366.8v-0.3c0-23.2,16.5-42.3,40.2-42.3c27.1,0,39.6,21.1,39.6,44.1c0,1.8-0.2,3.9-0.3,6.1h-56.5
			c2.3,10.5,9.5,15.9,19.9,15.9c7.7,0,13.3-2.4,19.7-8.3l13.2,11.7c-7.6,9.4-18.5,15.2-33.2,15.2
			C491.3,408.8,473.3,391.7,473.3,366.8z M530.6,360c-1.4-10.3-7.4-17.3-17.1-17.3c-9.5,0-15.8,6.8-17.6,17.3H530.6z"/>
		<path class="st0" d="M563.6,296.3h23V407h-23V296.3z"/>
	</g>
	<g>
		<path class="st0" d="M112.5,446.3h6.2v11.1H130v-11.1h6.2v28H130v-11.2h-11.4v11.2h-6.2L112.5,446.3L112.5,446.3z"/>
		<path class="st0" d="M145.2,463.7L145.2,463.7c0-6.2,5-11.2,11.6-11.2s11.6,4.9,11.6,11.1v0.1c0,6.2-5,11.2-11.6,11.2
			C150.2,474.8,145.2,469.9,145.2,463.7z M162.4,463.7L162.4,463.7c0-3.2-2.3-6-5.6-6c-3.5,0-5.6,2.7-5.6,5.8v0.1
			c0,3.2,2.3,5.9,5.6,5.9C160.4,469.5,162.4,466.9,162.4,463.7z"/>
		<path class="st0" d="M177.8,468.2V458h-2.6v-5.2h2.6v-5.5h6.1v5.5h5v5.2h-5v9.2c0,1.4,0.6,2.1,2,2.1c1.1,0,2.1-0.3,3-0.8v4.9
			c-1.3,0.8-2.8,1.2-4.8,1.2C180.4,474.7,177.8,473.2,177.8,468.2z"/>
		<path class="st0" d="M195.8,463.7L195.8,463.7c0-6.2,4.4-11.2,10.6-11.2c7.2,0,10.4,5.6,10.4,11.6c0,0.5,0,1-0.1,1.6h-14.9
			c0.6,2.8,2.5,4.2,5.2,4.2c2,0,3.5-0.6,5.2-2.2l3.5,3.1c-2,2.5-4.9,4-8.8,4C200.6,474.8,195.8,470.3,195.8,463.7z M210.9,461.9
			c-0.4-2.7-2-4.6-4.5-4.6s-4.2,1.8-4.6,4.6H210.9z"/>
		<path class="st0" d="M225.6,445.1h6.1v29.2h-6.1V445.1z"/>
		<path class="st0" d="M273.7,471.6c-2.3,1.9-5,3.1-8.2,3.1c-5.4,0-9.4-3.1-9.4-8.1v-0.1c0-3.6,1.9-6.1,5.4-7.7
			c-1.4-1.9-2-3.7-2-5.6v-0.1c0-3.8,3.1-7.4,8.5-7.4c4.8,0,7.9,3.1,7.9,7v0.1c0,3.8-2.4,6-5.9,7.3l3.7,3.7c0.9-1.4,1.8-3.1,2.7-4.8
			l4.5,2.5c-1.1,2-2.3,4-3.7,5.9l4.1,4.1l-4.5,3.2L273.7,471.6z M270.2,468.1l-5.4-5.4c-1.8,1-2.6,2.3-2.6,3.7v0.1
			c0,2,1.6,3.3,3.9,3.3C267.6,469.7,269,469.1,270.2,468.1z M270.6,453.3L270.6,453.3c0-1.7-1.1-2.7-2.6-2.7c-1.6,0-2.7,1.2-2.7,2.8
			v0.1c0,1.2,0.5,2.2,1.6,3.5C269.3,456.1,270.6,455.1,270.6,453.3z"/>
		<path class="st0" d="M305.9,446.3h12.8c3.6,0,6.3,1,8.2,2.8c1.6,1.6,2.4,3.8,2.4,6.4v0.1c0,4.5-2.4,7.4-6,8.7l6.8,10h-7.2l-6-9
			h-0.1H312v9h-6.2v-28H305.9z M318.3,459.9c3,0,4.7-1.6,4.7-4v-0.1c0-2.6-1.8-4-4.8-4h-6.1v8h6.2V459.9z"/>
		<path class="st0" d="M336.8,463.7L336.8,463.7c0-6.2,4.4-11.2,10.6-11.2c7.2,0,10.4,5.6,10.4,11.6c0,0.5,0,1-0.1,1.6h-14.9
			c0.6,2.8,2.5,4.2,5.2,4.2c2,0,3.5-0.6,5.2-2.2l3.5,3.1c-2,2.5-4.9,4-8.8,4C341.5,474.8,336.8,470.3,336.8,463.7z M351.9,461.9
			c-0.4-2.7-2-4.6-4.5-4.6s-4.2,1.8-4.6,4.6H351.9z"/>
		<path class="st0" d="M364.6,471.5l2.6-4c2.3,1.7,4.8,2.6,6.8,2.6c1.8,0,2.6-0.6,2.6-1.6v-0.1c0-1.3-2.1-1.8-4.4-2.5
			c-3-0.9-6.4-2.3-6.4-6.4v-0.1c0-4.4,3.5-6.8,7.8-6.8c2.7,0,5.7,0.9,8,2.5l-2.3,4.2c-2.1-1.2-4.2-2-5.8-2c-1.5,0-2.2,0.6-2.2,1.5
			v0.1c0,1.2,2,1.8,4.4,2.6c3,1,6.5,2.4,6.5,6.4v0.1c0,4.8-3.6,6.9-8.2,6.9C370.8,474.7,367.5,473.7,364.6,471.5z"/>
		<path class="st0" d="M389.4,463.7L389.4,463.7c0-6.2,5-11.2,11.6-11.2s11.6,4.9,11.6,11.1v0.1c0,6.2-5,11.2-11.6,11.2
			C394.3,474.8,389.4,469.9,389.4,463.7z M406.6,463.7L406.6,463.7c0-3.2-2.3-6-5.6-6c-3.5,0-5.6,2.7-5.6,5.8v0.1
			c0,3.2,2.3,5.9,5.6,5.9C404.5,469.5,406.6,466.9,406.6,463.7z"/>
		<path class="st0" d="M421,452.9h6.1v4.3c1.2-3,3.2-4.9,6.8-4.7v6.4h-0.3c-4,0-6.5,2.4-6.5,7.6v7.9H421V452.9z"/>
		<path class="st0" d="M442.7,468.2V458h-2.6v-5.2h2.6v-5.5h6.1v5.5h5v5.2h-5v9.2c0,1.4,0.6,2.1,2,2.1c1.1,0,2.1-0.3,3-0.8v4.9
			c-1.3,0.8-2.8,1.2-4.8,1.2C445.2,474.7,442.7,473.2,442.7,468.2z"/>
		<path class="st0" d="M460.6,471.5l2.6-4c2.3,1.7,4.8,2.6,6.8,2.6c1.8,0,2.6-0.6,2.6-1.6v-0.1c0-1.3-2.1-1.8-4.4-2.5
			c-3-0.9-6.4-2.3-6.4-6.4v-0.1c0-4.4,3.5-6.8,7.8-6.8c2.7,0,5.7,0.9,8,2.5l-2.3,4.2c-2.1-1.2-4.2-2-5.8-2c-1.5,0-2.2,0.6-2.2,1.5
			v0.1c0,1.2,2,1.8,4.4,2.6c3,1,6.5,2.4,6.5,6.4v0.1c0,4.8-3.6,6.9-8.2,6.9C466.8,474.7,463.4,473.7,460.6,471.5z"/>
	</g>
	<path class="st1" d="M295.6,9.5c-66.4,0-120.3,53.9-120.3,120.3c0,10,1.3,19.8,3.6,29.1l6.1-2.2v20.4c2.9,6.8,6.5,13.3,10.5,19.4
		c0-0.1,0-0.2,0-0.2V152l7.8-3.8v58.6c0,0.1,0.1,0.3,0.1,0.4c2.9,3.5,6,6.7,9.3,9.9v-73.4l7.8-3.8V224c3,2.4,6.1,4.7,9.4,6.8v-95.4
		l7.8-3.8V234c0.2,0.5,0.4,1.1,0.5,1.6c2.9,1.6,5.8,3,8.8,4.3V133.1V81.4l7.8-4.8v60.8l9.4,5V70.7l7.8-4.8v80.6l12.5,6.7v-95
		l7.8-4.8v196c0.1,0.3,0.3,0.5,0.4,0.8c0.9,0,1.8,0.1,2.7,0.1c1.6,0,3.1-0.1,4.7-0.1V48.5l7.8-4.8v205.8c3.7-0.4,7.3-0.9,10.9-1.6
		V45.2l50,36.1V225c28.5-22,46.9-56.5,46.9-95.3C415.9,63.3,362,9.5,295.6,9.5z"/>
	</g>
	<g id="star2" class="twinkle1">
		<g>
			<path class="st2" d="M203,112.7c0.1,1.6,0.3,3.1,0.5,4.9c1.1-0.4,2.1-0.8,3.1-1c0.6-0.1,1.4,0.2,2,0.3c-0.5,0.4-0.9,1-1.5,1.2
				c-1,0.4-2,0.7-2.9,1c0.2,1.9,3,2.8,2.2,4.7c-0.3,0.1-0.7,0.2-1,0.3c-0.9-1.3-1.8-2.6-2.8-4c-1,1.4-2,2.7-3,4.1c-1-1-1-1,1.5-5
				c-1.6-0.5-3.1-1-4.7-1.5c0.1-1.9,1.1-1.5,2.2-1c0.9,0.4,1.9,0.6,3.2,1c0-1.8,0-3.3,0-4.8C202.2,112.8,202.6,112.7,203,112.7z"/>
		</g>
	</g>
	<g id="star1" class="twinkle2">
		<g>
			<path class="st1" d="M409.5,198.4c0.1,1.6,0.3,3.1,0.5,4.9c1.1-0.4,2.1-0.8,3.1-1c0.6-0.1,1.4,0.2,2,0.3c-0.5,0.4-0.9,1-1.5,1.2
				c-1,0.4-2,0.7-2.9,1c0.2,1.9,3,2.8,2.2,4.7c-0.3,0.1-0.7,0.2-1,0.3c-0.9-1.3-1.8-2.6-2.8-4c-1,1.4-2,2.7-3,4.1c-1-1-1-1,1.5-5
				c-1.6-0.5-3.1-1-4.7-1.5c0.1-1.9,1.1-1.5,2.2-1c0.9,0.4,1.9,0.6,3.2,1c0-1.8,0-3.3,0-4.8C408.7,198.5,409.1,198.5,409.5,198.4z"/>
		</g>
	</g>
	<path id="dot1" class="st1 twinkle3" d="M420.5,192.6L420.5,192.6c-1.2,0-2.2-1-2.2-2.2l0,0c0-1.2,1-2.2,2.2-2.2l0,0c1.2,0,2.2,1,2.2,2.2l0,0
		C422.8,191.5,421.8,192.6,420.5,192.6z"/>
	<path id="dot2" class="st3 twinkle4" d="M361.6,47.4L361.6,47.4c-1.2,0-2.2-1-2.2-2.2v0c0-1.2,1-2.2,2.2-2.2l0,0c1.2,0,2.2,1,2.2,2.2v0
		C363.8,46.4,362.8,47.4,361.6,47.4z"/>
	<path id="dot1_1_" class="st1 twinkle5" d="M180.4,48L180.4,48c-0.8,0.9-2.2,1-3.2,0.2v0c-0.9-0.8-1-2.2-0.2-3.2v0c0.8-0.9,2.2-1,3.2-0.2v0
		C181.1,45.7,181.2,47.1,180.4,48z"/>
	</svg>
		
	
	</div>
	
	
	
	
	
	<div class="loginMsg">	
	<b>1st HOTEL</b>에 오신 것을 환영합니다.<br>
	회원 아이디와 비밀번호를 입력해 주시기 바랍니다.<br><br>
	</div>

<div class="form_group"></div>

<!-- 아이디 -->
<div id="formid">
	<div class="form_group">
	<input type="text" class="inputbox" id="user_id" name="id" placeholder="아이디를 입력해주세요" >
	</div>
</div>

<!-- 비밀번호 -->
<div>
	<div class="form_group">
	<input type="password" class="inputbox" id="user_pw" name="password" placeholder="비밀번호를 입력해주세요">
	</div>
</div>

<b id="chkmsg">${msg}</b><br>
<div class="btncenter"  style="margin-bottom: 10px;">
	<input type="submit" value="로그인" id="loginOk" style="height: 40px;">
</div>

<%-- <div class="col-sm-3 text-center">
	<div class="google_login">
		<i class="fab fa-google-plus-square"></i>
		<a href="${google_url}">Google 로그인</a>
	</div>
</div><br> --%>

<!-- https://accounts.kakao.com/login?continue=https://kauth.kakao.com/oauth/authorize?client_id%3D648cef1155eab095ac302a90bb64baa6%26redirect_uri%3Dhttp://localhost:9000/HotelProject/kakaoLogin%26response_type%3Dcode#pageLoginPoll -->
<!-- 		<a href="https://kauth.kakao.com/oauth/authorize?client_id=648cef1155eab095ac302a90bb64baa6&redirect_uri=http://localhost:9000/HotelProject/kakaoLogin&response_type=code">
			<img src="images/mypage/kakao_account_login_btn.png" height="40px;">
		</a> -->
<!-- 		<a href="https://accounts.kakao.com/login?continue=https://kauth.kakao.com/oauth/authorize?client_id%3D648cef1155eab095ac302a90bb64baa6%26redirect_uri%3Dhttp://localhost:9000/HotelProject/kakaoLogin%26response_type%3Dcode#pageLoginPoll">
			<img src="images/mypage/kakao_account_login_btn.png" height="40px;">
		</a> -->

	<!-- <div class="loginMsg">	
		소셜계정으로 로그인
	</div> -->


<!-- 카카오 로그인 버튼 -->
	<div class="btncenter">
	<c:if test="${userId == null}">
		<a href="https://accounts.kakao.com/login?continue=https://kauth.kakao.com/oauth/authorize?client_id%3D648cef1155eab095ac302a90bb64baa6%26redirect_uri%3Dhttp://localhost:9000/HotelProject/kakaoLogin%26response_type%3Dcode#pageLoginPoll">
			<img src="images/mypage/kakao_btn.png" height="40px;">
		</a>
	</c:if>
	<c:if test="${userId != null}">
		<!-- <input type="button" value="로그아웃" onclick="location.href='kakaoLogout.do'"> -->
	</c:if>
	
	</div><br>

<div class="loginPlus">
<span><a href="joinagree.do" id="joinPage">회원가입</a></span>
|
<span><a href="findIdform.do" id="findId">아이디 찾기</a></span>
|
<span><a href="findPwform.do" id="findPw">비밀번호 찾기</a></span>
</div>
</form>
</div>

</body>
</html>
