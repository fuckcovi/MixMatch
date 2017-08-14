<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<div class="page-main-style">
	<br>
	<h2>상세보기</h2>
	<hr class="l-style">
	<br>
	<div>
		<table>
			<tr>
				<th>개최자</th>
				<th>리그이름</th>
				<th>지역</th>
				<th>날짜</th>
				<th>시간</th>
				<th>경기장</th>
				<th>비용</th>
				<th>내용</th>
				<th>모집팀수</th>
				<th>현재신청팀수</th>
				<th>종목</th>
			</tr>
			<tr>
				<td>${league.id}</td>
				<td>${league.l_title}</td>
				<td>${league.l_area}</td>
				<td>${league.l_date}</td>
				<td>${league.l_time}</td>
				<td>${league.l_place}</td>
				<td>${league.l_cost}</td>
				<td>${league.l_content}</td>
				<td>${league.l_number}</td>
				<td>${league.l_team}</td>
				<td>${league.l_type}</td>
			</tr>
		</table>
		<br>
		<input type="button" value="참가신청" class="btn" onclick="location.href='update'">
		<input type="button" value="목록으로" class="btn" onclick="location.href='leagueList.do'">
	</div>
	<br>
	<hr class="l-style">
	<c:if test="${user_id eq league.id}">
		<input type="button" value="수정" class="btn" onclick="location.href='leagueUpdate.do?l_seq=${league.l_seq}'">
		<input type="button" value="삭제" class="btn" onclick="location.href='leagueDelete.do?l_seq=${league.l_seq}'">
	</c:if>
</div>