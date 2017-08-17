<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
<!-- <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  <meta name="robots" content="noindex, nofollow">
  <meta name="googlebot" content="noindex, nofollow">
 
  <link rel="stylesheet" type="text/css" href="/css/result-light.css"> -->
   <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.js"></script>
  <style type="text/css">
    .wrap {
	width: 500px;
	height:400px; 
	margin: 0 auto;
}
.btn-holder {
	text-align: center;
	margin: 10px 0 10px 0;
}
#calendar table {
	border-collapse: collapse;
	text-align: center;
}
#calendar table thead td {
	height: 30px;
	font-weight: bold;
}	
#calendar table td {
	border: solid 1px #000;
}
#calendar table td.date-cell {
	height: 50px;
}
#calendar table td.sun {
	color: red;
}
#calendar table td.sat {
	color: blue;
}
#calendar table td.not-this-month {
	background: #ddd;
	color: #999;
}
/* #calendar table td.not-this-month a{
	display: none;
} */
.tableBookingList th, .tableBookingList td{
	height:40px;
}
#output{
	height:200px;
	width:100%;
	border:1px solid;

	text-align: center;	
}
#output table{
	width:100%;
}
#stadiumTable{ 
	margin:0 auto;
}
#stadiumTable th{
	font-size:large;
	text-align: center;
	width:120px;
	padding:10px 0 10px 0;
	border-style: none;
	border-top:2px solid #BDBDBD;
	border-bottom:2px solid #BDBDBD;
}
#stadiumPic{
	width:200px;
}


  </style>
<script type='text/javascript'>//<![CDATA[
$(window).load(function(){

	
	
	var s_seq = $("#stadiumSeq").val();

var calendar = new controller(); 
calendar.init();

function controller(target) {

	var that = this;   
	var m_oMonth = new Date();
	m_oMonth.setDate(1);

	this.init = function() {
		that.renderCalendar();
		that.initEvent();
	}

    /* 달력 UI 생성 */
	this.renderCalendar = function() {
		var arrTable = [];

		arrTable.push('<table><colgroup>');
		for(var i=0; i<7; i++) {
			arrTable.push('<col width="100">');
		}		
		arrTable.push('</colgroup><thead><tr>');

		var arrWeek = "일월화수목금토".split("");

		for(var i=0, len=arrWeek.length; i<len; i++) {
			var sClass = '';
			sClass += i % 7 == 0 ? 'sun' : '';
			sClass += i % 7 == 6 ? 'sat' : '';
			arrTable.push('<td class="'+sClass+'">' + arrWeek[i] + '</td>');
		}
		arrTable.push('</tr></thead>');
		arrTable.push('<tbody>');

		var oStartDt = new Date(m_oMonth.getTime());
        // 1일에서 1일의 요일을 빼면 그 주 첫번째 날이 나온다.
		oStartDt.setDate(oStartDt.getDate() - oStartDt.getDay());

		for(var i=0; i<100; i++) {
			if(i % 7 == 0) {
				arrTable.push('<tr>');
			}

			var sClass = 'date-cell '
            sClass += m_oMonth.getMonth() != oStartDt.getMonth() ? 'not-this-month ' : '';
			sClass += i % 7 == 0 ? 'sun' : '';
			sClass += i % 7 == 6 ? 'sat' : '';
 
			arrTable.push('<td class="'+sClass+'" dataPick="'+that.getYearMonth(m_oMonth).substr(0,9)+oStartDt.getDate()+'일" id="'+that.getYearMonth(m_oMonth).substr(0,9)+oStartDt.getDate()+'일"><div>' + oStartDt.getDate() + '</div></td>'); 
			oStartDt.setDate(oStartDt.getDate() + 1);

			if(i % 7 == 6) {
				arrTable.push('</tr>');
				if(m_oMonth.getMonth() != oStartDt.getMonth()) {
					break;
				}
			}
		}
		arrTable.push('</tbody></table>');

		$('#calendar').html(arrTable.join(""));

		that.changeMonth();
	}

    /* Next, Prev 버튼 이벤트 */
	this.initEvent = function() {
		$('#btnPrev').click(that.onPrevCalendar);
		$('#btnNext').click(that.onNextCalendar);
	}

    /* 이전 달력 */
	this.onPrevCalendar = function() {
		m_oMonth.setMonth(m_oMonth.getMonth() - 1);
		that.renderCalendar();
	}

    /* 다음 달력 */
	this.onNextCalendar = function() {
		m_oMonth.setMonth(m_oMonth.getMonth() + 1);
		that.renderCalendar();
	}

    /* 달력 이동되면 상단에 현재 년 월 다시 표시 */
	this.changeMonth = function() {
		$('#currentDate').text(that.getYearMonth(m_oMonth).substr(0,9));
	}

    /* 날짜 객체를 년 월 문자 형식으로 변환 */
	this.getYearMonth = function(oDate) {
		return oDate.getFullYear() + '년' + (oDate.getMonth() + 1) + '월';
	}
}
});//]]> 

