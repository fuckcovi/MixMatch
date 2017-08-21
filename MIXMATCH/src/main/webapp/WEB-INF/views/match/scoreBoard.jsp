<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="match-div">
	<h3 style="text-align:left;font-weight:bold;">스코어보드</h3>
	<hr class="match-hr"><br>
	
	<div class="match-form">
		<form action="scoreBoard.do" id="type_form" method="get">
		<input type="submit" value="축구" name="type" 
		<c:if test="${type eq '축구'}">class="select-btn" disabled</c:if>
		<c:if test="${type ne '축구'}">class="match-btn"</c:if>>	
		
		<input type="submit" value="야구" name="type"  
		<c:if test="${type eq '야구'}">class="select-btn"</c:if>
		<c:if test="${type ne '야구'}">class="match-btn"</c:if>>
		
		<input type="submit" value="농구" name="type"  
		<c:if test="${type eq '농구'}">class="select-btn"</c:if>
		<c:if test="${type ne '농구'}">class="match-btn"</c:if>>
		</form><br>
		
		<table class="match-table">
			<tr>
				<th>지역</th>
				<th>날짜</th>
				<th>시간</th>
				<th></th>
				<th>결과</th>
				<th></th>
			</tr>
			
			<c:if test="${count == 0}">
				<tr><td colspan="6">매칭된 경기가 없습니다.</td></tr>
			</c:if>
			
			<c:if test="${count > 0}">
				<c:forEach var="match" items="${list}">
					<c:if test="${!empty match.m_challenger}">
						<tr> 
							<td>${match.m_area}</td>
							<td>${match.m_date}</td>
							<td>${match.m_time}</td>
							<td>${match.t_name}<br><input type="button" value="팀정보" class="team-btn" onclick="location.href='${pageContext.request.contextPath}/team/teamInfo.do?t_name=${match.t_name}'"></td>
							<c:if test="${match.m_home eq -1}">
							<td><input type="button" value="결과등록" 
							<c:if test="${fn:contains(t_name,match.t_name)}">class="match-btn"</c:if>
							<c:if test="${!fn:contains(t_name,match.t_name)}">class="dis-btn" disabled</c:if> onClick="location.href='scoreUpdate.do?m_seq=${match.m_seq}'"></td>
							</c:if>
							<c:if test="${match.m_home ne -1}">
							<td><a href="scoreDetail.do?m_seq=${match.m_seq}">점수보기</a></td>
							</c:if>
							<td>${match.m_challenger}<br><input type="button" value="팀정보" class="team-btn" onclick="location.href='${pageContext.request.contextPath}/team/teamInfo.do?t_name=${match.m_challenger}'"></td>
						</tr>
					</c:if>
				</c:forEach>	
			</c:if>  
		</table> 
		<div>${pagingHtml}</div>
	</div>
</div>