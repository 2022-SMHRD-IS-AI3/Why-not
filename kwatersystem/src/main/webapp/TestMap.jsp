<%@page import="com.smhrd.model.Filtration_infoDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.MapDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
	line-height: 40px;
	background-color: #5778ff;
}

.menu a {
	color: #fff;
	text-decoration: none;
	font-size: 14px
}
.menu>li:hover{
    background-color:#002cdb; 
    
}
.menu a:hover{
    color : #fff;
    text-decoration: none;
    
}

.head {
	position: fixed;
	top: 90px;
	left: 145px;
	font-size: 40px;
	font-weight: 550;
}

.map1 {
	float: left;
}

#map {
	width: 1180px;
	height: 700px;;
}

#mapWrap {
	position: fixed;
	top: 183px;
	left: 120px;
	padding: 10px;
	overflow: hidden;
	box-shadow: 0px 0px 0px 1px black;
	border-radius: 5px;
}

#ccc {
	position: fixed;
	top: 315px;
	left: 1361px;
	border-radius: 5px;
	border: 1px solid black;
	width: 430px;
	height: 430px;
	font-size: 15px;
	text-align: center;
}

#ccc>tr {
	height: 25px;
}

#ccc td:nth-child(1) {
	width: 100px;
	height: 50px;
	font-size: 15px;
}

.bubutton {
	width: 430px;
	height: 40px;
	position: fixed;
	top: 255px;
	left: 1360px;
}

.bubutton button {
	height: 40px;
	width: 104px;
	border: 2px solid #008CBA;
	background-color: white;
	color: black;
	border-radius: 5px;
	font-size: 15px;
}

.bubutton button:hover {
	background-color: #008CBA;
	color: white;
	text-decoration: none;
}

.f_search {
	width: 430px;
	height: 55px;
	font-size: 20px;
	position: fixed;
	top: 182px;
	left: 1360px;
	border: 1px solid black;
	border-radius: 5px;
}

.f_search .sesearch {
	height: 45px;
	width: 80px;
	border: 2px solid #008CBA;
	background-color: white;
	color: black;
	border-radius: 5px;
	font-size: 15px;
	margin-left: 15px;
}

.f_search .sesearch:hover {
	background-color: #008CBA;
	color: white;
	text-decoration: none;
}

.f_search td:nth-child(1) {
	width: 100px;
	height: 25px;
	background-color: whitesmoke;
	text-align: center;
}

#search_fname {
	outline: 0 none;
	border: white;
	width: 70px;
	height: 30px;
	border-bottom: 1px solid black;
	font-size: 20px;
}

#ss {
	background-color: white;
	width: 200px;
	padding: 10px;
}

.f_search td>button {
	width: 45px;
	height: 45px;
	text-align: center;
}

.f_search button>img {
	position: absolute;
	top: 4px;
	left: 353px;;
	width: 43px;
	height: 43px;
}

.button_button2 {
	position: fixed;
	top: 840px;
	left: 1640px;
	border-radius: 5px;
	border: none;
	padding: 16px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 20px;
	-webkit-transition-duration: 0.4s; /* Safari */
	transition-duration: 0.4s;
	cursor: pointer;
	background-color: white;
	color: black;
	border: 2px solid #008CBA;
}

.button_button2:hover {
	background-color: #008CBA;
	color: white;
	text-decoration: none;
}

.button_button2 a {
	text-decoration-line: none;
	color:black;
}

