<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/league/league.js"></script>
<div class="match-div">
	<h3 style="text-align:left;font-weight:bold;">리그등록</h3>
	<hr class="match-hr"><br>
	
	<div class="match-form">
		<form:form class="style" commandName="league" action="leagueInsert.do" enctype="multipart/form-data" id="l_insert_form">
			<form:hidden path="id" value="${league.id}"/>
			<table class="insert-table">
				<tr>
					<th>개최자</th>
					<td>${league.id}</td>
				</tr>
				<tr>
					<th>리그이름</th>
					<td><form:input path="l_title" cssClass="option-box"/></td>
				</tr>
				<tr>
					<th>지역</th>
					<td><form:select path="l_area" items="${area}" cssClass="option-box"/></td>
				</tr>
				<tr>
					<th>날짜</th>
					<td><input type="date" name="l_date" id="l_date" class="option-box"></td>
				</tr>
				<tr>
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
					<form:hidden path="l_time" id="l_time"/>
					</td>
				</tr>
				<tr>
					<th>경기장</th>
					<td><form:input path="l_place" id="l_place" cssClass="option-box"/></td>
				</tr>
				<tr>
					<th>비용</th>
					<td><input type="number" name="l_cost" value="0" step="1000" class="option-box"/></td>
				</tr>
				<tr>
					<th>모집팀수</th>
					<td>
						<input type="number" name="l_number" min="5" max="100" value="5" class="option-box">
						<form:hidden path="l_team" value="0"/>
					</td>
				</tr>
				<tr>
					<th>종목</th>
					<td><form:select path="l_type" items="${type}" cssClass="option-box"/></td>
				</tr>
				<tr height="80">
					<th>상세내용</th>
					<td><form:textarea path="l_content"/></td>
				</tr>
			</table>
			<br>
			<input type="submit" value="리그등록" class="match-btn">
			<input type="button" value="목록으로" class="match-btn" onclick="location.href='leagueList.do'">
		</form:form>
	</div>
</div>