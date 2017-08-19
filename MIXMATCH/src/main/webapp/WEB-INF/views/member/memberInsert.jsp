<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/member/confirmId.js"></script>
<style>
form div{
	width: 25%; 
	margin: 0 auto; 
	margin-bottom: 20px;
}
form label{
	float: left;
	width: 100px;
}
.file_input label {
    position:relative;
    cursor:pointer;
    display:inline-block;
    vertical-align:middle;
    overflow:hidden;
    width:70px;
    height:30px;
    background:#777;
    color:#fff;
    text-align:center;
    line-height:30px;
    left: 20px;
}
.file_input label input {
    position:absolute;
    width:0;
    height:0;
    overflow:hidden;
}
.file_input input[type=text] {
    vertical-align:middle;
    display:inline-block;
    width:120px;
    height:28px;
    line-height:28px;
    font-size:11px;
    padding:0;
    border:0;
    border:1px solid #777;
}
</style>
<div class="page-main-style">
	<h1>회원가입</h1>
	<form:form commandName="memberCommand" id="write_form" enctype="multipart/form-data">
		<form:errors element="div" cssClass="error-color"/>
		<div class="form-group form-inline">
			<label for="id">아이디</label>
			<form:input path="id" cssClass="form-control" style="width: 120px;"/>
			<input type="button" class="btn btn-warning" style="width: 80px;" id="confirmId" value="중복체크">
			<span id="message_id"></span>
			<img src="${pageContext.request.contextPath }/resources/images/ajax-loader.gif" id="loading" width="16" height="16" style="display: none;">
			<form:errors path="id" cssClass="error-color"/>
		</div>
		<div class="form-group form-inline">
			<label for="name">이름</label>
			<form:input path="name" cssClass="form-control"/>
			<form:errors path="name" cssClass="error-color"/>
		</div>
		<div class="form-group form-inline">
			<label for="pw">비밀번호</label>
			<form:password path="pw" cssClass="form-control"/>
			<form:errors path="pw" cssClass="error-color"/>
		</div>
		<div class="form-group form-inline">
			<label for="birth">생일</label>
			<input type="date" name="birth" id="birth">
			<form:errors path="birth" cssClass="error-color"/>
		</div>
		<div class="form-group form-inline">
			<label for="phone">전화번호</label>
			<form:input path="phone" cssClass="form-control"/>
			<form:errors path="phone" cssClass="error-color"/>
		</div>
		<div class="form-group form-inline">
			<label for="email">이메일</label>
			<form:input path="email" cssClass="form-control"/>
			<form:errors path="email" cssClass="error-color"/>
		</div>
		<div class="form-group form-inline">
			<label for="favor">관심종목</label>
			<select name="favor" id="favor">
				<option value="없음" selected="selected">없음</option>
				<option value="축구">축구</option>
				<option value="야구">야구</option>
				<option value="농구">농구</option>
			</select>
		</div>
		<div class="form-group form-inline">
			<label for="address">주소</label>
			<form:input path="address" cssClass="form-control"/>
			<form:errors path="address" cssClass="error-color"/>
		</div>
		<div class="form-group form-inline">
			<label for="profile_upload">프로필 사진</label>
			<div class="file_input" style="width: 100%;">
			    <label>
			        File
			        <input type="file" name="profile_upload" id="profile_upload" onchange="javascript:document.getElementById('file_route').value=this.value">
			    </label>
			    <input type="text" readonly="readonly" title="File Route" id="file_route">
			</div>
		</div>
		<div class="align-center">
			<input type="submit" class="btn" value="회원가입">
			<input type="button" class="btn" value="홈으로" onclick="location.href='${pageContext.request.contextPath}/home.do'">
		</div>
	</form:form>
</div>