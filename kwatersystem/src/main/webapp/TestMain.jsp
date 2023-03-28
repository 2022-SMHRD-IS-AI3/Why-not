<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.team_info{
		width:1800px;
		height:200px;
		position:fixed;
		top:0px;
		left:60px;
		background-color:#5778ff;
		text-align:center;
		font-size:100px;
		font-weight:500;
	}
	.warp{
		width:1800px;
		height:700px;
		position:fixed;
		top:200px;
		left:60px;
	}
	.warp>div{
		width:900px;
		height:700px;
		position:fixed;
		top:200px;
	}
	.warp a{
		width:900px;
		height:700px;
	}
	#warp_map{
		left:60px;
		background-color:yellow;
	}
	#warp_dan{
		left:960px;
		background-color:red;
	}
	#warp_map div{
		position:fixed;
		top:520px;
		left:310px;
		font-size:80px;
		color: black;
	}
	#warp_map img{
		width:900px;
		height:700px;
	}
	#warp_dan div{
		position:fixed;
		top:520px;
		left:1210px;
		font-size:80px;
		color: black;
	}
</style>
</head>
<body>
	<div class="team_info">
		<div style="height:20px;"></div>
		정수장 관리 시스템
	</div>
	<div class="warp">
		<div id="warp_map">
			<a href="TestMap.jsp">
				<img src="map_img.png">
				<div>정수장 현황</div>
			</a>
		</div>
		<div id="warp_dan">
			<a href="TestDanger.jsp">
				<img src="dan_img.png">
				<div>위험도 순위</div>
			</a>
		</div>
	</div>
</body>
</html>