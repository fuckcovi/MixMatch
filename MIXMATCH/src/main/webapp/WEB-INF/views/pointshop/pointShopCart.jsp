<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pointshop.css">
<div class="page-main-style">
    <h2><span id="use">${user_id}</span>님의 구매내역</h2>
    <c:if test="${cartCount == 0 }">
    	<div class="align-center">구매내역이 없습니다.</div>
    </c:if>
    <c:if test="${cartCount > 0 }">
    	<form class="type07">
            <table border="1" class="type07">
                <tr>
                	<th>ID</th>
                    <th>상품명</th>
                    <th width="80px">수량</th>
                    <th>포인트</th>   
                    <th>구매일</th>
                                 
                </tr>
                <c:forEach var="row" items="${cart}" varStatus="i">
                <tr>
					<td>${row.id}</td>                
                    <td>${row.p_name}</td>
                    <td>${row.amount}</td>
                    <td><fmt:formatNumber pattern="###,###,###" value="${row.p_price}"/> p</td>
                    <td>${row.p_date}</td>
                    
                </tr>
                </c:forEach>
            </table>
        </form> 
    </c:if>
    <button class="btn btn-info" onclick="location.href='pointHome.do'">쇼핑하기</button>
</div>    