<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/team/confirmTname.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/team/teamLogo.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/layout222.css" rel="stylesheet">
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
	<h2>팀생성</h2>
	<hr class="style"><br>
	<form:form id="teamRegister" class="style" commandName="teamCommand" action="${pageContext.request.contextPath}/team/teamRegister.do" enctype="multipart/form-data">
	<form:errors element="div" cssClass="error-color"/>
	<input type="hidden" id="id" name="id" value="${user_id}"><br><br>
	<ul>
		<li>
			<label for="t_name">팀명</label>
			<form:input path="t_name"/>
			<input type="button" id="confirmTname" class="btn" value="중복체크">
			<span id="message_tname"></span>
			<img src="${pageContext.request.contextPath}/resources/images/ajax-loader.gif" width="16" height="16" style="display:none">
			<form:errors path="t_name" cssClass="error-color"/>
		</li>
		<li>
			<label for="t_type">팀종목</label>
			<form:select path="t_type"> 
				<form:option value="야구" >야구</form:option>
				<form:option value="축구">축구</form:option>
				<form:option value="농구">농구</form:option>
			</form:select>
			<form:errors path="t_type" cssClass="error-color"/>
		</li>
		<li>
			<label for="t_address">팀연고지</label>
			<form:select path="t_address">
				<form:option value="서울">서울</form:option>
				<form:option value="경기도">경기도</form:option>
				<form:option value="강원도">강원도</form:option>
				<form:option value="전라도">전라도</form:option>
				<form:option value="경상도">경상도</form:option>
				<form:option value="충청도">충청도</form:option>
				<form:option value="제주도">제주도</form:option>
				<form:option value="해외">해외</form:option>
			</form:select>
			<form:errors path="t_address" cssClass="error-color"/>
		</li>
		
		<li id="profileImage">
			<label for="t_logo_upload">팀로고</label>
			<div id="baseballImages">
			<img style="max-width:50px;max-height:50px;" src="${pageContext.request.contextPath}/resources/images/baseball.png" id="prifile_pick_base_1">
			<%-- <img style="max-width:50px;max-height:50px;" src="${pageContext.request.contextPath}/resources/images/baseball_logo.png">
			<img style="max-width:50px;max-height:50px;" src="${pageContext.request.contextPath}/resources/images/baseball_logo2.jpg">
			<img style="max-width:50px;max-height:50px;" src="${pageContext.request.contextPath}/resources/images/baseball_logo2.PNG">
			<img style="max-width:50px;max-height:50px;" src="${pageContext.request.contextPath}/resources/images/baseball_logo3.gif">
			 --%></div>
			<div id="basketballImages" style="display:none;">
			<img style="max-width:50px;max-height:50px;" src="${pageContext.request.contextPath}/resources/images/basketball.png">
		<%-- 	<img style="max-width:50px;max-height:50px;" src="${pageContext.request.contextPath}/resources/images/basketball_logo.jpg">
			<img style="max-width:50px;max-height:50px;" src="${pageContext.request.contextPath}/resources/images/basketball_logo2.png">
			<img style="max-width:50px;max-height:50px;" src="${pageContext.request.contextPath}/resources/images/basketball_logo3.png">
			<img style="max-width:50px;max-height:50px;" src="${pageContext.request.contextPath}/resources/images/basketball_logo4.PNG">
			<img style="max-width:50px;max-height:50px;" src="${pageContext.request.contextPath}/resources/images/basketball_logo5.png">
			<img style="max-width:50px;max-height:50px;" src="${pageContext.request.contextPath}/resources/images/basketball_logo6.jpg">
			<img style="max-width:50px;max-height:50px;" src="${pageContext.request.contextPath}/resources/images/basketball_logo7.png">
			<img style="max-width:50px;max-height:50px;" src="${pageContext.request.contextPath}/resources/images/basketball_logo8.jpg">
			<img style="max-width:50px;max-height:50px;" src="${pageContext.request.contextPath}/resources/images/basketball_logo9.jpg">
			 --%></div>
			<div id="footballImages" style="display:none;">
			<img style="max-width:50px;max-height:50px;" src="${pageContext.request.contextPath}/resources/images/football.png">
			<%-- <img style="max-width:50px;max-height:50px;" src="${pageContext.request.contextPath}/resources/images/football_logo.jpg">
			<img style="max-width:50px;max-height:50px;" src="${pageContext.request.contextPath}/resources/images/football_logo2.jpg">
			<img style="max-width:50px;max-height:50px;" src="${pageContext.request.contextPath}/resources/images/football_logo3.PNG">
			<img style="max-width:50px;max-height:50px;" src="${pageContext.request.contextPath}/resources/images/football_logo4.jpg">
			 --%></div>
		<span>팀로고 미설정 시 기본이미지</span>
		</li>
		<li>
			<!-- <input type="file" name="t_logo_upload" id="t_logo_upload"> -->
			<div class="file_input" style="width: 100%;">
		    <label>
		        File
		        <input type="file" name="t_logo_upload" id="t_logo_upload" onchange="javascript:document.getElementById('file_route').value=this.value">
		    </label>
		    <input type="text" readonly="readonly" title="File Route" id="file_route">
		</div>
		</li>
	</ul>
	<div class="align-center">
		<input type="submit" value="팀생성" class="btn">
	</div>
	<br><br>
	</form:form>
	<br><hr class="style">
</div>