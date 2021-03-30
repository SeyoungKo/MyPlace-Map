var xhr = null;

function createRequest(){

		if(xhr!=null)return;
		if(window.ActiveXObject)
			xhr = new ActiveXObject("Microsoft.XMLHTTP");
		else
			xhr = new XMLHttpRequest();
	}
	
	
	function sendRequest(url, param, callBack, method){
		createRequest();//HTTP request생성
	
		//전송타입 구분
		var httpMethod = 
		(method!='POST' && method!='post')?'GET':'POST';
		
		//파라미터 구분
		var httpParam = 
		(param==null || param == '')?null:param;
		
		//접근 url
		var httpURL = url;

		if(httpMethod == 'GET' && httpParam != null)
			httpURL = httpURL+"?"+httpParam;

		xhr.open(httpMethod, httpURL, true);
	
		xhr.setRequestHeader("Content-Type",
		  "application/x-www-form-urlencoded");
	
		xhr.onreadystatechange = callBack;
		
		xhr.send(httpMethod == 'POST'?httpParam:null);
}













