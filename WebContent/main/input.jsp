<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/check_login.jsp"%>     

<%@ include file = "/layout/header.jsp" %> 

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<link rel='stylesheet' type='text/css' href="../css/input.css"/>

	<script type="text/javascript">
		var InputImage = 
			 (function loadImageFile() {
			    if (window.FileReader) {
			        var ImagePre; 
			        var ImgReader = new window.FileReader();
			        var fileType = /^(?:image\/bmp|image\/gif|image\/jpeg|image\/png|image\/x\-xwindowdump|image\/x\-portable\-bitmap)$/i; 
			 
			        ImgReader.onload = function (Event) {
			            if (!ImagePre) {
			                var newPreview = document.getElementById("imagePreview");
			                ImagePre = new Image();
			                ImagePre.style.width = "200px";
			                ImagePre.style.height = "140px";
			                newPreview.appendChild(ImagePre);
			            }
			            ImagePre.src = Event.target.result;
			        };
			 
			        return function () {
						/*img : 파일이름  */
						var img = document.getElementById("image").files;

						if (!fileType.test(img[0].type)) {
							alert("이미지 파일을 업로드 하세요");
							return;
						}
						ImgReader.readAsDataURL(img[0]);
					}
			    }
			  
			})();
		
		function choice(c) {
			document.getElementById("cate").value=c.value;
			c.style="background:#b5e4f2";
			
			for (var i = 0; i < 5; i++) {
				document.getElementsByTagName("button")[i].disabled=true;
			}
		}
		
		function input(f) {
			if(f.category.value.trim()==''){
				alert("카테고리를 선택해주세요");
				return;
			}
			if(f.photo_show.value.trim()==''){
				alert("사진 제목을 입력해주세요");
				return;
			}
			if(f.photo_name.value.trim()==''){
				alert("사진을 첨부해주세요");
				return;
			}
			if(f.content.value.trim()==''){
				alert("메모를 해주세요");
				return;
			}
			var go=confirm("공유 게시판에도 등록 하시겠습니까?");
			if(go==true){
				f.share.value="1";
			}
			f.submit();
		}
		
	</script>
</head>
<body>
	<div align="center">
		<form name="formName" action="oneshow.do" method="POST" enctype="multipart/form-data">
			<table border="0">
				<tr>
		<th><img class="img1" src="../image/photoCate.png" style="height:40px; width: 110px; margin-left:80px;"></th>
					<td> 
						<addr title="사진"><button id="사진" value="photoIcon" onclick="choice(this)"><img src="../icon/photoIcon.png"></button></addr>
	                	<addr title="맛집"><button id="맛집" value="eatIcon"  onclick="choice(this)"><img src="../icon/eatIcon.png"></button></addr>
	               		<addr title="명소"><button id="명소" value="placeIcon"  onclick="choice(this)"><img src="../icon/placeIcon.png"></button></addr>
	               	    <addr title="여행"><button id="여행" value="carIcon"  onclick="choice(this)"><img src="../icon/carIcon.png"></button></addr>
	              	    <addr title="기타"><button id="기타" value="userAddIcon"  onclick="choice(this)"><img src="../icon/userAddIcon.png"></button></addr>
					</td>
				</tr>
				
				<tr>
					<th><img class="img1" src="../image/photoName.png"style="height:40px; width:110px; margin-left:80px;" ></th>
					<td><input name="photo_show" style="width:263px; height:40px;"></td>
				</tr>
	
				<tr>
					<th><img class="img1" src="../image/photoUpload.png"style="height:40px; width: 110px; margin-left:80px;"></th>
					<td width = "200" height="80" id="imagePreview" ><input type="file" height="30"  name = "photo_name" id="image" onchange="InputImage();"></td>
				</tr>
				
				<tr>
					<th><img class="img1" src="../image/photoMemo.png"style="height:40px; width: 110px;  margin-left:80px;"></th>
					<td><textarea cols="30" rows="10" name="content" style="width:263px;"></textarea></td>
				</tr>
			
				<tr>
					<td><input type="button" id="button" value="입력완료" onclick="input(this.form)"></td>
					<td><input type="button" id="button" value="등록취소" onclick="location.href='main.do?id=${id}'"></td>
				</tr>
				
			</table>
			
			<input type="hidden" name="id" value="${vo.id}">
			<input type="hidden" name="latlng" value="${vo.latlng}">
			<input type="hidden" name="area" value="${vo.area}">
			<input type="hidden" name="place" value="${vo.place}">
			<input type="hidden" name="memo" value="${vo.memo}">
			<input type="hidden" id="cate" name="category">
			<input type="hidden" name="share" value="0">
		</form>
	</div>

</body>
</html>

<%@ include file = "/layout/footer.jsp" %>