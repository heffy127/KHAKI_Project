<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--

=========================================================
* Argon Dashboard - v1.1.0
=========================================================

* Product Page: https://www.creative-tim.com/product/argon-dashboard
* Copyright 2019 Creative Tim (https://www.creative-tim.com)
* Licensed under MIT (https://github.com/creativetimofficial/argon-dashboard/blob/master/LICENSE.md)

* Coded by Creative Tim

=========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software. -->
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>
    1등 카셰어링, khaki
  </title>
  <!-- Favicon -->
  <link href="resources/assets/img/brand/favicon.png" rel="icon" type="image/png">
  <!-- Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
  <!-- Icons -->
  <link href="resources/assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
  <link href="resources/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link href="resources/assets/css/argon-dashboard.css?v=1.1.0" rel="stylesheet" />
  <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <script>
     $(function(){
        $("#unlockImg").hide();
        $("#lockImg").hide();
        $("#claim").hide();
        $("#startImg").hide();
        $("#returnImg").hide();
        
        // 문열림
        $("#unlockCar").click(function(){
           alert("문이 열렸습니다.");
           $("#lockImg").hide();
           $("#claim").hide();
           $("#startImg").hide();
           $("#returnImg").hide();
           $("#unlockImg").show();
           
        });
        
        // 문잠금
        $("#lockCar").click(function(){
           alert("문이 잠겼습니다.");
           $("#unlockImg").hide();
           $("#claim").hide();
           $("#startImg").hide();
           $("#returnImg").hide();
             $("#lockImg").show();
        });
        
        // 차량 찾기
        $("#findCar").click(function(){
           alert("소리나기1");
           $("#unlockImg").hide();
           $("#claim").hide();
           $("#startImg").hide();
           $("#returnImg").hide();
             $("#lockImg").show();
        });
        
        // 시동걸기
        $("#startCar").click(function(){
           alert("소리나기2");
           $("#unlockImg").hide();
           $("#claim").hide();
           $("#returnImg").hide();
             $("#lockImg").hide();
           $("#startImg").show();
        });
        
        // 사고신고
        $("#reportCar").click(function(){
           var retVal = confirm("신고접수 페이지로 이동 하시겠습니까?");
           if(retVal == true) {
              $("#unlockImg").hide();
              $("#lockImg").hide();
              $("#startImg").hide();
              $("#returnImg").hide();
                $("#claim").show();
           }
        });
        
        // 차량반납
        $("#returnCar").click(function(){
           var retVal = confirm("차량을 반납 하시겠습니까?");
           if(retVal == true) {
              alert("이용해주셔서 감사합니다.");
              $("#unlockImg").hide();
              $("#claim").hide();
              $("#startImg").hide();
                $("#lockImg").hide();
                $("#returnImg").show();
                
                
                
                
           }
        });
     });
  </script>
</head>
<body>
   <!-- carkey -->
   <div id="tabs-icons-text-6" role="tabpanel" aria-labelledby="tabs-icons-text-6-tab">
      <div style="width: 50%; float: left; border-right: 8px solid #f5f5f5; padding: 1%;">
         <div id="name" style="width:100%; text-align:right; margin-bottom: 10px;">
            <h2><b style="color: blue;">${sessionId}</b>님 안녕하세요.</h2>
         </div>
         <div id="key-top" style="text-align: center;">
            <button id="unlockCar" style="width: 45%; height: 120px; margin-right: 25px; font-size: 25px;" type="button" class="btn btn-secondary btn-lg">
               문열기<br><img width="40px;" src="https://image.flaticon.com/icons/svg/1967/1967887.svg"></button>
            <button id="lockCar" style="width: 45%; height: 120px;  font-size: 25px;" type="button" class="btn btn-secondary btn-lg">
               문잠금<br><img width="40px;" src="https://image.flaticon.com/icons/svg/1972/1972850.svg"></button>
         </div>                        
         <div id="key-mid" style="text-align: center; margin-top: 5%; margin-bottom: 5%;">
            <button id="findCar" style="width: 30%; height: 150px; margin-right: 20px; font-size: 25px;" type="button" class="btn btn-secondary btn-lg">
               차량 찾기<br><img width="35px;" src="https://image.flaticon.com/icons/svg/709/709011.svg"></button>
            <button id="startCar" style="width: 30%; height: 150px; margin-right: 20px; font-size: 25px;" type="button" class="btn btn-secondary btn-lg">
               시동 걸기<br><img width="35px;" src="https://image.flaticon.com/icons/svg/944/944563.svg"></button>
            <button id="reportCar" style="width: 30%; height: 150px; font-size: 25px; color: red;" type="button" class="btn btn-secondary btn-lg" onclick="location.href='claim.do'">
                  신고 하기<br><img width="35px;" src="https://image.flaticon.com/icons/svg/2039/2039772.svg"></button>
         </div>
         <div id="key-bottom">
            <button id="returnCar" type="button" style="height: 120px; font-size: 30px;" class="btn btn-secondary btn-lg btn-block">
                     차량 반납하기</button>
         </div>
   </div>
   <!-- 실행창  -->
   <div id="window" style="text-align:center; width: 50%; float: left; padding: 1%;">
      <img id="unlockImg" style="width: 400px;" src="https://st2.depositphotos.com/1495079/12203/v/950/depositphotos_122037262-stock-illustration-padlock-unlock-sign-icon.jpg">
      <img id="lockImg" style="width: 400px;" src="https://st2.depositphotos.com/3907761/7233/v/450/depositphotos_72338459-stock-illustration-01208a.jpg">
      <img id="startImg" style="width: 400px;" src="resources/assets/img/brand/startCar.gif">
      <div id="returnImg" style="text-align: center;">
         <img  style="width: 400px;" src="resources/assets/img/brand/thanks.gif">
         <h1 style="padding-top: 10px;">이용해 주셔서 감사합니다.</h1>
      </div>
      <iframe id="claim" src="claim.do?writer=${sessionId }" style="width: 100%; height: 900px;" frameborder="0"></iframe>
   </div>
   </div>
   <!--   Core   -->
  <script src="resources/assets/js/plugins/jquery/dist/jquery.min.js"></script>
  <script src="resources/assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <!--   Optional JS   -->
  <!--   Argon JS   -->
  <script src="resources/assets/js/argon-dashboard.min.js?v=1.1.0"></script>
  <script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
  <script>
    window.TrackJS &&
      TrackJS.install({
        token: "ee6fab19c5a04ac1a32a645abde4613a",
        application: "argon-dashboard-free"
      });
  </script>
</body>
</html>