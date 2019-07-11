<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/hsStyle.css">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyAu9CgTNsqX_Fa3834zZQFqI09MK1sNwEc" ></script>
<style>
	#map_ma {width:100%; height:400px; clear:both; border:solid 1px red;}
</style>
</head>
<body>
<!-- 상단 메뉴바 -->
<div class="admin_subject_div">
	<div class="admin_subject_text">
		<a href="hotellist.do" class="subject_a">개요</a>
		<a href="room.do" class="subject_a">1st HOTEL</a>
		<a href="hoteladdress.do" class="subject_a">위치</a>
		<!-- <div class="subject_bar"></div> -->
	</div>
</div>
<!-- 소제목 -->
<div class="admin_title_div">
	<div class="admin_title_text">
		지점별 위치
	</div>
</div>

<!-- 버튼 클릭시 주소 이동 -->	
	<div class="btn-group">
		<button type="button" class="btn">서울</button>
		<button type="button" class="btn">제주</button>
		<button type="button" class="btn">광화문</button>
</div>

<br><br>

<div id="map_ma"></div>
<script type="text/javascript">
	$(document).ready(function() {
	var myLatlng = new google.maps.LatLng(37.499424,127.029031); // 위치값 위도 경도
	var Y_point			= 37.499424;		// Y 좌표
	var X_point			= 127.029031;		// X 좌표
	var zoomLevel		= 18;				// 지도의 확대 레벨 : 숫자가 클수록 확대정도가 큼
	var markerTitle		= "서울특별시";		// 현재 위치 마커에 마우스를 오버을때 나타나는 정보
	var markerMaxWidth	= 300;				// 마커를 클릭했을때 나타나는 말풍선의 최대 크기

// 말풍선 내용
	var contentString	= '<div>' +
	'<h2>1st Hotel 서울점</h2>'+
	'<p>1st Hotel 서울점 입니다.</p>' +
	'</div>';
	var myLatlng = new google.maps.LatLng(Y_point, X_point);
	var mapOptions = {
						zoom: zoomLevel,
						center: myLatlng,
						mapTypeId: google.maps.MapTypeId.ROADMAP
					}
	var map = new google.maps.Map(document.getElementById('map_ma'), mapOptions);
	var marker = new google.maps.Marker({
											position: myLatlng,
											map: map,
											title: markerTitle
	});
	var infowindow = new google.maps.InfoWindow(
												{
													content: contentString,
													maxWizzzdth: markerMaxWidth
												}
			);
	google.maps.event.addListener(marker, 'click', function() {
		infowindow.open(map, marker);
	});
});
</script>
</body>
</html>