<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<div class="match-div">
	<h3 style="text-align:left;font-weight:bold;">경기결과</h3>
	<hr class="match-hr"><br>
	
	<div class="match-form">
		<table class="detail-table"> 
			<tr>
				<td>
					<c:if test="${!empty t_name}">
						<img src="matchImageView.do?t_name=${match.t_name}" width="80">
					</c:if>
					<c:if test="${empty t_name}">
						<c:if test="${match.m_type eq '축구'}"><img src="${pageContext.request.contextPath}/resources/images/football.png" style="width:80px;height:80px;"></c:if>
						<c:if test="${match.m_type eq '야구'}"><img src="${pageContext.request.contextPath}/resources/images/baseball.png" style="width:80px;height:80px;"></c:if>
						<c:if test="${match.m_type eq '농구'}"><img src="${pageContext.request.contextPath}/resources/images/basketball.png" style="width:80px;height:80px;"></c:if>
					</c:if>
				<td><span style="font-size:25px;color:blue;font-weight:bold;">${match.m_home}</span><br>${match.t_name}<br><input type="button" value="팀정보" class="team-btn" onclick="location.href='${pageContext.request.contextPath}/team/teamInfo.do?t_name=${match.t_name}'"></td>
				<td><img src="${pageContext.request.contextPath}/resources/images/versus.png" width="80"></td>
				<td><span style="font-size:25px;color:red;font-weight:bold;">${match.m_away}</span><br>${match.m_challenger}<br><input type="button" value="팀정보" class="team-btn" onclick="location.href='${pageContext.request.contextPath}/team/teamInfo.do?t_name=${match.m_challenger}'"></td>
				<td>
					<c:if test="${!empty m_challenger}">
						<img src="matchImageView.do?t_name=${match.m_challenger}" width="80">
					</c:if>
					<c:if test="${empty m_challenger}">
						<c:if test="${match.m_type eq '축구'}"><img src="${pageContext.request.contextPath}/resources/images/football.png" style="width:80px;height:80px;"></c:if>
						<c:if test="${match.m_type eq '야구'}"><img src="${pageContext.request.contextPath}/resources/images/baseball.png" style="width:80px;height:80px;"></c:if>
						<c:if test="${match.m_type eq '농구'}"><img src="${pageContext.request.contextPath}/resources/images/basketball.png" style="width:80px;height:80px;"></c:if>
					</c:if>
				</td>
			</tr>
		</table>
		<br>
		<table class="list-table"> 
			<tr height="40">
				<td class="left-style">MVP</td>
				<td align="left" style="padding-left:10px;"> ${match.m_mvp}</td>
			</tr>
			<tr height="40">
				<td class="left-style">지역</td>
				<td align="left" style="padding-left:10px;"> ${match.m_area}</td>
			</tr>
			<tr height="40">
				<td class="left-style">날짜</td>
				<td align="left" style="padding-left:10px;"> ${match.m_date}</td>
			</tr>
			<tr height="40">	
				<td class="left-style">시간</td>
				<td align="left" style="padding-left:10px;"> ${match.m_time}</td>
			</tr>
			<tr height="40">
				<td class="left-style">경기장</td>
				<td align="left" style="padding-left:10px;"> ${match.m_place}</td>
			</tr>
		</table>
		<br>
		<input type="button" value="개인기록+" class="match-btn" onclick="location.href='${pageContext.request.contextPath}/team/matchMemRecordInsert.do?m_seq=${match.m_seq}'">
		<input type="button" value="목록으로" class="match-btn" onclick="location.href='scoreBoard.do'">
	</div>
	<br><hr>
	<div align="center">
		<h4 style="font-weight:bold;">&lt; 베팅한 회원 &gt;</h4>
		<table class="detail-list">
			<tr style="background:#EAEAEA;">
				<th>아이디</th>
				<th>예상승리팀</th>
				<th>예상점수</th>
				<th>베팅포인트</th>
				<th>배당률</th>
			</tr>
			<c:if test="${!empty list}">
				<c:forEach var="list" items="${list}">
					<tr>
						<td>${list.id}</td>
						<td>${list.t_winteam}</td>
						<td>${list.t_score}</td>
						<td>${list.t_point}</td>
						<td>${list.t_rate}</td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty list}">
				<tr>
					<td colspan="5">베팅한 회원이 없습니다.</td>
				</tr>
			</c:if>
		</table>
	</div>
</div>