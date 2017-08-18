<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
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
	<h2>글 수정</h2>
	
	<form:form commandName="teamboard" action="${pageContext.request.contextPath}/teamboard/teamboardUpdate.do" enctype="multipart/form-data">
		<form:errors element="div" cssClass="error-color"/>
		<form:hidden path="gt_seq"/>
		<form:hidden path="id"/>
		<ul>
			<li>
				<label for="t_name">팀선택</label>
				<form:select path="t_name">
				<c:forEach var="list" items="${ teamlist}">
					<form:option value="${list.t_name}"/>
				</c:forEach>
				</form:select>
				
			</li>
			
			<li>
				<label for="gt_title">제목</label>
				<form:input path="gt_title"/>
				<form:errors path="gt_title" cssClass="error-color"/>
			</li>
			<li>
				<label for="gt_content">내용</label>
				<form:input path="gt_content"/>
				<form:errors path="gt_content" cssClass="error-color"/>
			</li>
			<li>
				<label for="gt_uploadfile_upload">파일업로드</label>
				<!-- <input type="file" name="gt_uploadfile_upload" id="gt_uploadfile_upload"> -->
				<div class="file_input" style="width: 100%;">
				    <label>
				        File
				        <input type="file" id="gt_uploadfile_upload" name="gt_uploadfile_upload" onchange="javascript:document.getElementById('file_route').value=this.value">
				    </label>
				    <input type="text" readonly="readonly" title="File Route" id="file_route">
				</div>
				<c:if test="${!empty teamboard.gt_filename}">
				<br>
				<span>(${teamboard.gt_filename})파일이 등록되어 있습니다.
				다시 업로드하면 기존 파일은 삭제됩니다.</span>
				</c:if>
			</li>
		</ul>
		<input type="submit" value="글 수정">
		<input type="button" value="취소" onclick="location.href='${pageContext.request.contextPath}/teamboard/teamboard.do'">
	</form:form>
</div>