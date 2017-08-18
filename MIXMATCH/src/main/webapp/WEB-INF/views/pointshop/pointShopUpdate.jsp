<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript">
$(document).ready(function(){
	var grade = $("#gradeSelect").val();
	$("#p_grade").val(grade).prop("selected", true);
});
</script>
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
<h2>상품수정</h2>
<form:form commandName="pointShopCommand" enctype="multipart/form-data">
		<form:errors element="div" cssClass="error-color"/>		
		<form:hidden path="id"/>
		<input type="hidden" id="gradeSelect" value="${product.p_grade}">
		<div class="form-group">
			<label for="p_name">상품명</label>
			<form:input path="p_name" cssClass="form-control" value="${product.p_name}"/>
			<form:errors path="p_name" cssClass="error-color"/>
		</div>
		<div class="form-group">
			<label for="p_price">가격</label>
			<input type="number" name="p_price" min="1" class="form-control" value="${product.p_price}">
			<form:errors path="p_price" cssClass="error-color"/>
		</div>
		<div class="form-group">
			<label for="p_context">상품설명</label>
			<form:input path="p_context" cssClass="form-control" value="${product.p_context}"/>
			<form:errors path="p_context" cssClass="error-color"/>
		</div>
		<div class="form-group">
			<label for="p_grade" style="margin-bottom: 10px;">등급</label><br>
			<select name="p_grade" id="p_grade">
				<option value="BRONZE">브론즈</option>
				<option value="SILVER">실버</option>
				<option value="GOLD">골드</option>
				<option value="PLATINUM">플래티넘</option>
				<option value="DIAMOND">다이아몬드</option>
			</select>
			<form:errors path="p_grade" cssClass="error-color"/>
		</div>
		<div class="form-group">
			<label for="p_file">파일업로드</label>
			<div class="file_input" style="width: 100%;">
			    <label>
			        File
			        <input type="file" name="p_file" id="p_file" onchange="javascript:document.getElementById('file_route').value=this.value">
			    </label>
			    <input type="text" readonly="readonly" title="File Route" id="file_route">
			</div>
			<c:if test="${!empty product.p_file_name}">
            <br><span>(${product.p_file_name }) 파일이 등록되어 있습니다.<br>
            	다시 업로드하면 기존 파일은 삭제됩니다.</span>
            </c:if>
			<form:errors path="p_file" cssClass="error-color"/>
		</div>
		<%-- <ul class="menu">
			<li>				
				<label for="p_name">상품명</label>
				<form:input path="p_name" value="${product.p_name}"/>
				<form:errors path="p_name" cssClass="error-color"/>
			</li>
			<li>
				<label for="p_price">가격</label>
				<input type="number" name="p_price" min="1" value="${product.p_price}">
				<form:errors path="p_price" cssClass="error-color"/>
			</li>
			<li>
				<label for="p_context">상품설명</label>
				<input type="text" name="p_context" min="1" value="${product.p_context}">
				<form:errors path="p_context" cssClass="error-color"/>
			</li>
			<li>
				${product.p_grade}
				<label for="p_grade">등급</label>
				<select name="p_grade">
					<option value="BRONZE">브론즈</option>
					<option value="SILVER">실버</option>
					<option value="GOLD">골드</option>
					<option value="PLATINUM">플래티넘</option>
					<option value="DIAMOND">다이아몬드</option>
				</select>
				<form:errors path="p_grade" cssClass="error-color"/>
			</li>
			<li>
				<label for="p_file">파일업로드</label>
				<input type="file" name="p_file" id="p_file">
			</li>
		</ul> --%>
		<div class="align-center">
			<input type="submit" class="btn btn-success" value="수정">
			<input type="button" class="btn btn-info" value="홈으로" onclick="location.href='pointHome.do'">
		</div>
	</form:form>
</div>