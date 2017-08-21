<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/layout222.css" rel="stylesheet">
<style type="text/css">
	.style th{
		text-align: center;
	}
	#search_form{width:500px;height:50px;margin:0 auto;}
	.search{list-style:none;} 
	.search li{float:left; margin:10px 10px 10px 10px;}
</style>
<div class="page-main-style">
	<h2>팀게시판</h2>
	<div class="align-center" style="min-height:50px; width:100%;"> 
		<c:if test="${teamcount==0 }">
			<div>소속된 팀이 없어서 팀게시판 이용이 불가합니다.</div> 
		</c:if>
		<c:if test="${teamcount>0 }">
		<ul style="list-style: none;margin: 0 auto;height:70px; width:750px;padding:0;" id="teamboardList" >
			
			<c:forEach var="list" items="${teamlist}">
				<li style="float: left; width:150px; border:1px solid white;" value="${list.t_name}">
					<input type="button" style=" width:150px;" class="btn" value="${list.t_name}" onclick="location.href='${pageContext.request.contextPath}/teamboard/teamboard.do?t_name=${list.t_name}'">
				</li> 
			</c:forEach>
		</ul>
		</c:if>
	</div>
	<div class="align-right">
		<input type="button" class="btn" value="글쓰기"  onclick="location.href='${pageContext.request.contextPath}/teamboard/teamboardInsert.do'" >
	</div>
	<div>
	<c:if test="${count==0 }">
		<div class="align-center">등록된 팀게시글이 없습니다.</div>
	</c:if>
	<c:if test="${count>0 }">
		<table class="style"> 
			<tr>
				<th>번호</th>
				<th>팀명</th>
				<th width="400">제목</th>
				<th>등록일</th>
				<th>작성자</th>
				<th>조회수</th>
			</tr>
			<c:forEach var="article" items="${list}">
			<tr>
				<td>${article.gt_seq }</td>
				<td>${article.t_name}</td>
				<td><a href="${pageContext.request.contextPath}/teamboard/teamboardDetail.do?gt_seq=${article.gt_seq}">${article.gt_title}</a></td>
				<td>${article.gt_regdate}</td>
				<td>${article.id}</td>
				<td>${article.gt_hit}</td>
			</tr>
			</c:forEach>
		</table>
		<div class="align-center">${pagingHtml}</div>
	</c:if>
	<form action="${pageContext.request.contextPath}/teamboard/teamboard.do" id="search_form" method="get" >
		<ul class="search">
			<li>
				<select name="keyfield">
					<option value="gt_title">제목</option>
					<option value="gt_content">내용</option>
					<option value="id">작성자</option>
					<option value="all">전체</option>
				</select>
			</li> 
			<li>
				<input type="text" name="keyword" id="keyword">
			</li>
			<li>
				<input type="submit" class="btn"value="찾기">
			</li>
		</ul>
	</form>
	</div>
</div>