<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<style>
	*{ margin:0;}
	
	#header{
		margin-top: 15px;
		padding-top: 10px;
		width: 100%;
		height: 43px;
		background: #80d7e5;
		font-size:16px;}

	#header a{color: white;
			  padding-left: 60px;
			  font-weight: bold;}
	  
	#header a:hover {color: white;}
	
	a{text-decoration: none;}
	
</style>

<div id="header" align="center">
	<a href="main.do?id=${id}">Home</a> 
	<a href="showall.do?id=${id}">Show</a>
	<a href="board.do?id=${id}">Board</a>
	<a href="sList.do?id=${id}">Schedule</a>
	<a href="random.do?id=${id}">Game</a>	 
	
</div>
