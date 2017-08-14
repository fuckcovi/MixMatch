<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="page-main-style">
	<h2>리그등록</h2>
	<hr class="l-style">
	<br>
	<form:form class="style" commandName="league" action="leagueInsert.do" enctype="multipart/form-data" id="l_insert_form">
		<form:errors element="div" cssClass="error-color"/><br>
		<ul>
			<li>
				<label for="id">개최자</label>${league.id}
				<form:hidden path="id" value="${league.id}"/>
			</li>
			<li>
				<label for="l_title">리그이름</label>
				<form:input path="l_title"/>
			</li>
			<li>
				<label for="l_area">지역</label>
				<form:select path="l_area" items="${area}" cssClass="select_box"/>
			</li>
			<li>
				<label for="l_date">날짜</label>
				<input type="date" name="l_date">
			</li>
			<li>
				<label for="l_time">시간</label>
				<select id="ampm">
					<option value="오전">오전</option>
					<option value="오후">오후</option>
				</select>
				<select id="hour">
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
				<select id="minute">
					<option value="00분">00분</option>
					<option value="10분">10분</option>
					<option value="20분">20분</option>
					<option value="30분">30분</option>
					<option value="40분">40분</option>
					<option value="50분">50분</option>
				</select>
				<form:hidden path="l_time" id="l_time"/>
			</li>
			<li>
				<label for="l_place">경기장</label>
				<form:input path="l_place" id="l_place"/>
			</li>
			<li>
				<label for="l_cost">비용</label>
				<form:input path="l_cost"/>원
			</li>
			<li>
				<label for="l_content">내용</label>
				<form:textarea path="l_content"/>
			</li>
			<li>
				<label for="l_number">모집팀수</label>
				<input type="number" name="l_number" min="5" max="100" value="5">
				<form:hidden path="l_team" value="0"/>
			</li>
			<li>
				<label for="l_type">종목</label>
				<form:select path="l_type" items="${type}" cssClass="select_box"/>
			</li>
		</ul>
		<input type="submit" value="리그등록" class="btn">
		<input type="button" value="목록으로" class="btn" onclick="location.href='leagueList.do'">
	</form:form>
	<br>
	<hr class="l-style">
</div>