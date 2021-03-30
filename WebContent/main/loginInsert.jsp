<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link rel='stylesheet' type='text/css' href="../css/loginInsert.css"/>
	<script type="text/javascript" src="../js/httpRequest.js"></script>
	<script type="text/javascript">

		var b_idCheck = false;
		var b_pwdCheck=false;
		
		function send(f) {
			var id = f.id.value.trim();
			var pwd = f.pwd.value.trim();
			var name = f.name.value.trim();
			var gender = f.gender.value.trim();
			var age = f.age.value.trim();
			var tel = f.tel.value.trim();
			
			if(id == '') {
				alert("아이디를 입력하세요");
				f.id.focus();
				return;
				
			}
			if(pwd == '') {
				alert("비밀번호를 입력하세요");
				f.pwd.focus();
				return;
				
			}
			if(name == '') {
				alert("이름을 입력하세요");
				f.name.focus();
				return;
				
			}
			if(age == '') {
				alert("나이를 입력하세요");
				f.age.focus();
				return;
				
			}
			if( !b_idCheck ) {
				alert("아이디 중복체크를 먼저 하세요");
				return;
				
			}
			if(!b_pwdCheck){
				alert("비밀번호 체크를 먼저 하세요");
				return;
			}
			f.action = "loginInsert.do";
			f.method = "POST";
			f.submit();
		}
		function check_id() {
			
			var id = document.getElementById("id").value.trim();
			
			if(id == '') {
				alert("아이디를 입력하세요");
				return;
				
			}
			var url = "loginCheck.do";
			var param = "id="+encodeURIComponent(id);
			
			sendRequest(url, param, resultFn, "POST");
		}
		function resultFn() {
			if(xhr.readyState == 4 && xhr.status == 200) {
				var data = xhr.responseText;
				var json = eval(data);
				
				if(json[0].result == 'no') {
					alert(json[1].id + "는 이미 사용중인 아이디입니다.");
					return;
				}
				alert(json[1].id + "는 사용 가능합니다.");
				b_idCheck = true;
				
				document.getElementById("id").readOnly = true;
			}
			
		}
		function check_pwd(f) {
			var pwd=f.pwd.value.trim();
			var pwdch=f.pwdch.value.trim();
			
			if(pwd==""){
				alert("비밀번호를 입력해 주세요");
				return;
				
			}
			if(pwd==pwdch){
				alert("비밀번호가 일치합니다.");
				b_pwdCheck=true;
				f.pwd.readOnly=true;
				f.pwdch.readOnly=true;
			}else{
				alert("비밀번호가 일치하지 않습니다.\n확인 후 다시 입력해주세요.");
				
			}
		}
	</script>
</head>
<body>
	<br>
	<div id="join" align="center"><img src="../image/join_title.png"></div>
	<div id="bigtable" >
		<form>
			<table align="center">
				<tr>
					<th><img class="img" src="../image/join_id.png"></th>
					<td>
						<input type="text" name="id" id="id" size="15" placeholder="5~20자의  영문 소문자, 숫자와 특수기호(_, -)만 사용 가능합니다.">
						<input type="button" id="check_button" value="중복체크" onclick="check_id();">
					</td>
				</tr>
				<tr>
					<th><img class="img" src="../image/join_pwd.png"></th>
					<td><input type="password" name="pwd" size="15"></td>
				</tr>
				<tr>
					<th><img class="img" src="../image/join_pwd2.png"></th>
					<td>
						<input type="password" name="pwdch" size="15">
						<input type="button" id="check_button" value="일치확인" onclick="check_pwd(this.form);">
					</td>
				</tr>
				<tr>
					<th><img class="img" src="../image/join_name.png"></th>
					<td><input name="name" size="15"></td>
				</tr>
				<tr>
					<th><img class="img" src="../image/join_gender_age.png"></th>
					<td>
						<input id="radio" type ="radio" name="gender" value="남자" checked >남
						<input id="radio" type ="radio" name="gender" value="여자">여
						<input id="age" type ="text" name="age" size="1" placeholder="나이">세
					</td>
				</tr>
				<tr>
					<th><img class="img" src="../image/join_tel.png"></th>
					<td><input name="tel" size="15" placeholder="하이픈(-) 표시 없이 입력"></td>
				</tr>
					<tr align="center">
						<td colspan="2">
						<input type="button" id="button" onclick="send(this.form)" value="가입하기">
				   <input type="button" id="button" onclick="location.href='login.jsp'" value="가입취소">					</td>
					</tr>
				</table>
			</form>
		</div>
</body>
</html>