<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/check_login.jsp"%> 

<%@ include file = "/layout/header.jsp" %> 

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<script type="text/javascript">
		function back(f) {
			f.submit();
			
		}//back()
	
	</script>
	
	<link rel='stylesheet' type='text/css' href="../css/oneshow.css"/>
	
</head>
<body>
	
	<div align="center">
		<form action="showall.do" method="post">
			<table>
				<tr><td id="td_img" colspan="2"><img id="img" src="../upload/${vo.photo_name}"></td></tr>	
				<tr><th id="th_info">주소</th><td id="td_bold_center">${vo.area}</td></tr>	
				<tr><th id="th_info">장소</th><td id="td_bold_center">${vo.place}</td></tr>	
				<tr><th id="th_info">메모</th><td id="td_bold_center">${vo.memo}</td></tr>	
				<tr><th id="th_info">상세메모</th><td>${vo.content}</td></tr>	
			</table>
				
			<input type="hidden" name="id" value="${id}">
			<input type="hidden" name="id" value="${vo.id}">
			<input type="hidden" name="id" value="${vo.latlng}">
			<input type="hidden" name="category" value="${vo.category}">
			<input type="hidden" name="photo_show" value="${vo.photo_show}">
			<input type="hidden" name="photo_name" value="${vo.photo_name}">
		
			<input type="button" id="button" value="돌아가기"  onclick="back(this.form)">
		
		</form>
		
	</div>

</body>
</html>

<%@ include file = "/layout/footer.jsp" %> 