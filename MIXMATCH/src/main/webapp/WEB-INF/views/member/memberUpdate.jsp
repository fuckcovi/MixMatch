<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript">
$(document).ready(function(){
	var favor = $("#favorSelect").val();
	$("#favor").val(favor).prop("selected", true);
});
</script>
<style>
form div{
	width: 20%; 
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
	<h1>회원수정</h1>
	<form:form commandName="memberCommand" id="update_form" enctype="multipart/form-data">
		<form:errors element="div" cssClass="error-color"/>
		<form:hidden path="id"/>
		<input type="hidden" id="favorSelect" value="${memberCommand.favor }">
		<div class="form-group">
			<label for="name">이름</label>
			<form:input path="name" cssClass="form-control"/>
			<form:errors path="name" cssClass="error-color"/>
		</div>
		<div class="form-group">
			<label for="phone">전화번호</label>
			<form:input path="phone" cssClass="form-control"/>
			<form:errors path="phone" cssClass="error-color"/>
		</div>
		<div class="form-group">
			<label for="email">이메일</label>
			<form:input path="email" cssClass="form-control"/>
			<form:errors path="email" cssClass="error-color"/>
		</div>
		<div class="form-group">
			<label for="favor">관심종목</label>
			<select name="favor" id="favor">
				<option value="none" selected="selected">없음</option>
				<option value="soccer">축구</option>
				<option value="baseball">야구</option>
				<option value="basketball">농구</option>
			</select>
		</div>
		<div class="form-group">
			<label for="address">주소</label>
			<form:input path="address" cssClass="form-control"/>
			<form:errors path="address" cssClass="error-color"/>
		</div>
		<div class="form-group">
			<label for="profile_upload">프로필 사진</label>
			<div class="file_input" style="width: 100%;">
			    <label>
			        File
			        <input type="file" name="profile_upload" id="profile_upload" onchange="javascript:document.getElementById('file_route').value=this.value">
			    </label>
			    <input type="text" readonly="readonly" title="File Route" id="file_route">
			</div>
			<c:if test="${!empty memberCommand.profile_name}">
            <br><span>(${memberCommand.profile_name }) 파일이 등록되어 있습니다.<br>
                    다시 업로드하면 기존 파일은 삭제됩니다.</span>
            </c:if>
			
		</div>
		<div class="align-center">
			<input type="submit" class="btn" value="회원수정">
			<input type="button" class="btn" value="내정보 보기" onclick="location.href='detail.do'">
		</div>
	</form:form>
</div>