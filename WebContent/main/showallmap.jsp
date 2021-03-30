<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<%@ include file="../layout/check_login.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/layout/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="../css/showallmap.css">
</head>
<body>
	
<%@include file = "/layout/subIconMenu.jsp" %>
	<table>
			<c:if test="${empty list }">
				<tr>
					<td align="center" colspan="11" width="100%" height="50">현재 등록된
						장소가 없습니다 !</td>
				</tr>
			</c:if>
	</table>

	<c:if test="${!empty list}">
		<%@include file ="/main/previewinfo.jsp" %>	
			<div id="map"
				style="width: 680px; height:100%; top: 130px; margin-left:49%; 
				       position: absolute; margin-top: 80px;">
				
			</div>
			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=29d3db11d43c52060594f305f580b09f&libraries=services"></script>
			<script>

		var mapContainer = document.getElementById('map'),
			mapOption = {
			  center: new daum.maps.LatLng(37.568076, 126.978640),
				level: 3
			};

		var map = new daum.maps.Map(mapContainer, mapOption);
		var latlng =new Array();
		var tmp = new Array();
		var lat = new Array();

		for (var i = 1; i <= ${list.size()}; i++) {
			latlng[i-1] = document.getElementById("latlng"+i).innerHTML;

			tmp[i-1] = latlng[i-1].substring(1,17);
			tmp[i-1] = Number(tmp[i-1]);
			lat.push(tmp[i-1]);
		}

		var lng= new Array();
		var tmp2 = new Array();
		var lastIdx1;

		for (var i = 1; i <= ${list.size()}; i++) {
			latlng[i-1] = document.getElementById("latlng"+i).innerHTML;

			 lastIdx1 = latlng[i-1].indexOf(",")+1;
			 tmp2[i-1] = latlng[i-1].substring(lastIdx1,(latlng[i-1].length-2));  //문자열 자르기

			lng.push(tmp2[i-1]);
			parseFloat(lng[i-1]);
		}

		var place = new Array();
		var memo = new Array();
		var photo_name = new Array();
		var area = new Array();
		var id = new Array();
		var category = new Array();

		for (var i = 1; i <=${list.size()}; i++) {
			place[i-1] = document.getElementById("place"+i).innerHTML;
			memo[i-1] = document.getElementById("memo"+i).innerHTML;
			photo_name[i-1]= document.getElementById("photo_name"+i).innerHTML;
			area[i-1] = document.getElementById("area"+i).innerHTML;
			id[i-1] = document.getElementById("id"+i).innerHTML;
			category[i-1] = document.getElementById("category"+i).innerHTML;
		}

		var imageSrc ='../icon/markerIcon.png',
		   imageSize = new daum.maps.Size(32, 34),
		   imageOption = {
				 spriteSize : new daum.maps.Size(36, 91),
				 spriteOrigin : new daum.maps.Point(0, 46+10),
				 offset: new daum.maps.Point(20, 20)};

		var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize/*, imageOption*/);
		var positions = new Array();

		for (var i = 1; i <=${list.size()}; i++) {
			positions[i-1] = new daum.maps.LatLng(lat[i-1],lng[i-1]);
		}

		var i;
		var marker = new Array();

		for(i=1; i<=${list.size()}; i++){

			marker[i-1] = new daum.maps.Marker({
			map: map,
			position:positions[i-1],
			image: markerImage
			});

			marker[i-1].setMap(map);
		}


		function setBounds() {
			map.setBounds(bounds);
		}
		var content = new Array();

		for(var i=1; i<= ${list.size()}; i++){
			content[i-1]='<div class="wrap">' +
		'    <div class="info">' +
		'        <div class="title">'+
		'          <a href="https://www.google.com/maps/search/'+memo[i-1]+'/@'+lat[i-1]+','+lng[i-1]+',17z/data=!3m1!4b1" target="_blank" >'+memo[i-1]+'</a>'+
		'            <div class="close" onclick="closeOverlay('+(i-1)+')" title="닫기"></div>' +
		'        </div>' +
		'        <div class="body">' +
		'            <div class="img">' +
		'                <img src="../upload/'+photo_name[i-1]+'" width="73" height="70">' +
		'           </div>' +
		'            <div class="desc">' +
		'                <div class="ellipsis">'+place[i-1]+'</div>' +
		'                <div class="jibun ellipsis">'+area[i-1]+'</div>' +
		'                <div><a href="show.do?id='+id[i-1]+'&place='+place[i-1]+'&category='+category[i-1]+'" class="link">내 장소 정보보기</a></div>' +
		'           	 </div>' +
		'       	</div>' +
		'        </div>' +
		'    </div>';
			}

		var customOverlay = new Array();

		for(i=1; i<= ${list.size()}; i++){
			customOverlay[i-1]=new daum.maps.CustomOverlay({
				  map: map,
				  clickable:true,
				  position: positions[i-1],
				  content: content[i-1],
				  xAnchor:0.5,
				  yAnchor: 1
			});
		}

		for(i=1; i<= ${list.size()}; i++){
			daum.maps.event.addListener(marker[i-1], 'click', function() {
				customOverlay[i-1].setMap(map);
			});
		}

		for(i=1; i<= ${list.size()}; i++){
			function closeOverlay(i) {
				customOverlay[i].setMap(null);
			}
		}

			</script>
	</c:if>
</body>
</html>

<%@ include file="/layout/footer.jsp"%>
