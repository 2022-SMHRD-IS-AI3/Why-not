<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div{
	width:300px;
	height:300px;
	float:left;
	}
	div.graph{
		width:100px;
		height:100px;
		background-color: skyblue;
	}
</style>
</head>
<body>
<div>
<h1>1. 누수량</h1>
	<div class="graph"><p>누수량 막대그래프</p></div>
</div>
	
	<div>
	<h3><a href="TestLocal2.jsp">2. 노후도</a></h3>
	</div>
	<br>
	
	<span class="menu" onclick="hmFunc">메뉴〓</span>
	<div id="hiddenMenu" style="display:none;">
		<a href="TestMain.jsp">홈</a>
		<a href="TestMap.jsp">정수장 현황</a>
		<a href="TestLocal1.jsp">시도별 현황</a>
		<a href="TestDanger.jsp">위험 순위</a>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script>
		$(".menu").on('click',function(){
			$("#hiddenMenu").css("display","block");
		})
	</script>
</body>
</html>