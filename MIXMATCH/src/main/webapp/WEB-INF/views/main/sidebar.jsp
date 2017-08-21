<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/team/teamLogo.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	var flag = false;
	
	$("#side-button").click(function() {
		if (flag == false) {
			$("#sidenav").css("right", "0");
			$("#side-button").removeClass("glyphicon-chevron-left");
			$("#side-button").addClass("glyphicon-chevron-right");
			$("#side-button").css("right", "200px");
			flag = true;
		} else {
			$("#sidenav").css("right", "-200px");
			$("#side-button").removeClass("glyphicon-chevron-right");
			$("#side-button").addClass("glyphicon-chevron-left");
			$("#side-button").css("right", "0");
			flag = false;
		}
	});
	
	$("#up-btn").click(function() {
		$("body").scrollTop(0);
	});
	
	$("#down-btn").click(function() {
		$("body").scrollTop($(document).height());
	});
	
	var chat;
	var open = 0;
	$("#chat").click(function(){
		if(open==1){
			chat.close();
			open=0;
		}
		onPopupWindow();
	});
	function onPopupWindow(){  
	    chat = window.open("${pageContext.request.contextPath}/chat.do", "_blank", "top=300, left=500, width=400, height=400");
	    open=1;
	}
});
</script>
<div id="up-btn" title="맨 위로">
	<span class="glyphicon glyphicon-chevron-up"></span>
</div>
<div id="down-btn" title="맨 아래로">
	<span class="glyphicon glyphicon-chevron-down"></span>
</div>
<nav id="sidenav">
	<ul>
		<li>
			<c:if test="${!empty user_id }">
			<strong>${user_id}님 로그인</strong><br>
			<a href="${pageContext.request.contextPath}/mypage/main.do?id=${user_id}" >
				<c:if test="${fn:endsWith(member.profile_name, '.jpg') || fn:endsWith(member.profile_name, '.png') || fn:endsWith(member.profile_name, '.gif') || fn:endsWith(member.profile_name, '.JPG') || fn:endsWith(member.profile_name, '.PNG') || fn:endsWith(member.profile_name, '.GIF')}">
					<img src="${pageContext.request.contextPath}/imageViewSide.do?id=${member.id}" style="width:100px;height:100px;">
				</c:if> 
				<c:if test="${empty member.profile_name }">
					<img src="${pageContext.request.contextPath}/resources/images/profile.jpg" style="width:100px;height:100px;">
				</c:if>
				
			</a>
			</c:if>
			<c:if test="${empty user_id}">
			<form action="${pageContext.request.contextPath}/login.do" method="post">
				<label for="id">ID</label><input type="text" title="id" id="id" name="id" ><br>
				<label for="pw">PW</label><input type="password" id="pw" name="pw"><br><br>
				<input type="submit" value="로그인" class="btn">
			</form>
			</c:if>
		</li>
		<li> 
			<div>
			<c:if test="${joinCountSide==0 }">
			<b>팀생성</b><br> 
			<a href="${pageContext.request.contextPath}/team/team.do">
			<img src="${pageContext.request.contextPath}/resources/images/teamplus.png" style="width:100px;height:100px;">
			</a>
			</c:if>
			<c:if test="${joinCountSide>0 }">  
			<select id="myteam" name="myteam" style="width:100px;">
				<c:forEach var="joinListSide" items="${joinListSide}">
						<c:if test="${joinListSide.t_mem_auth > 0}">
						<option>
							${joinListSide.t_name}
						</option>
						</c:if>
				</c:forEach>
			</select>
			<br>
			<c:forEach var="joinListSide" items="${joinListSide}" varStatus="status">
				<a href="${pageContext.request.contextPath }/team/teamInfo.do?t_name=${joinListSide.t_name}" id="myteamLogo">
					<c:if test="${fn:endsWith(joinListSide.t_logo_name, '.jpg') || fn:endsWith(joinListSide.t_logo_name, '.png') || fn:endsWith(joinListSide.t_logo_name, '.gif') || fn:endsWith(joinListSide.t_logo_name, '.JPG') || fn:endsWith(joinListSide.t_logo_name, '.PNG') || fn:endsWith(joinListSide.t_logo_name, '.GIF')}">
						<img id="${joinListSide.t_name }" src="${pageContext.request.contextPath}/imageViewTside.do?t_name=${joinListSide.t_name}" style="width:100px;height:100px;display: none;">
					</c:if>
					<c:if test="${empty joinListSide.t_logo_name }">
						<c:if test="${joinListSide.t_type eq '야구' }">
							<img id="${joinListSide.t_name }" src="${pageContext.request.contextPath}/resources/images/baseball.png" style="width:100px;height:100px;display: none;">
						</c:if>
						<c:if test="${joinListSide.t_type eq '농구' }">
							<img id="${joinListSide.t_name }" src="${pageContext.request.contextPath}/resources/images/basketball.png" style="width:100px;height:100px;display: none;">
						</c:if>
						<c:if test="${joinListSide.t_type eq '축구' }">
							<img id="${joinListSide.t_name }" src="${pageContext.request.contextPath}/resources/images/football.png" style="width:100px;height:100px;display: none;">
						</c:if>
					</c:if>
				</a>
			</c:forEach>
			</c:if>
			</div>
		</li>
		<li>
		<div id="point" style="height:100px;">
			<b>포인트몰</b><br> 
			<a href="${pageContext.request.contextPath}/point/pointHome.do">
				<img src="${pageContext.request.contextPath}/resources/images/shopba.png" width="80">
			</a>
			</div>
		</li>
		<li>
			<c:if test="${!empty user_id }">
			<div id="chat" style="height:100px;">
			<b>채팅</b><br>
			<img src="${pageContext.request.contextPath}/resources/images/chat.png" width="80">		
			</div>
			</c:if>
			<c:if test="${empty user_id}">
			<div style="height:100px;">채팅을 하시려면 로그인하세요</div>
			</c:if>
		</li>
	</ul>
</nav>
<div>
	<span class="glyphicon glyphicon-chevron-left" id="side-button"></span>
</div>