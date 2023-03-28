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
#simplecontext {
	background-color: skyblue;
}
.map1 {
	float: left;
}
</style>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<h1>지도</h1>

	<span class="menu" onclick="hmFunc">메뉴〓</span>
	<div id="hiddenMenu" style="display: none;">
		<a href="TestMain.jsp">홈</a> <a href="TestMap.jsp">정수장 현황</a> <a
			href="TestLocal1.jsp">시도별 현황</a> <a href="TestDanger.jsp">위험 순위</a>
	</div>
	
	<script>
		$(".menu").on('click',function(){
			$("#hiddenMenu").css("display","block");
		})
	</script>

	<br>
	<br>

	<!-- 지도 div -->
	<div id="map" class="map1" style="width: 50%; height: 350px;"></div>
	<!-- 간략보기 div -->
	<div id="simplecontext" class="map1" style="width: 50%; height: 350px;"></div>
	
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=82a09d330020169ca7770768877a9db3&libraries=services"></script>
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

// 주소 이름 이차원배열
const mapicon = new Array(116);
for (var i = 0; i< 116; i++){
	mapicon[i] = new Array(2);
}
// console.log(mapicon);

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
            	//disableAutoPan: true,
                position : coords
                //clickable: true
            });

            // 인포윈도우를 생성합니다
            var infowindow = new kakao.maps.InfoWindow({
            	//disableAutoPan: true,
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
                  // ajax실행
                  getsimplecon(addr[0]);
                  // console.log(addr[0]);
            });
                       
    } 
      
    });
});
		
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


<script>
const getsimplecon = (addr)=>{
    // ajax문
    console.log(addr); // --> 함수 안에 매개변수를 안 넣은 것이었음...
    $.ajax({
        // 어디랑 통신 할건지
        url : "./MapCon",
        		//addr=${addr[0]} --> 이렇게?
        // 어떤 방식으로 통식할 건지
        type : 'get',
        // 가져갈 데이터
        data : { addr:addr}, //--> 이렇게?
        dataType : "json",
        // 통신에 성공했을 때 실행할 로직
         success:function(data){
             //alert("통신 성공!") //--> 확인함
             //console.log(data); //--> addr is not defined --> 워째서;;
            console.log(data);
            // alert(data.list[0].number);
            console.log(data.Const_year);

            // for(let i=0;i<movieList.length;i++){
            //     console.log(movieList[i].rank,movieList[i].movieNm,movieList[i].openDt);
            // }
		let tableForm = `	
    <table border="1" id="ccc">
		<tr class="imfor">
			<td colspan="2">간략정보</td>
		</tr>
		<tr class="name">
			<td>정수장 이름</td>
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
	</table>`;
    $('#simplecontext').html(tableForm);
	
       
            
        },
        
        // 통신에 실패했을 때 실행할 로직
        error:function(){
            alert("통신 실패..")
        }
    })
}
</script>
	

</body>
</html>