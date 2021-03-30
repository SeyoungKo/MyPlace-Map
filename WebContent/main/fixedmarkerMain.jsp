<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/check_login.jsp"%>    

<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

 		var list = [];
		var latlng = [];

	<c:forEach items="${list}" var= "item" varStatus="status">
		
		list.push("${item.id}");
		latlng.push("${item.latlng}");
		
	</c:forEach>
		var lat = []; //위도
		var lng = []; //경도	
		var tmp1 = new Array();
		var tmp2 = [];
		var lastIdx;
		
		for (var i = 1; i <= ${list.size()}; i++) {
			
			lastIdx = latlng[i-1].indexOf(",")+1;
			tmp1[i-1] = latlng[i-1].substring(1,17);
			tmp2[i-1] = latlng[i-1].substring(lastIdx,(latlng[i-1].length-2));
		
		lat.push(tmp1[i-1]);
		lng.push(tmp2[i-1]);
		}
		 
		var positions = [];
		
		for (var i = 1; i <=${list.size()}; i++) {
		positions[i-1] = new daum.maps.LatLng(lat[i-1],lng[i-1]);
	}
		var imageSrc = "../icon/heartIcon.png";		    

		for (var i = 0; i < positions.length; i ++) {
		  
		    var imageSize = new daum.maps.Size(30, 33);
		    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize);
		    var marker = new daum.maps.Marker({
		        map: map,
		        position: positions[i], 
		        image : markerImage
		    });
		}