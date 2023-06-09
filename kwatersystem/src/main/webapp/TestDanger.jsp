<%@page import="com.smhrd.model.Danger_infoDTO"%>
<%@page import="com.smhrd.model.Danger_infoDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.MapDAO"%>
<%@page import="com.smhrd.model.Filtration_infoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>K-water System</title>
<link rel="icon" href="wwwww.ico" type="image/x-icon" />
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="./circle-progress.js"></script>
<style>
li {
	list-style: none
}

.menu {
	width: 1685px;
	position: fixed;
	top: 0px;
	left: 78px;
}

.menu>li {
	width: 33.3%;
	float: left;
	text-align: center;
	line-height: 45px;
	background-color: #5778ff;
}

.menu a {
	color: #fff;
	text-decoration: none;
	font-size: 18px
}

.menu>li:hover {
	background-color: #002cdb;
	font-weight: 800; /*font-weight 적용*/
}

.menu a:hover {
	color: #fff;
	text-decoration: none;
}

.head {
	position: fixed;
	top: 70px;
	left: 170px;
	font-size: 40px;
	font-weight: 550;
}

.box {
	width: 1350px;
	height: 620px;
	position: fixed;
	top: 140px;
	left: 480px;
}

#danger {
	text-align: center;
	background-color: black;
}

#danger th {
	height: 40px;
	background-color: #859dff;
}

#danger_tr1>th:nth-child(1) {
	width: 120px;
}

#danger_tr1>th:nth-child(2) {
	width: 180px;
	font-size:28px;
}

#danger_tr1>th {
	font-size: 30px;
}

#danger_tr2>th {
	font-size: 20px;
}

#danger td {
	position: relative;
	height: 120px;
	background-color: white;
	font-size: 27px;
	text-align: center;
}

#danger td a {
	text-decoration-line: none;
	color: black;
}

#danger td:nth-child(2):hover {
	background-color: #6CB2FD;
	text-decoration: none;
	font-weight: 700;
}

#danger td:nth-child(3), #danger td:nth-child(4), #danger td:nth-child(5),
	#danger td:nth-child(6), #danger td:nth-child(7), #danger td:nth-child(8)
	{
	font-size: 20px;
	/* 테두리 없음 */
}

#danger td:nth-child(3) {
	width: 100px;
}

#danger td:nth-child(4), #danger td:nth-child(5), #danger td:nth-child(6),
	#danger td:nth-child(7), #danger td:nth-child(8) {
	width: 170px;
}

#danger td:nth-child(3)>a:nth-child(1) {
	position: absolute;
	top: 3px;
	left: 32px;
}

#danger td:nth-child(3)>a:nth-child(2) {
	position: absolute;
	width: 100%;
	background-image: linear-gradient(to top, yellow, red);
	bottom: 0;
	right: 0;
}

#danger td:nth-child(4)>a {
	position: absolute;
	text-align: center;
	top: 47px;
	left: 67px;
}

#danger td:nth-child(5)>a, #danger td:nth-child(6)>a {
	position: absolute;
	text-align: center;
	top: 3px;
	left: 55px;
}

#danger td:nth-child(7)>a, #danger td:nth-child(8)>a {
	position: absolute;
	text-align: center;
	top: 3px;
	left: 74px;
}

#danger td:nth-child(4)>canvas {
	padding-top: 4px;
}

#danger td:nth-child(5)>img, #danger td:nth-child(6)>img, #danger td:nth-child(7)>img,
	#danger td:nth-child(8)>img {
	width: 90px;
	height: 90px;
	padding-top: 4px;
}

.bbb {
	position: fixed;
	top: 145px;
	left: 180px;
}

.button_box .button {
	border-radius: 5px;
	background-color: #6CB2FD;
	border: 1px solid #6CB2FD;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	font-size: 16px;
	cursor: pointer;
	width: 180px;
	font-weight: 500;
}

.button_box .button:not(:last-child) {
	border-bottom: none; /* Prevent double borders */
}

.button_box .button:hover {
	background-color: white;
	color: black;
	font-weight: 770; /*font-weight 적용*/
}

#oper_td {
	text-align: center;
}

.smile_info {
	position: fixed;
	top: 395px;
	left: 198px;
	text-align: center;
	width: 160px;
}

.smile_info table {
	width: 160px;
	/* 	background-color:black; */
}

.smile_info th {
	width: 50%;
	/* 	background-color:#6CB2FD; */
}

.smile_info td {
	height: 35px;
	/* 	background-color:white; */
}

.smile_info img {
	width: 35px;
	height: 35px;
	padding-top: 4px;
}

</style>
</head>
<body>
	<ul class="menu">
		<li><a href="TestMain.jsp">홈</a></li>
		<li><a href="TestMap.jsp">정 수 장 현 황</a></li>
		<li><a href="TestDanger.jsp">위 험 도 순 위</a></li>
	</ul>

	<div class="head">위험도 순위</div>

	<div class="bbb">
		<table class="button_box">

			<tr>
				<td><button id="jungook" class="button">전 체</button></td>
			</tr>
			<tr>
				<td><button id="gwang" class="button">광 주 광 역 시</button></td>
			</tr>
			<tr>
				<td><button id="junbook" class="button">전 라 북 도</button></td>
			</tr>
			<tr>
				<td><button id="junnam" class="button">전 라 남 도</button></td>
			</tr>
		</table>
		<!--버튼에 클릭 이벤트 넣을 것-->

	</div>

	<!-- smile 설명 란 -->
	<div class="smile_info">
		<table>
			<tr>
				<th>등급 표시</th>
				<th>등급 정보</th>
			</tr>
			<tr>
				<td><img src='./smile/11_img.png'></td>
				<td>1등급</td>
			</tr>
			<tr>
				<td><img src='./smile/22_img.png'></td>
				<td>2등급</td>
			</tr>
			<tr>
				<td><img src='./smile/3_img.png'></td>
				<td>3등급</td>
			</tr>
			<tr>
				<td><img src='./smile/4_img.png'></td>
				<td>4등급</td>
			</tr>
			<tr>
				<td><img src='./smile/5_img.png'></td>
				<td>5등급</td>
			</tr>
			<tr>
				<td><img src='./smile/6_img.png'></td>
				<td>6등급</td>
			</tr>
			<tr>
				<td><img src='./smile/7_img.png'></td>
				<td>7등급</td>
			</tr>
			<tr>
				<td><img src='./smile/8_img.png'></td>
				<td>8등급</td>
			</tr>
			<tr>
				<td><img src='./smile/9_img.png'></td>
				<td>9등급</td>
			</tr>
		</table>
	</div>

	<script>
	
	console.log("test")
	 <%MapDAO dao = new MapDAO();
	 Danger_infoDAO ddao= new Danger_infoDAO();
	 List<Filtration_infoDTO> dataList = dao.selectJungook();
	 List<Filtration_infoDTO> gwangList = dao.selectGwangju();
	 List<Filtration_infoDTO> bookList = dao.selectJunbook();
	 List<Filtration_infoDTO> namList = dao.selectJunnam();
	 List<Danger_infoDTO> dataDList = ddao.selectDJungook();
	 List<Danger_infoDTO> gwangDList = ddao.selectDGwangju();
	 List<Danger_infoDTO> bookDList = ddao.selectDJunbook();
	 List<Danger_infoDTO> namDList = ddao.selectDJunnam();
	 %>
	 
	 //전국  위험도 이벤트 시작
	 // 정수장 이름 리스트
	 var filt_name = [];
	 <%for (int i = 0; i < dataList.size(); i++) {%>
	 filt_name.push('<%=dataList.get(i).getFilt_name() %>')
	 <%}%>
	 
