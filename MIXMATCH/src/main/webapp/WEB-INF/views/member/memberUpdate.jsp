<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript">
$(document).ready(function(){
	var favor = $("#favorSelect").val();
	$("#favor").val(favor).prop("selected", true);
});
</script>
<style>
form div{
	width: 20%; 
	margin: 0 auto; 
	margin-bottom: 20px;
}
</style>
<div class="page-main-style">
	<h1>회원수정</h1>
	<form:form commandName="memberCommand" id="update_form" enctype="multipart/form-data">
		<form:errors element="div" cssClass="error-color"/>
		<form:hidden path="id"/>
		<input type="hidden" id="favorSelect" value="${memberCommand.favor }">
		<div class="form-group">
			<label for="name">이름</label>
			<form:input path="name" cssClass="form-control"/>
			<form:errors path="name" cssClass="error-color"/>
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
			<input type="submit" value="회원수정">
			<input type="button" value="내정보 보기" onclick="location.href='detail.do'">
		</div>
	</form:form>
</div>