#simplecontext {
	width: 400px;
	height: 500px;
	position: fixed;
	top: 300px;
	left: 1360px;
	background-color: white;
}
</style>
</head>
<body>
	<!-- 제이쿼리 불러옴 -->
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

	<!-- 상단메뉴바 -->
	<ul class="menu">
		<li><a href="TestMain.jsp">홈</a></li>
		<li><a href="TestMap.jsp">정수장 현황</a></li>
		<li><a href="TestDanger.jsp">위험도 순위</a></li>
	</ul>
	
	<!-- 정수장 현황 -->
	<div class="head">정수장 현황</div>

	<!-- 검색 div -->
	<table class="f_search">
		<tr>
			<td id="ss"><input type="text" id="search_fname"> 정수장</td>
			<td><button class="sesearch" onclick="search()">검색</button></td>
		</tr>
	</table>
	
	<!-- 지역구분 버튼  -->
	<table class="bubutton">
		<td><button class="map10" onclick="honam()">전체</button></td>
		<td><button class="map11" onclick="gwangju()">광주광역시</button></td>
		<td><button class="map12" onclick="jeonnam()">전라남도</button></td>
		<td><button class="map13" onclick="jeonbuk()">전라북도</button></td>
	</table>
	
	<!-- 상세보기 버튼 -->
	<button class="button_button2">
		<a href="#" onclick="test123()">상세보기</a>
	</button>

	<!-- 지도 div -->
	<div id="mapWrap">
		<div id="map" class="map1"></div>
		<div id="simplecontext" class="map1"></div>
	</div>


	<!-- 카카오 지도 불러오는 스크립트 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=82a09d330020169ca7770768877a9db3&libraries=services"></script>
	
	<!-- 기능 스크립트 -->
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
			    center: new kakao.maps.LatLng(35.450701, 126.570667), // 지도의 중심좌표
			    level: 11 // 지도의 확대 레벨
			};  

		// 지도를 생성합니다  
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		
		<%MapDAO dao = new MapDAO();
		List<Filtration_infoDTO> list = dao.selectAll();%>

		// 정수장 주소 리스트
		var listAddress = [];
		<%for (int i = 0; i < list.size(); i++) {%>
			listAddress.push('<%=list.get(i).getAddr()%>')
		<%}%>
		console.log(listAddress)

		// 정수장 이름 리스트
		var listName = [];
		<%for (int i = 0; i < list.size(); i++) {%>
			listName.push('<%=list.get(i).getFilt_name()%>')
		<%}%>
		console.log(listName)
		
		// 지역 리스트
		var listlocal = [];
		<%for (int i = 0; i < list.size(); i++) {%>
		listlocal.push('<%=list.get(i).getLocal()%>')
		<%}%>
		console.log(listlocal)

		// 주소 이름 이차원배열
		const mapicon = new Array(<%=list.size()%>);
		for (var i = 0; i< <%=list.size()%>; i++){
			mapicon[i] = new Array(3);
		}
		

		for(var i =0; i<<%=list.size()%>; i++){
			mapicon[i][0] = listAddress[i];
		}
		for(var i =0; i<<%=list.size()%>; i++){
			mapicon[i][1] = listName[i];
		}
		for(var i =0; i<<%=list.size()%>; i++){
			mapicon[i][2] = listlocal[i];
		}
		console.log(mapicon);

		// 마커를 담을 배열 생성
		var markers = [];

		// foreach loop
		mapicon.forEach(function(addr, index) {
    		geocoder.addressSearch(addr[0], function(result, status) {
        		if (status === kakao.maps.services.Status.OK) {
        			// 주소가 좌표로 변환
            		var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
					
        			// 마커 생성
		            var marker = new kakao.maps.Marker({
		            	map : map,
		                position : coords
		            });
        			
        			// 생성된 마커를 배열에 추가
		            markers.push(marker);

		            // 인포윈도우 생성
		            var infowindow = new kakao.maps.InfoWindow({
		                content : '<div style="width:150px;text-align:center;padding:6px 0;">' + addr[1] + '</div>'
		            });
                           
		         	// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
					// 이벤트 리스너로는 클로저를 만들어 등록합니다 
					// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
					kakao.maps.event.addListener(marker, 'mouseover',
							makeOverListener(map, marker, infowindow));
					kakao.maps.event.addListener(marker, 'mouseout',
							makeOutListener(infowindow));
                       
		            // 마커에 클릭이벤트를 등록합니다
		            kakao.maps.event.addListener(marker, 'click', function() {
		                  // ajax실행
		                  if(infowindow !=null){
		                  infowindow.close();}
		                  
		                  infowindow.open(map, marker);
		                  getsimplecon(addr[0],addr[1]);
		                  // console.log(addr[0]);
		            });
                       
    			} 
      
    		});
		});
		
		// 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
		function setMarkers(map) {
		    for (var i = 0; i < markers.length; i++) {
		        markers[i].setMap(map);
		    }            
		}

		// foreach문 밖!!
		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, infowindow) {
			return function() {
				infowindow.open(map, marker);
			};
		}

		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
			return function() {
				infowindow.close();
			};
		}
		
		// 호남(전국)버튼 함수
		function honam(){
			setMarkers(null);
			setMarkers(map);
		}
		
		// 광주버튼 함수
		function gwangju(){
			setMarkers(null);
			var i=0;
			while(true){
				if(mapicon[i][2]=='광주광역시'){
					markers[i].setMap(map);
				}
				i++;
			}
		}
		
		// 전남버튼 함수
		function jeonnam(){
			setMarkers(null);
			var i=0;
			while(true){
				if(mapicon[i][2]=='전라남도'){
					markers[i].setMap(map);
				}
				i++;
			}
		}
		
		// 전북버튼 함수
		function jeonbuk(){
			setMarkers(null);
			var i=0;
			while(true){
				if(mapicon[i][2]=='전라북도'){
					markers[i].setMap(map);
				}
				i++;
			}
		}
		
								
		// 상세보기 넘겨주는 함수
		let data23 =""
		function test123(){
			location.href="DetailsCon?data="+data23
		}
		
		// 간략보기 함수
		const getsimplecon = (addr,Filtname)=>{
	    	// ajax문
	    	// console.log(addr); // --> 함수 안에 매개변수를 안 넣은 것이었음...
	    	$.ajax({
	        	// 어디랑 통신 할건지
	        	url : "./MapCon",
	        	// 어떤 방식으로 통식할 건지
	        	type : 'get',
	        	// 가져갈 데이터
	        	data : { addr:addr},
	        	dataType : "json",
	       		// 통신에 성공했을 때 실행할 로직
	         	success:function(data){
	            	//alert("통신 성공!") //--> 확인함
	            	//console.log(data); //--> addr is not defined --> 워째서;;
	            	console.log(data);
	            	// alert(data.list[0].number);
	            	console.log(data.Const_year);
	
					let tableForm = `
					    <table border="1" id="ccc">
							<tr class="imfor">
								<td colspan="2">간략정보</td>
							</tr>
							<tr class="name">
								<td>정수장   이름</td>
								<td>${data.map.filt_name} 정수장</td>
							</tr>
							<tr class="address">
								<td>주소</td>
								<td>${data.map.addr}</td>
							</tr>
							<tr class="region">
								<td>급수 지역</td>
								<td>${data.map.sup_area}</td>
							</tr>
							<tr class="simple06">
						        <td>준공년도</td>
						        <td>${data.map.const_year}년</td>
					        </tr>
					        <tr class="simple07">
						        <td>가동률</td>
						        <td>${data.map.oper_rate} %</td>
					        </tr>
					        <tr class="simple08">
						        <td>급수인구</td>
						        <td>${data.map.sup_popu}명</td>
					        </tr>
					        <tr>
					        <td colspan="2">120위 중 ${data.map.rank}위</td>
					      
					        </tr>
						</table>`;
					  $('#simplecontext').html(tableForm);
		
	       
	            
	        	},
	        
	        	// 통신에 실패했을 때 실행할 로직
	        	error:function(){
	            	alert("통신 실패..")
	        	}
	    	}),
	    	
	    	// 정수장 이름 쿼리스트링에 저장
		    data23 = Filtname;
		    // 정수장 이름 세션에 저장
		    //window.sessionStorage.setItem("SessionFilterName",Filtname);
		}


		// 검색함수	
		var infowindow;
		const search = ()=>{
				
			// 인포 닫기? 
			if(infowindow != null){
				infowindow.close();
			};
				
			// 검색한 정수장 이름 저장
			let name = $("#search_fname").val();
			// console.log(name); --> 확인 완.
			
			// 정수장 이름으로 주소 찾기
			var num;
			var i=0;
			while(true){
				if(mapicon[i][1]==name){
					num = i;
					break;
				}
				i++;
			}
			// console.log(i); --> 확인 완.
			
			// 지도에 정수장 띄우기
			geocoder.addressSearch(mapicon[i][0], function(result, status) {
				if (status === kakao.maps.services.Status.OK) {
			    	var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
			        var marker = new kakao.maps.Marker({
			            map : map,
			            position : coords
			        });
	
			        // 인포윈도우를 생성합니다
			        infowindow = new kakao.maps.InfoWindow({
			            content : '<div style="width:150px;text-align:center;padding:6px 0;">' + name + '</div>'
			        });
			                           
			        infowindow.open(map, marker);
			        map.setCenter(coords);
			                       
			    } 
			      
			});
			
			// 간략정보 띄우기			
			getsimplecon(mapicon[i][0], name);			
		}
	</script>



</body>
</html>