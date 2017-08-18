<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
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
	<h1>글수정</h1>
	<form:form commandName="command" action="update.do"
	    enctype="multipart/form-data"
	    id="modify_form">
	    <form:hidden path="id"/>
	    <form:hidden path="gb_seq"/>
	    <form:errors element="div" cssClass="error-color"/>      
	    <div class="form-group">
			<label for="gb_title">제목</label>
			<form:input path="gb_title" class="form-control"/>
			<form:errors path="gb_title" cssClass="error-color"/>
		</div>
		<div class="form-group">
			<label for="gb_content">내용</label>
			<textarea rows="10" cols="50" name=gb_content class="form-control">${command.gb_content}</textarea>
			<form:errors path="gb_content" cssClass="error-color"/>
		</div>
		<div class="form-group">
			<label for="gb_upload">파일업로드</label>
			<div class="file_input" style="width: 100%;">
			    <label>
			        File
			        <input type="file" id="gb_upload" name="gb_upload" onchange="javascript:document.getElementById('file_route').value=this.value">
			    </label>
			    <input type="text" readonly="readonly" title="File Route" id="file_route">
			    <c:if test="${!empty command.gb_filename}">
				<br>
				<span>(${command.gb_filename})파일이 등록되어 있습니다.
				다시 업로드하면 기존 파일은 삭제됩니다.</span>
				</c:if>
			</div>
			<form:errors path="gb_upload" cssClass="error-color"/>
		</div>
		
		<div class="align-center">
			<input type="submit" class="btn" value="수정">
			<input type="button" class="btn" value="목록"
			           onclick="location.href='list.do'">
		</div>
	</form:form>
</div>









