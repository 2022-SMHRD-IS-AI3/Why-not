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
		<table>
		<tr><td><button  onclick="getJungook()">전국</buttom></td></tr><br>
		<tr><td><button  onclick="getGwang()">광주광역시</buttom></td></tr><br>
		<tr><td><button  onclick="getBook()">전라북도</buttom></td></tr><br>
		<tr><td><button  onclick="getNam()">전라남도</buttom></td></tr>
		<!--버튼에 클릭 이벤트 넣을 것-->
		</table>
	</div>
	<div class="box" style="width:70%;height:350px;background-color:lightblue;position:fixed;left:200px">
		<div id="danger"><p>버튼 클릭시 ajax로 처리할 공간</p>
		<p>위험도 상위 top10</p>
		<table border=1 align='center'>
		<th class=''>
		<td class='rank'>순위</td>
		<td class='filt_name'>정수장 이름</td>
		<td class='danger'>위험도 항목</td>
		</th>
		
		</table>
		
		
		</div>
	</div>
	
	<script>
					 let dataList=[];
		 MapDAO dao = new MapDAO();
	
	const getJungook = ()=>{
		 
		 }
	const getGwang = ()=>{		
				 					 
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
	
	}
	
	
	
	
	
	const getBook = ()=>{
		 
		 
List<Filtration_infoDTO> dataList = dao.selectJunbook();
			 
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
	}
	
	
	
	
	
	const getNam = ()=>{
		 
		 
List<Filtration_infoDTO> dataList = dao.selectJunnam();
			 
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
     
		 }
	
	
	
	
	}
	</script>
</body>
</html>