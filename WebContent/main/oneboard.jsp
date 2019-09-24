<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   

<%@ include file="../layout/check_login.jsp"%> 

<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%@ include file = "/layout/header.jsp" %> 
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>

	<script type="text/javascript">
		if(!${empty res}){
			alert("댓글이 등록되었습니다");
			
		}//if
	
		function enrollment(f) {
			if(f.text.value.trim()==""){
				alert("댓글을 입력해 주세요");
				return;
				
			}//if
			
			f.submit();
			
		}//enrollment()
		
		function back(f) {
			f.submit();
			
		}//back()
	
	</script>
		<link rel='stylesheet' type='text/css' href="../css/oneboard.css"/>
	
</head>
<body>
	<div align="center">
			<div class="div2"><p>${vo.id} 님의</p><img src="../icon/${vo.category}.png" id="img2">&nbsp;&nbsp;${vo.place}</div>
			
			<div class="div3"><img src="../icon/searchMapIcon.png" style="width:23px; height:23px;">
					<h5 style="display:inline;">${vo.area}</h5>
			</div>
	
				<div class="div1" align="center"><img src="../upload/${vo.photo_name}" width="90%" height="400px" id="img1"></div>


		<table border="1" class="table">
			
			
			<tr style="text-align: center">
				<td colspan="3"><p id="p2">Memo  :  </p>  ${vo.memo}</td>
				
			</tr>
						
		</table>
			
			<br>
			
		<form action="board.do">
			<input type="hidden" name="id" value="${id}">
			<input type="button" id="button_back" value="돌아가기" onclick="back(this.form);">
		
		</form>
		
	</div>
	
	<form action="comment.do" method="post">
		<div align="center">
		<br>
		<div><img src="../icon/talkIcon.png"></div>
			<textarea name="text" placeholder="주제와 무관한 댓글, 악플은 삭제될 수 있습니다." cols="100" rows="4" style="margin:auto;"></textarea>
			<input type="button" id="button_comment" value="등록" onclick="enrollment(this.form)">
		</div>
		
		<input type="hidden" name="idx" value="${idx}">
		<input type="hidden" name="place" value="${vo.place}">
		<input type="hidden" name="category" value="${vo.category}">
		<input type="hidden" name="memo" value="${vo.memo}">
		<input type="hidden" name="area" value="${vo.area}">
		<input type="hidden" name="photo_show" value="${vo.photo_show}">
		<input type="hidden" name="content" value="${vo.content}">
		<input type="hidden" name="photo_name" value="${vo.photo_name}">
		<input type="hidden" name="id" value="${id}">
		
	</form>
	
	<div align="center">
				<c:forEach var="list" items="${list}">
				<br>
						<h3><img src="../icon/resultIcon.png" width="13">${list.id}</h3>
						<h4 style="display:inline;">${list.text}</h4>
						<p>${list.regdate}</p>
						<hr style="color:#f9ffff">
					
				</c:forEach>

	</div>
	
</body>
</html>

<%@ include file = "/layout/footer.jsp" %> 