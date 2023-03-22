<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.box{
		float:left;
	}
</style>
</head>
<body>
<div><h1>위험도 순위</h1></div>
	
	<div class="menu" onclick="hmFunc">메뉴〓</div>
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
	<div class="box" style="width:30%;height:350px;">
		<button>광주광역시</buttom><br>
		<button>전라북도</buttom><br>
		<button>전라남도</buttom>
		<!--버튼에 클릭 이벤트 넣을 것-->
	</div>
	<div class="box" style="width:70%;height:350px;background-color:lightblue;">
		<div id="danger"><p>버튼 클릭시 ajax로 처리할 공간</p></div>
	</div>
</body>
</html>