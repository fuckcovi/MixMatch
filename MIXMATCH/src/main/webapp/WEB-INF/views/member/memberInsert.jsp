<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/member/confirmId.js"></script>
<style>
form div{
	width: 20%; 
	margin: 0 auto; 
	margin-bottom: 20px;
}
</style>
<div class="page-main-style">
	<h1>회원가입</h1>
	<form:form commandName="memberCommand" id="write_form" enctype="multipart/form-data">
		<form:errors element="div" cssClass="error-color"/>
		<div class="form-group form-inline">
			<label for="id">아이디</label>
			<form:input path="id" cssClass="form-control" style="width: 130px;"/>
			<input type="button" id="confirmId" value="아이디 중복체크">
			<span id="message_id"></span>
			<img src="${pageContext.request.contextPath }/resources/images/ajax-loader.gif" id="loading" width="16" height="16" style="display: none;">
			<form:errors path="id" cssClass="error-color"/>
		</div>
		<div class="form-group">
			<label for="name">이름</label>
			<form:input path="name" cssClass="form-control"/>
			<form:errors path="name" cssClass="error-color"/>
		</div>
		<div class="form-group">
			<label for="pw">비밀번호</label>
			<form:password path="pw" cssClass="form-control"/>
			<form:errors path="pw" cssClass="error-color"/>
		</div>
		<div class="form-group">
			<label for="birth">생일</label>
			<input type="date" name="birth" id="birth">
			<form:errors path="birth" cssClass="error-color"/>
		</div>
		<div class="form-group">
			<label for="phone">전화번호</label>
			<form:input path="phone" cssClass="form-control"/>
			<form:errors path="phone" cssClass="error-color"/>
		</div>
		<div class="form-group">
			<label for="email">이메일</label>
			<form:input path="email" cssClass="form-control"/>
			<form:errors path="email" cssClass="error-color"/>
		</div>
		<div class="form-group">
			<label for="favor">관심종목</label>
			<select name="favor" id="favor">
				<option value="none" selected="selected">없음</option>
				<option value="soccer">축구</option>
				<option value="baseball">야구</option>
				<option value="basketball">농구</option>
			</select>
		</div>
		<div class="form-group">
			<label for="address">주소</label>
			<form:input path="address" cssClass="form-control"/>
			<form:errors path="address" cssClass="error-color"/>
		</div>
		<div class="form-group">
			<label for="profile_upload">프로필 사진</label>
			<input type="file" name="profile_upload" id="profile_upload">
		</div>
		<div class="align-center">
			<input type="submit" value="회원가입">
			<input type="button" value="홈으로" onclick="location.href='${pageContext.request.contextPath}/main.do'">
		</div>
	</form:form>
</div>