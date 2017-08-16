<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/match/match.js"></script>
<div class="page-main-style">
	<h2>매치등록</h2>
	<hr class="style"><br>
	<form:form class="style" commandName="match" action="matchInsert.do" enctype="multipart/form-data" id="insert_form">
		<form:errors element="div" cssClass="error-color"/><br>
		<form:hidden path="m_type" value="null"/>
		<ul>
			<li>
				<label for="t_name">팀명</label>
				<select name="t_name" class="select_box">
					<c:forEach var="team" items="${team}">
						<option value="${team.t_name}:${team.t_type}">${team.t_name}:${team.t_type}</option>
					</c:forEach>
				</select>
			</li>
			<li>
				<label for="m_area">지역</label>
				<form:select path="m_area" items="${area}" cssClass="select_box"/>
				<form:errors path="m_area" cssClass="error-color"/>
			</li>
			<li>
				<label for="m_date">날짜</label>
				<input type="date" name="m_date" id="m_date">
				<form:errors path="m_date" cssClass="error-color"/>
			</li>
			<li>
				<label for="m_time">시간</label>
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
				<form:hidden path="m_time" id="m_time"/>
				<form:errors path="m_time" cssClass="error-color"/>
			</li>
			<li>
				<label for="m_place">경기장</label>
				<form:input path="m_place" id="m_place"/>
				<form:errors path="m_place" cssClass="error-color"/>
			</li>
			<li>
				<label for="m_cost">비용</label>
				<form:input path="m_cost"/>원
				<form:errors path="m_cost" cssClass="error-color"/>
			</li>
			<li>
				<label for="m_content">내용</label>
				<form:textarea path="m_content"/>
				<form:errors path="m_content" cssClass="error-color"/>
			</li>
		</ul>
	<input type="submit" value="매치등록" class="btn">
	<input type="button" value="목록으로" class="btn" onclick="location.href='matchBoard.do'">
	</form:form>
	<br><hr class="style">
</div>