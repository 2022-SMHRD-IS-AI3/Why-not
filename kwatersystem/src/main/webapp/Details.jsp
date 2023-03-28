<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="./circle-progress.js"></script>
<style>
li{list-style:none}
.menu, {
	width: 1668px;
	position: fixed;
	top: 0px;
	left: 78px;
}

.menu > li {
  width: 20%; /*20*5=100%*/
  float: left;
  text-align: center;
  line-height: 40px;
  background-color: #5778ff;
}

.menu a {
  color: #fff;
  text-decoration:none;
  font-size:14px
}


#details_head {
	width: 1900px;
	height: 80px;
	position: fixed;
	top: 80px;
	left: 30px;
}

#details_head>a {
	margin-left: 100px;
	font-weight:550;
}
#details_head>a:nth-child(1){
	width:380px; 	
	font-size: 30px;
	position: fixed;
	top: 80px;
	left: 30px;
}
#details_head>a:nth-child(3){
	width:250px; 	
	font-size: 30px;
	position: fixed;
	top: 80px;
	left: 1450px;
}
#details_head>a:nth-child(2){
	width: 1010px;
	font-size: 30px;
	position: fixed;
	top: 80px;
	left: 420px;
}
#oper_table {
	position: fixed;
	top: 185px;
	width: 500px;
	margin-left: 110px;
	background-color: whitesmoke;
}

#oper_table th {
	font-size: 30px;
	height: 50px;
}

#oper_g {
	height: 307px;
}
#circle{
	text-align: center;
}
#circle>div{
	position: fixed;
	top: 363px;
	left: 330px;
	font-size: 40px;
	text-align: center;
}

#popu_table {
	position: fixed;
	top: 185px;
	width: 500px;
	margin-left: 670px;
	background-color: whitesmoke;
}

#popu_table th {
	font-size: 30px;
	height: 50px;
}

#popu_g {
	height: 307px;
	text-align: center;
	font-size:30px;
}
#popu_g>div:nth-child(1){
	height: 260px;
}
#popu_img{
	width:250px;
	position:absolute;
	left:25%;
	animation-name: imgAni;
	animation-duration: 1s;
	animation-direction: normal;
	animation-delay: 0.5s;
}
@keyframes imgAni{
	from{
		width:25px;
		left:48%;
		top:50%;
	}
	to{
		left:25%;
		top:0%;
		width:250px;
	}	
}

#i_table {
	width:570px;
	position: fixed;
	background-color: black;
	top: 185px;
	left: 1215px;
}

#i_table th {
	height: 50px;
	font-size: 30px;
	background-color: skyblue;
}

#i_table td {
	width: 80px;
	height: 27px;
	text-align: center;
	background-color: white;
}

.i_years {
	font-size: 15px;
}

.i_code>td:first-child {
	font-size: 10px;
}

#f_table {
	position: fixed;
	background-color: black;
	width:1668px;
	top: 580px;
	margin-left: 110px;
}

#f_table th {
	height: 50px;
	font-size: 30px;
	background-color: skyblue;
}

#f_table td {
	width: 115px;
	height: 30px;
	text-align: center;
	font-size: 15px;
	background-color: white;
}

