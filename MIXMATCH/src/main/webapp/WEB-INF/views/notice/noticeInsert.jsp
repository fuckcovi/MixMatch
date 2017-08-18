<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<style>
form div{
	width: 25%; 
	margin: 0 auto; 
	margin-bottom: 20px;
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
	<h2>공지사항 등록</h2>
	<form:form commandName="noticeCommand" enctype="multipart/form-data" action="noticeInsert.do">
		<form:errors element="div" cssClass="error-color"/>
		<form:hidden path="id"/>
		<div class="form-group">
			<label for="gn_title">제목</label>
			<form:input path="gn_title" cssClass="form-control"/>
			<form:errors path="gn_title" cssClass="error-color"/>
		</div>
		<div class="form-group">
			<label for="gn_content">내용</label>
			<textarea rows="10" cols="50" name=gn_content class="form-control"></textarea>
			<form:errors path="gn_content" cssClass="error-color"/>
		</div>
		<div class="form-group">
			<label for="gn_uploadfile_upload">파일 업로드</label>
			<div class="file_input" style="width: 100%;">
			    <label>
			        File
			        <input type="file" id="gn_uploadfile_upload" name="gn_uploadfile_upload" onchange="javascript:document.getElementById('file_route').value=this.value">
			    </label>
			    <input type="text" readonly="readonly" title="File Route" id="file_route">
			</div>
			<form:errors path="gn_uploadfile_upload" cssClass="error-color"/>
		</div>
		<input type="submit" class="btn" value="공지사항 등록">
		<input type="button" class="btn" value="목록보기" onclick="location.href='notice.do'">
	</form:form>
</div>