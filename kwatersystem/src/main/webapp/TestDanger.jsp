
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

.button_box{
	width:200px;
	position:fixed;
	top:210px;
	left:150px;
	text-align:center;
}
.button_box td>button{
	width:180px;
	height:40px;
	font-size:20px;
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
	<table class="button_box">
		<tr>
			<td><button id='start' class="jungook">전국</button></td>
		</tr>
		<tr>
			<td><button  class="gwang">광주광역시</button></td>
		</tr>
		<tr>
			<td><button  class="junbook">전라북도</button></td>
		</tr>
		<tr>
			<td><button  class="junnam">전라남도</button></td>
		</tr>
		<!--버튼에 클릭 이벤트 넣을 것-->

	</div>
	
	<script>
	
	console.log("test")
	 <%MapDAO dao = new MapDAO();
	 List<Filtration_infoDTO> dataList = dao.selectJungook();
	 List<Filtration_infoDTO> gwangList = dao.selectGwangju();
	 List<Filtration_infoDTO> bookList = dao.selectJunbook();
	 List<Filtration_infoDTO> namList = dao.selectJunnam();
	 
	 %>
	 
	 
	 
	 
	 
	 //전국  위험도 이벤트 시작
	// 정수장 이름 리스트
	 var filt_name = [];
	 <%for (int i = 0; i < dataList.size(); i++) {%>
	 filt_name.push('<%=dataList.get(i).getFilt_name() %>')
	 <%}%>
	 
	 console.log(filt_name)


	 // 정수장 위험도 리스트
	 var danger = [];
	 <%for (int i = 0; i < dataList.size(); i++) {%>
	 danger.push('<%=dataList.get(i).getDanger_no()%>')
	 <%}%>
	 
	 console.log(danger)


	 // 주소 이름 이차원배열
	 const mapicon = new Array(danger.length);
	 for (var i = 0; i< danger.length; i++){
	 	mapicon[i] = new Array(2);
	 }
	 //console.log(mapicon);

	 for(var i =0; i<danger.length; i++){
	 	mapicon[i][0] = filt_name[i];
	 }
	 for(var i =0; i<danger.length; i++){
	 	mapicon[i][1] = danger[i];
	 }
	 
	 console.log(mapicon);
	
	
	 $(".jungook").on('click',function(){
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
             <td>${mapicon[i][0]}</td>
            <td>${mapicon[i][1]}</td> 
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
	 
	 console.log(filt_name2)


	 // 정수장 위험도 리스트
	 var danger2 = [];
	 <%for (int i = 0; i < gwangList.size(); i++) {%>
	 danger2.push('<%=gwangList.get(i).getDanger_no()%>')
	 <%}%>
	 
	 console.log(danger)


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
	
	
	 $(".gwang").on('click',function(){
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
             <td>${mapicon2[i][0]}</td>
            <td>${mapicon2[i][1]}</td> 
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
	 console.log("mapicon3")
	 console.log(mapicon3);
	
	
	 $(".junbook").on('click',function(){
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
             <td>${mapicon3[i][0]}</td>
            <td>${mapicon3[i][1]}</td> 
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
	 
	 console.log(danger4)


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
	
	
	 $(".junnam").on('click',function(){
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
             <td>${mapicon4[i][0]}</td>
            <td>${mapicon4[i][1]}</td> 
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
	<script>$("#start").trigger("click");</script>
	
</body>
</html>