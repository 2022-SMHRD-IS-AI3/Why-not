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
div#mapcont {
	background-color: skyblue;
}

.map1 {
	float: left;
}
</style>
</head>
<body>
	<h1>지도</h1>


	<span class="menu" onclick="hmFunc">메뉴〓</span>
	<div id="hiddenMenu" style="display: none;">
		<a href="TestMain.jsp">홈</a> <a href="TestMap.jsp">정수장 현황</a> <a
			href="TestLocal1.jsp">시도별 현황</a> <a href="TestDanger.jsp">위험 순위</a>
	</div>

	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script>
		$(".menu").on('click',function(){
			$("#hiddenMenu").css("display","block");
		})
	</script>

	<br>
	<br>


	<!-- <p style="margin-top:-12px">
    <em class="link">
        <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
            혹시 주소 결과가 잘못 나오는 경우에는 여기에 제보해주세요.
        </a>
    </em>
</p> -->

	<div id="map" class="map1" style="width: 50%; height: 350px;"></div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=82a09d330020169ca7770768877a9db3&libraries=services"></script>
	<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
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


// 주소 이름 이차원배열
const mapicon = new Array(116);
for (var i = 0; i< 116; i++){
	mapicon[i] = new Array(2);
}
console.log(mapicon);

for(var i =0; i<116; i++){
	mapicon[i][0] = listAddress[i];
}
for(var i =0; i<116; i++){
	mapicon[i][1] = listName[i];
}
console.log(mapicon);


// foreach loop
mapicon.forEach(function(addr, index) {
    geocoder.addressSearch(addr[0], function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

            var marker = new kakao.maps.Marker({
            	map : map,
                position : coords
                //clickable: true
            });

            // 마커를 지도에 표시합니다.
            //marker.setMap(map);

            // 인포윈도우를 생성합니다
            var infowindow = new kakao.maps.InfoWindow({
                content : '<div style="width:150px;text-align:center;padding:6px 0;">' + addr[1] + '</div>'
                //removable : true
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
                  // 마커 위에 인포윈도우를 표시합니다 --> 간략보기 처리!!
                  infowindow.open(map, marker);  
            });
    } 
        map.setCenter(coords);
    });
});

		// --> 시행착오(참고용)
		/* for (var i = 0; i < listAddress.length; i++) {
			//console.log(listName[i]) --> 출력됨!!
			//console.log(i)
			
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(listAddress[i],
					function(result, status) {

						// 정상적으로 검색이 완료됐으면 
						if (status === kakao.maps.services.Status.OK) {
									// console.log('ok')
							var coords = new kakao.maps.LatLng(result[0].y,
									result[0].x);
							
							// 마커를 생성합니다
							var marker = new kakao.maps.Marker({
								map : map, // 마커를 표시할 지도
								position : coords // 마커의 위치
							});
							//marker.setMap(map);
							//console.log(listAddress[i])
						
							// 마커에 표시할 인포윈도우를 생성합니다 
							var infowindow = new kakao.maps.InfoWindow({
								content : listName[i]
							// 인포윈도우에 표시할 내용
							});
							 console.log(i)    
						
							// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
							// 이벤트 리스너로는 클로저를 만들어 등록합니다 
							// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
							kakao.maps.event.addListener(marker, 'mouseover',
									makeOverListener(map, marker, infowindow));
							kakao.maps.event.addListener(marker, 'mouseout',
									makeOutListener(infowindow));
						}
						map.setCenter(coords);
						
			});	
			
		} */
		

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
						
							
		
	</script>


	<div id="mapcont" class="map1" style="width: 50%; height: 350px;">ajax로
		불러올 공간(간략정보)</div>

</body>
</html>