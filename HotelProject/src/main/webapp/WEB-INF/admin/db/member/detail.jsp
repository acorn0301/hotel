<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member detail </title>
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
			<div>회원상세</div>
			<div class="clearBoth"></div>	
	</div>
</div>

<div class="dashboard_div">
	
	
	<div class="admin_title_div">
		<div class="admin_title_text">기본정보</div>
	</div>
	<div class="dashboard_div_table">
	
		<table class="bookdetail_table">
			<tr class="bookdetail_table_tr">
				<td colspan="2" class="bookdetail_table_td td_for_selectbox">
					<img width="100%" src="<%=root %>/save/member_pic/${mbdto.member_pic }">
				</td>	
			</tr>
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">회원번호</td>
				<td class="bookdetail_table_td"> ${mbdto.member_num }</td>	
			</tr>
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">아이디</td>
				<td class="bookdetail_table_td">${mbdto.id }</td>	
			</tr>
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">이름</td>
				<td class="bookdetail_table_td"> ${mbdto.name }</td>	
			</tr>
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">가입일</td>
				<td class="bookdetail_table_td"> ${mbdto.joinday }</td>	
			</tr>
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">이메일</td>
				<td class="bookdetail_table_td"> ${mbdto.joinday }</td>	
			</tr>
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">연락처</td>
				<td class="bookdetail_table_td"> ${mbdto.phone }</td>	
			</tr>
			<tr class="bookdetail_table_tr">
				<td class="bookdetail_table_th bookdetail_table_td">등급</td>
				<td class="bookdetail_table_td"> ${mbdto.phone }</td>	
			</tr>

			</tr>
			
			<tr class="dashboard_tr_buttons twoBtns">
				<td colspan="2">
					<%-- <button type="button" onclick="location.href='adminMemberEditForm.do?member_num=${mbdto.member_num}'">수정</button> --%>								
					<button type="button" onclick="alert('준비중입니다.')">수정</button>
					<button type="button" class="lastBtn" onclick="deleteMenu(${mbdto.member_num})">탈퇴</button>			
					
					
					
				</td>
			</tr>
		
		</table>
		
	
	
		
</div>
</div>
</div>


<script>

function deleteMenu(member_num){
	let name = '${mbdto.name}';
	let chk = confirm(name+'(을)를 탈퇴처리하시겠습니까?');
	if(chk){
		location.href="adminMemberDelete.do?member_num=" + member_num;
	}
}

</script>

</body>
</html>

