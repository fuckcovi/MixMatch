<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/pointshop/point.js"></script>
<style type="text/css">
#search_form{
	width:500px;
	height:50px;
	margin:0 auto;}
.search{
	list-style:none;
}
.search li{
	float:left; 
	margin:10px 10px 10px 10px;
}
.product_list {
	text-align:left;
	list-style: none;
	margin:30px 0 0 300px;
}
.product_list li{
	display:inline-block;
	padding:10px;
	width: 300px;
}
</style>
<div class="page-main-style">
	<h2>포인트몰</h2>
	<!-- 검색 -->
	<form action="pointHome.do" id="search_form" method="get">
		<ul class="search">
			<li>
				<select name="keyfield" id="keyfield">
					<option value="all">전체</option>
					<option value="p_name">상품명</option>
					<option value="p_grade">등급</option>
				</select>
			</li>
			<li>
				<input type="text" name="keyword" id="keyword">
			</li>
			<li>
				<input type="submit" class="btn" value="상품찾기">
			</li>
		</ul>
	</form>
	<c:if test="${user_id == 'admin' }">
	<div class="align-right">
    	<input type="button" class="btn" value="상품등록" onclick="location.href='${pageContext.request.contextPath}/point/pointWrite.do'">
    </div>
	</c:if>
    <!-- 상품목록 -->
    <c:if test="${count == 0}">
	<div class="align-center">상품목록이 없습니다.</div>
	</c:if>
	<c:if test="${count > 0}">
	<ul class="product_list" style="">
		<c:forEach var="product" items="${list}" varStatus="status">
			<li>
			<div style="border:1px solid #bdbdbd; border-radius:20px; height:400px;">
				<a href="${pageContext.request.contextPath}/point/pointShopDetail.do?p_seq=${product.p_seq}">
           		<c:if test="${fn:endsWith(product.p_file_name,'.jpg') ||
				 				fn:endsWith(product.p_file_name,'.JPG') ||
				 			fn:endsWith(product.p_file_name,'.gif') ||
				 			fn:endsWith(product.p_file_name,'.GIF') ||
				 			fn:endsWith(product.p_file_name,'.png') ||
				 			fn:endsWith(product.p_file_name,'.PNG')}">
					<div class="align-center">
						<img src="imageView.do?p_seq=${product.p_seq}" style="width:250px;height:250px;">
					</div>			
				</c:if>
				</a>
        		<hr size="1">
        		<div style="text-align: center;">
        			상품명 : ${product.p_name}
        		</div>
        		<br>
        		<div style="text-align: center;">
        			구매가능 회원 등급 : ${product.p_grade}
        		</div>
        		<br>
        		<div style="text-align: center;">
        			상품 가격 : <fmt:formatNumber value="${product.p_price}" pattern="###,###,###"/> p
        		</div>
        	</div>
        	</li>
     	</c:forEach>
	</ul>
    <div class="align-center">
		${pagingHtml}
	</div>
</c:if>
</div>