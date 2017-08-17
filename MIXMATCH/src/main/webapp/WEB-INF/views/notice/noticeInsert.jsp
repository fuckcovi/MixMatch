<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<style type="text/css">
	ul li{list-style: none;}
	input#gn_title{width:100%;height:50px;}
	#gn_content{width:100%;height:250px;}
</style>
<div class="page-main-style">
	<h2>공지사항</h2>
	<form:form commandName="noticeCommand" enctype="multipart/form-data" action="noticeInsert.do">
		<form:errors element="div" cssClass="error-color"/>
		<form:hidden path="id"/>
		<ul class="menu">
			<li>
				<label for="gn_title" style="float:left;"><h3>제목</h3></label><br>
				<form:input path="gn_title" />
				<form:errors path="gn_title" cssClass="error-color"/>
			</li>
			<li>
				<label for="gn_content" style="float:left;"><h3>내용</h3></label><br>
				<form:textarea path="gn_content"/>
				<form:errors path="gn_content" cssClass="error-color"/>
			</li> 
			<li>
				<label for="gn_uploadfile_upload" style="float:left;"><h3>파일업로드</h3></label><br>
				<input type="file" id="gn_uploadfile_upload" name="gn_uploadfile_upload">
			</li>
		</ul>
		<input type="submit" value="공지사항등록">
		<input type="button" value="취소" onclick="location.href='notice.do'">
	</form:form>
</div>