</script>
<script>
  // tell the embed parent frame the height of the content
  if (window.parent && window.parent.parent){
    window.parent.parent.postMessage(["resultsFrame", {
      height: document.body.getBoundingClientRect().height,
      slug: "8b44ft0w"
    }], "*")
  }
</script>
 
 <script type="text/javascript">
 $(document).ready(function(){

	$(document).on("mouseover",".date-cell:not(.not-this-month) div",function(){
		$(this).parent().css("background-color",'#f98e8e');
	});
	$(document).on("mouseout",".date-cell div",function(){
		$(this).parent().css("background-color",'white');
		$(".not-this-month").css("background-color","#ddd");		
	});
	
	
	 $(document).on("click",".resBtn input", function(){
		 location.href="${pageContext.request.contextPath }/stadium/stadiumBooking.do?s_seq="+$(this).attr("s_seq")+"&b_regdate="+$(this).attr("b_regdate")+"&b_time="+$(this).attr("b_time")+"&t_name="+$("#t_name option:selected").val();
	 });
	 
	 var bookList;
	 
	 $(document).on("click",".date-cell:not(.not-this-month)",function(){ 
		
		var regdate =$(this).attr("dataPick"); 
		var seq = $("#stadiumSeq").val();
		$("#loading").show();
		$.ajax({
			type:"post",
			data:{b_regdate:$(this).attr("dataPick"),s_seq:$("#stadiumSeq").val()},
			url:"bookingList.do",
			dataType:"json",
			cache:false,
			timeout:30000,
			success:function(data){
				$("#loading").hide();
				var bookCount = data.bookCount;
				bookList = data.bookList;
				if(bookCount>=0 && bookList!=null){
					var output = "";
					output += "<table class='tableBookingList'>"
					output += "	<tr>";
					output += "		<th>날짜</th>";
					output += "		<th>타임</th>";
					output += "		<th>가능여부</th>";
					output += "	</tr>";
					
					$(bookList).each(function(index,item){	
						var time="";
						if(item.b_time=="1타임"){ time ="8시 ~ 10시30분";}
						if(item.b_time=="2타임"){time ="10시30분 ~ 13시";}
						if(item.b_time=="3타임"){time ="13시 ~ 15시30분";}
						if(item.b_time=="4타임"){time ="15시30분 ~ 18시";}
						var check = "";
						if(item.b_check==0){ check = "O";	}
						if(item.b_check==1 || item.b_check==2){ check = "X";	}
						output += "	<tr id='"+item.b_time+"'>";
						output += "		<td>"+item.b_regdate+"</td>";
						output += "		<td>"+item.b_time+" ("+time	+")</td>";
						output += "		<td>"+check+"</td>";
						if(item.b_check == 0){
							output += "	<td class='resBtn'><input type='button' s_seq='"+seq+"' b_time='"+item.b_time+"' b_regdate='"+regdate+"' value='예약하기'></td>";
						}
						output += "	</tr>";
						
					});
					 

					output += "</table>";
					$("#output").html("");
					$("#output").append(output);
					
					
					
				}else{
					alert("예약목록 호출 시 에러 발생");
				}
			},
			error:function(){
				$("#loading").hide();
				alert("목록 호출 시 네트워크 오류!");
			}
		});
	 });
 }); 
 </script>
 <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=725f2c7f2b3fcc396032b404e5f4e242&libraries=services"></script>
