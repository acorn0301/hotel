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
<%
		String root=request.getContextPath();//프로젝트 루트 경로
%>
<div class="admin_body">

<div class="qna_body_title_div">
	<div class="qna_title_text">
			<div class="arrow_back" onclick="location.href='adminMenuList.do'"><i class="fas fa-chevron-left"></i></div>
			<div>메뉴상세</div>
			<div class="clearBoth"></div>	
	</div>
</div>

<div class="dashboard_div">
	
	
	<div class="admin_title_div">
		<div class="admin_title_text">메뉴정보</div>
	</div>
	<div class="dashboard_div_table">
	
		<table class="bookdetail_table">
			<tr class="bookdetail_table_tr">
				<td colspan="2" class="bookdetail_table_td td_for_selectbox">
					<img width="100%" src="<%=root %>/save/images/menu/${mndto.menu_img }">
				</td>	
			</tr>
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">메뉴번호</td>
				<td class="bookdetail_table_td"> ${mndto.menu_num }</td>	
			</tr>
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">카테고리</td>
				<td class="bookdetail_table_td">${mndto.menu_type }</td>	
			</tr>
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">국문이름</td>
				<td class="bookdetail_table_td"> ${mndto.menu_name_kor }</td>	
			</tr>
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">영문이름</td>
				<td class="bookdetail_table_td"> ${mndto.menu_name_eng }</td>	
			</tr>
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">단가</td>
				<td class="bookdetail_table_td">
					<fmt:formatNumber value="${mndto.menu_price }" pattern="#,##0"/> 원
				</td>	
			</tr>
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">메뉴설명</td>
				<td class="bookdetail_table_td"> ${mndto.menu_desc }</td>	
			</tr>
			
			<tr class="dashboard_tr_buttons twoBtns">
				<td colspan="2">
					<button type="button" onclick="location.href='adminMenuEditForm.do?menu_num=${mndto.menu_num}'">수정</button>								
					<button type="button" class="lastBtn" onclick="deleteMenu(${mndto.menu_num})">삭제</button>			
					
				</td>
			</tr>
		
		</table>
		
	
	
		
</div>
</div>
</div>


<script>

function deleteMenu(menu_num){
	let menu_name = '${mndto.menu_name_kor}';
	let chk = confirm(menu_name+'(을)를 삭제하시겠습니까?');
	if(chk){
		location.href="adminMenuDelete.do?menu_num=" + menu_num;
	}
}

</script>

</body>
</html>

