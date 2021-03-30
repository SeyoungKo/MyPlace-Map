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

	function gogo() {
		var random = Math.floor(Math.random() * 3) + 1;
		
		if(random == 1){
			document.getElementById("img_2").innerHTML = "";
			document.getElementById("img_3").innerHTML = "";
		}
		if(random == 2){
			document.getElementById("img_1").innerHTML = "";
			document.getElementById("img_3").innerHTML = "";
		}
		if(random == 3){
			document.getElementById("img_2").innerHTML = "";
			document.getElementById("img_3").innerHTML = "";
		}
	}
	
	function again(f) {
		f.submit();
	}
</script>
	<link rel="stylesheet" type="text/css" href="../css/random.css">
</head>
<body>
<form action="random.do" method="post">
	<div class="img">
		<div class="content">
		   <div align="center">

				<div id="img_1"><input type="text" id="place_1"
					 style="text-align:center; width:250px; height:40px; margin:5px;
					 border-radius:12px; border-style:none;"
					 placeholder="가고 싶은 장소를 입력해주세요!"></div>


				<div id="img_2"><input type="text" id="place_2"
					 style="text-align:center; width:250px; height:40px; margin:5px;
					 border-radius:12px; border-style:none;"
					 placeholder="가고 싶은 장소를 입력해주세요!"></div>


				<div id="img_3"><input type="text" id="place_3"
					 style="text-align:center; width:250px; height:40px; margin:5px;
					 border-radius:12px; border-style:none;"
					 placeholder="가고 싶은 장소를 입력해주세요!"></div>
			</div>
				<div>
					<input type="button" value="뽑기" style="width:70px; height:30px; margin:5px;
					border-radius:12px; border-style: dashed; background : white;"onclick="gogo()">

					<input type="button" value="다시?" style="width:70px; height:30px; margin:5px;
					border-radius:12px; border-style: dashed; background : white;"onclick="again(this.form)">
					<input type="hidden" name="id" value="${id}">
				</div>
			<div class="img-cover"></div>
		</div>
	</div>
</form>
</body>
</html>

<%@ include file = "/layout/footer.jsp" %> 