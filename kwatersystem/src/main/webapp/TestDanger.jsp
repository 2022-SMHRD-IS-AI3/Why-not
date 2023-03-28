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
}

#danger th{
	height:50px;
}
#danger th:nth-child(1){
	font-size:20px;
	width:70px;
}
#danger th:nth-child(2){
	font-size:20px;
	width:300px;
}
#danger th:nth-child(3){
	font-size:20px;
	width:1000px;
}

#danger td{
	height:100px;
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
	<div class="head">위험도 순위</div>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script>
		
	</script>
	<table class="button_box">
		<tr>
			<td><button  onclick="getJungook()">전국</button></td>
		</tr>
		<tr>
			<td><button  onclick="getGwang()">광주광역시</button></td>
		</tr>
		<tr>
			<td><button  onclick="getBook()">전라북도</button></td>
		</tr>
		<tr>
			<td><button  onclick="getNam()">전라남도</button></td>
		</tr>
		<!--버튼에 클릭 이벤트 넣을 것-->
	</table>
	<div class="box">
		<div id="danger">
			<table border=1 align='center'>
				<tr>
					<th class='rank'>순위</td>
					<th class='filt_name'>정수장 이름</td>
					<th class='danger'>위험도 항목</td>
				</tr>
				<tr>
					<td></td>
					<td></td>					
					<td></td>					
				</tr>
				<tr>
					<td></td>
					<td></td>					
					<td></td>					
				</tr>
				<tr>
					<td></td>
					<td></td>					
					<td></td>					
				</tr>
				<tr>
					<td></td>
					<td></td>					
					<td></td>					
				</tr>
				<tr>
					<td></td>
					<td></td>					
					<td></td>					
				</tr>
			</table>		
		</div>
	</div>
	<script>
	const getJungook = ()=>{
		 $.ajax({
			 url:'dangerList.jsp',,type : 'get',success :
			 
		 }
	const getGwang = ()=>{
		 $.ajax({
			 url:'dangerList.jsp',type : 'post',success :
				 					 
					 let dataList=[];
		 MapDAO dao = new MapDAO();
		 List<Filtration_infoDTO> dataList = dao.selectGwangju();
						 
					 let tableForm = `
			                <table>
			                    <tr>
			                        <th>순위</th>
			                        <th>정수장 이름</th>
			                        <th>위험도</th>
			                    </tr>
			                `;

			                for(let i=0;i<10;i++){
			                tableForm+=`
			                <tr>
			                    <td>${i+1}</td>
			                    <td>${dataList[i].filt_Name}</td>
			                    <td>${dataList[i].danger_No}</td>
			                 </tr>
			                `;

			            }
			            tableForm+=`</table>`;
			            $('#danger').html(tableForm);
			            error:function(){
			                //alert('통신실패')

			            }
		            });
				 }
		 
	}
	}
	const getBook = ()=>{
		 $.ajax({
			 url:'dangerList.jsp',,type : 'get',success :
			 
		 }
	}
	const getNam = ()=>{
		 $.ajax({
			 url:'',,type : 'get',success :
			 
		 }
	}
	</script>
</body>
</html>