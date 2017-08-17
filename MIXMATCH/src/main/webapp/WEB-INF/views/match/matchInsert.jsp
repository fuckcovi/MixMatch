<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/match/match.js"></script>
<div class="match-div">
	<h3 style="text-align:left;font-weight:bold;">매치등록</h3>
	<hr class="match-hr"><br>
	
	<div class="match-form">
		<form:form class="style" commandName="match" action="matchInsert.do" enctype="multipart/form-data" id="insert_form">
			<form:hidden path="m_type"/>
			<table class="insert-table">
				<tr height="30">
					<th>팀명</th>
					<td>
						<select name="t_name" class="option-box">
						<c:forEach var="team" items="${team}">
							<option value="${team.t_name}:${team.t_type}">${team.t_name}:${team.t_type}</option>
						</c:forEach>
					</select>
					</td>
				</tr>
				<tr height="30">
					<th>지역</th>
					<td><form:select path="m_area" items="${area}" cssClass="option-box"/></td>
				</tr>
				<tr height="30">
					<th>날짜</th>
					<td><input type="date" name="m_date" id="m_date" class="option-box"></td>
				</tr>
				<tr height="30">
					<th>시간</th>
					<td>
						<select id="ampm" style="height:30px;">
						<option value="오전">오전</option>
						<option value="오후">오후</option>
					</select>
					<select id="hour" style="height:30px;">
						<option value="12시">12시</option>
						<option value="1시">1시</option>
						<option value="2시">2시</option>
						<option value="3시">3시</option>
						<option value="4시">4시</option>
						<option value="5시">5시</option>
						<option value="6시">6시</option>
						<option value="7시">7시</option>
						<option value="8시">8시</option>
						<option value="9시">9시</option>
						<option value="10시">10시</option>
						<option value="11시">11시</option>
					</select>
					<select id="minute" style="height:30px;">
						<option value="00분">00분</option>
						<option value="10분">10분</option>
						<option value="20분">20분</option>
						<option value="30분">30분</option>
						<option value="40분">40분</option>
						<option value="50분">50분</option>
					</select>
					<form:hidden path="m_time"/>
					</td>
				</tr>
				<tr height="30">
					<th>경기장</th>
					<td><form:input path="m_place" id="m_place" cssClass="option-box"/></td>
				</tr>
				<tr height="30">
					<th>비용</th>
					<td><input type="number" name="m_cost" value="0" step="1000" class="option-box"/></td>
				</tr>
				<tr height="80">
					<th>내용</th>
					<td><form:textarea path="m_content"/></td>
				</tr>
			</table>
			<br>
			<input type="submit" value="매치등록" class="match-btn">
			<input type="button" value="목록으로" class="match-btn" onclick="location.href='matchBoard.do'">
		</form:form>
	</div>
</div>