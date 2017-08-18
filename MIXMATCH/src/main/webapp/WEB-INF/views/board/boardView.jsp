<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/board/board.reply.js"></script>
<style>
form div{
	width: 25%; 
	margin: 0 auto; 
	margin-bottom: 20px;
}
</style>
<div class="page-main-style">
	<h2>${board.gb_title}</h2>
	<ul style="list-style: none;">
		<li>번호 : ${board.gb_seq}</li>
		<li>작성자 : ${board.id}</li>
		<li>조회수 : ${board.gb_hit}</li>
		<li>등록일 : ${board.gb_regdate}</li>
		<c:if test="${!empty board.gb_filename}">
		<li>첨부파일 : <a href="file.do?gb_seq=${board.gb_seq}">${board.gb_filename}</a></li>
		</c:if>
	</ul>
	<hr size="1" width="100%">
	<c:if test="${fn:endsWith(board.gb_filename,'.jpg') ||
	              fn:endsWith(board.gb_filename,'.JPG') ||
	              fn:endsWith(board.gb_filename,'.gif') ||
	              fn:endsWith(board.gb_filename,'.GIF') ||
	              fn:endsWith(board.gb_filename,'.png') ||
	              fn:endsWith(board.gb_filename,'.PNG')}">
	<div class="align-center">
		<img src="imageView.do?gb_seq=${board.gb_seq}" style="max-width:500px">
	</div>
	</c:if>
	<p>
		${board.gb_content}
	</p>
	<hr size="1" width="100%">
	<div class="align-right">
		<c:if test="${!empty user_id && user_id == board.id}">
		<input type="button" class="btn" value="수정"
		    onclick="location.href='update.do?gb_seq=${board.gb_seq}'">
		<input type="button" class="btn" value="삭제"
		    onclick="location.href='delete.do?gb_seq=${board.gb_seq}'">
		</c:if>
		<input type="button" class="btn btn-info" value="목록"
		    onclick="location.href='list.do'">    
	</div>
	<div id="reply_div">
		<span class="reply-title">댓글 달기</span>
		<form id="re_form">
			<input type="hidden" name="gb_seq"
			                 value="${board.gb_seq}" id="gb_seq">
			<input type="hidden" name="id"
			                 value="${user_id}" id="user_id">
			<textarea rows="3" cols="50"
			   name="gbre_content" id="gbre_content"
			   class="rep-content" style="resize: none;"
			   <c:if test="${empty user_id}">disabled="disabled"</c:if>
			   ><c:if test="${empty user_id}">로그인해야 작성할 수 있습니다.</c:if></textarea>  
			<c:if test="${!empty user_id}">
				<div id="re_first">
					<span class="letter-count">300/300</span>
				</div>
				<div id="re_second" class="align-right">
					<input type="submit" class="btn btn-success" value="댓글">
				</div>
			</c:if>                                   
		</form>
	</div>
	<!-- 목록 출력 -->
	<div id="output"></div>
	<div class="paging-button" style="display:none;">
		<input type="button" value="다음글 보기">
	</div>
	<div id="loading" style="display:none;">
		<img src="${pageContext.request.contextPath}/resources/images/ajax-loader.gif">
	</div>
</div>









