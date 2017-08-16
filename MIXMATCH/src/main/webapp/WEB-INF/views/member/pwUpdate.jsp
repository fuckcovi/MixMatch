<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<style>
form div{
	width: 20%; 
	margin: 0 auto; 
	margin-bottom: 20px;
}
</style>
<div class="page-main-style">
	<h1>비밀번호 수정</h1>
	<form:form commandName="memberCommand" id="pwUpdate_form" action="pwUpdate.do">
		<form:errors element="div" cssClass="error-color"/>
		<div class="form-group">
			<label for="pw">비밀번호</label>
			<form:password path="pw" cssClass="form-control"/>
			<form:errors path="pw" cssClass="error-color"/>		
		</div>
		<div class="form-group">
			<label for="changePw">변경할 비밀번호</label>
			<form:password path="changePw" cssClass="form-control"/>
			<form:errors path="changePw" cssClass="error-color"/>		
		</div>
		<div class="form-group">
			<label for="changePwCheck">비밀번호 확인</label>
			<form:password path="changePwCheck" cssClass="form-control"/>
			<form:errors path="changePwCheck" cssClass="error-color"/>		
		</div>
		<div class="align-center">
			<input type="submit" value="비밀번호 수정">
			<input type="button" value="내정보 보기" onclick="location.href='detail.do'">
		</div>
	</form:form>
</div>