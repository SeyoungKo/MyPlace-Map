<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/check_login.jsp"%>
<%@ include file = "/layout/header.jsp" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<link rel='stylesheet' type='text/css' href="../css/scheduleWrite.css"/>

<script>
	function send(f) {
		
		if(f.scontent.value.trim()==''){
			alert("내용을 입력하세요");
			return;
		}
		f.action = "sInsert.do";
		f.method="post";
		f.submit();
	}
</script>
<body>
	<form>
		<div align="center" id="div">
		<input type="hidden" name="id" value="${sessionScope.user.id}">
			<table>
				<tr>
					<td id="sub_1"><img id="sub_img" src="../image/scheduleWrite_날짜.png"></td>
					<td id="sub_1_1">
						<input id="input" style="width: 50px;" type="text" name="year">년
						<input id="input" style="width: 30px;" type="text" name="month">월
						<input id="input" style="width: 30px;" type="text" name="day">일 ~
						<input id="input" style="width: 50px;" type="text" name="endyear">년
						<input id="input" style="width: 30px;" type="text" name="endmonth">월
						<input id="input" style="width: 30px;" type="text" name="endday">일
					</td>
				</tr>

				<tr>
					<td id="sub_2"><img id="sub_img" src="../image/scheduleWrite_장소.png"></td>
					<td colspan="2"><input type="text" id="splace" name="splace"></td>
				</tr>

				<tr>
					<td id="sub_3"><img id="sub_img3" src="../image/scheduleWrite_내용.png"></td>
					<td><textarea id="scontent" rows="5" cols="30" name="scontent">내용을 입력해주세요.</textarea></td>
				</tr>

				<tr>
					<td colspan="2" align="center">
						<input type="button" class="img_button_1" value="뒤로 가기" onclick="location.href='sList.do?id=${id}'">
						<input type="submit" class="img_button_2" value="등록" onclick="send(this.form)">
					</td>
				</tr>

			</table>
		</div>
	</form>
</body>
</html>

<%@ include file = "/layout/footer.jsp" %> 