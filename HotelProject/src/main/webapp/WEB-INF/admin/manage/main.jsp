<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>

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
				<div class="dashboard_li_div" onclick="location.href='adminBookList.do?book_status=0'">
					<i class='fas fa-check-circle color1' ></i>
				 	예약대기 <div class="dashboard_li_number color1" > ${status0 } <span class="dashboard_li_gun">건</span> </div>
				 </div>
				
			</li>
			<li>
				<div class="dashboard_li_div"  onclick="location.href='adminBookList.do?book_status=2'">
				<i class='fas fa-sign-in-alt color2'></i>
				 체크인 	<div class="dashboard_li_number color2" > ${statusCheckIn } <span class="dashboard_li_gun">건</span> 
				 </div>
				 </div>
			</li>
			<li><div class="dashboard_li_div"  onclick="location.href='adminBookList.do?book_status=4'">
				<i class='fas fa-sign-out-alt color3'></i>
				 체크아웃 <div class="dashboard_li_number color3"> ${statusCheckOut } <span class="dashboard_li_gun">건</span> </div></div></li>
			<li>
				<div class="dashboard_li_div li_last" onclick="location.href='adminBookList.do?book_status=1s'">
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
			<li><div class="dashboard_li_div" onclick="location.href='adminOrderList.do?room_status=0'">
				<i class='fas fa-bell color5' ></i>
				신규주문 <div class="dashboard_li_number color5">${ostatus0 } <span class="dashboard_li_gun">건</span></div></div>
			</li>
			<li><div class="dashboard_li_div " onclick="location.href='adminOrderList.do?room_status=1'">
				<i class='fas fa-hamburger color2'></i>
				준비중 <div class="dashboard_li_number color2">${ostatus1 } <span class="dashboard_li_gun">건</span></div></div>
			</li>
			<li><div class="dashboard_li_div li_last" onclick="location.href='adminOrderList.do?room_status=2'">
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

<div class="clearBoth"></div>


<div class="dashboard_div">
	<div class="admin_title_div">
		<div class="admin_title_text">DB관리</div>
	</div>
	
	<div class="dashboard_qna_div">
	
	
		<div class="dashboard_qna_divs" onclick="location.href='adminMemberList.do'">
			<div class="icon_with_badge">
				<i class='fas fa-users color8'></i>
			</div>
				<br>
				<div class="dashboard_qna_divs_text"><span>회원관리</span></div> 	
		</div>
		
		
		<div class="dashboard_qna_divs" onclick="location.href='adminMenuList.do'">
			<div class="icon_with_badge">
				<i class='fas fa-hamburger color9'></i>
			</div>	
				<br>
			
				<div class="dashboard_qna_divs_text"><span>메뉴관리</span></div> 		
		</div>
		
		
		<div class="dashboard_qna_divs li_last_right" onclick="location.href='adminHotelList.do'">
			<div class="icon_with_badge">
				<i class='fas fa-hotel color4'></i>
			</div>			
				<br>
				<div class="dashboard_qna_divs_text"><span>호텔관리</span></div>
		</div>
		
		
		
	</div>
	<div class="clearBoth"></div>
	
	<div class="dashboard_qna_div">
		<div class="dashboard_qna_divs">
			<div class="icon_with_badge">
				<i class='fas fa-user-tie color2'></i>
			</div>
			
				<br>
			
				<div class="dashboard_qna_divs_text"><span>직원관리</span></div> 
			
		</div>
		<div class="dashboard_qna_divs">
			<div class="icon_with_badge">
				<i class='fas fa-comments color1'></i>
			</div>	
				<br>
			
				<div class="dashboard_qna_divs_text"><span>리뷰관리</span></div> 		
		</div>
		<div class="dashboard_qna_divs li_last_right">
			<div class="icon_with_badge">
				<i class='fas fa-sitemap color6'></i>
			</div>
				
				<br>
				
				<div class="dashboard_qna_divs_text"><span>사이트관리</span></div>
		</div>
	</div>
	
	
<!-- 	<div class="dashboard_qna_div">
		<div class="dashboard_qna_divs">
			<div class="icon_with_badge">
				<i class='fas fa-phone color1'></i>
			</div>
				<div class="dashboard_qna_divs_text"><span>호텔관리</span></div> 
			
		</div>
		<div class="dashboard_qna_divs">
			<div class="icon_with_badge">
				<i class='fas fa-home color2'></i>
			</div>	
				<div class="dashboard_qna_divs_text"><span>직원관리</span></div> 		
		</div>
		<div class="dashboard_qna_divs li_last_right">
			<div class="icon_with_badge">
				<i class='fas fa-money-bill-wave color3'></i>
			</div>
				<div class="dashboard_qna_divs_text"><span>공지사항</span></div>
		</div>
	</div> -->
	
	
	
</div>

<div class="clearBoth"></div>



</div>
</body>
</html>

