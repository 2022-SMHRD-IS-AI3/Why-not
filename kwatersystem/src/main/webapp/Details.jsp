<%@page import="java.util.Arrays"%>
<%@page import="com.smhrd.model.Intake_quality"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.Filteration_qualityDTO"%>
<%@page import="com.smhrd.model.Filtration_infoDTO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="./circle-progress.js"></script>
<%
System.out.println("정수장정보, 정수장수질, 취수장수질 넘기는 스트릿틀릿!!");

Filtration_infoDTO filtinfo = (Filtration_infoDTO)request.getAttribute("정수장정보");
Filteration_qualityDTO filtQuality = (Filteration_qualityDTO)request.getAttribute("정수장수질");
List<Intake_quality> intakeQuality = (List<Intake_quality>)request.getAttribute("취수장수질");

%>

<style>
<%
   double val_num = filtinfo.getOper_rate() ;
   double val_num2 = val_num*(0.01) ;
   double val_num3 = val_num2 - 1.0 ;
   
   
   int popu_num = filtinfo.getSup_popu() ;
   
   int n_left = 0 ;
   int n_top = 0 ;
   int n_width = 0 ;   
 %> 
  <% if(popu_num ==0) { %> 
       #popu_img { 
          display:none;
      }
   <%}else if(popu_num<1000) {
      n_left = 46;
      n_top = 46;
      n_width = 40;
   }else if(popu_num<5000) {
      n_left = 42;
      n_top = 38;
      n_width = 80;
   }else if(popu_num<10000) {
      n_left = 39;
      n_top = 35;
      n_width = 110;
   }else if(popu_num<50000) {
      n_left = 35;
      n_top = 25;
      n_width = 150;   
   }else if(popu_num<100000) {
      n_left = 32;
      n_top = 20;
      n_width = 180;
   }else if(popu_num<200000) {
      n_left = 30;
      n_top = 12;
      n_width = 200;
   }else if(popu_num<500000) {
      n_left = 26;
      n_top = 5;
      n_width = 235;
   }else if(popu_num<1000000) {
      n_left = 22;
      n_top = -2;
      n_width = 275;
   }else if(popu_num>=1000000) {
      n_left = 20;
      n_top = -10;
      n_width = 300;
   }%>
    
li{
   list-style:none
}

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

#circle2 {
   display: hidden;
   position: fixed;
   top: 254px;
   left: 228px;
   animation-delay: 2s;
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

#popu_img {
   width: 25px;
   position: absolute;
   left: 48%;
   top: 50%;
   animation-name: imgAni;
   animation-duration: 1.5s;
   animation-direction: normal;
   animation-delay: 0.3s;
   animation-fill-mode: forwards;
}

@keyframes imgAni {
   from { 
      width:25px;
      left: 48%;
      top: 50%;
   }

   to {
      left: <%=n_left%>%;
      top: <%=n_top%>%;
      width: <%=n_width%>px;
   }
}

