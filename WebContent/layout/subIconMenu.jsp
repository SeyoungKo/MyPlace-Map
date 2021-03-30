<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<style>
	*{ margin:0px;

	}
	
	#subIcon{
		padding-top:10px;
		padding-bottom:10px;
		margin-top: 60px;
		width: 100%;
		height: 38px;
		background: #f4f4f4;
	}
	#img1{
		 padding-right: 43px;
		
	}
	#img2{
		 padding-right: 43px;
	
	}
	#img3{
		 padding-right: 43px;
		
	}
	#img4{
		 padding-right: 43px;
		
	}
	#img5{
		
	
	}
	
	a{text-decoration: none;}
	
</style>
	<div id = "subIcon" align ="center">
		<span id="img1">
			<a href = "submap.do?id=${id}&category=photoIcon">
		      <img src ="../icon/photoIcon.png" alt="사진찍기 좋은 곳" >
			</a>	
		</span>
		
		<span id ="img2">
			 <a href = "submap.do?id=${id}&category=eatIcon">
				<img src ="../icon/eatIcon.png" alt="맛집">
			</a>
		</span>
		
		<span id = "img3">
			 <a href="submap.do?id=${id}&category=placeIcon">
				<img src ="../icon/placeIcon.png" alt="명소">
			 </a>	
		</span>	 
		
		<span id = "img4">
			 <a href="submap.do?id=${id}&category=carIcon">
				<img src = "../icon/carIcon.png" alt = "여행">
			 </a>	
		</span>		
		<span id = "img5">
			 <a href="submap.do?id=${id}&category=userAddIcon">
				<img src ="../icon/userAddIcon.png" alt="기타">
			 </a>
		</span>	 
	</div>