#f_table td[name=no15], #f_table td[name=no16], #f_table td[name=no17],
	#f_table td[name=no23], #f_table td[name=no29], #f_table td[name=no33],
	#f_table td[name=no34], #f_table td[name=no35], #f_table td[name=no36],
	#f_table td[name=no37], #f_table td[name=no39], #f_table td[name=no54],
	#f_table td[name=no55], #f_table td[name=no3], #f_table td[name=no11],
	#f_table td[name=no31] {
	font-size: 12px;
}
</style>
</head>
<body>	
	<ul class="menu">
      <li>
        <a href="TestMain.jsp">홈</a>
      </li>
      <li>
        <a href="TestMap">지도</a>
      </li>
      <li>
        <a href="TestDanger.jsp">위험도 순위</a>
      </li>
      <li>
        <a href="Details.jsp">상세보기</a>
      </li>
      <li>
        <a href="#">MENU5</a>
      </li>
    </ul>

	<div id="details_head">
		<a>이름 : ??? 정수장</a> 
		<a>주소 : ?? ?? ??</a> 
		<a>준공년도 : 0000</a>
	</div>

	<table id="oper_table">
		<tr>
			<th>가동률</th>
		</tr>
		<tr>
			<td id="oper_g">
				<div id="circle">
					<div>90%</div>
				</div>
			</td>
		</tr>
	</table>
	<table id="popu_table">
		<tr>
			<th>급수 인구</th>
		</tr>
		<tr>
			<td id="popu_g">
				<div style="position:relative"><img src="./icon_users.png" id="popu_img"></div>
				<div>300,000</div>
			</td>
		</tr>
	</table>
	<table id="i_table">
		<tr>
			<th colspan="6">취수장 수질</th>
		</tr>
		<tr class="i_years">
			<td style="width: 120px">항목</td>
			<td name="no1">2022</td>
			<td name="no2">2021</td>
			<td name="no3">2020</td>
			<td name="no4">2019</td>
			<td name="no5">2018</td>
		</tr>
		<tr class="i_code">
			<td>수소이온농도</td>
			<td name="no1"></td>
			<td name="no2"></td>
			<td name="no3"></td>
			<td name="no4"></td>
			<td name="no5"></td>
		</tr>
		<tr class="i_code">
			<td>생물화학적_산소요구량</td>
			<td name="no1"></td>
			<td name="no2"></td>
			<td name="no3"></td>
			<td name="no4"></td>
			<td name="no5"></td>
		</tr>
		<tr class="i_code">
			<td>화학적_산소요구량</td>
			<td name="no1"></td>
			<td name="no2"></td>
			<td name="no3"></td>
			<td name="no4"></td>
			<td name="no5"></td>
		</tr>
		<tr class="i_code">
			<td>총유기탄소</td>
			<td name="no1"></td>
			<td name="no2"></td>
			<td name="no3"></td>
			<td name="no4"></td>
			<td name="no5"></td>
		</tr>
		<tr class="i_code">
			<td>총인</td>
			<td name="no1"></td>
			<td name="no2"></td>
			<td name="no3"></td>
			<td name="no4"></td>
			<td name="no5"></td>
		</tr>
		<tr class="i_code">
			<td>부유물질량</td>
			<td name="no1"></td>
			<td name="no2"></td>
			<td name="no3"></td>
			<td name="no4"></td>
			<td name="no5"></td>
		</tr>
		<tr class="i_code">
			<td>용존산소량</td>
			<td name="no1"></td>
			<td name="no2"></td>
			<td name="no3"></td>
			<td name="no4"></td>
			<td name="no5"></td>
		</tr>
		<tr class="i_code">
			<td>총대장균군</td>
			<td name="no1"></td>
			<td name="no2"></td>
			<td name="no3"></td>
			<td name="no4"></td>
			<td name="no5"></td>
		</tr>
		<tr class="i_code">
			<td>대장균_분원성대장균군</td>
			<td name="no1"></td>
			<td name="no2"></td>
			<td name="no3"></td>
			<td name="no4"></td>
			<td name="no5"></td>
		</tr>
	</table>
	<table id="f_table">
		<tr>
			<th colspan="14">정수장 수질</th>
		</tr>
		<tr clase="f_code">
			<td name="no1">일반세균</td>
			<td name="no2">총대장균군</td>
			<td name="no3">분원성_대장균군</td>
			<td name="no4">납</td>
			<td name="no5">불소</td>
			<td name="no6">비소</td>
			<td name="no7">셀레늄</td>
			<td name="no8">수은</td>
			<td name="no9">시안</td>
			<td name="no10">크롬</td>
			<td name="no11">암모니아성질소</td>
			<td name="no12">질산성질소</td>
			<td name="no13">카드뮴</td>
			<td name="no14">페놀</td>
		</tr>
		<tr clase="f_value">
			<td name="no1"></td>
			<td name="no2"></td>
			<td name="no3"></td>
			<td name="no4"></td>
			<td name="no5"></td>
			<td name="no6"></td>
			<td name="no7"></td>
			<td name="no8"></td>
			<td name="no9"></td>
			<td name="no10"></td>
			<td name="no11"></td>
			<td name="no12"></td>
			<td name="no13"></td>
			<td name="no14"></td>
		</tr>
		<tr clase="f_code">
			<td name="no15">1.1.1-트리클로로에탄</td>
			<td name="no16">테트라클로로에틸렌</td>
			<td name="no17">트리클로로에틸렌</td>
			<td name="no18">디클로로메탄</td>
			<td name="no19">벤젠</td>
			<td name="no20">톨루엔</td>
			<td name="no21">에틸벤젠</td>
			<td name="no22">크실렌</td>
			<td name="no23">1.1디클로로에틸렌</td>
			<td name="no24">사염화탄소</td>
			<td name="no25">다이아지논</td>
			<td name="no26">파라티온</td>
			<td name="no27">페니트로티온</td>
			<td name="no28">카바릴</td>
		</tr>
		<tr clase="f_value">
			<td name="no15"></td>
			<td name="no16"></td>
			<td name="no17"></td>
			<td name="no18"></td>
			<td name="no19"></td>
			<td name="no20"></td>
			<td name="no21"></td>
			<td name="no22"></td>
			<td name="no23"></td>
			<td name="no24"></td>
			<td name="no25"></td>
			<td name="no26"></td>
			<td name="no27"></td>
			<td name="no28"></td>
		</tr>
		<tr clase="f_code">
			<td name="no29">1,2-디브로모-3-클로로프로판</td>
			<td name="no30">잔류염소</td>
			<td name="no31">총트리할로메탄</td>
			<td name="no32">클로로포름</td>
			<td name="no33">클로랄하이드레이트</td>
			<td name="no34">디브로모아세토니트릴</td>
			<td name="no35">디클로로아세토니트릴</td>
			<td name="no36">트리클로로아세토니트릴</td>
			<td name="no37">할로아세틱에시드</td>
			<td name="no38">경도</td>
			<td name="no39">과망간산칼륨소비량</td>
			<td name="no40">냄새</td>
			<td name="no41">맛</td>
			<td name="no42">동</td>
		</tr>
		<tr clase="f_value">
			<td name="no29"></td>
			<td name="no30"></td>
			<td name="no31"></td>
			<td name="no32"></td>
			<td name="no33"></td>
			<td name="no34"></td>
			<td name="no35"></td>
			<td name="no36"></td>
			<td name="no37"></td>
			<td name="no38"></td>
			<td name="no39"></td>
			<td name="no40"></td>
			<td name="no41"></td>
			<td name="no42"></td>
		</tr>
		</tr>
		<tr clase="f_code">
			<td name="no43">색도</td>
			<td name="no44">세제</td>
			<td name="no45">수소이온농도</td>
			<td name="no46">아연</td>
			<td name="no47">염소이온</td>
			<td name="no48">증발잔류물</td>
			<td name="no49">철</td>
			<td name="no50">망간</td>
			<td name="no51">탁도</td>
			<td name="no52">황산이온</td>
			<td name="no53">알루미늄</td>
			<td name="no54">브로모디클로로메탄</td>
			<td name="no55">디브로모클로로메탄</td>
			<td name="no56">1,4-다이옥산</td>
		</tr>
		<tr clase="f_value">
			<td name="no43"></td>
			<td name="no44"></td>
			<td name="no45"></td>
			<td name="no46"></td>
			<td name="no47"></td>
			<td name="no48"></td>
			<td name="no49"></td>
			<td name="no50"></td>
			<td name="no51"></td>
			<td name="no52"></td>
			<td name="no53"></td>
			<td name="no54"></td>
			<td name="no55"></td>
			<td name="no56"></td>
		</tr>
	</table>

	<script>
		/* $(document).on('click', '[class=menu]', function() {
			$("#hiddenMenu").css("display", "inline");
			$(this).removeClass('menu');
			$(this).attr('class', 'h_menu');
		})
		$(document).on('click', '[class=h_menu]', function() {
			$("#hiddenMenu").css("display", "none");
			$(this).removeClass('h_menu');
			$(this).attr('class', 'menu');
		}) */
	</script>
	<script>
		$('#circle').circleProgress({
			startAngle: -Math.PI ,
	        value: 0.90,
	        size: 280,
	        thickness:40,
	        emptyFill: "rgba(0,0,0,0.1)",
	        fill: {gradient: ["#DDF1FE", "#016FFE"]},
			animationStartValue:0.0
	    });
	</script>



</body>
</html>