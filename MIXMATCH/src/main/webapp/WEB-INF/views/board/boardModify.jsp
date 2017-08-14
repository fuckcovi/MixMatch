<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<div class="page-main-style">
	<h1>글수정</h1>
	<form:form commandName="command" action="update.do"
	    enctype="multipart/form-data"
	    id="modify_form">
	    <form:hidden path="id"/>
	    <form:hidden path="gb_seq"/>
	    <form:errors element="div" cssClass="error-color"/>       
		<ul>
			<li>
				<label for="gb_title">제목</label>
				<form:input path="gb_title"/>
				<form:errors path="gb_title" cssClass="error-color"/>
			</li>
			<li>
				<label for="gb_content">내용</label>
				<form:textarea path="gb_content"/>
				<form:errors path="gb_content" cssClass="error-color"/>
			</li>
			<li>
				<label for="gb_upload">파일업로드</label>
				<input type="file" name="gb_upload" id="gb_upload">
				<c:if test="${!empty command.gb_filename}">
				<br>
				<span>(${command.gb_filename})파일이 등록되어 있습니다.
				다시 업로드하면 기존 파일은 삭제됩니다.</span>
				</c:if>
			</li>
		</ul>
		<div class="align-center">
			<input type="submit" value="전송">
			<input type="button" value="목록"
			           onclick="location.href='list.do'">
		</div>
	</form:form>
</div>









