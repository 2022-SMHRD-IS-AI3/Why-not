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
		height:150px;
		position:fixed;
		top:10px;
		left:60px;
		background-color:#5778ff;
		text-align:center;
		font-size:80px;
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
		overflow: hidden;
	}
	#warp_dan{
		left:960px;
		overflow: hidden;
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
		filter: brightness(70%);
		transition: all 0.2s linear;
	}
	#warp_map img:hover{
		transition: all 0.2s linear;
		transform: scale(1.2);
		filter: brightness(100%);
	}
		
	#warp_dan div{
		position:fixed;
		top:520px;
		left:1210px;
		font-size:80px;
		color: black;
	}
	#warp_dan img{
		width:900px;
		height:700px;
		filter: brightness(70%);
		transition: all 0.2s linear;
	}
	#warp_dan img:hover{
		transition: all 0.2s linear;
		transform: scale(1.2);
		filter: brightness(100%);
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
				<img src="map_img2.png">
				<div>정수장 현황</div>
			</a>
		</div>
		<div id="warp_dan">
			<a href="TestDanger.jsp">
				<img src="error_img.jpg">
				<div>위험도 순위</div>
			</a>
		</div>
	</div>
	

</body>
</html>