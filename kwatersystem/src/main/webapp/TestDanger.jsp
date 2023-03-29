
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
<title>Insert title here</title>
<style>
li{list-style:none}
.menu {
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
.head{
	position:fixed;
	top:90px;
	left:145px;
	font-size:40px;
	font-weight:550;
}



.box{
	width:1350px;
	height:620px;
	position:fixed;
	top:180px;
	left:410px;
}
#danger{
	text-align:center;
	background-color:black;
}

#danger th{
	height:60px;
	background-color:#5778ff;
}
#danger th:nth-child(1){
	font-size:30px;
	width:130px;
}
#danger th:nth-child(2){
	font-size:30px;
	width:200px;5
}
#danger th:nth-child(3){
	font-size:30px;
	width:900px;
}

#danger td{
	height:80px;
	background-color:white;
	font-size:30px;
}
.bbb{
position:fixed; top:210px; left:150px;
}
.button_box .button {
border-radius: 5px;
  background-color: #00BFFF;
  border: 1px solid green;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  font-size: 16px;
  cursor: pointer;
  width: 150px;
  display: block;
}

.button_box .button:not(:last-child) {
  border-bottom: none; /* Prevent double borders */
}

.button_box .button:hover {
  background-color: #008CBA;
}


</style>
</head>
<body>	
	<ul class="menu">
      <li>
        <a href="TestMain.jsp">홈</a>
      </li>
      <li>
        <a href="TestMap.jsp">지도</a>
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
	<div class="head">위험도 순위</div>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script>
		
	</script>
	<div class="bbb">
	<table class="button_box">
	
		<tr>
			<td><button id="jungook" class="button">전국</button></td>
		</tr>
		<tr>
			<td><button id="gwang" class="button">광주광역시</button></td>
		</tr>
		<tr>
			<td><button id="junbook" class="button">전라북도</button></td>
		</tr>
		<tr>
			<td><button id="junnam" class="button">전라남도</button></td>
		</tr>
		</table>
		<!--버튼에 클릭 이벤트 넣을 것-->

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
	 
	 
	 
	 
	 
	 
/* 	 var filt_name = mapicon[1][0];
	 console.log(filt_name); */
	 console.log(mapicon);
		<%-- <% 
		 Danger_infoDAO ddao= new Danger_infoDAO();
		 Danger_infoDTO dto = new Danger_infoDTO(%>${filt_name}<%);
		 List<Danger_infoDTO> operList = ddao.selectOper(dto);
		%> --%>
	
	 $("#jungook").on('click',function(){
		console.log('ㅎㅇ');	
		
		  let tableForm =  `
            <table id='danger'>
                <tr>
                    <th>순위</th>
                    <th>정수장 이름</th>
                    <th>위험도</th>
                </tr>
            `;

		for(let i=0;i<5;i++){
        tableForm+=`
        <tr>
            <td>${i+1}</td>
             <td><a href='DetailsCon?data="${mapicon[i][0]}"'>${mapicon[i][0]}</a></td>
            <td>위험도 총점: ${mapicon[i][1]} 가동률위험도 :${mapicon[i][2]} 피해세대수${mapicon[i][3]} 준공년도 위험도 : ${mapicon[i][4]} 취수장 수질위험도 : ${mapicon[i][5]} 정수장 수질 위험도 : ${mapicon[i][6]}</td> 
         </tr>
        `;
	
    }
    tableForm += `</table>`; 
    
    console.log(tableForm); 
    
    $('#dangerid').html(tableForm);
		
		
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
                <tr>
                    <th>순위</th>
                    <th>정수장 이름</th>
                    <th>위험도</th>
                </tr>
            `;

		for(let i=0;i<3;i++){
        tableForm2 +=`
        	<tr>
            <td>${i+1}</td>
             <td><a href='DetailsCon?data="${mapicon2[i][0]}"'>${mapicon2[i][0]}</a></td>
             <td>위험도 총점: ${mapicon2[i][1]} 가동률위험도 :${mapicon2[i][2]} 피해세대수${mapicon2[i][3]} 준공년도 위험도 : ${mapicon2[i][4]} 취수장 수질위험도 : ${mapicon2[i][5]} 정수장 수질 위험도 : ${mapicon2[i][6]}</td> 
         </tr>
        `;
	
    }
    tableForm2 += `</table>`; 
    
    console.log(tableForm2); 
    
    $('#dangerid').html(tableForm2);
		
		
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
                <tr>
                    <th>순위</th>
                    <th>정수장 이름</th>
                    <th>위험도</th>
                </tr>
            `;

		for(let i=0;i<5;i++){
        tableForm3 +=`
        <tr>
            <td>${i+1}</td>
            
            <td><a href='DetailsCon?data="${mapicon3[i][0]}"'>${mapicon3[i][0]}</td> 
            <td>위험도 총점: ${mapicon3[i][1]} 가동률위험도 :${mapicon3[i][2]} 피해세대수${mapicon3[i][3]} 준공년도 위험도 : ${mapicon3[i][4]} 취수장 수질위험도 : ${mapicon3[i][5]} 정수장 수질 위험도 : ${mapicon3[i][6]}</td> 

         </tr>
        `;
	
    }
    tableForm3 += `</table>`; 
    
    console.log(tableForm3); 
    
    $('#dangerid').html(tableForm3);
		
		
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
                <tr>
                    <th>순위</th>
                    <th>정수장 이름</th>
                    <th>위험도</th>
                </tr>
            `;

		for(let i=0;i<5;i++){
        tableForm4 +=`
        <tr>
            <td>${i+1}</td>
             <td><a href='DetailsCon?data="${mapicon4[i][0]}"'>${mapicon4[i][0]}</a></td>
             <td>위험도 총점: ${mapicon4[i][1]} 가동률위험도 :${mapicon4[i][2]} 피해세대수${mapicon4[i][3]} 준공년도 위험도 : ${mapicon4[i][4]} 취수장 수질위험도 : ${mapicon4[i][5]} 정수장 수질 위험도 : ${mapicon4[i][6]}</td> 

         </tr>
        `;
	
    }
    tableForm4 += `</table>`; 
    
    console.log(tableForm4); 
    
    $('#dangerid').html(tableForm4);
		
		
	})
	</script>

	<div class="box">
		<div id="dangerid">
				
	</div>
	</div>
	<script>$("#jungook").trigger("click");</script>
	
</body>
</html>