<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구글맵에 내 위치 표시하기</title>
<link rel="stylesheet" type="text/css" href="http://code.google.com/apis/maps/documentation/javascript/examples/default.css">
<script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyCdyu1YFV4ZjHm9VxN_bvLikvh524hb_uI"></script>
<script type="text/javascript">
/*
  	구글맵 사이트 : https://developers.google.com/maps
 	Maps 자바스크립트 : https://developers.google.com/maps/documentation/javascript
 	콘솔키 등록 : https://console.developers.google.com/
 	구글맵api 내key: key=AIzaSyCdyu1YFV4ZjHm9VxN_bvLikvh524hb_uI
 */
	/* window.onload = function(){
		// geolocation서비스 지원여부 체크
		if(!navigator.geolocation){
			document.getElementById("disp").innerHTML="위치정보지원안함";
			return;
		}
		// 사용자 현재 위치 확인
		navigator.geolocation.getCurrentPosition(function(position){
			var lat = position.coords.latitude;
			var lon = position.coords.longitude;
			// 검사의 console창에 찍히는것
			console.log("위도 : "+lat);
			console.log("경도 : "+lon);
			
			// 구글맵에 표시할 위치 정보를 갖는 객체 생성
			var initLoc = new google.maps.LatLng(lat,lon);
			
			// 구글맵 객체 생성
			var map = new google.maps.Map(document.getElementById("map_canvas"), 
											{zoom:16,
											// mapTypeId : ROADMAP(약도형태), TERRAIN(지형지물까지 보여짐)
											mapTypeId:google.maps.MapTypeId.ROADMAP}
											);
			
			// 구글맵에 위치정보 매칭
			map.setCenter(initLoc);	// 지도의 중앙에 현재 위치(위도경도) 명시
			// 지도위에 표시해줄 마커표시						initLoc 나의 위치를 map 지도에 표시하는데 title을 위에 써서 표지판
			//var marker = new google.maps.Marker({position:initLoc,map:map,title:"I am HERE"});
			
			
			// 말풍선 형태의 마커
			var infowindow = new google.maps.InfoWindow();
			infowindow.setContent("현재 내 위치 <br> 위도 : "+lat +", 경도 : " + lon);
			infowindow.setPosition(initLoc);	// 마커의 포지션은 lat,lon의 위치를 갖는 구글맵
			infowindow.open(map);
		});
	}; */
	
	
</script>
</head>
<body>
	<h2 id="disp">구글맵 보기</h2>
	<div id="map_canvas" style="width:300px;height:500px;border:2px solid red"></div>
</body>
</html>

 -->
 <!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>Displaying text directions with <code>setPanel()</code></title>
    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #floating-panel {
        position: absolute;
        top: 10px;
        left: 25%;
        z-index: 5;
        background-color: #fff;
        padding: 5px;
        border: 1px solid #999;
        text-align: center;
        font-family: 'Roboto','sans-serif';
        line-height: 30px;
        padding-left: 10px;
      }
      #right-panel {
        font-family: 'Roboto','sans-serif';
        line-height: 30px;
        padding-left: 10px;
      }

      #right-panel select, #right-panel input {
        font-size: 15px;
      }

      #right-panel select {
        width: 100%;
      }

      #right-panel i {
        font-size: 12px;
      }
      #right-panel {
        height: 100%;
        float: right;
        width: 390px;
        overflow: auto;
      }
      #map {
        margin-right: 400px;
      }
      #floating-panel {
        background: #fff;
        padding: 5px;
        font-size: 14px;
        font-family: Arial;
        border: 1px solid #ccc;
        box-shadow: 0 2px 2px rgba(33, 33, 33, 0.4);
        display: none;
      }
      @media print {
        #map {
          height: 500px;
          margin: 0;
        }
        #right-panel {
          float: none;
          width: auto;
        }
      }
    </style>
  </head>
  <body>
    <div id="floating-panel">
      <strong>Start:</strong>
      <select id="start">
        <option value="chicago, il">Chicago</option>
        <option value="st louis, mo">St Louis</option>
        <option value="joplin, mo">Joplin, MO</option>
        <option value="oklahoma city, ok">Oklahoma City</option>
        <option value="amarillo, tx">Amarillo</option>
        <option value="gallup, nm">Gallup, NM</option>
        <option value="flagstaff, az">Flagstaff, AZ</option>
        <option value="winona, az">Winona</option>
        <option value="kingman, az">Kingman</option>
        <option value="barstow, ca">Barstow</option>
        <option value="san bernardino, ca">San Bernardino</option>
        <option value="los angeles, ca">Los Angeles</option>
      </select>
      <br>
      <strong>End:</strong>
      <select id="end">
        <option value="chicago, il">Chicago</option>
        <option value="st louis, mo">St Louis</option>
        <option value="joplin, mo">Joplin, MO</option>
        <option value="oklahoma city, ok">Oklahoma City</option>
        <option value="amarillo, tx">Amarillo</option>
        <option value="gallup, nm">Gallup, NM</option>
        <option value="flagstaff, az">Flagstaff, AZ</option>
        <option value="winona, az">Winona</option>
        <option value="kingman, az">Kingman</option>
        <option value="barstow, ca">Barstow</option>
        <option value="san bernardino, ca">San Bernardino</option>
        <option value="los angeles, ca">Los Angeles</option>
      </select>
    </div>
    <div id="right-panel"></div>
    <div id="map"></div>
    <script>
      function initMap() {
        var directionsDisplay = new google.maps.DirectionsRenderer;
        var directionsService = new google.maps.DirectionsService;
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 7,
          center: {lat: 41.85, lng: -87.65}
        });
        directionsDisplay.setMap(map);
        directionsDisplay.setPanel(document.getElementById('right-panel'));

        var control = document.getElementById('floating-panel');
        control.style.display = 'block';
        map.controls[google.maps.ControlPosition.TOP_CENTER].push(control);

        var onChangeHandler = function() {
          calculateAndDisplayRoute(directionsService, directionsDisplay);
        };
        document.getElementById('start').addEventListener('change', onChangeHandler);
        document.getElementById('end').addEventListener('change', onChangeHandler);
      }

      function calculateAndDisplayRoute(directionsService, directionsDisplay) {
        var start = document.getElementById('start').value;
        var end = document.getElementById('end').value;
        directionsService.route({
          origin: start,
          destination: end,
          travelMode: 'DRIVING'
        }, function(response, status) {
          if (status === 'OK') {
            directionsDisplay.setDirections(response);
          } else {
            window.alert('Directions request failed due to ' + status);
          }
        });
      }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCdyu1YFV4ZjHm9VxN_bvLikvh524hb_uI&callback=initMap">
    </script>
  </body>
</html>
 