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

<title>Log List</title>

</head>
<body>
<%
		String root=request.getContextPath();//프로젝트 루트 경로
%>

<div class="admin_body">

	<div class="qna_body_title_div">
		<div class="qna_title_text">
			<div class="arrow_back" onclick="location.href='admin.do'"><i class="fas fa-chevron-left"></i></div>
			<div>사이트관리</div>
			<div class="clearBoth"></div>	
		</div>
	</div>

	
	<div class="dashboard_div">
		<div class="admin_title_div">
			<div class="admin_title_text">관리자로그</div>
		</div>
		<div class="dashboard_div_table dashboard_log_table">
			<ul>
			
				<c:forEach items="${list}" var="dto">
					<li>
						<div onClick="alert('상세 페이지는 준비중입니다.')">
							<div class="">
								<div class="">
									<div class="log_member_pic"><img src="<%=root %>/save/member_pic/${dto.member_pic }"></div>
									<div class="log_div"><b>${dto.name }</b> 님이 <b>${dto.log_table }</b>의 <c:if test="${dto.log_attr!='all' }">${dto.log_attr}</c:if> 데이타를 <b><c:if test="${dto.log_act=='insert' }">추가</c:if><c:if test="${dto.log_act=='update' }">변경</c:if><c:if test="${dto.log_act=='delete' }">삭제</c:if></b>하였습니다.<div class="log_simpletime">${dto.simpletime }</div></div>
									
								</div>
							</div>
						</div>
						
						<div class="clearBoth"></div>
						
						
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
	
	
	<!-- 페이징 처리 -->
	<div class="text-center">
		<ul class="pagination">
			<c:if test="${startPage > 1 }">
				<li><a href="adminLogList.do?pageNum=${1}">처음으로</a>
			</c:if>
			<c:if test="${startPage > 1 }">
				<li><a href="adminLogList.do?pageNum=${startPage-1 }"><-</a>
			</c:if>
			<c:forEach var="pp" begin="${startPage}" end="${endPage}" varStatus="i">
				<c:if test="${pp==currentPage }">
					<li><a style="color:red" href="adminLogList.do?pageNum=${pp }">${pp }</a></li>
				</c:if>
				<c:if test="${pp!=currentPage }">
					<li><a href="adminLogList.do?pageNum=${pp }">${pp }</a></li>
				</c:if>
			</c:forEach>
			<c:if test="${endPage < totalPage}">
				<li><a href="adminLogList.do?pageNum=${endPage+1}">-></a>
			</c:if>
			<c:if test="${endPage < totalPage }">
				<li><a href="adminLogList.do?pageNum=${totalPage}">끝으로</a>
			</c:if>
		</ul>
	</div>
	<!-- 페이징 끝 -->

</div>

</body>
</html>



</body>
</html>

