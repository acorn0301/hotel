<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/yeStyle.css">
<link rel="stylesheet" href="css/jhStyle.css">
</head>
<body>
<%
      String root=request.getContextPath();//프로젝트 루트 경로
%>

<div id="mypageForm">
<form action="" method="post">
<div class="headTit">
   <h2 class="tit">마이페이지</h2>
   <!-- <div class="btnBack">
      <a href="#" onclick="history.back(); return false;">뒤로</a>
   </div> -->
</div>

<div class="myinfo">

   
   <br>
   <div>
      <img src="<%=root%>/save/member_pic/${mbdto.member_pic }" style="border-radius:100%; border:1px solid lightgray;" width="100" height="100" />
      <span class="mask"></span>
   </div>
   <h4>${mbdto.name} 님 </h4>
   <span> 가입일 <fmt:formatDate value="${mbdto.joinday }" pattern="yyyy년 MM월 dd일"/> </span>
   
</div>

<!-- 프로필 이미지 -->
<%-- <c:if test="${mbdto.imagename!='noImg' && mbdto.image=='yes'}">
   <img src="mypage/${mbdto.imagename}" style="max-width:400px;"><br>
</c:if>
<c:if test="${mbdto.imagename!='noImg' && mbdto.image=='no'}">
   <img src="images/mypage/user_pic.jpg" style="max-width:150px;"><br>
</c:if> --%>

<div class="linkBox">
   <ul class="linkLIst">
      <li class="first"><a href="m_bookinglist.do"><i class="fas fa-bed color1"></i> &nbsp;예약확인 <div class="user_list_divs user_list_div_3"><i class="fas fa-chevron-right arrow_right"></i></div></a></li>
      <li><a href="m_roomservicelist.do"><i class="fas fa-concierge-bell color2"></i> &nbsp;룸서비스 <div class="user_list_divs user_list_div_3"><i class="fas fa-chevron-right arrow_right"></i></div></a></li>
      <li><a href="infoEdit.do"><i class="fas fa-user color3"></i> &nbsp;정보수정 <div class="user_list_divs user_list_div_3"><i class="fas fa-chevron-right arrow_right"></i></div></a></li>
      <li><a href="qnaform.do?pageNum=1"><i class="fas fa-question color7"></i> &nbsp;문의하기 <div class="user_list_divs user_list_div_3"><i class="fas fa-chevron-right arrow_right"></i></div></a></li>         
      <li class="last"><a href="withdrawal.do"><i class="fas fa-user-slash color5"></i> &nbsp;회원탈퇴 <div class="user_list_divs user_list_div_3"><i class="fas fa-chevron-right arrow_right"></i></div></a></li>
   </ul>
</div>

</form>
</div>
</body>
</html>
