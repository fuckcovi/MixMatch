<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="page-main-style">
	<h2>공지사항 수정</h2>
	<form:form commandName="noticeCommand" enctype="multipart/form-data" action="noticeUpdate.do">
		<form:errors element="div" cssClass="error-color"/>
		<form:hidden path="id"/>
		<form:hidden path="gn_seq"/>
		<ul class="menu">
			<li>
				<label for="gn_title">제목</label>
				<form:input path="gn_title"/>
				<form:errors path="gn_title" cssClass="error-color"/>
			</li>
			<li>
				<label for="gn_content">내용</label>
				<form:input path="gn_content"/>
				<form:errors path="gn_content" cssClass="error-color"/>
			</li>
			<li>
				<label for="gn_uploadfile_upload">파일업로드</label>
				<input type="file" id="gn_uploadfile_upload" name="gn_uploadfile_upload">
				<c:if test="${!empty noticeCommand.gn_filename}">
	            <br><span>(${noticeCommand.gn_filename }) 파일이 등록되어 있습니다.<br>
	            	다시 업로드하면 기존 파일은 삭제됩니다.</span>
	            </c:if>
			</li>
		</ul>
		<div class="align-right">
			<input type="submit" value="공지사항 수정">
			<input type="button" value="취소" onclick="location.href='noticeDetail.do?gn_seq=${noticeCommand.gn_seq}'">
		</div>
	</form:form>

</div>
