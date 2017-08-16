<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/team/team.js"></script>
<div class="page-main-style">
	<h2>팀기록</h2>
	<hr class="style"><br>
	<c:if test="${count==0 }">
		<div>
			소속 팀도 없는데 기록이 있을리가 
		</div>
	</c:if>
	<c:if test="${count>0 }">  
	<ul style="list-style: none" id="teamScheduleList">
		<li style="float: left; width:150px;" value="allList">
			<input type="button" class="btn" value="전체보기">
		</li>
		<c:forEach var="list" items="${list}">
			<li style="float: left; width:150px;" value="${list.t_name}"><!-- 클릭하면 ajax로 화면 바꿔서 일정 보이기 -->
				<input type="button" class="btn" value="${list.t_name}">
			</li>
		</c:forEach>
	</ul>
	<br>
	<hr size="1" width="85%">
	<table class="scheduleList fplan">
		<tr class="tablehead">
			<th>매치번호</th>
			<th>매치일자</th>
			<th>매치결과</th>
		</tr>
		<c:set var="seq" value="0"/>
		<c:forEach var="teamlist" items="${list}">
		<c:forEach var="matchlist" items="${matchList}">
			<c:if test="${matchlist.m_home!=-1 && matchlist.m_away!=-1 && (matchlist.t_name==teamlist.t_name || matchlist.m_challenger==teamlist.t_name)}">
				<c:set var="m_seq" value="[${matchlist.m_seq}]"/>
				<c:if test="${!fn:contains(seq,m_seq)}">
					<c:set var="seq" value="${seq},[${matchlist.m_seq}]"/>
					<tr class="${matchlist.t_name} ${matchlist.m_challenger} plan">
						<td>${matchlist.m_seq}</td>
						<td>${matchlist.m_date}</td>
						<td><a href="matchDetail.do?m_seq=${matchlist.m_seq}">${matchlist.t_name} ${matchlist.m_home} : ${matchlist.m_away} ${matchlist.m_challenger}</a></td>
					</tr>
				</c:if>
			</c:if>
		</c:forEach>
		</c:forEach>
		<tr class="tablenull" style="display: none;">
			<td colspan="4">매치결과없음</td>
		</tr>
	</table>
	</c:if> 
	<br><hr class="style"> 
</div>