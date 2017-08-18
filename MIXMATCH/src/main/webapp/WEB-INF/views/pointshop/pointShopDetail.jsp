<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/pointshop/point.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pointshop.css">
<style>
.style {
	width: 60%;
	margin: 0 auto;
}
</style>
<div class="page-main-style">
	<h2>상품 상세정보</h2>
	<div class="style">
	    <table class="table table-bordered">
		    <tr>
		    	<td	rowspan="5" style="width: 550px;">
		    		 <c:if test="${fn:endsWith(product.p_file_name,'.jpg') ||
						 fn:endsWith(product.p_file_name,'.JPG') ||
						 fn:endsWith(product.p_file_name,'.gif') ||
						 fn:endsWith(product.p_file_name,'.GIF') ||
						 fn:endsWith(product.p_file_name,'.png') ||
						 fn:endsWith(product.p_file_name,'.PNG')}">
						<div class="align-center">
							<img src="imageView.do?p_seq=${product.p_seq}" style="max-width:500px">
						</div>			
					</c:if>
		    	</td>
	    	</tr>
	    	<tr>
	    		<td style="vertical-align: middle;">상품명</td>
	            <td style="vertical-align: middle;">${product.p_name}</td>
	    	</tr>
	    	<tr>
	    		<td style="vertical-align: middle;">포인트</td>
	            <td style="vertical-align: middle;"><fmt:formatNumber value="${product.p_price}" pattern="###,###,###"/> p</td>
	    	</tr>
	    	<tr>
	    		<td style="vertical-align: middle;">상품소개</td>
	            <td style="vertical-align: middle;">${product.p_context}</td>
	    	</tr>
	    	<tr>
	    		<td colspan="2" style="vertical-align: middle;">
	               	<input type="hidden" name="id" value="${product.id}">
	               	<input type="hidden" name="p_name" id="p_name"  value="${product.p_name}">
	               	<input type="hidden" name="p_price" id="p_price"  value="${product.p_price}">
	               	<input type="hidden" name="p_grade" id="p_grade" value="${product.p_grade}">
	                <select name="amount" id="amount">
	                <c:forEach begin="1" end="10" var="i">
	                	<option value="${i}">${i}</option>
	                </c:forEach>
	                </select>&nbsp;개
	                <input type="button" id="purchase" value="구매">
	        	</td>
	    	</tr>
	    </table>
	    <input type="button" class="btn" value="상품목록" onclick="location.href='pointHome.do'">
	    <c:if test="${user_id == 'admin'}">
	         <input type="button" class="btn" id="update" value="상품수정" onclick="location.href='${pageContext.request.contextPath}/point/PointUpdate.do?p_seq=${product.p_seq}'">
	   		 <input type="button" class="btn" id="delete" value="상품삭제" onclick="location.href='${pageContext.request.contextPath}/point/delete.do?p_seq=${product.p_seq}'">		
	 	</c:if>
    </div>
</div>