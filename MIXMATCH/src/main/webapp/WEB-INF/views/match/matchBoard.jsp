<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/match/match.js"></script>
<div class="match-div">
	<h3 style="text-align:left;font-weight:bold;">매치보드</h3>
	<hr class="match-hr"><br>
	
	<div class="match-form">
		<form action="matchBoard.do" id="type_form" method="get">
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
				<th></th>
				<th>팀명</th>
				<th>지역</th>
				<th>날짜</th>
				<th>시간</th>
				<th></th>
			</tr>
			
			<c:if test="${count == 0}">
				<tr><td colspan="6">등록된 매치가 없습니다.</td></tr>
			</c:if>
			
			<c:if test="${count > 0}">
				<c:forEach var="match" items="${list}">
					<c:if test="${empty match.m_challenger}">
					<tr>
						<td>
							<c:if test="${!empty match.t_logo_name}">
								<img src="matchImageView.do?t_name=${match.t_name}" style="width:80px;">
							</c:if>
							<c:if test="${empty match.t_logo_name}">
								<c:if test="${type eq '축구'}"><img src="${pageContext.request.contextPath}/resources/images/football.png" style="width:80px;height:80px;"></c:if>
								<c:if test="${type eq '야구'}"><img src="${pageContext.request.contextPath}/resources/images/baseball.png" style="width:80px;height:80px;"></c:if>
								<c:if test="${type eq '농구'}"><img src="${pageContext.request.contextPath}/resources/images/basketball.png" style="width:80px;height:80px;"></c:if>					
							</c:if>
						</td>
						<td>${match.t_name}<br><input type="button" value="팀정보" class="team-btn" onclick="location.href='${pageContext.request.contextPath}/team/teamInfo.do?t_name=${match.t_name}'"></td>
						<td>${match.m_area}</td>
						<td>${match.m_date}</td>
						<td>${match.m_time}</td>
						<td><input type="button" value="상세보기" class="match-btn" onClick="location.href='matchDetail.do?m_seq=${match.m_seq}'"></td>
					</tr>
					</c:if>
				</c:forEach>	
			</c:if>
		</table>
		<div>${pagingHtml}</div>
	</div>
	<c:if test="${!empty t_name}">
		<input type="button" value="매치등록" id="insert_btn" class="match-btn" style="margin-top:20px;" onClick="location.href='matchInsert.do'">
	</c:if>
</div>