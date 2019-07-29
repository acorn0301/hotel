<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/yeStyle.css">
<title>Insert title here</title>

</head>
<body>
<div id="m_myorderForm">
   
<div class="admin_body">
   <div class="headTit">
      <h2 class="tit">룸서비스 주문내역</h2>
   </div>

      <c:if test="${ RoomsCount == 0 }">
         <tr>
            <td colspan="2">
               <div class="dashboard_li_empty">
                  <i class="fas fa-exclamation-triangle"></i><br> 
                  <strong>${mbdto.name }</strong> 님의 주문내역이 없습니다.
               </div>
            </td>
         </tr>
      </c:if>

   <c:if test="${ RoomsCount != 0 }">
   <div class="dashboard_div">
      <br><br>
      <div class="admin_title_div">
         <div class="admin_title_text">
            &nbsp;&nbsp;&nbsp;&nbsp;주문내역
         </div>
      </div>
   
      <div class="dashboard_div_table">
<!--          <ul>
 -->         
          <table class="dashboard_table">
<%--             <tr class="dashboard_tr_buttons">
               <td colspan="2">
                  <button onclick="chkAll()" id="selectAllBtn">전체선택</button>
                  <button onclick="chkNone()" id="selectNoneBtn">선택해제</button>
                  <c:if test="${room_status < 3}">
                     <button onclick="nextStep()">확인처리</button>            
                     <button onclick="orderCancel()">주문취소</button>
                  </c:if>
                  <c:if test="${room_status == 5}">
                     <button onclick="cancelRevoke()">취소철회</button>
                     <button onclick="bookDelete()">주문삭제</button>            
                  </c:if>
                  <button class="lastBtn" onclick="search()">조건검색</button>
               </td>
            </tr> 
                <c:if test="${size==0 }">
               <tr>
                  <td colspan="2">
                     <div class="dashboard_li_empty">
                        <i class="fas fa-exclamation-triangle"></i><br>
                        조건에 해당하는 주문건이 없습니다.
                     </div>
                  </td>
               </tr>
            </c:if> --%>
            
            <c:forEach items="${list}" var="dto" >
               <!-- <li> -->
               <tr class="dashboard_tr">
<%--                 <td class="dashboard_td_chkbox">
                  <input class="adminChkBox" type="checkbox" value="${dto.order_num }" name="chkbox">
               </td> --%>
               <td>
                  <div onClick="location.href='m_roomservicelistDetail.do?order_num=${dto.order_num}'">
                  <div class="dashboard_li_div3">
<!--                      <span class="arrowRight"><i class="fas fa-angle-right"></i></span>
 -->                     <div class="booklist_div">
                        <span class="list_hotel_local">${dto.hotel_local }점</span>
                        <span class="list_room_local color2">${dto.room_local}호 &nbsp;&nbsp;</span>
                        <span class="list_book_day color3"><fmt:formatDate value="${dto.time }" pattern="yyyy-MM-dd HH:mm"/></span>
                     </div>
                     
<%--                      <div class="booklist_div">
                        <span class="list_name">${dto.name }님</span>
                        <span class="list_id">(${dto.id })</span>
                        &nbsp;
                        <span class="list_book_day color3"><fmt:formatDate value="${dto.time }" pattern="yyyy-MM-dd HH:mm"/></span>
                     </div> --%>
                     
                     <div class="booklist_div">
                           <c:forEach items="${dto.order_detail }" var="oddto">
                              <div>
                                 <span>&nbsp;&nbsp; + &nbsp;${oddto.menu_name_kor }</span>
                                 <span>  ${oddto.qty } 개</span>
                              </div>
                           </c:forEach>
                     </div>
      
                  </div>
                  </div>
                  </td>
                  </tr>
               <!-- </li> -->   
            </c:forEach>
         </table>
<!--          </ul>
 -->      </div>   
   </div>
   </c:if>

<input type="hidden" value="${room_status }" id="hiddenRoomStatus">
</div>
   
      
</div>
</body>
</html>
