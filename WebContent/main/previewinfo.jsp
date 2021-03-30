<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix ="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../layout/check_login.jsp"%>

<head>

	<link rel="stylesheet" type="text/css" href="../css/previewinfo.css"> 
</head>
<body>
<script>
	function mouseOver(c) {
	 	var tmp = c.id;
		var arr = [];
		var cateArr = [];

		for (var i = 1; i <= ${list.size()}; i++) {
			arr[i-1] = document.getElementById("latlng"+i).innerHTML;
			cateArr.push(arr[i-1]);
		}
		var reply_click = cateArr[tmp-1];
		var sub1= reply_click.substr(1,9);
		var lastIdx = reply_click.indexOf(",")+1;
		var sub2 = reply_click.substr(lastIdx,13);

		sub2.toString();

		var moveLatLon = new daum.maps.LatLng(sub1,sub2);

	    map.panTo(moveLatLon);  
	}
		
</script>
<table class = "table1">
		<c:forEach var="vo" items="${list}" varStatus="status">
			<tr style="display:none">
			
				<td id="id${status.count}">${vo.id}</td>
				<td id="latlng${status.count}">${vo.latlng}</td>
				<td id="place${status.count}">${vo.place}</td>
				<td id="memo${status.count}">${vo.memo}</td>
				<td id="photo_name${status.count}">${vo.photo_name}</td>
				<td id="area${status.count}">${vo.area}</td>
				<td id="category${status.count}">${vo.category}</td>
			</tr>
			
		</c:forEach>
</table>
		<div class = "grid-container" >
			<c:forEach var = "vo" items ="${list}" varStatus = "status" >
				<form name ="formName">
						<div class = "grid_item">
							<img src = "../upload/${vo.photo_name}" id= "${status.count}" onclick="mouseOver(this)"
										style="opacity:0.9; margin-top:10px; margin-bottom:10px; margin-right:5px;
											   margin-left:5px;"
										onmouseover="this.style.opacity='1'"
										onmouseout="this.style.opacity='0.9'" width = "180" height="180">
								<a href="testt2.jsp"></a>
						</div>
				</form>
			</c:forEach>
		</div>
</body>	