<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="${pageContext.request.contextPath}/resources/css/layout222.css" rel="stylesheet">
<style type="text/css">
	.style th{
		text-align: center;
	}
	#search_form{height:50px;margin:0 auto;display: inline-block;}
	.search{list-style:none;} 
	.search li{float:left;}
	.style #title{
	 width:600px;
	}
</style>
<div class="page-main-style">
	<h2>공지사항</h2>
	<form action="notice.do" id="search_form" method="get" >
		<ul class="search">
			<li>
				<select name="keyfield" style="height:30px;">
					<option value="gn_title">제목</option>
					<option value="gn_content">내용</option>
					<option value="all">전체</option>
				</select>
			</li> 
			<li>
				<input type="text" name="keyword" id="keyword" style="height:30px;">
			</li>
			<li>
				<input type="submit" value="찾기" style="height:30px;">
			</li>
			<c:if test="${user_id == 'admin'}">
			<li> 
				<input type="button" value="글쓰기"  onclick="location.href='noticeInsert.do'" style="height:30px;">
			</li>
			</c:if>
		</ul> 
	</form>
	
	<c:if test="${count==0 }">
		<div class="align-center">등록된 공지사항이 없습니다.</div>
	</c:if>
	<c:if test="${count>0 }">
		<table class="style">
			<tr>
				<th>번호</th>
				<th id="title">제목</th>
				<th>등록일</th>
				<th>조회수</th>
			</tr>
			<c:forEach var="article" items="${list}">
			<tr>
				<td>${article.gn_seq }</td>
				<td><a href="noticeDetail.do?gn_seq=${article.gn_seq}">${article.gn_title}</a></td>
				<td>${article.gn_regdate}</td>
				<td>${article.gn_hit}</td>
			</tr>
			</c:forEach>
		</table>
		<div class="align-center">${pagingHtml}</div>
	</c:if>
</div>