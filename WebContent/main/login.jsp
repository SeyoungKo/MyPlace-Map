<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
 
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<link rel='stylesheet' type='text/css' href="../css/login.css"/>
	
	<script type="text/javascript" src="../js/httpRequest.js"></script>
	
	<script type="text/javascript">
		if(!${empty res}){
			alert("회원가입이 완료되었습니다");
			
		}//if
	
		function login(f) {
			var id=f.id.value.trim();
			var pwd=f.pwd.value.trim();
			
			
			if(id==""){
				alert("아이디를 입력하세요");
				return;
				
			}//if
			
			
			
			if(pwd==""){
				alert("비밀번호를 입력하세요");
				return;
				
			}//if
			
			var url="login.do";
			var param="id="+encodeURIComponent(id)+"&pwd="+encodeURIComponent(pwd);
			sendRequest(url,param,resultFn,"POST");

		}//login()
		
		function resultFn() {
			if(xhr.readyState==4&&xhr.status==200){	
				var data=xhr.responseText;
				var json=eval(data);
				
				if(json[0].result=="no"){
					alert("아이디 또는 비밀번호 불일치");
					
				}else{
					var f=document.getElementById("f");
					f.submit();
					
				}//else_if
			
			}//if
			
		}//resultFn()
		
		
		
	</script>
	
</head>
<body>

<div id="title" align="center"><img src="../image/MyPlace.png"></div>
	
	<form id="f" action="main.do" method="post">
		
	<div align="center"><input id="idpwd" type="text" id="id" name="id" size="15" placeholder="아이디를 입력하세요"></div>
	<div align="center"><input id="idpwd" type="password" name="pwd" size="15" placeholder="비밀번호를 입력하세요"></div>
	<div align="center"><div align="center"><input type="button" id="button" onclick="login(this.form)" value="LOGIN"></div></div>
	<div id="join" align="center"><a href="loginInsert.jsp">My Place의 회원이 아닌가요?</a></div>

	</form>

</body>
</html>