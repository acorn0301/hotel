<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:if test="${currentCustomer == null }">

	
	
	
<img src="images/testimg.png">


	현재 객실에 머물고 있는 고객이 아니거나, 비 로그인 상태에서 보여지는 메인화면 <br><Br>
	
	몇월 며칠 / 몇월 며칠 <br>
	인원선택 : @@
	
	<br><br>
	
	프로모션 <br><Br>
	
	최근 작성된 리뷰 <br><Br>
	
	등등..

	db테스트 : ${hotelTotalCount }<br><br>
	
	부분적으로커밋되는지 확인 1 / 확인 2
	
	영은이 테스트
	혜수언니 테스트
	배고파요..
	나도..
	뭐먹을까요
	
	화이팅 !
	
	혜정테스트
	
	장희테스트
</c:if>
<c:if test="${currentCustomer != null }">

	로그인한 회원이 현재 우리 호텔에 머물고 있는 경우 나타날 메인화면
	
	<br><Br>
	룸서비스 주문 , 리뷰 남기기 , 문의사항 등등 뭔가 메뉴를 나타내면 되겠습니다.

</c:if>

</body>
</html>