/* 	 console.log(filt_name)
	  */
	 // 정수장 위험도 리스트
	 var danger = [];
	 <%for (int i = 0; i < dataList.size(); i++) {%>
	 danger.push('<%=dataList.get(i).getDanger_no()%>')
	 <%}%>
	 
	/*  console.log(danger) */
	//가동률 위험도 리스트
 	 var oper_danger = [];
	 <%for (int i = 0; i < dataList.size(); i++) {%>
	 oper_danger.push('<%=dataDList.get(i).getOper_danger() %>')
	 <%}%>
/* 	 console.log('ㅜㅜ')
	 console.log(oper_danger) */
	//공급세대 위험도 리스트 const_danger
 	 var sup_danger = [];
	 <%for (int i = 0; i < dataList.size(); i++) {%>
	 sup_danger.push('<%=dataDList.get(i).getSup_danger() %>')
	 <%}%>
/* 	 console.log('ㅜㅜ')
	 console.log(sup_danger) */
	//준공년도 위험도 리스트 const_danger
 	 var const_danger = [];
	 <%for (int i = 0; i < dataList.size(); i++) {%>
	 const_danger.push('<%=dataDList.get(i).getConst_danger() %>')
	 <%}%>
/* 	 console.log('ㅜㅜ')
	 console.log(const_danger) */
	//취수장 수질 위험도 리스트 const_danger
 	 var inta_danger = [];
	 <%for (int i = 0; i < dataList.size(); i++) {%>
	 inta_danger.push('<%=dataDList.get(i).getInta_danger() %>')
	 <%}%>
/* 	 console.log('ㅜㅜ')
	 console.log(inta_danger) */
	//정수장 수질 위험도 리스트 const_danger
 	 var filt_danger = [];
	 <%for (int i = 0; i < dataList.size(); i++) {%>
	 filt_danger.push('<%=dataDList.get(i).getFilt_danger() %>')
	 <%}%>
/* 	 console.log('ㅜㅜ')
	 console.log(filt_danger) */
	 
	 
	 // 전국 위험도 데이터 이차원배열생성 데이터 넣기전 셋팅
	 const mapicon = new Array(danger.length);
	 for (var i = 0; i< danger.length; i++){
	 	mapicon[i] = new Array(2); //2차원배열
	 }
	 //console.log(mapicon);
	 
	 //mapicon에 이차원 배열값 넣어주기
	 for(var i =0; i<danger.length; i++){
	 	mapicon[i][0] = filt_name[i];
	 }
	 for(var i =0; i<danger.length; i++){
	 	mapicon[i][1] = danger[i];
	 }
	 for(var i =0; i<danger.length; i++){
	 	mapicon[i][2] = oper_danger[i];
	 }
	 for(var i =0; i<danger.length; i++){
	 	mapicon[i][3] = sup_danger[i];
	 }
	 for(var i =0; i<danger.length; i++){
	 	mapicon[i][4] = const_danger[i];
	 }
	 for(var i =0; i<danger.length; i++){
	 	mapicon[i][5] = inta_danger[i];
	 }
	 for(var i =0; i<danger.length; i++){
	 	mapicon[i][6] = filt_danger[i];
	 }
	 
	 <%
		int dang_num = 0;
		int oper_num = 0;
		int popu_num = 0;
		int const_num = 0;
		int inta_num = 0;
		int filt_num = 0;
		String img_smile = null;
		String img_smile2 = null;
		String img_smile3 = null;
		String img_smile4 = null;
	%>	 
