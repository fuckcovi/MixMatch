<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link href="${pageContext.request.contextPath}/resources/css/layout222.css" rel="stylesheet">
<style type="text/css">
	.style th{text-align: center;}
</style>
<div class="page-main-style">
	<h2><b>팀원관리</b></h2>
	<table class="style" >
		<tr>
			<th colspan="2">팀명</th>
			<th>종목</th>
			<th>팀마스터</th>
			<th>연고지</th>
		</tr>
		<tr>
			<td>
				<c:if test="${fn:endsWith(team.t_logo_name, '.jpg') || fn:endsWith(team.t_logo_name, '.png') || fn:endsWith(team.t_logo_name, '.gif') || fn:endsWith(team.t_logo_name, '.JPG') || fn:endsWith(team.t_logo_name, '.PNG') || fn:endsWith(team.t_logo_name, '.GIF')}">
					<img src="${pageContext.request.contextPath}/team/imageView.do?t_name=${team.t_name}" style="width:100px;height:100px;">
				</c:if> 
				<c:if test="${empty team.t_logo_name }">
				<c:if test="${team.t_type eq '야구' }">
					<img src="${pageContext.request.contextPath}/resources/images/baseball.png" style="width:100px;height:100px;">
				</c:if>
				<c:if test="${team.t_type eq '농구' }">
					<img src="${pageContext.request.contextPath}/resources/images/basketball.png" style="width:100px;height:100px;">
				</c:if>
				<c:if test="${team.t_type eq '축구' }">
					<img src="${pageContext.request.contextPath}/resources/images/football.png" style="width:100px;height:100px;">
				</c:if>
				</c:if>
			</td>
			<td>${team.t_name}</td>
			<td>${team.t_type}</td>
			<td>${team.id}</td>
			<td>${team.t_address}</td>
		</tr>
	</table>
	
	<hr>
	 
	<table class="style">
		<tr>
			<th>프로필</th>
			<th>이름</th>
			<th>팀가입일</th>
			<th>팀원여부</th>
			<c:if test="${tMemList.get(0).master == user_id}">
			<th>팀내보내기</th>
			</c:if>
		</tr>
	<c:forEach var="list" items="${tMemList}">
		<tr>
			<td>
				<c:if test="${fn:endsWith(list.profile_name, '.jpg') || fn:endsWith(list.profile_name, '.png') || fn:endsWith(list.profile_name, '.gif') || fn:endsWith(list.profile_name, '.JPG') || fn:endsWith(list.profile_name, '.PNG') || fn:endsWith(list.profile_name, '.GIF')}">
					<img src="${pageContext.request.contextPath }/team/imageViewMem.do?id=${list.id}" style="width:100px;height:100px;">
				</c:if>
				<c:if test="${empty list.profile_name }">
					<img src="${pageContext.request.contextPath}/resources/images/profile.jpg" style="width:100px;height:100px;">
				</c:if>
			</td>
			<td><a href="${pageContext.request.contextPath }/mypage/main.do?id=${list.id}">${list.name}</a></td>
			<td>${list.t_mem_regdate}</td>
			<td> 
				<c:if test="${list.t_mem_auth==1}">
					팀원
				</c:if>
				<c:if test="${list.t_mem_auth==0}">
					미승인 회원
					<c:if test="${list.master == user_id }">
					<input type="button" class="btn" value="승인" onclick="location.href='${pageContext.request.contextPath }/team/approveMem.do?t_name=${list.t_name}&id=${list.id}'">
					</c:if>
				</c:if>
			</td>
			<c:if test="${list.master == user_id }">
				<td><input type="button" class="btn" value="내쫒기"  onclick="location.href='${pageContext.request.contextPath }/team/deleteMem.do?t_name=${list.t_name}&id=${list.id}'" <c:if test="${list.id==list.master}">disabled</c:if>></td>
			</c:if>
		<tr>
	</c:forEach>
	</table>
</div>