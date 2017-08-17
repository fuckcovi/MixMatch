<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/match/match.js"></script>
<div class="match-div">
	<h3 style="text-align:left;font-weight:bold;">결과등록</h3>
	<hr class="match-hr"><br>
	
	<div class="match-form">
		<form:form class="style" commandName="match" action="scoreUpdate.do" enctype="multipart/form-data" id="result_form">
			<form:errors element="div" cssClass="error-color"/><br>
			<form:hidden path="m_seq"/>
			<form:hidden path="t_name"/>
			<form:hidden path="m_challenger"/>
			<table class="insert-table">
				<tr>
					<th><span style="color:red;">${match.t_name}</span> 점수</th>
					<td><form:input path="m_home" value="0" cssClass="option-box" name="m_home"/></td>
				</tr>
				<tr>
					<th><span style="color:blue;">${match.m_challenger}</span> 점수</th>
					<td><form:input path="m_away" value="0" cssClass="option-box" name="m_away"/></td>
				</tr>
				<tr>
					<th>MVP</th>
					<td><form:select path="m_mvp" items="${mvpMember}" cssClass="option-box"/></td>
				</tr>
			</table>
			<br>
			<input type="submit" value="결과등록" class="match-btn">
			<input type="button" value="목록으로" class="match-btn" onclick="location.href='scoreBoard.do'">
		</form:form>
	</div>
</div>