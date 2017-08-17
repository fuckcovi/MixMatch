<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/team/team.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/layout222.css" rel="stylesheet">
<style type="text/css">
	.style th{text-align: center;}
</style>
<div class="page-main-style">
	
	<div>
	<table class="style">
		<tr>
			<th colspan="5"><h5>매치 상세 기록</h5></th>
		</tr>
		<tr>
			<td><h2>${match.m_away}</h2></td>
			<td>${match.m_challenger}</td>
			<td><img src="${pageContext.request.contextPath}/resources/images/versus.png" width="40"></td>
			<td>${match.t_name}</td>
			<td><h2>${match.m_home}</h2></td>
		</tr>
		<tr>
			<th colspan="2">경기일자</th>
			<th>경기장소</th>
			<th colspan="2">MVP</th>
		</tr>
		<tr>
			<td colspan="2">${match.m_date}</td>
			<td>${match.m_place}</td>
				<c:if test="${!empty match.m_mvp }">
			<td>
						<c:if test="${fn:endsWith(mvpmember.profile_name, '.jpg') || fn:endsWith(mvpmember.profile_name, '.png') || fn:endsWith(mvpmember.profile_name, '.gif') || fn:endsWith(mvpmember.profile_name, '.JPG') || fn:endsWith(mvpmember.profile_name, '.PNG') || fn:endsWith(mvpmember.profile_name, '.GIF')}">
							<img src="${pageContext.request.contextPath}/team/imageViewMem.do?id=${mvpmember.id}" style="width:100px;height:100px;">
						</c:if> 
						<c:if test="${empty mvpmember.profile_name }">
							<img src="${pageContext.request.contextPath}/resources/images/profile.jpg" style="width:100px;height:100px;">
						</c:if>
			</td>
			<td>
						${match.m_mvp}
			</td> 
				</c:if>
			
				<c:if test="${empty match.m_mvp }">
			<td colspan="2">
				MVP가 선택되지 않았습니다.
			</td>
				</c:if>
			
			
		</tr>
	
	</table>
	</div>
	<br><hr>
	<div>
		<ul style="margin:0 auto;padding:0 0 0 0; height:35px;list-style: none;display: inline-block;" id="matchDetailRecord">
			<li style="float: left; width:150px;" value="homeRecord">
				<input type="button"class="btn" style="width:150px;border:1px solid white;" value="홈팀기록">
			</li>
			<li style="float: left; width:150px;" value="awayRecord">
				<input type="button"class="btn" style="width:150px;border:1px solid white;" value="어웨이팀기록">
			</li>
		</ul>
	</div>
	<div>
		<c:if test="${match.m_type eq '야구'}">
			<!--  개인기록  ㅇ-->
			<c:if test="${basecount > 0}">
			<div class="detailRecord_home">
			<table class="homeRecord style">
				<tr class="tablehead">
					<th>이름</th>
					<th>타수</th>
					<th>안타수</th>
					<th>타점</th>
					<th>득점</th>
					<th>타율</th>
					<th>승리</th>
					<th>패배</th>
					<th>삼진</th>
					<th>이닝</th>
					<th>실점</th>
					<th>방어율</th>
				</tr>
			<c:forEach var="list" items="${baselist}">
			<c:if test="${list.t_name == match.t_name}"><!--  홈팀 기록 -->
				<tr>
					<td><a href="${pageContext.request.contextPath}/mypage/main.do?id=${list.id}">${list.name}</a></td>
					<td>${list.b_bat}</td>
					<td>${list.b_hit}</td>
					<td>${list.b_rbi}</td>
					<td>${list.b_score}</td>
					<td><fmt:formatNumber value="${list.b_avg }" pattern="0.000"/></td>
					<td>${list.b_win}</td>
					<td>${list.b_lose}</td>
					<td>${list.b_strike}</td>
					<td>${list.b_ip}</td>
					<td>${list.b_er}</td>
					<td><fmt:formatNumber value="${list.b_era }" pattern="0.00"/></td>
				</tr>
			</c:if>
			</c:forEach>
			</table>
			</div>
			<div class="detailRecord_away" style="display: none;">
			<table class="awayRecord style">
				<tr class="tablehead">
					<th>이름</th>
					<th>타수</th>
					<th>안타수</th>
					<th>타점</th>
					<th>득점</th>
					<th>타율</th>
					<th>승리</th>
					<th>패배</th>
					<th>삼진</th>
					<th>이닝</th>
					<th>실점</th>
					<th>방어율</th>
				</tr>
			<c:forEach var="list" items="${baselist}">
			<c:if test="${list.t_name == match.m_challenger}"><!--  어웨이팀 기록 -->
				<tr>
					<td><a href="${pageContext.request.contextPath}/mypage/main.do?id=${list.id}">${list.name}</a></td>
					<td>${list.b_bat}</td>
					<td>${list.b_hit}</td>
					<td>${list.b_rbi}</td>
					<td>${list.b_score}</td>
					<td><fmt:formatNumber value="${list.b_avg }" pattern="0.000"/></td>
					<td>${list.b_win}</td>
					<td>${list.b_lose}</td>
					<td>${list.b_strike}</td>
					<td>${list.b_ip}</td>
					<td>${list.b_er}</td>
					<td><fmt:formatNumber value="${list.b_era }" pattern="0.00"/></td>
				</tr>
			</c:if>
			</c:forEach>
			</table> 
			</div>
			</c:if>
			<c:if test="${basecount == 0}">
				${match.m_seq}매치의 개인기록을 입력해주세요.
			</c:if>
		</c:if>
		<c:if test="${match.m_type eq '농구'}">
			<!--  개인기록 ㄴ -->
			<c:if test="${basketcount > 0}">
			<div class="detailRecord_home" >
			<table class="homeRecord style">
				<tr class="tablehead">
					<th>이름</th> 
					<th>득점</th>
					<th>도움</th>
					<th>리바운드</th>
					<th>스틸</th>
					<th>블록</th>
					<th>3점슛</th>
				</tr>
			<c:forEach var="list" items="${basketlist}">
			<c:if test="${list.t_name == match.t_name}"><!--  홈팀 기록 -->
				<tr>
					<td><a href="${pageContext.request.contextPath}/mypage/main.do?id=${list.id}">${list.name}</a></td>
					<td>${list.b_score}</td>
					<td>${list.b_assist}</td>
					<td>${list.b_rebound}</td>
					<td>${list.b_steel}</td>
					<td>${list.b_block}</td>
					<td>${list.b_3point}</td>
				</tr>
			</c:if>
			</c:forEach>
			</table>
			</div>
			<div class="detailRecord_away" style=" display: none;">
			<table class="awayRecord style">
				<tr class="tablehead">
					<th>이름</th>
					<th>득점</th>
					<th>도움</th>
					<th>리바운드</th>
					<th>스틸</th>
					<th>블록</th>
					<th>3점슛</th>
				</tr>
			<c:forEach var="list" items="${basketlist}">
			<c:if test="${list.t_name == match.m_challenger}"><!--  어웨이팀 기록 -->
				<tr>
					<td><a href="${pageContext.request.contextPath}/mypage/main.do?id=${list.id}">${list.name}</a></td>
					<td>${list.b_score}</td>
					<td>${list.b_assist}</td>
					<td>${list.b_rebound}</td>
					<td>${list.b_steel}</td>
					<td>${list.b_block}</td>
					<td>${list.b_3point}</td>
				</tr>
			</c:if>
			</c:forEach>
			</table> 
			</div>
			</c:if>
			<c:if test="${basketcount == 0}">
				${match.m_seq}매치의 개인기록을 입력해주세요.
			</c:if>
		</c:if>
		<c:if test="${match.m_type eq '축구'}">
			<!--  개인기록  ㅊ-->
			<c:if test="${footcount > 0}">
			<div class="detailRecord_home" >
			<table class="homeRecord style">
				<tr class="tablehead">
					<th>이름</th>
					<th>슈팅</th>
					<th>도움</th>
					<th>골</th>
					<th>공격포인트</th>
				</tr>
			<c:forEach var="list" items="${footlist}">
			<c:if test="${list.t_name == match.t_name}"><!--  홈팀 기록 -->
				<tr>
					<td><a href="${pageContext.request.contextPath}/mypage/main.do?id=${list.id}">${list.name}</a></td>
					<td>${list.f_shoot}</td>
					<td>${list.f_assist}</td>
					<td>${list.f_goal}</td>
					<td>${list.f_attack}</td>
				</tr>
			</c:if>
			</c:forEach>
			</table>
			</div>
			<div class="detailRecord_away" style="display: none;">
			<table class="awayRecord style">
				<tr class="tablehead">
					<th>이름</th>
					<th>슈팅</th>
					<th>도움</th>
					<th>골</th>
					<th>공격포인트</th>
				</tr>
			<c:forEach var="list" items="${footlist}">
			<c:if test="${list.t_name == match.m_challenger}"><!--  어웨이팀 기록 -->
				<tr>
					<td><a href="${pageContext.request.contextPath}/mypage/main.do?id=${list.id}">${list.name}</a></td>
					<td>${list.f_shoot}</td>
					<td>${list.f_assist}</td>
					<td>${list.f_goal}</td>
					<td>${list.f_attack}</td>
				</tr>
			</c:if>
			</c:forEach>
			</table> 
			</div>
			</c:if>
			<c:if test="${footcount == 0}">
				${match.m_seq}매치의 개인기록을 입력해주세요.
			</c:if>
		</c:if>
	</div>
	
</div>