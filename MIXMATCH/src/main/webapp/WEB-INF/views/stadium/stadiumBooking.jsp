<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>

<div class="page-main-style">
	<br>
	<h2>경기장 예약확인</h2>
	${booking.s_seq} : ${booking.b_time} (
	<c:if test="${booking.b_time eq '1타임'}">
		8시 ~ 10시30분
	</c:if>
	<c:if test="${booking.b_time eq '2타임'}">
		10시30분 ~ 13시
	</c:if>
	<c:if test="${booking.b_time eq '3타임'}">
		13시 ~ 15시30분
	</c:if>
	<c:if test="${booking.b_time eq '4타임'}">
		15시30분 ~ 18시
	</c:if>
	)
	: ${booking.b_regdate} : ${booking.b_check}
	<br>	
	<input type="button" value="경기장목록" onclick="location.href='${pageContext.request.contextPath}/stadium/stadium.do'">
	<input type="button" value="예약목록" onclick="location.href='${pageContext.request.contextPath}/stadium/stadiumConfirm.do'">
</div>