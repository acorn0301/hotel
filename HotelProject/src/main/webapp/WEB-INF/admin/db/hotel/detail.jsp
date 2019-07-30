<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>room detail </title>
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
			<div class="arrow_back" onclick="location.href='adminMemberList.do'"><i class="fas fa-chevron-left"></i></div>
			<div>객실상세</div>
			<div class="clearBoth"></div>	
	</div>
</div>

<div class="dashboard_div">
	
	
	<div class="admin_title_div">
		<div class="admin_title_text">객실정보</div>
	</div>
	<div class="dashboard_div_table">
	
		<table class="bookdetail_table">
			<tr class="bookdetail_table_tr">
				<td colspan="2" class="bookdetail_table_td td_for_selectbox">
					<img width="100%" src="<%=root %>/save/images/room/${rmdto.room_img }">
				</td>	
			</tr>
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">객실번호</td>
				<td class="bookdetail_table_td"> ${rmdto.room_num }</td>	
			</tr>
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">객실타입</td>
				<td class="bookdetail_table_td">${rmdto.room_name } ${rmdto.type }</td>	
			</tr>
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">최대인원</td>
				<td class="bookdetail_table_td"> ${rmdto.max}</td>	
			</tr>
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">숙박요금</td>
				<td class="bookdetail_table_td"><fmt:formatNumber value="${rmdto.price }" pattern="#,##0"/> 원</td>	
			</tr>
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">위치</td>
				<td class="bookdetail_table_td"> 
					<c:if test="${rmdto.hotel_num==10 }">서울점</c:if>
					<c:if test="${rmdto.hotel_num==11 }">제주점</c:if>
					${rmdto.room_local } 호
 				</td>	
			</tr>
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">구성</td>
				<td class="bookdetail_table_td"> ${rmdto.room_config}</td>	
			</tr>
			

			
			
			<tr class="dashboard_tr_buttons twoBtns">
				<td colspan="2">
					<%-- <button type="button" onclick="location.href='adminMemberEditForm.do?member_num=${mbdto.member_num}'">수정</button> --%>								
					<button type="button" onclick="alert('준비중입니다.')">수정</button>
					<button type="button" class="lastBtn" onclick="alert('준비중입니다.')">삭제</button>			
					
					
					
				</td>
			</tr>
		
		</table>
		
	
	
		
</div>
</div>
</div>


<script>

/* function deleteMenu(member_num){
	let name = '${mbdto.name}';
	let chk = confirm(name+'(을)를 탈퇴처리하시겠습니까?');
	if(chk){
		location.href="adminMemberDelete.do?member_num=" + member_num;
	}
}
 */
</script>

</body>
</html>

