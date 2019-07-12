<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/jhStyle.css">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>

<title>Hotel & Room Service </title>

</head>
<body>


<div class="admin_body">

	<div class="qna_body_title_div">
		<div class="qna_title_text">호텔관리</div>
	</div>

	
	<div class="dashboard_div">
		<div class="admin_title_div">
			<div class="admin_title_text">${hotel_local1 }</div>
		</div>
		<div class="dashboard_div_table">
			<ul>
			
				<c:forEach items="${list1}" var="dto">
				
				
					<li>
						<div onClick="location.href='adminBookListDetail.do?room_num=${dto.room_num}'">
							<div class="dashboard_li_div2">
								<div class="userlist_div">
									<div class="user_list_divs user_list_div_1"><img src="images/room/${dto.room_img }"></div>
									<div class="user_list_divs user_list_div_2">${dto.room_local}호  ${dto.room_name } ${dto.type }</div>
									<div class="user_list_divs user_list_div_3"><i class="fas fa-chevron-right arrow_right"></i></div>
								</div>
							</div>
						</div>
						
						<div class="clearBoth"></div>	
					</li>
					
						
				</c:forEach>
			</ul>
		</div>	
	</div>
	
		
	<div class="dashboard_div">
		<div class="admin_title_div">
			<div class="admin_title_text">${hotel_local2 }</div>
		</div>
		<div class="dashboard_div_table">
			<ul>
			
				<c:forEach items="${list2}" var="dto">
				
				
						<li>
						<div onClick="location.href='adminBookListDetail.do?room_num=${dto.room_num}'">
							<div class="dashboard_li_div2">
								<div class="userlist_div">
									<div class="user_list_divs user_list_div_1"><img src="images/room/${dto.room_img }"></div>
									<div class="user_list_divs user_list_div_2">${dto.room_local}호  ${dto.room_name } ${dto.type }</div>
									<div class="user_list_divs user_list_div_3"><i class="fas fa-chevron-right arrow_right"></i></div>
								</div>
							</div>
						</div>
						
						<div class="clearBoth"></div>	
					</li>
						
					
					
				</c:forEach>
			</ul>
		</div>	
	</div>
	
	
	
</div>

</body>
</html>



</body>
</html>