<script>
$(document).ready(function(){
	add($("#s_address2").attr("address"));
	function add(address){
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
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
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+$("#s_name").attr("s_name")+'</div>'
			        });
			        infowindow.open(map, marker);
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			     }
		});   
	}

});
</script>
 <div class="page-main-style">
<div>
	<h2><b>경기장 상세보기</b></h2> 
	
	<input type="hidden" value="${stadium.s_seq}" id="stadiumSeq">
	<table id="stadiumTable">
	<tr>
		<th class="stadiumPic">경기장사진</th>
		<th>명칭</th>
		<th class="asd">종목</th>
		<th>지역</th>
		<th>등록일</th>
	</tr>
	
		<tr>
			<td>
				<c:if test="${fn:endsWith(stadium.s_logo_name, '.jpg') || 
							fn:endsWith(stadium.s_logo_name, '.png') || 
							fn:endsWith(stadium.s_logo_name, '.gif') || 
							fn:endsWith(stadium.s_logo_name, '.JPG') || 
							fn:endsWith(stadium.s_logo_name, '.PNG') || 
							fn:endsWith(stadium.s_logo_name, '.GIF')}">
					<img src="${pageContext.request.contextPath }/stadium/imageViewStadium.do?s_seq=${stadium.s_seq}" style="width:200px;height:200px;">
				</c:if>
				<c:if test="${empty stadium.s_logo_name }">
				<c:if test="${stadium.s_type eq '야구' }">
					<img src="${pageContext.request.contextPath}/resources/images/baseball.png" style="width:200px;height:200px;">
				</c:if>
				<c:if test="${stadium.s_type eq '농구' }">
					<img src="${pageContext.request.contextPath}/resources/images/basketball.png" style="width:200px;height:200px;">
				</c:if>
				<c:if test="${stadium.s_type eq '축구' }">
					<img src="${pageContext.request.contextPath}/resources/images/football.png" style="width:200px;height:200px;">
				</c:if>
				</c:if>
			</td>
			<td id="s_name" s_name="${stadium.s_name }">${stadium.s_name}</td>
			<td>${stadium.s_type }</td>
			<td>${stadium.s_address1}</td>
			<td>${stadium.s_regdate}</td>
		</tr>
		<tr style="border-top:1px dashed #BDBDBD;">
			<td ><div id="map" style="width:200px;height:150px;"></div></td>
			<td style="font-size:large;"><b>상세주소</b></td>
			<td colspan="3" id="s_address2" address="${stadium.s_address2}">${stadium.s_address2}</td>
		</tr>
		
	</table>
</div>
<hr noshade="noshade">
<div>
	<h2>예약하기</h2>
<div class='wrap' >
	<div class='btn-holder'>
		<button id='btnPrev'>&lt;</button>
		 <span id='currentDate'></span> 
		<button id='btnNext'>&gt;</button>
	</div>
	<div id="calendar"></div>
</div>
<div>
	<c:if test="${tmasterCount > 0 }">
		<select id="t_name">
		<c:forEach var="list" items="${t_name}">
				<option>${list.t_name}</option> 
	
		</c:forEach>
		</select>
	</c:if>
	<c:if test="${tmasterCount == 0 }">
		<div style="height:200px;"><h4>팀마스터로 지정된 팀이 없습니다.<br>팀마스터만이 경기장을 예약할 수 있습니다.</h4></div>
	</c:if>
</div>
<c:if test="${tmasterCount > 0 }">
<div id="output"  >
	
 
</div>
</c:if>

	
</div>
  