/* 	 var filt_name = mapicon[1][0];
	 console.log(filt_name); */
	 /* console.log(mapicon); */
		<%-- <% 
		 Danger_infoDAO ddao= new Danger_infoDAO();
		 Danger_infoDTO dto = new Danger_infoDTO(%>${filt_name}<%);
		 List<Danger_infoDTO> operList = ddao.selectOper(dto);
		%> --%>
	
	 $("#jungook").on('click',function(){
		console.log('ㅎㅇ');	
		
		  let tableForm =`
            <table id='danger'>
                <tr id='danger_tr1'>
                    <th rowspan="2">순 위</th>
                    <th rowspan="2">정수장 이름</th>
                    <th colspan="6">위 험 도</th>
                </tr>
                <tr id='danger_tr2'>
                	<th>총 점</th>
                	<th>가 동 률</th>
                	<th>급 수 인 구</th>
                	<th>준 공 년 도</th>
                	<th>취 수 장 수 질</th>
                	<th>정 수 장 수 질</th>
                </tr>
            `;
            
        var dang_g = [];
		var oper_g = [];
		var inta_g = [];
		var filt_g = [];
		
		for(let i=0;i<5;i++){
			dang_num = mapicon[i][1];
			oper_num = parseInt(mapicon[i][2]);
			popu_num = mapicon[i][3];
			const_num = mapicon[i][4];
			inta_num = mapicon[i][5];
			filt_num = mapicon[i][6];
			dang_g[i] = dang_num;
			oper_g[i] = oper_num*0.01;
			inta_g[i] = inta_num;
			filt_g[i] = filt_num;
			console.log(inta_g[i]);
			
			// 취수장 수질 위험도
			if(inta_num == 0){
				aorf1 = 'A'
				img_smile = './smile/11_img.png'
			}else if(inta_num == 10){
				aorf1 = 'F'
				img_smile = './smile/9_img.png'				
			}
			// 정수장 수질 위험도
			if(filt_num == 0){
				aorf2 = 'A'
				img_smile2 = './smile/11_img.png'
			}else if(filt_num == 10){
				aorf2 = 'F'
				img_smile2 = './smile/9_img.png'				
			}
			// 준공년도 위험도
			if(const_num == 0){
				img_smile3 = './smile/11_img.png'
			}else if(const_num == 1){
				img_smile3 = './smile/22_img.png'
			}else if(const_num <= 3){
				img_smile3 = './smile/3_img.png'
			}else if(const_num <= 5){
				img_smile3 = './smile/4_img.png'
			}else if(const_num <= 7){
				img_smile3 = './smile/5_img.png'
			}else if(const_num <= 9){
				img_smile3 = './smile/6_img.png'
			}else if(const_num <= 11){
				img_smile3 = './smile/7_img.png'
			}else if(const_num == 12){
				img_smile3 = './smile/8_img.png'
			}else if(const_num == 13){
				img_smile3 = './smile/9_img.png'
			}
			// 공급인구 위험도
			if(popu_num == 0){
				img_smile4 = 'X'
			}else if(popu_num == 1){
				img_smile4 = './smile/11_img.png'
			}else if(popu_num == 2){
				img_smile4 = './smile/22_img.png'
			}else if(popu_num == 3){
				img_smile4 = './smile/3_img.png'
			}else if(popu_num == 4){
				img_smile4 = './smile/4_img.png'
			}else if(popu_num == 5){
				img_smile4 = './smile/5_img.png'
			}else if(popu_num == 6){
				img_smile4 = './smile/6_img.png'
			}else if(popu_num == 7){
				img_smile4 = './smile/7_img.png'
			}else if(popu_num == 8){
				img_smile4 = './smile/8_img.png'
			}else if(popu_num == 9){
				img_smile4 = './smile/9_img.png'
			}
			
			inta_g[i] = inta_num;
			filt_g[i] = filt_num;
			console.log(inta_g[i]);
			
	        tableForm+=`
    	    <tr>
        	    <td>${i+1}</td>
             	<td><a href='DetailsCon?data=${mapicon[i][0]}'>${mapicon[i][0]}</a></td>
           		<td id='dang_td${i}'>
           			<a>${dang_num}점</a>
           			<a></a>
           		</td>
       			<td id='oper_td${i}'>
       				<a>${oper_num}점</a>
       			</td>
       			<td id='popu_td'>
       				<img src='${img_smile4}'>
       			</td>
       			<td id='const_td'>
       				<img src='${img_smile3}'>
       			</td>
       			<td id='inta_td'>
       				<img src='${img_smile}'>
       			</td>
       			<td id='filt_td'>
       				<img src='${img_smile2}'>
       			</td>
         	</tr>
         	`;        	
	    }
	    tableForm += `</table>`; 
	    
	    console.log(tableForm); 
	    
	    $('#dangerid').html(tableForm);
	   	
	    $('#dang_td0>a:nth-child(2)').css('height', 0);
 	    $('#dang_td0>a:nth-child(2)').animate({
 	    	height : dang_g[0]
 	    },1500);
		$('#dang_td1>a:nth-child(2)').css('height', 0);
 	    $('#dang_td1>a:nth-child(2)').animate({
 	    	height : dang_g[1]
 	    },1500);
  	    $('#dang_td2>a:nth-child(2)').css('height', 0);
 	    $('#dang_td2>a:nth-child(2)').animate({
 	    	height : dang_g[2]
 	    },1500);
  	    $('#dang_td3>a:nth-child(2)').css('height', 0);
 	    $('#dang_td3>a:nth-child(2)').animate({
 	    	height : dang_g[3]
 	    },1500);
 	    $('#dang_td4>a:nth-child(2)').css('height', 0);
 	    $('#dang_td4>a:nth-child(2)').animate({
 	    	height : dang_g[4]
 	    },1500);	    
	    
	    // 가동률 위험도 그래프
	    $('#oper_td0').circleProgress({
			startAngle: -Math.PI ,
			value: oper_g[0],
			size: 95,
			thickness:15,
			emptyFill: "rgba(0,0,0,0.1)",
			fill: {gradient: ["#2afc4d","#bafe5c","#FED32A", "#F72509"]},
			animationStartValue:0.0
		});

		$('#oper_td1').circleProgress({
			startAngle: -Math.PI ,
			value: oper_g[1],
			size: 95,
			thickness:15,
			emptyFill: "rgba(0,0,0,0.1)",
			fill: {gradient: ["#2afc4d","#bafe5c","#FED32A", "#F72509"]},
			animationStartValue:0.0
		});
		
		$('#oper_td2').circleProgress({
			startAngle: -Math.PI ,
			value: oper_g[2],
			size: 95,
			thickness:15,
			emptyFill: "rgba(0,0,0,0.1)",
			fill: {gradient: ["#2afc4d","#bafe5c","#FED32A", "#F72509"]},
			animationStartValue:0.0
		});
		
		$('#oper_td3').circleProgress({
			startAngle: -Math.PI ,
			value: oper_g[3],
			size: 95,
			thickness:15,
			emptyFill: "rgba(0,0,0,0.1)",
			fill: {gradient: ["#2afc4d","#bafe5c","#FED32A", "#F72509"]},
			animationStartValue:0.0
		});
		
		$('#oper_td4').circleProgress({
			startAngle: -Math.PI ,
			value: oper_g[4],
			size: 95,
			thickness:15,
			emptyFill: "rgba(0,0,0,0.1)",
			fill: {gradient: ["#2afc4d","#bafe5c","#FED32A", "#F72509"]},
			animationStartValue:0.0
		});
		// 가동률 위험도 그래프 끝
				
	})
	//전국 위험도 이벤트 끝
	
	
	
	//광주 위험도 이벤트 스크립트
	// 정수장 이름 리스트
	 var filt_name2 = [];
	 <%for (int i = 0; i < gwangList.size(); i++) {%>
	 filt_name2.push('<%=gwangList.get(i).getFilt_name() %>')
	 <%}%>

	 // 정수장 위험도 리스트
	 var danger2 = [];
	 <%for (int i = 0; i < gwangList.size(); i++) {%>
	 danger2.push('<%=gwangList.get(i).getDanger_no()%>')
	 <%}%>
	 
	  //가동률 위험도 리스트
 	  var oper_danger2 = [];
	 <%for (int i = 0; i < gwangDList.size(); i++) {%>
	 oper_danger2.push('<%=gwangDList.get(i).getOper_danger() %>')
	 <%}%> 
	 /* console.log('ㅜㅜ')
	 console.log(oper_danger2) */
	 
	//공급세대 위험도 리스트 const_danger
 	 var sup_danger2 = [];
	 <%for (int i = 0; i < gwangDList.size(); i++) {%>
	 sup_danger2.push('<%=gwangDList.get(i).getSup_danger() %>')
	 <%}%>
	 
	//준공년도 위험도 리스트 const_danger
 	 var const_danger2 = [];
	 <%for (int i = 0; i < gwangDList.size(); i++) {%>
	 const_danger2.push('<%=gwangDList.get(i).getConst_danger() %>')
	 <%}%>
	 console.log('ㅜㅜ')
	 console.log(const_danger2)
	 
	//취수장 수질 위험도 리스트 const_danger
 	 var inta_danger2 = [];
	 <%for (int i = 0; i < gwangDList.size(); i++) {%>
	 inta_danger2.push('<%=gwangDList.get(i).getInta_danger() %>')
	 <%}%>
	 console.log('ㅜㅜ')
	 console.log(inta_danger2)
	 
	//정수장 수질 위험도 리스트 const_danger
 	 var filt_danger2 = [];
	 <%for (int i = 0; i < gwangDList.size(); i++) {%>
	 filt_danger2.push('<%=gwangDList.get(i).getFilt_danger() %>')
	 <%}%>
	 console.log('ㅜㅜ')
	 console.log(filt_danger2) 

	 // 주소 이름 이차원배열
	 const mapicon2 = new Array(116);
	 for (var i = 0; i< 116; i++){
	 	mapicon2[i] = new Array(2);
	 }
	 //console.log(mapicon);

	 for(var i =0; i<116; i++){
	 	mapicon2[i][0] = filt_name2[i];
	 }
	 for(var i =0; i<116; i++){
	 	mapicon2[i][1] = danger2[i];
	 }
	 
	 console.log(mapicon2);
	 
	 for(var i =0; i<3; i++){
		 	mapicon2[i][2] = oper_danger2[i];
		 }
		  for(var i =0; i<3; i++){
		 	mapicon2[i][3] = sup_danger2[i];
		 }
		 for(var i =0; i<3; i++){
		 	mapicon2[i][4] = const_danger2[i];
		 }
		 for(var i =0; i<3; i++){
		 	mapicon2[i][5] = inta_danger2[i];
		 }
		 for(var i =0; i<3; i++){
		 	mapicon2[i][6] = filt_danger2[i];
		 }
	
	
	 $("#gwang").on('click',function(){
		console.log('ㅎㅇ');
		
		  let tableForm2 =  `
            <table id='danger'>
			  <tr id='danger_tr1'>
             	 <th rowspan="2">순 위</th>
              	<th rowspan="2">정수장 이름</th>
              	<th colspan="6">위 험 도</th>
          	</tr>
          	<tr id='danger_tr2'>
	          	<th>총 점</th>
          		<th>가 동 률</th>
          		<th>급 수 인 구</th>
          		<th>준 공 년 도</th>
          		<th>취 수 장 수 질</th>
          		<th>정 수 장 수 질</th>
          	</tr>
            `;

        var dang_g = [];
		var oper_g = [];
		var inta_g = [];
		var filt_g = [];
		
		for(let i=0;i<3;i++){
			dang_num = mapicon2[i][1];
			oper_num = parseInt(mapicon2[i][2]);
			popu_num = mapicon2[i][3];
			const_num = mapicon2[i][4];
			inta_num = mapicon2[i][5];
			filt_num = mapicon2[i][6];
			dang_g[i] = dang_num;
			oper_g[i] = oper_num*0.01;
			inta_g[i] = inta_num;
			filt_g[i] = filt_num;
			console.log(inta_g[i]);
			
			// 취수장 수질 위험도
			if(inta_num == 0){
				aorf1 = 'A'
				img_smile = './smile/11_img.png'
			}else if(inta_num == 10){
				aorf1 = 'F'
				img_smile = './smile/9_img.png'				
			}
			// 정수장 수질 위험도
			if(filt_num == 0){
				aorf2 = 'A'
				img_smile2 = './smile/11_img.png'
			}else if(filt_num == 10){
				aorf2 = 'F'
				img_smile2 = './smile/9_img.png'				
			}
			// 준공년도 위험도
			if(const_num == 0){
				img_smile3 = './smile/11_img.png'
			}else if(const_num == 1){
				img_smile3 = './smile/22_img.png'
			}else if(const_num <= 3){
				img_smile3 = './smile/3_img.png'
			}else if(const_num <= 5){
				img_smile3 = './smile/4_img.png'
			}else if(const_num <= 7){
				img_smile3 = './smile/5_img.png'
			}else if(const_num <= 9){
				img_smile3 = './smile/6_img.png'
			}else if(const_num <= 11){
				img_smile3 = './smile/7_img.png'
			}else if(const_num == 12){
				img_smile3 = './smile/8_img.png'
			}else if(const_num == 13){
				img_smile3 = './smile/9_img.png'
			}
			// 공급인구 위험도
			if(popu_num == 0){
				img_smile4 = 'X'
			}else if(popu_num == 1){
				img_smile4 = './smile/11_img.png'
			}else if(popu_num == 2){
				img_smile4 = './smile/22_img.png'
			}else if(popu_num == 3){
				img_smile4 = './smile/3_img.png'
			}else if(popu_num == 4){
				img_smile4 = './smile/4_img.png'
			}else if(popu_num == 5){
				img_smile4 = './smile/5_img.png'
			}else if(popu_num == 6){
				img_smile4 = './smile/6_img.png'
			}else if(popu_num == 7){
				img_smile4 = './smile/7_img.png'
			}else if(popu_num == 8){
				img_smile4 = './smile/8_img.png'
			}else if(popu_num == 9){
				img_smile4 = './smile/9_img.png'
			}
			
			
			tableForm2 +=`
			<tr>
	    	   	<td>${i+1}</td>
         		<td><a href='DetailsCon?data=${mapicon2[i][0]}'>${mapicon2[i][0]}</a></td>
       			<td id='dang_td${i}'>
	       			<a>${dang_num}점</a>
       				<a></a>
    			</td>
   				<td id='oper_td${i}'>
		   			<a>${oper_num}점</a>
   				</td>
   				<td id='popu_td'>
   					<img src='${img_smile4}'>
   				</td>
   				<td id='const_td'>
   					<img src='${img_smile3}'>
   				</td>
   				<td id='inta_td'>
   					<img src='${img_smile}'>
   				</td>
  				<td id='filt_td'>
   					<img src='${img_smile2}'>
   				</td>
     		</tr>
       		`;
    	}
    	tableForm2 += `</table>`; 
	    
	    console.log(tableForm2); 
	    
	    $('#dangerid').html(tableForm2);
			
    	$('#dang_td0>a:nth-child(2)').css('height', 0);
		$('#dang_td0>a:nth-child(2)').animate({
		   	height : dang_g[0]
		},1500);
		$('#dang_td1>a:nth-child(2)').css('height', 0);
	    $('#dang_td1>a:nth-child(2)').animate({
	    	height : dang_g[1]
	    },1500);
	    $('#dang_td2>a:nth-child(2)').css('height', 0);
	    $('#dang_td2>a:nth-child(2)').animate({
	    	height : dang_g[2]
	    },1500);
	 	// 가동률 위험도 그래프
	    $('#oper_td0').circleProgress({
			startAngle: -Math.PI ,
			value: oper_g[0],
			size: 95,
			thickness:15,
			emptyFill: "rgba(0,0,0,0.1)",
			fill: {gradient: ["#2afc4d","#bafe5c","#FED32A", "#F72509"]},
			animationStartValue:0.0
		});

		$('#oper_td1').circleProgress({
			startAngle: -Math.PI ,
			value: oper_g[1],
			size: 95,
			thickness:15,
			emptyFill: "rgba(0,0,0,0.1)",
			fill: {gradient: ["#2afc4d","#bafe5c","#FED32A", "#F72509"]},
			animationStartValue:0.0
		});
		
		$('#oper_td2').circleProgress({
			startAngle: -Math.PI ,
			value: oper_g[2],
			size: 95,
			thickness:15,
			emptyFill: "rgba(0,0,0,0.1)",
			fill: {gradient: ["#2afc4d","#bafe5c","#FED32A", "#F72509"]},
			animationStartValue:0.0
		});
		// 가동률 위험도 그래프 끝
	})
	//광주 위험도 이벤트 스크립트 끝
	
	
	
	//전북 위험도 이벤트 스크립트
	// 정수장 이름 리스트
	 var filt_name3 = [];
	 <%for (int i = 0; i < bookList.size(); i++) {%>
	 filt_name3.push('<%=bookList.get(i).getFilt_name() %>')
	 <%}%>
	 console.log("filt_name3")
	 console.log(filt_name3)

	 // 정수장 위험도 리스트
	 var danger3 = [];
	 <%for (int i = 0; i < bookList.size(); i++) {%>
	 danger3.push('<%=bookList.get(i).getDanger_no()%>')
	 <%}%>
	 console.log("danger3")
	 console.log(danger3)
	 
	 // 가동률 위험도 리스트
	 var oper_danger3 = [];
	 <%for (int i = 0; i < bookDList.size(); i++) {%>
	 oper_danger3.push('<%=bookDList.get(i).getOper_danger() %>')
	 <%}%>
	 
 	 //공급세대 위험도 리스트 const_danger
 	 var sup_danger3 = [];
	 <%for (int i = 0; i < bookDList.size(); i++) {%>
	 sup_danger3.push('<%=bookDList.get(i).getSup_danger() %>')
	 <%}%>
	 
	//준공년도 위험도 리스트 const_danger
 	 var const_danger3 = [];
	 <%for (int i = 0; i < bookDList.size(); i++) {%>
	 const_danger3.push('<%=bookDList.get(i).getConst_danger() %>')
	 <%}%>
	 
	//취수장 수질 위험도 리스트 const_danger
 	 var inta_danger3 = [];
	 <%for (int i = 0; i < bookDList.size(); i++) {%>
	 inta_danger3.push('<%=bookDList.get(i).getInta_danger() %>')
	 <%}%>
	 
	//정수장 수질 위험도 리스트 const_danger
 	 var filt_danger3 = [];
	 <%for (int i = 0; i < bookDList.size(); i++) {%>
	 filt_danger3.push('<%=bookDList.get(i).getFilt_danger() %>')
	 <%}%>

	 // 주소 이름 이차원배열
	 const mapicon3 = new Array(danger3.length);
	 for (var i = 0; i< danger3.length; i++){
	 	mapicon3[i] = new Array(2);
	 }
	 //console.log(mapicon);

	 for(var i =0; i<danger3.length; i++){
	 	mapicon3[i][0] = filt_name3[i];
	 }
	 for(var i =0; i<danger3.length; i++){
	 	mapicon3[i][1] = danger3[i];
	 }
	 for(var i =0; i<danger3.length; i++){
		 	mapicon3[i][2] = oper_danger3[i];
		 }
	 for(var i =0; i<danger3.length; i++){
		 	mapicon3[i][3] = sup_danger3[i];
		 }
	 for(var i =0; i<danger3.length; i++){
		 	mapicon3[i][4] = const_danger3[i];
		 }
	 for(var i =0; i<danger3.length; i++){
		 	mapicon3[i][5] = inta_danger3[i];
		 }
	 for(var i =0; i<danger3.length; i++){
		 	mapicon3[i][6] = filt_danger3[i];
		 }
	 console.log("mapicon3")
	 console.log(mapicon3);
	
	
	 $("#junbook").on('click',function(){
		console.log('ㅎㅇ');
		
		let tableForm3 =  `
		<table id='danger'>
           	<tr id='danger_tr1'>
        	    <th rowspan="2">순 위</th>
                <th rowspan="2">정수장 이름</th>
                <th colspan="6">위 험 도</th>
            </tr>
            <tr id='danger_tr2'>
              	<th>총 점</th>
              	<th>가 동 률</th>
              	<th>급 수 인 구</th>
              	<th>준 공 년 도</th>
              	<th>취 수 장 수 질</th>
              	<th>정 수 장 수 질</th>
            </tr>
        `;

        var dang_g = [];
		var oper_g = [];
		var inta_g = [];
		var filt_g = [];
        
		for(let i=0;i<5;i++){
			dang_num = mapicon3[i][1];
			oper_num = parseInt(mapicon3[i][2]);
			popu_num = mapicon3[i][3];
			const_num = mapicon3[i][4];
			inta_num = mapicon3[i][5];
			filt_num = mapicon3[i][6];
			dang_g[i] = dang_num;
			oper_g[i] = oper_num*0.01;
			inta_g[i] = inta_num;
			filt_g[i] = filt_num;
			console.log(inta_g[i]);			

			// 취수장 수질 위험도
			if(inta_num == 0){
				aorf1 = 'A'
				img_smile = './smile/11_img.png'
			}else if(inta_num == 10){
				aorf1 = 'F'
				img_smile = './smile/9_img.png'				
			}
			// 정수장 수질 위험도
			if(filt_num == 0){
				aorf2 = 'A'
				img_smile2 = './smile/11_img.png'
			}else if(filt_num == 10){
				aorf2 = 'F'
				img_smile2 = './smile/9_img.png'				
			}
			// 준공년도 위험도
			if(const_num == 0){
				img_smile3 = './smile/11_img.png'
			}else if(const_num == 1){
				img_smile3 = './smile/22_img.png'
			}else if(const_num <= 3){
				img_smile3 = './smile/3_img.png'
			}else if(const_num <= 5){
				img_smile3 = './smile/4_img.png'
			}else if(const_num <= 7){
				img_smile3 = './smile/5_img.png'
			}else if(const_num <= 9){
				img_smile3 = './smile/6_img.png'
			}else if(const_num <= 11){
				img_smile3 = './smile/7_img.png'
			}else if(const_num == 12){
				img_smile3 = './smile/8_img.png'
			}else if(const_num == 13){
				img_smile3 = './smile/9_img.png'
			}
			// 공급인구 위험도
			if(popu_num == 0){
				img_smile4 = 'X'
			}else if(popu_num == 1){
				img_smile4 = './smile/11_img.png'
			}else if(popu_num == 2){
				img_smile4 = './smile/22_img.png'
			}else if(popu_num == 3){
				img_smile4 = './smile/3_img.png'
			}else if(popu_num == 4){
				img_smile4 = './smile/4_img.png'
			}else if(popu_num == 5){
				img_smile4 = './smile/5_img.png'
			}else if(popu_num == 6){
				img_smile4 = './smile/6_img.png'
			}else if(popu_num == 7){
				img_smile4 = './smile/7_img.png'
			}else if(popu_num == 8){
				img_smile4 = './smile/8_img.png'
			}else if(popu_num == 9){
				img_smile4 = './smile/9_img.png'
			}
			
			tableForm3 +=`
			<tr>
        		<td>${i+1}</td>
             	<td><a href='DetailsCon?data=${mapicon3[i][0]}'>${mapicon3[i][0]}</a></td>
           		<td id='dang_td${i}'>
           			<a>${dang_num}점</a>
           			<a></a>
           		</td>
       			<td id='oper_td${i}'>
       				<a>${oper_num}점</a>
       			</td>
       			<td id='popu_td'>
       				<img src='${img_smile4}'>
       			</td>
       			<td id='const_td'>
       				<img src='${img_smile3}'>
       			</td>
       			<td id='inta_td'>
       				<img src='${img_smile}'>
       			</td>
       			<td id='filt_td'>
       				<img src='${img_smile2}'>
       			</td>
         	</tr>
        	`;
	
    	}
    	tableForm3 += `</table>`; 
    
    	console.log(tableForm3); 
    
    	$('#dangerid').html(tableForm3);
		
	    $('#dang_td0>a:nth-child(2)').css('height', 0);
 	    $('#dang_td0>a:nth-child(2)').animate({
 	    	height : dang_g[0]
 	    },1500);
		$('#dang_td1>a:nth-child(2)').css('height', 0);
 	    $('#dang_td1>a:nth-child(2)').animate({
 	    	height : dang_g[1]
 	    },1500);
  	    $('#dang_td2>a:nth-child(2)').css('height', 0);
 	    $('#dang_td2>a:nth-child(2)').animate({
 	    	height : dang_g[2]
 	    },1500);
  	    $('#dang_td3>a:nth-child(2)').css('height', 0);
 	    $('#dang_td3>a:nth-child(2)').animate({
 	    	height : dang_g[3]
 	    },1500);
 	    $('#dang_td4>a:nth-child(2)').css('height', 0);
 	    $('#dang_td4>a:nth-child(2)').animate({
 	    	height : dang_g[4]
 	    },1500);	    
	    
	    // 가동률 위험도 그래프
	    $('#oper_td0').circleProgress({
			startAngle: -Math.PI ,
			value: oper_g[0],
			size: 95,
			thickness:15,
			emptyFill: "rgba(0,0,0,0.1)",
			fill: {gradient: ["#2afc4d","#bafe5c","#FED32A", "#F72509"]},
			animationStartValue:0.0
		});

		$('#oper_td1').circleProgress({
			startAngle: -Math.PI ,
			value: oper_g[1],
			size: 95,
			thickness:15,
			emptyFill: "rgba(0,0,0,0.1)",
			fill: {gradient: ["#2afc4d","#bafe5c","#FED32A", "#F72509"]},
			animationStartValue:0.0
		});
		
		$('#oper_td2').circleProgress({
			startAngle: -Math.PI ,
			value: oper_g[2],
			size: 95,
			thickness:15,
			emptyFill: "rgba(0,0,0,0.1)",
			fill: {gradient: ["#2afc4d","#bafe5c","#FED32A", "#F72509"]},
			animationStartValue:0.0
		});
		
		$('#oper_td3').circleProgress({
			startAngle: -Math.PI ,
			value: oper_g[3],
			size: 95,
			thickness:15,
			emptyFill: "rgba(0,0,0,0.1)",
			fill: {gradient: ["#2afc4d","#bafe5c","#FED32A", "#F72509"]},
			animationStartValue:0.0
		});
		
		$('#oper_td4').circleProgress({
			startAngle: -Math.PI ,
			value: oper_g[4],
			size: 95,
			thickness:15,
			emptyFill: "rgba(0,0,0,0.1)",
			fill: {gradient: ["#2afc4d","#bafe5c","#FED32A", "#F72509"]},
			animationStartValue:0.0
		});
		// 가동률 위험도 그래프 끝
						
	})
	//전북 위험도 이벤트 스크립트 끝
	
	
	
	// 전남 위험도 이벤트 스크립트 시작
		// 정수장 이름 리스트
	 var filt_name4 = [];
	 <%for (int i = 0; i < namList.size(); i++) {%>
	 filt_name4.push('<%=namList.get(i).getFilt_name() %>')
	 <%}%>
	
	 console.log(filt_name4)


	 // 정수장 위험도 리스트
	 var danger4 = [];
	 <%for (int i = 0; i < namList.size(); i++) {%>
	 danger4.push('<%=namList.get(i).getDanger_no()%>')
	 <%}%>
	 
	 // 가동률 위험도 리스트
	 var oper_danger4 = [];
	 <%for (int i = 0; i < namDList.size(); i++) {%>
	 oper_danger4.push('<%=namDList.get(i).getOper_danger() %>')
	 <%}%>
	 
 	 //공급세대 위험도 리스트 const_danger
 	 var sup_danger4 = [];
	 <%for (int i = 0; i < namDList.size(); i++) {%>
	 sup_danger4.push('<%=namDList.get(i).getSup_danger() %>')
	 <%}%>
	 
	//준공년도 위험도 리스트 const_danger
 	 var const_danger4 = [];
	 <%for (int i = 0; i < namDList.size(); i++) {%>
	 const_danger4.push('<%=namDList.get(i).getConst_danger() %>')
	 <%}%>
	 
	//취수장 수질 위험도 리스트 const_danger
 	 var inta_danger4 = [];
	 <%for (int i = 0; i < namDList.size(); i++) {%>
	 inta_danger4.push('<%=namDList.get(i).getInta_danger() %>')
	 <%}%>
	 
	//정수장 수질 위험도 리스트 const_danger
 	 var filt_danger4 = [];
	 <%for (int i = 0; i < namDList.size(); i++) {%>
	 filt_danger4.push('<%=namDList.get(i).getFilt_danger() %>')
	 <%}%> 

	 // 주소 이름 이차원배열
	 const mapicon4 = new Array(danger4.length);
	 for (var i = 0; i< danger4.length; i++){
	 	mapicon4[i] = new Array(2);
	 }
	 //console.log(mapicon);

	 for(var i =0; i<danger4.length; i++){
	 	mapicon4[i][0] = filt_name4[i];
	 }
	 for(var i =0; i<danger4.length; i++){
	 	mapicon4[i][1] = danger4[i];
	 }
	 
	 console.log(mapicon4);
	 
	 for(var i =0; i<danger4.length; i++){
		 	mapicon4[i][0] = filt_name4[i];
		 }
		 for(var i =0; i<danger4.length; i++){
		 	mapicon4[i][1] = danger4[i];
		 }
		 for(var i =0; i<danger4.length; i++){
			 	mapicon4[i][2] = oper_danger4[i];
			 }
		 for(var i =0; i<danger4.length; i++){
			 	mapicon4[i][3] = sup_danger4[i];
			 }
		 for(var i =0; i<danger4.length; i++){
			 	mapicon4[i][4] = const_danger4[i];
			 }
			 
		 for(var i =0; i<danger4.length; i++){
			 	mapicon4[i][5] = inta_danger4[i];
			 }
			 
		 for(var i =0; i<danger4.length; i++){
			 	mapicon4[i][6] = filt_danger4[i];
			 }

		 
	$("#junnam").on('click',function(){
		console.log('ㅎㅇ');
		let tableForm4 =  `
        <table id='danger'>
			<tr id='danger_tr1'>
        		<th rowspan="2">순 위</th>
              	<th rowspan="2">정수장 이름</th>
               	<th colspan="6">위 험 도</th>
           	</tr>
           	<tr id='danger_tr2'>
	           	<th>총 점</th>
           		<th>가 동 률</th>
           		<th>급 수 인 구</th>
           		<th>준 공 년 도</th>
           		<th>취 수 장 수 질</th>
           		<th>정 수 장 수 질</th>
           	</tr>
		`;

		var dang_g = [];
		var oper_g = [];
		var inta_g = [];
		var filt_g = []; 
		    
		for(let i=0;i<5;i++){
			dang_num = mapicon4[i][1];
			oper_num = parseInt(mapicon4[i][2]);
			popu_num = mapicon4[i][3];
			const_num = mapicon4[i][4];
			inta_num = mapicon4[i][5];
			filt_num = mapicon4[i][6];
			dang_g[i] = dang_num;
			oper_g[i] = oper_num*0.01;
			inta_g[i] = inta_num;
			filt_g[i] = filt_num;
			console.log(inta_g[i]);
			
			// 취수장 수질 위험도
			if(inta_num == 0){
				aorf1 = 'A'
				img_smile = './smile/11_img.png'
			}else if(inta_num == 10){
				aorf1 = 'F'
				img_smile = './smile/9_img.png'				
			}
			// 정수장 수질 위험도
			if(filt_num == 0){
				aorf2 = 'A'
				img_smile2 = './smile/11_img.png'
			}else if(filt_num == 10){
				aorf2 = 'F'
				img_smile2 = './smile/9_img.png'				
			}
			// 준공년도 위험도
			if(const_num == 0){
				img_smile3 = './smile/11_img.png'
			}else if(const_num == 1){
				img_smile3 = './smile/22_img.png'
			}else if(const_num <= 3){
				img_smile3 = './smile/3_img.png'
			}else if(const_num <= 5){
				img_smile3 = './smile/4_img.png'
			}else if(const_num <= 7){
				img_smile3 = './smile/5_img.png'
			}else if(const_num <= 9){
				img_smile3 = './smile/6_img.png'
			}else if(const_num <= 11){
				img_smile3 = './smile/7_img.png'
			}else if(const_num == 12){
				img_smile3 = './smile/8_img.png'
			}else if(const_num == 13){
				img_smile3 = './smile/9_img.png'
			}
			// 공급인구 위험도
			if(popu_num == 0){
				img_smile4 = 'X'
			}else if(popu_num == 1){
				img_smile4 = './smile/11_img.png'
			}else if(popu_num == 2){
				img_smile4 = './smile/22_img.png'
			}else if(popu_num == 3){
				img_smile4 = './smile/3_img.png'
			}else if(popu_num == 4){
				img_smile4 = './smile/4_img.png'
			}else if(popu_num == 5){
				img_smile4 = './smile/5_img.png'
			}else if(popu_num == 6){
				img_smile4 = './smile/6_img.png'
			}else if(popu_num == 7){
				img_smile4 = './smile/7_img.png'
			}else if(popu_num == 8){
				img_smile4 = './smile/8_img.png'
			}else if(popu_num == 9){
				img_smile4 = './smile/9_img.png'
			}
			
			tableForm4 +=`
			<tr>
        		<td>${i+1}</td>
             	<td><a href='DetailsCon?data=${mapicon4[i][0]}'>${mapicon4[i][0]}</a></td>
           		<td id='dang_td${i}'>
           			<a>${dang_num}점</a>
           			<a></a>
           		</td>
       			<td id='oper_td${i}'>
       				<a>${oper_num}점</a>
       			</td>
       			<td id='popu_td'>
       				<img src='${img_smile4}'>
       			</td>
       			<td id='const_td'>
       				<img src='${img_smile3}'>
       			</td>
       			<td id='inta_td'>
       				<img src='${img_smile}'>
       			</td>
       			<td id='filt_td'>
       				<img src='${img_smile2}'>
       			</td>
         	</tr>
        	`;
		}
    	tableForm4 += `</table>`; 
    
    	console.log(tableForm4); 
    
		$('#dangerid').html(tableForm4);
		
	    $('#dang_td0>a:nth-child(2)').css('height', 0);
 	    $('#dang_td0>a:nth-child(2)').animate({
 	    	height : dang_g[0]
 	    },1500);
		$('#dang_td1>a:nth-child(2)').css('height', 0);
 	    $('#dang_td1>a:nth-child(2)').animate({
 	    	height : dang_g[1]
 	    },1500);
  	    $('#dang_td2>a:nth-child(2)').css('height', 0);
 	    $('#dang_td2>a:nth-child(2)').animate({
 	    	height : dang_g[2]
 	    },1500);
  	    $('#dang_td3>a:nth-child(2)').css('height', 0);
 	    $('#dang_td3>a:nth-child(2)').animate({
 	    	height : dang_g[3]
 	    },1500);
 	    $('#dang_td4>a:nth-child(2)').css('height', 0);
 	    $('#dang_td4>a:nth-child(2)').animate({
 	    	height : dang_g[4]
 	    },1500);	    
	    
	    // 가동률 위험도 그래프
	    $('#oper_td0').circleProgress({
			startAngle: -Math.PI ,
			value: oper_g[0],
			size: 95,
			thickness:15,
			emptyFill: "rgba(0,0,0,0.1)",
			fill: {gradient: ["#2afc4d","#bafe5c","#FED32A", "#F72509"]},
			animationStartValue:0.0
		});

		$('#oper_td1').circleProgress({
			startAngle: -Math.PI ,
			value: oper_g[1],
			size: 95,
			thickness:15,
			emptyFill: "rgba(0,0,0,0.1)",
			fill: {gradient: ["#2afc4d","#bafe5c","#FED32A", "#F72509"]},
			animationStartValue:0.0
		});
		
		$('#oper_td2').circleProgress({
			startAngle: -Math.PI ,
			value: oper_g[2],
			size: 95,
			thickness:15,
			emptyFill: "rgba(0,0,0,0.1)",
			fill: {gradient: ["#2afc4d","#bafe5c","#FED32A", "#F72509"]},
			animationStartValue:0.0
		});
		
		$('#oper_td3').circleProgress({
			startAngle: -Math.PI ,
			value: oper_g[3],
			size: 95,
			thickness:15,
			emptyFill: "rgba(0,0,0,0.1)",
			fill: {gradient: ["#2afc4d","#bafe5c","#FED32A", "#F72509"]},
			animationStartValue:0.0
		});
		
		$('#oper_td4').circleProgress({
			startAngle: -Math.PI ,
			value: oper_g[4],
			size: 95,
			thickness:15,
			emptyFill: "rgba(0,0,0,0.1)",
			fill: {gradient: ["#2afc4d","#bafe5c","#FED32A", "#F72509"]},
			animationStartValue:0.0
		});
		// 가동률 위험도 그래프 끝
		
	})
	</script>

	<div class="box">
		<div id="dangerid"></div>
	</div>
	<script>$("#jungook").trigger("click");</script>



</body>
</html>