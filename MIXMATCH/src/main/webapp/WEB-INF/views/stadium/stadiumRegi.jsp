<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=725f2c7f2b3fcc396032b404e5f4e242&libraries=services"></script>
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
<script>
$(document).ready(function(){
	var checkmap=0 ;
	$("#mapbutton").click(function(){
		add($("#s_address2").val());	// 입력한 주소 지도 보여주기.
	});
	function add(address){
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new daum.maps.LatLng(33,15), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	  	};  
		// 지도를 생성합니다    
		var map = new daum.maps.Map(mapContainer, mapOption); 
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new daum.maps.services.Geocoder();
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(address, function(result, status) {
			    // 정상적으로 검색이 완료됐으면 
			     if (status === daum.maps.services.Status.OK) {
			        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new daum.maps.Marker({
			            map: map,
			            position: coords
			        });
			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new daum.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+$("#s_name").val()+'</div>'
			        });
			        infowindow.open(map, marker);
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			        checkmap =1;
			    }else{
			    	$("#map").append().text("");
			    	$("#map").removeAttr("style");
			    	$("#map").attr("style","width:300px;height:300px;");
			    	alert("비정상적인 주소");
			    	$("#s_address2").focus();
			    	checkmap=0;
			    }
		});   
	}

	$("#stadiumRegister #s_address2").keyup(function(){
		checkmap = 0;
	});

	$("#stadiumRegister").submit(function(){
		if(checkmap==0){
			alert('정확한 주소를 입력하세요.');
			$("#s_address2").focus();
			return false;
		}
	});
});
</script>
<link href="${pageContext.request.contextPath}/resources/css/layout222.css" rel="stylesheet">
<div class="page-main-style">
	<h2>경기장 등록</h2>
	<ul style="list-style: none;">

	
	<form:form commandName="stadiumCommand" enctype="multipart/form-data" id="stadiumRegister" action="${pageContext.request.contextPath }/stadium/stadiumRegi.do" class="style" >
		<br>
		<br>
		<li>
		<label for="s_name">경기장 이름</label>
		<form:input path="s_name"/>
		</li>
		<li>
		<label for="s_type">경기장종목</label>
		<form:select path="s_type">
			<form:option value="야구"/>
			<form:option value="농구"/>
			<form:option value="축구"/>
		</form:select>
		</li>
		<li>
		<label for="s_address1">경기장 지역</label>
		<form:select path="s_address1">
			<form:option value="서울"/>
			<form:option value="경기"/>
			<form:option value="인천"/>
			<form:option value="강원"/>
			<form:option value="대전"/>
			<form:option value="충북"/>
			<form:option value="충남"/>
			<form:option value="광주"/>
			<form:option value="전북"/>
			<form:option value="전남"/>
			<form:option value="대구"/>
			<form:option value="울산"/>
			<form:option value="경북"/>
			<form:option value="경남"/>
			<form:option value="부산"/>
			<form:option value="제주"/>
		</form:select>
		</li>
		<li>
		<label for="s_address2">경기장 상세주소</label>
		<form:input path="s_address2"/>
		<input type="button" id="mapbutton"value="지도보기" >
		<div id="map" style="width:300px;height:300px;">
		</div>
		</li>
		<li>
		<label for="s_logo_upload">경기장 로고</label>
		<!-- <input type="file" id="s_logo_upload" name="s_logo_upload"> -->
		<div class="file_input" style="width: 100%;">
		    <label>
		        File
		        <input type="file" name="s_logo_upload" id="s_logo_upload" onchange="javascript:document.getElementById('file_route').value=this.value">
		    </label>
		    <input type="text" readonly="readonly" title="File Route" id="file_route">
		</div>
		</li>
		<input type="submit" value="경기장등록">
	</form:form>
	</ul>
</div>