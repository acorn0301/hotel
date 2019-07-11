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

<div class="admin_body">

<div class="qna_body_title_div">
	<div class="qna_title_text">관리자페이지</div>
</div>

<div class="dashboard_div">
	<div class="admin_title_div">
		<div class="admin_title_text">객실예약</div>
	</div>
	<div class="dashboard_div_table">
		<ul>
			<li>
				<div class="dashboard_li_div" onclick="location.href='adminBookList.do?book_status=예약대기'">
					<i class='fas fa-check-circle color1' ></i>
				 	예약대기 <div class="dashboard_li_number color1" > ${status0 } <span class="dashboard_li_gun">건</span> </div>
				 </div>
				
			</li>
			<li>
				<div class="dashboard_li_div"  onclick="location.href='adminBookList.do?book_status=ChkIn'">
				<i class='fas fa-sign-in-alt color2'></i>
				 체크인 	<div class="dashboard_li_number color2" > ${statusCheckIn } <span class="dashboard_li_gun">건</span> 
				 </div>
				 </div>
			</li>
			<li><div class="dashboard_li_div"  onclick="location.href='adminBookList.do?book_status=ChkOut'">
				<i class='fas fa-sign-out-alt color3'></i>
				 체크아웃 <div class="dashboard_li_number color3"> ${statusCheckOut } <span class="dashboard_li_gun">건</span> </div></div></li>
			<li>
				<div class="dashboard_li_div li_last" onclick="location.href='adminBookList.do?book_status=예약완료'">
				<i class='fas fa-check-circle color4'  ></i>
				 예약완료 <div class="dashboard_li_number color4"> ${status1 } <span class="dashboard_li_gun">건</span></div>
				 </div>
			</li>
		</ul>
	</div>	
</div>
<div class="dashboard_div">
	<div class="admin_title_div">
		<div class="admin_title_text">룸서비스</div>
	</div>
	<div class="dashboard_div_table">
		<ul>
			<li><div class="dashboard_li_div" onclick="location.href='adminOrderList.do?room_status=접수'">
				<i class='fas fa-bell color5' ></i>
				신규주문 <div class="dashboard_li_number color5">${ostatus0 } <span class="dashboard_li_gun">건</span></div></div>
			</li>
			<li><div class="dashboard_li_div " onclick="location.href='adminOrderList.do?room_status=준비중'">
				<i class='fas fa-hamburger color2'></i>
				준비중 <div class="dashboard_li_number color2">${ostatus1 } <span class="dashboard_li_gun">건</span></div></div>
			</li>
			<li><div class="dashboard_li_div li_last" onclick="location.href='adminOrderList.do?room_status=완료'">
				<i class='fas fa-concierge-bell color3' ></i>
				처리완료 <div class="dashboard_li_number color3" >${ostatus2 } <span class="dashboard_li_gun">건</span></div></div>
			</li>
		</ul>
	</div>	
</div>
<div class="dashboard_div">
	<div class="admin_title_div">
		<div class="admin_title_text">문의사항</div>
	</div>
	
	<div class="dashboard_qna_div">
		<div class="dashboard_qna_divs">
			<div class="icon_with_badge">
				<i class='fas fa-phone color1'></i>
			</div>
				<span class="badge_number badge">${qcategory1 }</span>
				<div class="dashboard_qna_divs_text"><span>예약문의</span></div> 
			
		</div>
		<div class="dashboard_qna_divs">
			<div class="icon_with_badge">
				<i class='fas fa-home color2'></i>
			</div>	
				<span class="badge_number badge">${qcategory2 }</span>
				<div class="dashboard_qna_divs_text"><span>객실문의</span></div> 		
		</div>
		<div class="dashboard_qna_divs li_last_right">
			<div class="icon_with_badge">
				<i class='fas fa-money-bill-wave color3'></i>
			</div>
				<span class="badge_number badge">${qcategory3 }</span>
				<div class="dashboard_qna_divs_text"><span>가격문의</span></div>
		</div>
	</div>
	
</div>

<br><br><br><br>

</div>
</body>
</html>

