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
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>




<div class="admin_body">

	<div class="qna_body_title_div">
		<div class="qna_title_text">예약관리</div>
	</div>

	
	<div class="dashboard_div">
		<div class="admin_title_div">
			<div class="admin_title_text">
				<c:if test="${book_status==0 }">예약대기</c:if>
				<c:if test="${book_status==1 }">예약완료</c:if>
				<c:if test="${book_status==2 }">체크인</c:if>
				<c:if test="${book_status==3 }">숙박중</c:if>
				<c:if test="${book_status==4 }">체크아웃</c:if>
			</div>
		</div>
		<div class="dashboard_div_table">
			<ul>
			
				<c:forEach items="${list}" var="dto">
					<li>
						<div onClick="location.href='adminBookListDetail.do?book_num=${dto.book_num}'">
						<div class="dashboard_li_div2">
							<div class="booklist_div">
								<span class="list_hotel_local">${dto.hotel_local }점</span>
								<span class="list_room_local color2">${dto.room_local}호 &nbsp;&nbsp;</span>
								<span>
									
									<span class="list_hotel_local"><i class='fas fa-user color1'></i>&nbsp;${dto.head_count }&nbsp;</span>
									
									<c:if test="${dto.add_bed > 0}">
										<span class="glyphicon glyphicon-bed color6"></span>&nbsp;
									</c:if>
									
									<c:if test="${dto.breakfast_count >0 }">
										<i class='fas fa-utensils color7' ></i>
									</c:if>
									
									
								</span> 
							</div>
							
							<div class="booklist_div">
								<span class="list_name">${dto.name }님</span>
								<span class="list_id">
									<c:if test="${dto.id != 'nc_id' }"> (${dto.id })</c:if>
									<c:if test="${dto.id == 'nc_id' }"> (비회원예약)</c:if>
								</span>
								<span class="list_book_day color3"><fmt:formatDate value="${dto.book_day }" pattern="yyyy-MM-dd HH:mm"/></span>
							</div>
							
							<div class="booklist_div">
								<span class="list_check_in_out color4">
									<fmt:formatDate value="${dto.check_in }" pattern="MM / dd"/>
								 	-
								 	<fmt:formatDate value="${dto.check_out }" pattern="MM / dd "/></span>
									<span class="list_status">(${book_status })</span>
								
							</div>
						</div>
						</div>
					</li>	
				</c:forEach>
			<%-- 	<li><div class="dashboard_li_div">
					<i class='far fa-check-circle color1' ></i>
					 예약대기 <div class="dashboard_li_number color1" > ${status0 } <span class="dashboard_li_gun">건</span> </div></div></li>
				<li><div class="dashboard_li_div">
					<i class='fas fa-sign-in-alt color2'></i>
					 체크인 	<div class="dashboard_li_number color2" > ${statusCheckIn } <span class="dashboard_li_gun">건</span> </div></div></li>
				<li><div class="dashboard_li_div">
					<i class='fas fa-sign-out-alt color3'></i>
					 체크아웃 <div class="dashboard_li_number color3"> ${statusCheckOut } <span class="dashboard_li_gun">건</span> </div></div></li>
				<li><div class="dashboard_li_div li_last">
					<i class='fas fa-check-circle color4'></i>
					 예약완료 <div class="dashboard_li_number color4"> ${status1 } <span class="dashboard_li_gun">건</span></div></div></li> --%>
			</ul>
		</div>	
	</div>


</div>

</body>
</html>

