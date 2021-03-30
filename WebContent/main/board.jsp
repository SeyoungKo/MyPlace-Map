<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../layout/check_login.jsp"%>

<%@ include file = "/layout/header.jsp" %>



<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>

	
	<script type="text/javascript">
	
		function choice(c) {
			document.getElementById("cate").value=c.value;
			
			c.style="background:#b5e4f2";

			for (var i = 0; i < 5; i++) {
				document.getElementsByTagName("button")[i].disabled=true;

			}

		}
		
		function search(f) {
			f.submit();

		}
		
	</script>
			<link rel="stylesheet" type="text/css" href="../css/board.css"> 
</head>
<body>
	<div align="center">
		<table border="0" class="table" >
		
		<form action="search.do" method="post">
			<tr>
				
				<td>
					<select name="area">
						<option value="지역">지역검색</option>
						<option value="서울">서울</option>
						<option value="경기">경기</option>
						<option value="인천">인천</option>
						<option value="강원">강원</option>
						<option value="충북">충북</option>
						<option value="충남">충남</option>
						<option value="대전">대전</option>
						<option value="경북">경북</option>
						<option value="경남">경남</option>
						<option value="대구">대구</option>
						<option value="울산">울산</option>
						<option value="부산">부산</option>
						<option value="전북">전북</option>
						<option value="전남">전남</option>
						<option value="광주">광주</option>
						<option value="제주">제주</option>
					
					</select>
					
				</td>
			
				<td colspan="5">
			   		<addr title="사진"><button value="photoIcon"  onclick="choice(this)"><img src="../icon/photoIcon.png"></button></addr>
	                <addr title="맛집"><button value="eatIcon"  onclick="choice(this)"><img src="../icon/eatIcon.png"></button></addr>
	                <addr title="명소"><button value="placeIcon"  onclick="choice(this)"><img src="../icon/placeIcon.png"></button></addr>
	                <addr title="여행"><button value="carIcon"  onclick="choice(this)"><img src="../icon/carIcon.png"></button></addr>
	                <addr title="기타"><button value="userAddIcon"  onclick="choice(this)"><img src="../icon/userAddIcon.png"></button></addr>
	                  
				</td>
				<th><input type="button" id="button" value="검색"  onclick="search(this.form)"></th>
			</tr>
			<tr></tr><tr></tr><tr></tr>
			
			<input type="hidden" name="id" value="${id}">
			<input type="hidden" id="cate" name="category">
			
		</form>
		
			<tr class="head">
				<th class="col">등록번호</th>
				<th class="col">카테고리</th>
				<th class="col">장소</th>
				<th class="col">메모</th>
				<th class="col">닉네임</th>
				<th class="col">등록일자</th>
				<th class="col">조회수</th>
				
			</tr>
			
			<c:forEach var="list" items="${list}">
				<tr>
					<th>${list.idx}</th>
					<th><a href="oneboard.do?idx=${list.idx}&id=${id}"><img src="../icon/${list.category}.png"></a></th>
					<th><a href="oneboard.do?idx=${list.idx}&id=${id}">${list.place}</a></th>
					<th><a href="oneboard.do?idx=${list.idx}&id=${id}">${list.memo}</a></th>
					<th><a href="oneboard.do?idx=${list.idx}&id=${id}">${list.id}</a></th>
					<th><a href="oneboard.do?idx=${list.idx}&id=${id}">${list.regdate}</a></th>
					<th>${list.readhit}</th>
					
				</tr>
				
			</c:forEach>
			
		</table>
	
	</div>
</body>
</html>

<%@ include file = "/layout/footer.jsp" %> 