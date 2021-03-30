<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/check_login.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file = "/layout/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>

<link rel='stylesheet' type='text/css' href="../css/scheduleView.css"/>

<script src="../js/httpRequest.js"></script>
<script type="text/javascript">
	function del(a) {
		var idx = a;
		var url = "sDelete.do?idx=" + idx;
		sendRequest(url, idx, resultFn, "POST");
	}
	
	function resultFn() {
		if(xhr.readyState == 4 && xhr.status == 200){
			//json타입으로 넘긴다.
			var data = xhr.responseText;
			var json = eval(data);
			
			if(json[0].result == 'yes'){
				alert("삭제 성공");
				location.href = "sList.do?id=${id}";
			} else {
				return;
			}
		}
	}
</script>

<body>
	<form action="sInsertForm.do">
	<div align="center"><img id="title" src="../image/MySchedule.png"></div>
		<c:if test="${empty list}" >
				<p style="text-align:center; ">등록된 내용이 없습니다. 내용을 등록해주세요!</p>
				<input type="hidden" name="id" value="${sessionScope.user.id}">
		</c:if>
	</form>
	<form action="sInsertForm.do">
		<div id="bigTable" align="center">
		<input type="hidden" name="id" value="${sessionScope.user.id}">
			<p>
				<input type="button" class="img_button" value="뒤로 가기" onclick="location.href='main.do?id=${id}'">
				<input type="submit" class="img_button" value="등록 하기">
			</p>

			<c:forEach var="vo" items="${list}">
				<div id="view_table">
					<table id="smallTable">
						<tr>
							<td id="td">날짜</td>
							<td>
							${vo.year}년 ${vo.month}월 ${vo.day}일 ~
							${vo.endyear}년 ${vo.endmonth}월 ${vo.endday}일
							</td>
						</tr>

						<tr>
							<td id="td">장소</td>
							<td>${vo.splace}</td>
						</tr>

						<tr>
							<td id="td">내용</td>
							<td>${vo.scontent}</td>
						</tr>

						<tr>
							<td colspan="2" align="right">
							<input type="button" value="삭제" name="delete" onclick="del('${vo.idx}');">
							</td>
						</tr>
					</table>
				</div>
			</c:forEach>
		</div>
	</form>
</body>
</html>

<%@ include file = "/layout/footer.jsp" %> 