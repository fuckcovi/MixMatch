<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/league/league.js"></script> 
<div class="match-div">
	<h3 style="text-align:left;font-weight:bold;">리그정보</h3>
	<hr class="match-hr"><br>
	
	<div class="match-form">
		<table class="insert-table">
			<tr>
				<th>개최자</th>
				<td>${league.id}</td>
			</tr>
			<tr>
				<th>종목</th>
				<td>${league.l_type}</td>
			</tr>
			<tr>
				<th>리그이름</th>
				<td>${league.l_title}</td>
			</tr>
			<tr>
				<th>지역</th>
				<td>${league.l_area}</td>
			</tr>
			<tr>
				<th>날짜</th>
				<td>${league.l_date}</td>
			</tr>
			<tr>
				<th>시간</th>
				<td>${league.l_time}</td>
			</tr>
			<tr>
				<th>경기장</th>
				<td>${league.l_place}</td>
			</tr>
			<tr>
				<th>비용</th>
				<td>${league.l_cost}</td>
			</tr>
			<tr>
				<th>모집현황</th>
				<td>${league.l_team}/${league.l_number}</td>
			</tr>
			<tr height="80">
				<th>내용</th>
				<td>${league.l_content}</td>
			</tr>
		</table>
		<br><hr>
		<div align="center">
			<h4 style="font-weight:bold;">&lt; 참가신청팀 목록 &gt;</h4>
			<table class="detail-list">
				<tr style="background:#EAEAEA;">
					<th>팀명</th>
					<th>승수</th>
					<th>무승부수</th>
					<th>패수</th>
					<th>신청상태</th>
				</tr>
				<c:if test="${!empty list}">
					<c:forEach var="list" items="${list}">
						<tr>
							<td>${list.t_name}</td>
							<td>${list.t_win}</td>
							<td>${list.t_draw}</td>
							<td>${list.t_lose}</td>
							<td>
								<c:if test="${list.ld_check eq 'Y'}">
									참가중
								</c:if>
								<c:if test="${list.ld_check eq 'N'}">
									<c:if test="${user_id eq league.id && league.l_number > league.l_team}">
										<input type="button" value="승인" onclick="location.href='leagueDtlCheck.do?ld_seq=${list.ld_seq}'">
									</c:if>
									<c:if test="${user_id eq league.id && league.l_number <= league.l_team}">
										<span style="color:red;">정원초과</span>
									</c:if>
									<c:if test="${user_id ne league.id}">
										<span style="color:#BDBDBD;">참가신청중</span>
									</c:if>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty list}">
					<tr>
						<td colspan="5">참가신청한 회원이 없습니다.</td>
					</tr>
				</c:if>
			</table>
		</div>
		<br>
		<c:if test="${league.l_team >= league.l_number && user_id ne league.id}">
			<span>더 이상 신청할 수 없습니다.</span><br><br>
		</c:if>
		<c:if test="${empty team}">
			<span>참가신청할 수 없습니다.</span><br><br>
		</c:if>
		<c:if test="${!empty team}">
			<c:if test="${league.l_team < league.l_number && user_id ne league.id}">
				<form:form commandName="leagueDtl" action="leagueDtlInsert.do" enctype="multipart/form-data">
					<form:hidden path="l_seq" value="${league.l_seq}"/>
					<form:select path="t_name" items="${team}" cssClass="option-box"/>
					<input type="submit" value="참가신청" class="select-btn">			
				</form:form><br>
			</c:if>
		</c:if>
		<input type="button" value="목록으로" class="match-btn" onclick="location.href='leagueList.do'">
	</div>
	<br>
	<c:if test="${user_id eq league.id}">
		<input type="button" value="수정" class="match-btn" onclick="location.href='leagueUpdate.do?l_seq=${league.l_seq}'">
		<input type="button" value="삭제" class="match-btn" id="delete_btn" onclick="location.href='leagueDelete.do?l_seq=${league.l_seq}'">
	</c:if>
</div>