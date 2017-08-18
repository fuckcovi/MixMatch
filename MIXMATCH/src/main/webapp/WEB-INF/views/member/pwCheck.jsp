<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<style>
form div{
	width: 20%; 
	margin: 0 auto; 
	margin-bottom: 20px;
}
</style>
<div class="page-main-style">
	<h1>비밀번호 확인</h1>
	<form:form commandName="memberCommand" id="pwCheck_form">
		<form:errors element="div" cssClass="error-color"/>
		<div class="form-group">
			<label for="pw">비밀번호</label>
			<form:password path="pw" cssClass="form-control"/>
			<form:errors path="pw" cssClass="error-color"/>		
		</div>
		<div class="align-center">
			<input type="submit" class="btn" value="회원수정">
			<input type="button" class="btn" value="내정보 보기" onclick="location.href='detail.do'">
		</div>
	</form:form>
</div>