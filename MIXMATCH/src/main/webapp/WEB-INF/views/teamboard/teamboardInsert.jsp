<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<style>
form div{
	width: 40%;  
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
	<h2>팀게시판</h2>
	
	<form:form commandName="teamboardCommand" enctype="multipart/form-data">
		<form:errors element="div" cssClass="error-color"/>
		<form:hidden path="id"/>
		<div class="form-group">
				<label for="t_name">팀선택</label>
				<form:select path="t_name" class="form-control">
				<c:forEach var="list" items="${ teamlist}">
					<form:option value="${list.t_name}"/>
				</c:forEach>
				</form:select>
		</div>
		<div class="form-group">
				<label for="gt_title">제목</label>
				<form:input path="gt_title" class="form-control"/>
				<form:errors path="gt_title" cssClass="error-color"/>
		</div>
		<div class="form-group">
				<label for="gt_content">내용</label>
				<textarea rows="10" cols="50" name="gt_content" class="form-control"></textarea>
				<form:errors path="gt_content" cssClass="error-color"/>
			</div>
		<div class="form-group">
				<label for="gt_uploadfile_upload">파일업로드</label>
				<!-- <input type="file" id="gt_uploadfile_upload" name="gt_uploadfile_upload"> -->
				<div class="file_input" style="width: 100%;">
				    <label>
				        File
				        <input type="file" id="gt_uploadfile_upload" name="gt_uploadfile_upload" onchange="javascript:document.getElementById('file_route').value=this.value">
				    </label>
				    <input type="text" readonly="readonly" title="File Route" id="file_route">
				</div>
			</div>
			<div class="align-center">
		<input type="submit" class="btn" value="팀게시판등록">
		<input type="button" class="btn" value="취소" onclick="location.href='${pageContext.request.contextPath}/teamboard/teamboard.do'">
		</div>
	</form:form>
</div>