#i_table {
   width: 570px;
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
        <a href="TestMap.jsp">정수장 현황</a>
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
      <a>이름 : <%=filtinfo.getFilt_name() %> 정수장</a> 
      <a>주소 : <%=filtinfo.getAddr() %></a> 
      <a>준공년도 : <%=filtinfo.getConst_year() %></a>
   </div>

   <table id="oper_table">
      <tr>
         <th>가동률</th>
      </tr>
      <tr>
         <td id="oper_g">
            <div id="circle">
               <div><%=val_num %>%</div>
            </div>
            <div id="circle2">
               <div></div>
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
            <div style="position:relative">
               <img src="./icon_users.png" id="popu_img">
            </div>
            <div><%=popu_num  %></div>
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
         <td id='I01' name="no1"><%
         try{%><%=intakeQuality.get(4).getB_1()+0%>
         <%}
         catch(NullPointerException e){}
         %></td>
         <td id='I02' name="no2"><%
         try{%><%=intakeQuality.get(3).getB_1()+0%>
         <%}
         catch(NullPointerException e){}
         %></td>
         <td id='I03' name="no3"><%
         try{%><%=intakeQuality.get(2).getB_1()+0%>
         <%}
         catch(NullPointerException e){}
         %></td>
         <td id='I04' name="no4"><%
         try{%><%=intakeQuality.get(1).getB_1()+0%>
         <%}
         catch(NullPointerException e){}
         %></td>
         <td id='I05' name="no5"><%
         try{%><%=intakeQuality.get(0).getB_1()+0%>
         <%}
         catch(NullPointerException e){}
         %></td>
      </tr>
      <tr class="i_code">
      <td>생물화학적_산소요구량</td>
         <td id='I06' name="no1"><%
         try{%><%=intakeQuality.get(4).getB_2()+0%>
         <%} 
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td id='I07' name="no2"><%
         try{%><%=intakeQuality.get(3).getB_2()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td id='I08' name="no3"><%
         try{%><%=intakeQuality.get(2).getB_2()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td id='I09' name="no4"><%
         try{%><%=intakeQuality.get(1).getB_2()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td id='I10' name="no5"><%
         try{%><%=intakeQuality.get(0).getB_2()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
      </tr>
      <tr class="i_code">
         <td>화학적_산소요구량</td>
         <td id='I11' name="no1"><%
         try{%><%=intakeQuality.get(4).getB_3()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%><%}
         %></td>
         <td id='I12' name="no2"><%
         try{%><%=intakeQuality.get(3).getB_3()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%><%}
         %></td>
         <td id='I13' name="no3"><%
         try{%><%=intakeQuality.get(2).getB_3()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%><%}
         %></td>
         <td id='I14' name="no4"><%
         try{%><%=intakeQuality.get(1).getB_3()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%><%}
         %></td>
         <td id='I15' name="no5"><%
         try{%><%=intakeQuality.get(0).getB_3()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
      </tr>
      <tr class="i_code">
         
         <td>총유기탄소</td>
         <td name="no1"><%
         try{%><%=intakeQuality.get(4).getB_4()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no2"><%
         try{%><%=intakeQuality.get(3).getB_4()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no3"><%
         try{%><%=intakeQuality.get(2).getB_4()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no4"><%
         try{%><%=intakeQuality.get(1).getB_4()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no5"><%
         try{%><%=intakeQuality.get(0).getB_4()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
      </tr>
      <tr class="i_code">
         <td>총인</td>
         <td name="no1"><%
         try{%><%=intakeQuality.get(4).getB_5()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no2"><%
         try{%><%=intakeQuality.get(3).getB_5()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no3"><%
         try{%><%=intakeQuality.get(2).getB_5()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no4"><%
         try{%><%=intakeQuality.get(1).getB_5()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no5"><%
         try{%><%=intakeQuality.get(0).getB_5()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
      </tr>
      <tr class="i_code">
         <td>부유물질량</td>
         <td name="no1"><%
         try{%><%=intakeQuality.get(4).getB_6()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no2"><%
         try{%><%=intakeQuality.get(3).getB_6()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no3"><%
         try{%><%=intakeQuality.get(2).getB_6()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no4"><%
         try{%><%=intakeQuality.get(1).getB_6()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no5"><%
         try{%><%=intakeQuality.get(0).getB_6()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
      </tr>
      <tr class="i_code">
         <td>용존산소량</td>
         <td name="no1"><%
         try{%><%=intakeQuality.get(4).getB_7()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no2"><%
         try{%><%=intakeQuality.get(3).getB_7()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no3"><%
         try{%><%=intakeQuality.get(2).getB_7()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no4"><%
         try{%><%=intakeQuality.get(1).getB_7()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no5"><%
         try{%><%=intakeQuality.get(0).getB_7()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
      </tr>
      <tr class="i_code">
         <td>총대장균군</td>
         <td name="no1"><%
         try{%><%=intakeQuality.get(4).getB_8()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no2"><%
         try{%><%=intakeQuality.get(3).getB_8()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no3"><%
         try{%><%=intakeQuality.get(2).getB_8()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no4"><%
         try{%><%=intakeQuality.get(1).getB_8()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no5"><%
         try{%><%=intakeQuality.get(0).getB_8()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
      </tr>
      <tr class="i_code">
         <td>대장균_분원성대장균군</td>
         <td name="no1"><%
         try{%><%=intakeQuality.get(4).getB_9()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no2"><%
         try{%><%=intakeQuality.get(3).getB_9()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no3"><%
         try{%><%=intakeQuality.get(2).getB_9()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no4"><%
         try{%><%=intakeQuality.get(1).getB_9()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no5"><%
         try{%><%=intakeQuality.get(0).getB_9()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
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
         <td name="no1">
         <%
         try{%><%=filtQuality.getA_1()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %>
         </td>
         <td name="no2"><%
         try{%><%=filtQuality.getA_2()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no3"><%
         try{%><%=filtQuality.getA_3()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no4"><%
         try{%><%=filtQuality.getA_4()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no5"><%
         try{%><%=filtQuality.getA_5()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no6"><%
         try{%><%=filtQuality.getA_6()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no7"><%
         try{%><%=filtQuality.getA_7()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no8"><%
         try{%><%=filtQuality.getA_8()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no9"><%
         try{%><%=filtQuality.getA_9()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no10"><%
         try{%><%=filtQuality.getA_10()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no11"><%
         try{%><%=filtQuality.getA_11()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no12"><%
         try{%><%=filtQuality.getA_12()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no13"><%
         try{%><%=filtQuality.getA_13()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no14"><%
         try{%><%=filtQuality.getA_14()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
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
         <td name="no15"><%
         try{%><%=filtQuality.getA_15()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no16"><%
         try{%><%=filtQuality.getA_16()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no17"><%
         try{%><%=filtQuality.getA_17()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no18"><%
         try{%><%=filtQuality.getA_18()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no19"><%
         try{%><%=filtQuality.getA_19()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no20"><%
         try{%><%=filtQuality.getA_20()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no21"><%
         try{%><%=filtQuality.getA_21()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no22"><%
         try{%><%=filtQuality.getA_22()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no23"><%
         try{%><%=filtQuality.getA_23()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no24"><%
         try{%><%=filtQuality.getA_24()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no25"><%
         try{%><%=filtQuality.getA_25()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no26"><%
         try{%><%=filtQuality.getA_26()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no27"><%
         try{%><%=filtQuality.getA_27()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no28"><%
         try{%><%=filtQuality.getA_28()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
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
         <td name="no29"><%
         try{%><%=filtQuality.getA_29()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no30"><%
         try{%><%=filtQuality.getA_30()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no31"><%
         try{%><%=filtQuality.getA_31()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no32"><%
         try{%><%=filtQuality.getA_32()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no33"><%
         try{%><%=filtQuality.getA_33()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no34"><%
         try{%><%=filtQuality.getA_34()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no35"><%
         try{%><%=filtQuality.getA_35()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no36"><%
         try{%><%=filtQuality.getA_36()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no37"><%
         try{%><%=filtQuality.getA_37()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no38"><%
         try{%><%=filtQuality.getA_38()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no39"><%
         try{%><%=filtQuality.getA_39()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no40"><%
         try{%><%=filtQuality.getA_40()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no41"><%
         try{%><%=filtQuality.getA_41()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no42"><%
         try{%><%=filtQuality.getA_42()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
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
         <td name="no43"><%
         try{%><%=filtQuality.getA_43()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no44"><%
         try{%><%=filtQuality.getA_44()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no45"><%
         try{%><%=filtQuality.getA_45()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no46"><%
         try{%><%=filtQuality.getA_46()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no47"><%
         try{%><%=filtQuality.getA_47()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no48"><%
         try{%><%=filtQuality.getA_48()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no49"><%
         try{%><%=filtQuality.getA_49()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no50"><%
         try{%><%=filtQuality.getA_50()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no51"><%
         try{%><%=filtQuality.getA_51()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no52"><%
         try{%><%=filtQuality.getA_52()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no53"><%
         try{%><%=filtQuality.getA_53()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no54"><%
         try{%><%=filtQuality.getA_54()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no55"><%
         try{%><%=filtQuality.getA_55()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
         <td name="no56"><%
         try{%><%=filtQuality.getA_56()+0%>
         <%}
         catch(NullPointerException e){%><%='N'%>
         <%}
         %></td>
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
     /*  let b1=document.getElementById("I01").textContent;
      console.log(b1);
      if(b1=="null N"){
    	  console.log(b1)
          document.getElementById("I01").innerText='N';          
      } else{ console.log(b1)}
      
      
      
      let b2=document.getElementById("I02").textContent;
      console.log(b2);
      if(b2=="null N){
          document.getElementById("I02").innerText='N';
          
      }
      let b3=document.getElementById("I03").textContent;
      console.log(b3);
      if(b3=="null N"){
          document.getElementById("I03").innerText='N';
          
      }
      let b5=document.getElementById("I05").textContent;
      console.log(b5);
      if(b5=="null N"){
          document.getElementById("I05").innerText='N';
          
      }
      let b6=document.getElementById("I06").textContent;
      console.log(b6);
      if(b6=="null N"){
          document.getElementById("I06").innerText='N';
          
      } else{ console.log(b1)}
      let b7=document.getElementById("I07").textContent;
      console.log(b7);
      if(b7=="null N"){
          document.getElementById("I07").innerText='N';
          
      } else{ console.log(b1)}
      let b8=document.getElementById("I08").textContent;
      console.log(b8);
      if(b8=="null N"){
          document.getElementById("I08").innerText='N';
          
      } else{ console.log(b1)}
      let b9=document.getElementById("I09").textContent;
      console.log(b9);
      if(b9=="null N"){
          document.getElementById("I09").innerText='N';
          
      }
      let b10=document.getElementById("I10").textContent;
      console.log(b10);
      if(b10=="null N"){
          document.getElementById("I10").innerText='N';
          
      }
      let b11=document.getElementById("I11").textContent;
      console.log(b11);
      if(b11=="null N"){
          document.getElementById("I11").innerText='N';
          
      }
      let b12=document.getElementById("I12").textContent;
      console.log(b12);
      if(b12=="null N"){
          document.getElementById("I12").innerText='N';
          
      }
      let b13=document.getElementById("I13").textContent;
      console.log(b13);
      if(b13=="null N"){
          document.getElementById("I13").innerText='N';
          
      }
      let b14=document.getElementById("I14").textContent;
      console.log(b14);
      if(b14=="null N"){
          document.getElementById("I14").innerText='N';
          
      }
      let b15=document.getElementById("I15").textContent;
      console.log(b15);
      if(b15=="null N"){
          document.getElementById("I15").innerText='N';
          
      } */
      
      
      
      
   </script>
   

   
<script>
      
   <%if(val_num<=100){%>
      $('#circle').circleProgress({
         startAngle : -Math.PI,
         value : <%=val_num2 %>,
         size : 280,
         thickness : 40,
         emptyFill : "rgba(0,0,0,0.1)",
         fill : {gradient : [ "#DDF1FE", "#016FFE" ]},
         animationStartValue : 0.0
      });
   <%}else if(val_num>100){%>
      $('#circle').circleProgress({
         startAngle : -Math.PI,
         value : 1.00,
         size : 280,
         thickness : 40,
         emptyFill : "rgba(0,0,0,0.1)",
         fill : {gradient : [ "#DDF1FE", "#016FFE" ]},
         animationStartValue : 0.0
      });
      setTimeout(function() {
         $('#circle2').circleProgress({
            startAngle : -Math.PI,
            value : <%=val_num3 %>,
            size : 280,
            thickness : 40,
            emptyFill : "rgba(0,0,0,0.0)",
            fill : {gradient : [ "#DDF1FE", "#FED32A", "#F72509" ]},
            animationStartValue : 0.0,
         });
      }, 1000);
   <%}%>
      
   </script>

</body>
</html>