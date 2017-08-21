<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/board/board.js"></script>
<style type="text/css">
#search_form{height:50px;margin:0 auto;display: inline-block;margin-left:10px;}
.search{list-style:none;} 
.search li{float:left;}
table th{text-align: center;}
</style>
<div class="page-main-style">
	<h2>게시판 목록</h2>
	<form action="list.do" id="search_form" method="get">
		<ul class="search">
			<li>
				<select name="keyfield"  style="height:30px;">
					<option value="title">제목</option>
					<option value="id">ID</option>
					<option value="content">내용</option>
					<option value="all">전체</option>
				</select>
			</li>
			<li>
				<input type="text" name="keyword" id="keyword"  style="height:30px;">
			</li>
			<li>
				<input type="submit" class="btn" value="찾기"  style="height:30px;">
			</li>
		</ul>
	</form>
	
	<c:if test="${count == 0}">
	<div class="align-center">등록된 게시물이 없습니다.</div>
	</c:if>
	<c:if test="${count > 0}">
	<table class="table table-bordered" style="width: 70%; margin: 0 auto;">
		<tr>
			<th>번호</th>
			<th width="400">제목</th>
			<th>ID</th>
			<th>등록날짜</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="article" items="${list}">
		<tr>
			<td>${article.gb_seq}</td>
			<td><a href="detail.do?gb_seq=${article.gb_seq}">${article.gb_title}(${article.reply_cnt})</a></td>
			<td>${article.id}</td>
			<td>${article.gb_regdate}</td>
			<td>${article.gb_hit}</td>
		</tr>
		</c:forEach>
	</table>
	<div class="align-center">${pagingHtml}</div>
	</c:if>
	<div class="align-right">
		<input type="button" class="btn" value="글쓰기" onclick="location.href='write.do'">
	</div>
</div>









