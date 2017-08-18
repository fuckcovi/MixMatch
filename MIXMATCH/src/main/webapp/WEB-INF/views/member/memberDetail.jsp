<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<style>
form div{
	width: 20%; 
	margin: 0 auto; 
	margin-bottom: 20px;
}
</style>
<div class="page-main-style">
	<h2>회원 상세 정보</h2>
	<form>
		<div class="form-group">
			<label>아이디 : ${member.id }</label>
		</div>
		<div class="form-group">
			<label>이름 : ${member.name }</label>
		</div>
		<div class="form-group">
			<label>생일 : ${member.birth }</label>
		</div>
		<div class="form-group">
			<label>전화번호 : ${member.phone }</label>
		</div>
		<div class="form-group">
			<label>이메일 : ${member.email }</label>
		</div>
		<div class="form-group">
			<label>주소 : ${member.address }</label>
		</div>
		<div class="form-group">
		<c:choose>
		<c:when test="${member.favor == 'soccer'}">
			<label>관심종목 : 축구</label>
		</c:when>
		<c:when test="${member.favor == 'basketball'}">
			<label>관심종목 : 농구</label>
		</c:when>
		<c:when test="${member.favor == 'baseball'}">
			<label>관심종목 : 야구</label>
		</c:when>
		<c:otherwise>
			<label>관심종목 : 없음</label>
	    </c:otherwise>
	    </c:choose>
		</div>
		<div class="form-group">
			<label>현재 포인트 : ${member.point }</label>
		</div>
		<div class="form-group">
			<label>회원등급 : ${member.auth }</label>
		</div>
		<div class="form-group">
			<label>가입일 : ${member.regdate }</label>
		</div>
	</form>
	<hr size="1" width="100%"/>
	<p class="align-center">
		<input type="button" class="btn" value="비밀번호 수정" onclick="location.href='pwUpdate.do'">
		<input type="button" class="btn" value="회원정보 수정" onclick="location.href='pwCheck.do'">
		<input type="button" class="btn" value="회원 탈퇴" onclick="location.href='delete.do'">
	</p>
</div>