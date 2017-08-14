<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<div class="page-main-style">
	<h1>글쓰기</h1>
	<form:form commandName="command" action="write.do"
	    enctype="multipart/form-data"
	    id="register_form">
	    <form:hidden path="id"/>
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
			</li>
		</ul>
		<div class="align-center">
			<input type="submit" value="전송">
			<input type="button" value="목록"
			           onclick="location.href='list.do'">
		</div>
	</form:form>
</div>









