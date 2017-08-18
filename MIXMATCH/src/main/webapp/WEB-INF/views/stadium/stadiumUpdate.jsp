<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
<style>
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
	<h2>경기장 수정</h2>
	<ul style="list-style: none;">
	<form:form commandName="stadiumCommand" enctype="multipart/form-data" id="stadiumUpdate" action="${pageContext.request.contextPath }/stadium/stadiumUpdate.do" class="style" >
	<form:hidden path="s_seq" value="${s_seq}"/>
		<br>
		<br>
		<li>
		<label for="s_name">경기장 이름</label>
		<form:input path="s_name"/>
		</li>
		<li>
		<label for="s_type">경기장종목</label>
		<form:select path="s_type">
			<form:option value="야구"/>
			<form:option value="농구"/>
			<form:option value="축구"/>
		</form:select>
		</li>
		<li>
		<label for="s_address1">경기장 지역</label>
		<form:select path="s_address1">
			<form:option value="서울"/>
			<form:option value="경기"/>
			<form:option value="인천"/>
			<form:option value="강원"/>
			<form:option value="대전"/>
			<form:option value="충북"/>
			<form:option value="충남"/>
			<form:option value="광주"/>
			<form:option value="전북"/>
			<form:option value="전남"/>
			<form:option value="대구"/>
			<form:option value="울산"/>
			<form:option value="경북"/>
			<form:option value="경남"/>
			<form:option value="부산"/>
			<form:option value="제주"/>
		</form:select>
		</li>
		<li>
		<label for="s_address2">경기장 상세주소</label>
		<form:input path="s_address2"/>
		</li>
		<li>
		<label for="s_logo_upload">경기장 로고</label>
		<!-- <input type="file" id="s_logo_upload" name="s_logo_upload"> -->
		<div class="file_input" style="width: 100%;">
		    <label>
		        File
		        <input type="file" name="s_logo_upload" id="s_logo_upload" onchange="javascript:document.getElementById('file_route').value=this.value">
		    </label>
		    <input type="text" readonly="readonly" title="File Route" id="file_route">
		</div>
		<c:if test="${!empty stadiumCommand.s_logo_name}">
			<br>
			<span>(${stadiumCommand.s_logo_name}이 등록되어있습니다. 재업로드하면 기존 파일은 삭제됩니다.)</span>
		</c:if>
		</li>
		<input type="submit" value="경기장수정">
	</form:form>
	</ul>
</div>