<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <script>
     $(function(){
        // var kyul = parseInt($("#kyul").val($("#first_amount").text()));
        // var one = parseInt($("#first_amount").val());
        // var ku = parseInt(0);
        // var po = parseInt(0);
        // 결제할금액 = 원래금액 - 쿠폰할인금액 - 포인트할인금액
        // kyul = one - ku - po;
        var first = $("#first_amount").val();
        var gap = $("#timeGap").val();
        $("#first_amount").val(gap * (first / 60));
        $("#confirm_amount").text(gap * (first / 60));
        $("#one").val($("#first_amount").val());
        $("#kyul").val($("#first_amount").val());
        var startTime = $("#confirm_startTime").text();
        var endTime = $("#confirm_endTime").text();
        startTime = startTime.split("");
        endTime = endTime.split("");
        startTime = startTime[0]+startTime[1]+"."+startTime[2]+startTime[3]+"."+startTime[4]+startTime[5]+" "+startTime[6]+startTime[7]+":"+startTime[8]+startTime[9];
        endTime = endTime[0]+endTime[1]+"."+endTime[2]+endTime[3]+"."+endTime[4]+endTime[5]+" "+endTime[6]+endTime[7]+":"+endTime[8]+endTime[9];
        $("#confirm_startTime").text(startTime);        
        $("#confirm_endTime").text(endTime);
        // 쿠폰을 적용 시킬때마다 이벤트 발생
        $(".coupon_method").change(function(){
             var one = $("#one").val();
           var kyul = $("#kyul").val();
             var ku = $("#ku").val();
             var po = $("#po").val();
           $("#confirm_amount").text(one-ku-po);
           // 다른 쿠폰을 선택할 때마다 최초 결제금액으로 돌아옴.(이 부분이 없으면 할인적용된 금액에 추가적으로 또 할인이 적용됨.)
           // kyul = parseInt($("#confirm_amount").text(one - ku - po));
           // 선택한 option의 value(타입, 할인정도) 가져온다.
           var couponVal = $('select[name=coupon_method]').val();
           couponVal = couponVal.split(",");
           // 0번인덱스에는 쿠폰 타입, 1번 인덱스에는 할인정도가 들어가있다.
           // swal(couponVal[0]);
           // swal(couponVal[1]);
           if(couponVal[3] == "1") {
              var cpTitle = couponVal[4].split("원");
              cpTitle2 = cpTitle[0];
              if(parseInt(cpTitle2) > parseInt(one)) {
                 swal("쿠폰 조건이 맞지 않습니다.\n다른 쿠폰을 선택 해주세요.")
                 $(".coupon_method option:eq(0)").prop("selected", true); //첫번째 option 선택
                 ku = parseInt(0);
               kyul = one - ku - po; // 결제할금액 = 원래금액 - 쿠폰할인금액 - 포인트할인금액
                 $("#ku").val(ku);
               $("#kyul").val(kyul);
                    
                 $("#discount_label").remove();
                 $("#discount_label2").remove();
                 // 최초 결제금액을 할인 적용한 금액으로 변경
                 $("#confirm_amount").text(kyul);
                   // 할인 적용 안된 금액에 0.03을 곱하여 해당 금액을 포인트로 적립시킴
                   result = parseInt(kyul * 0.03);
                   $("#confirm_point").text(result);
              } else {
                 if(couponVal[0] == "basic") {
                      ku = parseInt(0);
                    kyul = one - ku - po; // 결제할금액 = 원래금액 - 쿠폰할인금액 - 포인트할인금액
                      $("#ku").val(ku);
                    $("#kyul").val(kyul);
                      
                      $("#discount_label").remove();
                      $("#discount_label2").remove();
                      // 최초 결제금액을 할인 적용한 금액으로 변경
                      $("#confirm_amount").text(kyul);
                        // 할인 적용 안된 금액에 0.03을 곱하여 해당 금액을 포인트로 적립시킴
                        result = parseInt(kyul * 0.03);
                        $("#confirm_point").text(result);
                      
                   } else if(couponVal[0] == "M") { // 쿠폰타입이 금액할인이라면
                      ku = parseInt(couponVal[1]);
                      kyul = one - ku - po; // 결제할금액 = 원래금액 - 쿠폰할인금액 - 포인트할인금액
                      $("#ku").val(ku);
                      $("#kyul").val(kyul);
                      if(kyul < 0) { // 결제할 금액이 0원 아래로 내려갈경우 -금액이 아닌 0원으로 대체
                         kyul = 0;
                      }
                      // 최초 결제금액을 할인 적용한 금액으로 변경
                      $("#confirm_amount").text(kyul);
                      // (할인적용)이라는 문구가 만들어져 있다면 우선 삭제한 후 다시 append
                      $("#discount_label").remove();
                      $("#discount_label2").remove();
                      // 할인이 적용되었다고 알리기 위해 라벨 추가
                    $("#amount_div2").append("<label id=\"discount_label2\" style='font-size: 15px; margin-left: 2%;'>최초금액 : " + one + "원 </label> <label id=\"discount_label\" style=\"font-size: 15px; color: red;\">(할인적용)</label>");
                      // 할인 적용된 금액에 0.03을 곱하여 해당 금액을 포인트로 적립시킴
                      result = parseInt(kyul * 0.03);
                      $("#confirm_point").text(result);
                   } else { // 쿠폰타입이 퍼센트 할인이라면 
                      ku = parseInt(kyul * (parseInt(couponVal[1]) * 0.01));
                      kyul = one - ku - po;
                      $("#ku").val(ku);
                      $("#kyul").val(kyul);
                      // 최초 결제금액을 할인 적용한 금액으로 변경
                      $("#confirm_amount").text(kyul);
                        // (할인적용)이라는 문구가 만들어져 있다면 우선 삭제한 후 다시 append
                      $("#discount_label").remove();
                      $("#discount_label2").remove();
                        // 할인이 적용되었다고 알리기 위해 라벨 추가
                      $("#amount_div2").append("<label id=\"discount_label2\" style='font-size: 15px; margin-left: 2%;'>할인전금액 : " + one + "원 </label> <label id=\"discount_label\" style=\"font-size: 15px; color: red;\">(할인적용)</label>");
                        // 할인 적용된 금액에 0.03을 곱하여 해당 금액을 포인트로 적립시킴
                        result = parseInt(kyul * 0.03);
                        $("#confirm_point").text(result);
                   }
                   $("#couponSeq").val(couponVal[2]);
              }
           } else if(couponVal[3] == "2") {
              var cpTitle = couponVal[4].split("시간");
              cpTitle = cpTitle[0];
              
              var timeGap = $("#timeGap").val();
              timeGap = timeGap / 60;
              var timeCheck = "";
              if(cpTitle <= timeGap) {
                 timeCheck = "Y";
              } else {
                 timeCheck = "N";
              }
              
              if(timeCheck == "N") {
                 swal("쿠폰 조건이 맞지 않습니다.\n다른 쿠폰을 선택 해주세요.")
                 $(".coupon_method option:eq(0)").prop("selected", true); //첫번째 option 선택
                 ku = parseInt(0);
                 kyul = one - ku - po; // 결제할금액 = 원래금액 - 쿠폰할인금액 - 포인트할인금액
                 $("#ku").val(ku);
                 $("#kyul").val(kyul);
                    
                 $("#discount_label").remove();
                 $("#discount_label2").remove();
                 // 최초 결제금액을 할인 적용한 금액으로 변경
                 $("#confirm_amount").text(kyul);
                 // 할인 적용 안된 금액에 0.03을 곱하여 해당 금액을 포인트로 적립시킴
                 result = parseInt(kyul * 0.03);
                 $("#confirm_point").text(result);
                 
              } else if(timeCheck == "Y") {
                 if(couponVal[0] == "basic") {
                      ku = parseInt(0);
                    kyul = one - ku - po; // 결제할금액 = 원래금액 - 쿠폰할인금액 - 포인트할인금액
                      $("#ku").val(ku);
                    $("#kyul").val(kyul);
                      
                      $("#discount_label").remove();
                      $("#discount_label2").remove();
                      // 최초 결제금액을 할인 적용한 금액으로 변경
                      $("#confirm_amount").text(kyul);
                        // 할인 적용 안된 금액에 0.03을 곱하여 해당 금액을 포인트로 적립시킴
                        result = parseInt(kyul * 0.03);
                        $("#confirm_point").text(result);
                      
                   } else if(couponVal[0] == "M") { // 쿠폰타입이 금액할인이라면
                      ku = parseInt(couponVal[1]);
                    kyul = one - ku - po; // 결제할금액 = 원래금액 - 쿠폰할인금액 - 포인트할인금액
                      $("#ku").val(ku);
                    $("#kyul").val(kyul);
                    if(kyul < 0) { // 결제할 금액이 0원 아래로 내려갈경우 -금액이 아닌 0원으로 대체
                       kyul = 0;
                    }
                    // 최초 결제금액을 할인 적용한 금액으로 변경
                    $("#confirm_amount").text(kyul);
                      // (할인적용)이라는 문구가 만들어져 있다면 우선 삭제한 후 다시 append
                    $("#discount_label").remove();
                    $("#discount_label2").remove();
                      // 할인이 적용되었다고 알리기 위해 라벨 추가
                    $("#amount_div2").append("<label id=\"discount_label2\" style='font-size: 15px; margin-left: 2%;'>최초금액 : " + one + "원 </label> <label id=\"discount_label\" style=\"font-size: 15px; color: red;\">(할인적용)</label>");
                      // 할인 적용된 금액에 0.03을 곱하여 해당 금액을 포인트로 적립시킴
                      result = parseInt(kyul * 0.03);
                      $("#confirm_point").text(result);
                   } else { // 쿠폰타입이 퍼센트 할인이라면 
                      ku = parseInt(kyul * (parseInt(couponVal[1]) * 0.01));
                      kyul = one - ku - po;
                      $("#ku").val(ku);
                      $("#kyul").val(kyul);
                      // 최초 결제금액을 할인 적용한 금액으로 변경
                      $("#confirm_amount").text(kyul);
                        // (할인적용)이라는 문구가 만들어져 있다면 우선 삭제한 후 다시 append
                      $("#discount_label").remove();
                      $("#discount_label2").remove();
                        // 할인이 적용되었다고 알리기 위해 라벨 추가
                      $("#amount_div2").append("<label id=\"discount_label2\" style='font-size: 15px; margin-left: 2%;'>할인전금액 : " + one + "원 </label> <label id=\"discount_label\" style=\"font-size: 15px; color: red;\">(할인적용)</label>");
                        // 할인 적용된 금액에 0.03을 곱하여 해당 금액을 포인트로 적립시킴
                        result = parseInt(kyul * 0.03);
                        $("#confirm_point").text(result);
                   }
                   $("#couponSeq").val(couponVal[2]);
              }
           } else if(couponVal[3] == "3") {
              var cpTitle1 = couponVal[4].split("시");
              var cpT1 = cpTitle1[0];
              var cpTitle2 = cpTitle1[1].split(" ");
              var cpT2 = cpTitle2[2];
              
              var startTime = $("#confirm_startTime").text().split(" ");
              
              startTime = startTime[1].split(":");
              startTime = parseInt(startTime[0]);
              
              var timeCheck = "";
              if(parseInt(cpT1) <= startTime && parseInt(cpT2) > startTime ) { // 출발시간이 쿠폰의 범위시간 안에 있을 경우
                 timeCheck = "Y";
              } else {
                 timeCheck = "N";
              }
              
              if(timeCheck == "N") {
                 swal("쿠폰 조건이 맞지 않습니다.\n다른 쿠폰을 선택 해주세요.")
                 $(".coupon_method option:eq(0)").prop("selected", true); //첫번째 option 선택
                 ku = parseInt(0);
               kyul = one - ku - po; // 결제할금액 = 원래금액 - 쿠폰할인금액 - 포인트할인금액
                 $("#ku").val(ku);
               $("#kyul").val(kyul);
                    
                 $("#discount_label").remove();
                 $("#discount_label2").remove();
                 // 최초 결제금액을 할인 적용한 금액으로 변경
                 $("#confirm_amount").text(kyul);
                   // 할인 적용 안된 금액에 0.03을 곱하여 해당 금액을 포인트로 적립시킴
                   result = parseInt(kyul * 0.03);
                   $("#confirm_point").text(result);
              } else {
                 if(couponVal[0] == "basic") {
                      ku = parseInt(0);
                      kyul = one - ku - po; // 결제할금액 = 원래금액 - 쿠폰할인금액 - 포인트할인금액
                      $("#ku").val(ku);
                      $("#kyul").val(kyul);
                      
                      $("#discount_label").remove();
                      $("#discount_label2").remove();
                      // 최초 결제금액을 할인 적용한 금액으로 변경
                      $("#confirm_amount").text(kyul);
                      // 할인 적용 안된 금액에 0.03을 곱하여 해당 금액을 포인트로 적립시킴
                      result = parseInt(kyul * 0.03);
                      $("#confirm_point").text(result);
                      
                   } else if(couponVal[0] == "M") { // 쿠폰타입이 금액할인이라면
                      ku = parseInt(couponVal[1]);
                    kyul = one - ku - po; // 결제할금액 = 원래금액 - 쿠폰할인금액 - 포인트할인금액
                      $("#ku").val(ku);
                    $("#kyul").val(kyul);
                    if(kyul < 0) { // 결제할 금액이 0원 아래로 내려갈경우 -금액이 아닌 0원으로 대체
                       kyul = 0;
                    }
                    // 최초 결제금액을 할인 적용한 금액으로 변경
                    $("#confirm_amount").text(kyul);
                      // (할인적용)이라는 문구가 만들어져 있다면 우선 삭제한 후 다시 append
                    $("#discount_label").remove();
                    $("#discount_label2").remove();
                      // 할인이 적용되었다고 알리기 위해 라벨 추가
                    $("#amount_div2").append("<label id=\"discount_label2\" style='font-size: 15px; margin-left: 2%;'>최초금액 : " + one + "원 </label> <label id=\"discount_label\" style=\"font-size: 15px; color: red;\">(할인적용)</label>");
                      // 할인 적용된 금액에 0.03을 곱하여 해당 금액을 포인트로 적립시킴
                      result = parseInt(kyul * 0.03);
                      $("#confirm_point").text(result);
                   } else { // 쿠폰타입이 퍼센트 할인이라면 
                      ku = parseInt(kyul * (parseInt(couponVal[1]) * 0.01));
                      kyul = one - ku - po;
                      $("#ku").val(ku);
                      $("#kyul").val(kyul);
                      // 최초 결제금액을 할인 적용한 금액으로 변경
                      $("#confirm_amount").text(kyul);
                        // (할인적용)이라는 문구가 만들어져 있다면 우선 삭제한 후 다시 append
                      $("#discount_label").remove();
                      $("#discount_label2").remove();
                        // 할인이 적용되었다고 알리기 위해 라벨 추가
                      $("#amount_div2").append("<label id=\"discount_label2\" style='font-size: 15px; margin-left: 2%;'>할인전금액 : " + one + "원 </label> <label id=\"discount_label\" style=\"font-size: 15px; color: red;\">(할인적용)</label>");
                        // 할인 적용된 금액에 0.03을 곱하여 해당 금액을 포인트로 적립시킴
                        result = parseInt(kyul * 0.03);
                        $("#confirm_point").text(result);
                   }
                   $("#couponSeq").val(couponVal[2]);
              }
              
              
              
           }
           
           
           
        })
        
        // 쿠폰 select는 기본적으로 숨겨져있음
        $("#select_couponMethod").hide();
        // 쿠폰 적용하기 글씨를 클릭 했을 경우
        $("#cpCheckLabel").click(function() {
           // 쿠폰 select에 클릭 이벤트 적용하여 쿠폰 체크박스가 클릭 되게 함
           $("#couponCheckBox").click();
        })
        // 쿠폰 체크박스가 클릭되거나 클릭 해제될때마다 실행
        $("#couponCheckBox").change(function(){
           var one = $("#one").val();
           var kyul = $("#kyul").val();
             var ku = $("#ku").val();
             var po = $("#po").val();
           // 쿠폰 체크박스에 체크가 되어있는 상태라면
           if ($("input:checkbox[id='couponCheckBox']").is(":checked") == true){
              // sessionId를 cp_id에 저장
              var cp_id = $("#cp_id").val();
              $.ajax({
                   // couponconfirm.do에 ajax로 연결
                    url:"couponConfirm.do",
                    data : {
                       "cp_id" : cp_id
                    },
                    success:function(data){
                       // ajax를 select의 option들을 가져옴
                       $("#cp_method").children().remove();
                       console.log(data);
                       // 현재 해당 회원이 가지고 있는 option들을 select에 추가해준다.
                       $("#cp_method").append(data);
                    },
                    error : function(xhr, status) {
                         swal(xhr + " : " + status);
                     }
              });
              // select를 감싸고있는 div가 쿠폰적용하기를 클릭하면 select를 보이게 함
              $("#select_couponMethod").show();
           } else {// 쿠폰 적용하기에 체크박스에 체크가 안되어 있는 상태라면
              var couponVal = $('select[name=coupon_method]').val();
                couponVal = couponVal.split(",");
                // 0번인덱스에는 쿠폰 타입, 1번 인덱스에는 할인정도가 들어가있다.
                // swal(couponVal[0]);
                // swal(couponVal[1]);
                ku = parseInt(0);
                $("#ku").val(ku);
                kyul = one - ku - po; // 결제할금액 = 원래금액 - 쿠폰할인금액 - 포인트할인금액
                $("#kyul").val(kyul);
                $("#confirm_amount").text(kyul);
                result = parseInt(kyul * 0.03);
                $("#confirm_point").text(result);
                // 빨간색(할인적용)을 div를 삭제
                $("#discount_label").remove();
                $("#discount_label2").remove();
                // 쿠폰select를 담고있는 div 안보이게 hide
                $("#select_couponMethod").hide();
                $("#couponSeq").val("");
           }
        })
        
        // 쿠폰을 적용하여 할인이 되거나, 할인이 되지 않아도 현재 결제될 금액에 3%를 포인트로 제공.
        var result = parseInt($("#confirm_amount").text());
        result = parseInt(result * 0.03);
        $("#confirm_point").text(result);
        
        // 포인트 사용하기 글씨를 클릭 했을 경우
        $("#pointUseLabel").click(function() {
           // 포인트 사용하기의 체크박스가 클릭됨
           $("#pointUseCheckBox").click();
        })
        
        $("#pointUseCheckBox").change(function(){
           var one = $("#one").val();
           var kyul = $("#kyul").val();
             var ku = $("#ku").val();
             var po = $("#po").val();
           // 포인트 체크박스에 체크가 되어있는 상태라면
           if ($("input:checkbox[id='pointUseCheckBox']").is(":checked") == true){
              $(".pointUse").append("<div id='pointUseLabelDiv' style='width: 100%; text-align: center;'><input type='text' id='pointUseInput' style='width: 20%; direction:rtl;' placeholder='보유 포인트 - "+$("#memberPoint").val()+"p'><button type=\"button\" class=\"btn btn-outline-success\" id='pointUseBtn' style='margin-left: 2.5%;'>사용하기</button></div>");
              $("#pointUseInput").on("propertychange change keyup paste", function() {
                 $(this).val($(this).val().replace(/[^0-9]/g,""))
                   if(($("#pointUseInput").val() - $("#memberPoint").val()) > 0) {
                      $("#pointUseCheck").remove();
                      $("#pointUseLabelDiv").append("<div id='pointUseCheck' style='color: #f64366;'>보유 포인트를 초과했습니다.</div>");
                   } else{
                      $("#pointUseCheck").remove();
                      $("#pointUseLabelDiv").append("<div id='pointUseCheck' style='color: #2dce89;'>사용가능</div>");
                   }
                })
           } else {// 쿠폰 적용하기에 체크박스에 체크가 안되어 있는 상태라면
              po = 0;
                $("#po").val(po);
                kyul = one - ku - po; // 결제할금액 = 원래금액 - 쿠폰할인금액 - 포인트할인금액
            $("#kyul").val(kyul);
                $("#confirm_amount").text(kyul);
              $("#pointUseLabelDiv").remove();
              result = parseInt(kyul * 0.03);
              $("#confirm_point").text(result);
           }
        })
        
        $(document).on('click', '#pointUseBtn', function(){
           var one = $("#one").val();
           var kyul = $("#kyul").val();
             var ku = $("#ku").val();
             var po = $("#po").val();
           if($("#pointUseCheck").text() == '사용가능') {
              po = $("#pointUseInput").val(); // 입력한 포인트 금액을 po에 저장
              $("#po").val(po); // po hidden에 입력한 포인트 금액이 저장
              $("#confirm_amount").text(kyul - ku - po); // 결제금액에는 현재결제금액 - 쿠폰할인금액 - 포인트적용금액
              kyul = $("#confirm_amount").text();
              $("#kyul").val(kyul);
              kyul = $("#kyul").val();
              result = parseInt(kyul * 0.03);
              $("#confirm_point").text(result);
           } else {
              
           }
        })
      
        
        
     })
  </script>
  <script type="text/javascript">
  	$(function() {
  		// handler a태그 클릭시 sessionId의 핸들러 여부에 따라 호출 페이지가 달라짐.
  		$("#handler_a").click(function(){ // 핸들러 버튼을 클릭했을때
  			var id = '<%=(String)session.getAttribute("sessionId")%>'; // sessionId를 [id]라는 변수에 담아서
  			$.ajax({ // ajax 실행
			      url:"handlerIdCheck.do", // session id의 핸들러 여부를 파악하기 위해 handlerIdCheck.do 컨트롤러 호출
			      data : {
			    	  "id" : id // data는 위에서 변수로 저장한 sessionId
			      },
			      success:function(data){ // ajax가 성공했을 때
			    	  if(data == "") { // handler/handlerIdCheck에 데이터가 없다면
			    		  location.href="handler.do"; // 핸들러 신청할 수 있는 핸들러메인으로 이동
			    	  } else if(data == "N") { // handler/handlerIdCheck에 데이터가 N일때
			    		  location.href="handler.do"; // 핸들러 신청건들이 있는 핸들러 게시판으로 이동 
			    	  } else { // handler/handlerIdCheck에 데이터가 N일때
			    		  location.href="handlerBoard.do"; // 핸들러 신청건들이 있는 핸들러 게시판으로 이동 
			    	  }
			      },
			      error : function(xhr, status) { // ajax가 실패했을 때
		              swal(xhr + " : " + status); // 실패 내용 확인
		          }
			});
  		})

  	})
  </script>
</head>

<body class="">
  <nav class="navbar navbar-vertical fixed-left navbar-expand-md navbar-light bg-white" id="sidenav-main">
    <div class="container-fluid">
      <!-- Toggler -->
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#sidenav-collapse-main" aria-controls="sidenav-main" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <!-- Brand -->
      <a class="navbar-brand pt-0" href="home.do">
        <img src="resources/assets/img/brand/khaki2.png" class="navbar-brand-img" alt="...">
      </a>
      <!-- User -->
      <ul class="nav align-items-center d-md-none">
        <li class="nav-item dropdown">
          <a class="nav-link nav-link-icon" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="ni ni-bell-55"></i>
          </a>
          <div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right" aria-labelledby="navbar-default_dropdown_1">
            <a class="dropdown-item" href="#">Action</a>
            <a class="dropdown-item" href="#">Another action</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">Something else here</a>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <div class="media align-items-center">
              <span class="avatar avatar-sm rounded-circle">
                <img alt="Image placeholder" src="resources/assets/img/theme/team-1-800x800.jpg">
              </span>
            </div>
          </a>
          <div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
            <div class=" dropdown-header noti-title">
              <h6 class="text-overflow m-0">Welcome!</h6>
            </div>
            <a href="profile.do" class="dropdown-item">
              <i class="ni ni-single-02"></i>
              <span>My profile</span>
            </a>
            <a href="profile.do" class="dropdown-item">
              <i class="ni ni-settings-gear-65"></i>
              <span>Settings</span>
            </a>
            <a href="profile.do" class="dropdown-item">
              <i class="ni ni-calendar-grid-58"></i>
              <span>Activity</span>
            </a>
            <a href="profile.do" class="dropdown-item">
              <i class="ni ni-support-16"></i>
              <span>Support</span>
            </a>
            <div class="dropdown-divider"></div>
            <a href="#!" class="dropdown-item">
              <i class="ni ni-user-run"></i>
              <span>Logout</span>
            </a>
          </div>
        </li>
      </ul>
      <!-- Collapse -->
      <div class="collapse navbar-collapse" id="sidenav-collapse-main">
        <!-- Collapse header -->
        <div class="navbar-collapse-header d-md-none">
          <div class="row">
            <div class="col-6 collapse-brand">
              <a href="../index.html">
                <img src="resources/assets/img/brand/blue.png">
              </a>
            </div>
            <div class="col-6 collapse-close">
              <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#sidenav-collapse-main" aria-controls="sidenav-main" aria-expanded="false" aria-label="Toggle sidenav">
                <span></span>
                <span></span>
              </button>
            </div>
          </div>
        </div>
         <!-- Form -->
         <form class="mt-4 mb-3 d-md-none">
            <div class="input-group input-group-rounded input-group-merge">
               <input type="search" class="form-control form-control-rounded form-control-prepended" placeholder="Search" aria-label="Search">
               <div class="input-group-prepend">
                  <div class="input-group-text">
                     <span class="fa fa-search"></span>
                  </div>
               </div>
            </div>
         </form>
                <!-- 왼쪽 공통 메뉴 -->
        <ul class="navbar-nav">
          <li class="nav-item ">
             <a class=" nav-link" href="home.do"> 
                <i class="ni ni-shop text-black"></i> Home
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" href="map.do">
              <i class="ni ni-square-pin text-orange"></i> 카셰어링
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link a" href="board.do">
              <i class="ni ni-bullet-list-67 text-blue"></i> 자유게시판
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="notice.do">
              <i class="ni ni-air-baloon text-red"></i> 공지사항
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="coupon.do">
              <i class="ni ni-collection text-green"></i> 쿠폰
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " id="handler_a" style="cursor: pointer;">
              <i class="ni ni-user-run text-yellow"></i> 핸들러
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="cctv.do">
              <i class="ni ni-tv-2 text-black"></i> 교통상황 CCTV
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="nanumCar.do">
              <i class="ni ni-delivery-fast text-blue"></i> 나눔카
            </a>
          </li>
         </ul>
       <!--  -->
       <hr>
      </div>
    </div>
  </nav>
  <div class="main-content">
      <!-- Navbar -->
   <nav class="navbar navbar-top navbar-expand-md navbar-dark" id="navbar-main">
      <div class="container-fluid">
         <!-- Brand -->
         <a class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block" href="map.do">Map</a>
        <!-- 우측 상단 프로필 -->
        <ul class="navbar-nav align-items-center d-none d-md-flex">
          <li class="nav-item dropdown">
            <c:choose>
                  <c:when test="${sessionName != null }">
                  <a class="nav-link pr-0" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                       <div class="media align-items-center">
                         <span class="avatar avatar-sm rounded-circle">
                           <img alt="Image placeholder" src="${sessionPhoto}" style="width: 40px; height: 40px;">
                         </span>
                         <div class="media-body ml-2 d-none d-lg-block">
                           <span class="mb-0 text-sm  font-weight-bold">${sessionName} 님</span>
                         </div>
                       </div>
                  </a>
                       </c:when>
                 <c:when test="${sessionName == null }">
               <div>
                  <a href="login.do" style="color: white; font-weight: bold;">&nbsp;&nbsp;&nbsp;로그인&nbsp;&nbsp;&nbsp;</a>
               </div>
                 </c:when>
            </c:choose>
            <div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
              <div class=" dropdown-header noti-title">
                <h6 class="text-overflow m-0">Welcome!</h6>
              </div>
              <a href="profile.do" class="dropdown-item">
                <i class="ni ni-circle-08"></i>
                <span>회원정보 관리</span>
              </a>
              <a href="profile.do?tab=2" class="dropdown-item">
                <i class="ni ni-time-alarm"></i>
                <span>예약정보 관리</span>
              </a>
              <a href="profile.do?tab=3" class="dropdown-item">
                <i class="ni ni-user-run"></i>
                <span>핸들러 관리</span>
              </a>
              <a href="profile.do?tab=4" class="dropdown-item">
                <i class="ni ni-book-bookmark"></i>
                <span>나의 쿠폰북</span>
              </a>
              <a href="profile.do?tab=5" class="dropdown-item">
                <i class="ni ni-align-center"></i>
                <span>내가 쓴 글 확인</span>
              </a>
              <div class="dropdown-divider"></div>
              <a href="sessionLogout.do" class="dropdown-item">
                <i class="ni ni-button-power"></i>
                <span>Logout</span>
              </a>
            </div>
          </li>
        </ul>
        <!--  -->
      </div>
   </nav>
   <!-- End Navbar -->
   <!-- Header -->
    <div class="header bg-gradient-default pb-6 pt-5 pt-md-8">
      <div class="container-fluid">
        <div class="header-body">
        
        </div>
      </div>
    </div>
    
    
    <div class="container-fluid mt--7">
      <div class="row">
        <div class="col">
          <div class="card shadow border-0">
             <div class="confirm_area">
               <div class="confirm_content">
                  <div class="c_content_title">
                     <img src="https://image.flaticon.com/icons/svg/179/179372.svg" style="width: 2.777%; margin-left: 1%; margin-right: 1%;">선택 상품 확인
                  </div>
                  <div>
                     <div class="c_content">
                        <table>
                           <tr>
                              <td rowspan="8" style="width: 50%;"><img style="width: 100%;" src="${buy_carImage }"></td>
                              <td class="c_content_1">차량번호</td>
                              <td></td>
                           </tr>
                           <tr>
                              <td></td>
                              <td class="c_content_2" id="confirm_carNum">${payDTO.buy_carNum }</td>
                           </tr>
                           <tr>
                              <td class="c_content_1">차종</td>
                              <td></td>
                           </tr>
                           <tr>
                              <td></td>
                              <td class="c_content_2" id="confirm_carModel">${payDTO.buy_carModel }</td>
                           </tr>
                           <tr>
                              <td class="c_content_1">대여시간<input type="hidden" id="confirm_startTime2" value="${payDTO.buy_startTime }"></td>
                              <td></td>
                           </tr>
                           <tr>
                              <td></td>
                              <td class="c_content_2" id="confirm_startTime">${payDTO.buy_startTime }</td>
                           </tr>
                           <tr>
                              <td class="c_content_1">반납시간<input type="hidden" id="confirm_endTime2" value="${payDTO.buy_endTime }"></td>
                              <td></td>
                           </tr>
                           <tr>
                              <td></td>
                              <td class="c_content_2" id="confirm_endTime">${payDTO.buy_endTime }</td>
                           </tr>
                        </table>
                     </div>
                     <div class="c_content2">
                        <div class="confirm_content_title" style="width: 50%; float: left;">
                           보험종류
                        </div>
                        <div class="confirm_content_title" style="width: 50%; float: left;">
                           예상적립포인트
                        </div>
                        <div style="width: 50%; padding-left: 10%; float: left;" id="confirm_carIns">${payDTO.buy_carIns }</div>
                        <div style="width: 50%; padding-left: 10%; float: left;" id="confirm_point">${payDTO.buy_point }</div>
                        <div class="confirm_content_title" style="width: 100%;">
                           대여주소
                        </div>
                        <div style="width: 100%; padding-left: 10%;" id="confirm_startLocation">${payDTO.buy_startLocation }
                        </div>
                        <div class="confirm_content_title" style="width: 100%;">
                           반납주소
                        </div>
                        <div style="width: 100%; padding-left: 10%;" id="confirm_returnLocation">${payDTO.buy_returnLocation }</div>
                        <div class="confirm_content_title" style="width: 100%;">
                           결제금액
                        </div>
                        <div style="width: 100%; text-align: center;" id="amount_div">
                           <img style="width: 2.5%; float: left; margin-left: 45%; margin-right: 1%;" src="https://image.flaticon.com/icons/svg/211/211054.svg"><div id="confirm_amount" style="float: left;">${payDTO.buy_amount }</div><label style="float:left;">원</label>
                        </div>
                        <div style="width: 100%;" id="amount_div2">
                        </div>
                        <div class="pointUse">
                           <input type="checkbox" id="pointUseCheckBox" name="coupon" value="point" style="opacity: 0;"/><label id="pointUseLabel" style="cursor: pointer; margin-left: 43%; margin-top: 2%;"><img src="https://image.flaticon.com/icons/svg/1722/1722091.svg" style="width: 4%; margin-right: 1.5%;">포인트 사용하기</label>
                        </div>
                        <div class="confirm_content_title" style="clear: both;">
                           <input type="checkbox" id="couponCheckBox" name="coupon" value="coupon" style="opacity: 0;"/><label id="cpCheckLabel" style="cursor: pointer; margin-left: 43%; margin-top: 2%;"><img src="https://image.flaticon.com/icons/svg/1041/1041894.svg" style="width: 10%; margin-right: 1.5%;">쿠폰 적용하기</label>
                        </div>
                        <div>
                           <div class="fl_left" id="select_couponMethod">
                        <select name="coupon_method" id="cp_method" class="form-control_jkh input-sm coupon_method" style="margin-top: 1.3%; height: 60px;">
                           
                          </select>
                     </div>
                        </div>
                        <div class="confirm_content_title" style="width: 100%;">
                           결제수단 선택
                        </div>
                        <div style="width: 100%; text-align: center;">
                           <div class="fl_left" id="select_payMentMethod">
                        <select name="pay_method" id="region_2_n" class="form-control_jkh input-sm">
                           <option value="" class="" selected>- 결제 수단 선택 -</option>
                           <option value="card" class="payment_method">신용카드</option>
                           <option value="trans" class="payment_method" >실시간계좌이체</option>
                           <option value="vbank" class="payment_method" >가상계좌</option>
                           <option value="phone" class="payment_method" >휴대폰소액결제</option>
                          </select>
                     </div>
                        </div>
                        <div>
                           <button type="button" class="btn btn-outline-danger c_content_payBtn" id="check_module">결제하기</button>
                        </div>
                     </div>
                  </div>
                  <input type="hidden" id="one" value="0">
                  <input type="hidden" id="kyul" value="0">
                  <input type="hidden" id="ku" value="0">
                  <input type="hidden" id="po" value="0">
                  <input type="hidden" id="timeGap" value="${timeGap }">
                  <input type="hidden" id="first_amount" value="${payDTO.buy_amount }"> <!-- confirm페이지에서 처음들어온 금액 -->
                  <input type="hidden" id="buy_burum" value="${payDTO.buy_burum }"> <!-- 부름서비스 선택여부 y혹은 n이 들어옴 -->
                  <input type="hidden" id="couponSeq"> <!-- 선택한 쿠폰의 시퀀스 넘버(결제 완료 됐을때 쿠폰사용여부에 체크해주기 위함) -->
                  <form action="couponConfirm.do" id="couponFrm" name="couponFrm">
                     <input type="hidden" id="cp_id" name="cp_id" value="${sessionId }">
                     <input type="hidden" id="cp_title" name="cp_title" value=" ">
                     <input type="hidden" id="cp_type" name="cp_type" value=" ">
                     <input type="hidden" id="cp_num" name="cp_num" value=" ">
                     <input type="hidden" id="cp_end" name="cp_end" value=" ">
                     <input type="hidden" id="cp_using" name="cp_using" value=" ">
                  </form>
                  <form action="payResult.do" id="payInsert" name="payInsert">
                     <input type="hidden" id="buy_num" name="buy_num" value="1">
                     <input type="hidden" id="buy_id" name="buy_id" value=""> <!-- session에서 가져온 id -->
                     <input type="hidden" id="buy_name" name="buy_name" value="${memberDTO.name }">
                     <input type="hidden" id="buy_carIns" name="buy_carIns" value=""> <!-- table과 동일한 데이터 -->
                     <input type="hidden" id="buy_startTime" name="buy_startTime" value=""> <!-- table과 동일한 데이터 -->
                     <input type="hidden" id="buy_endTime" name="buy_endTime" value=""> <!-- table과 동일한 데이터 -->
                     
                     <input type="hidden" id="buy_real_endTime" name="buy_real_endTime" value=""> <!-- table과 동일한 데이터 -->
                     <input type="hidden" id="buy_driveDistance" name="buy_driveDistance" value=""> <!-- 주행거리(나중에 추가 됨) -->
                     <input type="hidden" id="buy_startLocation" name="buy_startLocation" value=""> <!-- table과 동일한 데이터 -->
                     <input type="hidden" id="buy_returnLocation" name="buy_returnLocation" value=""> <!-- table과 동일한 데이터 -->
                     <input type="hidden" id="buy_real_returnLocation" name="buy_real_returnLocation" value=""> <!-- table과 동일한 데이터 -->
                     
                     <input type="hidden" id="buy_carNum" name="buy_carNum" value=""> <!-- table과 동일한 데이터 -->
                     <input type="hidden" id="buy_carModel" name="buy_carModel" value=""> <!-- table과 동일한 데이터 -->
                     <input type="hidden" id="buy_point" name="buy_point" value=""> <!-- table과 동일한 데이터 -->
                     <input type="hidden" id="buy_amount" name="buy_amount" value=""> <!-- table과 동일한 데이터 -->
                     <input type="hidden" id="buy_addAmount" name="buy_addAmount" value="0"> <!-- 추가금액(나중에 추가 됨) -->
                     
                     <input type="hidden" id="buy_totalAmount" name="buy_totalAmount" value=""> <!-- 총 금액(나중에 추가 됨) -->
                     <input type="hidden" id="buy_usePoint" name="buy_usePoint" value=""> <!-- 총 금액(나중에 추가 됨) -->
                     <input type="hidden" id="buy_accident" name="buy_accident" value=""> <!-- 사고정보(나중에 추가 됨) -->
                     <input type="hidden" id="buy_coupon" name="buy_coupon" value=""> <!-- table과 동일한 데이터 -->
                     <input type="hidden" id="buy_discount" name="buy_discount" value=""> <!-- 할인받은 금액 -->
                     <input type="hidden" id="buy_useCoupon" name="buy_useCoupon" value=""> <!-- 할인받은 금액 -->
                     <input type="hidden" id="buy_burum" name="buy_burum" value="${payDTO.buy_burum }"> <!-- table과 동일한 데이터 -->
                     <input type="hidden" id="buy_impUid" name="buy_impUid" value=""> <!-- 주문번호(script에서 결제할때 추가 됨) -->
                  </form>
                  <input type="hidden" id="memberName" value="${memberDTO.name }">
                  <input type="hidden" id="memberEmail" value="${memberDTO.email_id }@${memberDTO.email_site }">
                  <input type="hidden" id="memberPhone" value="${memberDTO.phone1 }-${memberDTO.phone2 }-${memberDTO.phone3 }">
                  <input type="hidden" id="memberAddress" value="${memberDTO.address1 } ${memberDTO.address2 }">
                  <input type="hidden" id="memberPoint" value="${memberDTO.point }">
                  <script>
            $("#check_module").click(function () {
               var sessionId = '<%=(String)session.getAttribute("sessionId")%>';
               var coupon_v = $('select[name=coupon_method]').val();
               var coupon_t = $('#cp_method option:checked').text();
               var coupon_sp = coupon_t.split("(");
               $("#buy_id").val(sessionId);
                 $("#buy_carIns").val($("#confirm_carIns").text());
                 $("#buy_startTime").val($("#confirm_startTime2").val());
               $("#buy_endTime").val($("#confirm_endTime2").val());       
               $("#buy_startLocation").val($("#confirm_startLocation").text());       
               $("#buy_returnLocation").val($("#confirm_returnLocation").text());       
               $("#buy_carNum").val($("#confirm_carNum").text());       
               $("#buy_carModel").val($("#confirm_carModel").text());       
               $("#buy_point").val($("#confirm_point").text());       
               $("#buy_amount").val(parseInt($("#confirm_amount").text()) + parseInt($("#po").val()) + parseInt($("#ku").val())); 
               $("#buy_totalAmount").val($("#confirm_amount").text()); 
               $("#buy_usePoint").val($("#po").val());
               $("#buy_useCoupon").val($("#ku").val());
               $("#buy_coupon").val(coupon_sp[0]);
               $("#buy_discount").val(coupon_v);
               // 결제 필수파라미터 부분
               var radioVal = $('select[name=pay_method]').val();
               var buy_id_data = sessionId; // session id
               var buy_name_data = $("#memberName").val(); // session id로 db조회했을 때 회원 이름
               var buy_email = $("#memberEmail").val(); // session id로 db조회했을 때 회원 이메일
               var buy_phone = $("#memberPhone").val(); // session id로 db조회했을 때 회원 휴대폰번호
               var buy_addr = $("#memberAddress").val(); // session id로 db조회했을 때 회원 주소
               var buy_carModel_data = $("#confirm_carModel").text();
               var buy_amount_data = $("#buy_totalAmount").val();
               
               var IMP = window.IMP; // 생략가능
               IMP.init('imp74838776');
               // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
               // i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
               IMP.request_pay({
                  pg: 'inicis', // version 1.1.0부터 지원.
                  /*
                  'kakao':카카오페이,
                  html5_inicis':이니시스(웹표준결제)
                  'nice':나이스페이
                  'jtnet':제이티넷
                  'uplus':LG유플러스
                  'danal':다날
                  'payco':페이코
                  'syrup':시럽페이
                  'paypal':페이팔
                  */
                  pay_method: radioVal,
                  /*
                  'samsung':삼성페이,
                  'card':신용카드,
                  'trans':실시간계좌이체,
                  'vbank':가상계좌,
                  'phone':휴대폰소액결제
                  */
                  merchant_uid: 'merchant_' + new Date().getTime(),
                  /*
                  merchant_uid에 경우
                  https://docs.iamport.kr/implementation/payment
                  위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
                  참고하세요.
                  나중에 포스팅 해볼게요.
                  */
                  name: buy_carModel_data,
                  //결제창에서 보여질 이름
                  amount: buy_amount_data,
                  //가격
                  buyer_email: buy_email,
                  buyer_name: buy_name_data,
                  buyer_tel: buy_phone,
                  buyer_addr: buy_addr
                  /*
                  모바일 결제시,
                  결제가 끝나고 랜딩되는 URL을 지정
                  (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
                  */
               }, function (rsp) {
                  console.log(rsp);
                  if (rsp.success) {
                     // rsp.imp_uid은 아임포트 거래고유번호(상품주문번호로 사용가능)
                     var msg = '결제가 완료되었습니다.';
                     msg += '고유ID : ' + rsp.imp_uid;
                     msg += '상점 거래ID : ' + rsp.merchant_uid;
                     msg += '결제 금액 : ' + rsp.paid_amount;
                     msg += '카드 승인번호 : ' + rsp.apply_num;
                     $("#buy_impUid").val(rsp.imp_uid);
                     result = "ok";
                  } else {
                     var msg = '결제에 실패하였습니다.';
                     msg += '에러내용 : ' + rsp.error_msg;
                  }
                  if(result == "ok"){
                     var params = $("form[name=payInsert]").serialize();
                     console.log(params);
                     

                     if($("#buy_burum").val() == "y") {
                        $.ajax({
                           url:"burumService.do",
                           data : params,
                           success:function(data){
                           },
                           error : function(xhr, status) {
                              swal(xhr + " : " + status);
                           }
                        });
                     } else {
                     }
                                          
                                          
                     if($("#po").val() != "0") {
                        $.ajax({
                           url:"pointUseInput.do",
                           data : {
                              "id" : $("#buy_id").val(),
                              "point" : $("#pointUseInput").val()
                           },
                           success:function(){
                           },
                           error : function(xhr, status) {
                              swal(xhr + " : " + status);
                           }
                        });
                     } else {

                     }


                     if($("#ku").val() != "0") {
                        $.ajax({
                           url:"couponUsing.do",
                           data : {
                              "num" : $("#couponSeq").val()
                           },
                           success:function(){
                           },
                           error : function(xhr, status) {
                              swal(xhr + " : " + status);
                           }
                        });
                     } else {

                     }


                     $(document).ready(function(){
                        $.ajax({
                           url:"payResult.do",
                           data : params,
                           success:function(data){
                              swal("결제가 완료 되었습니다.\n예약페이지로 이동합니다.")
                              .then((value) => {
                            	  location.href="map.do";
                              });
                              
                           },
                           error : function(xhr, status) {
                              swal(xhr + " : " + status);
                           }
                        })
                     })         
                     
                  }else{
                     swal("실패");
                  }
               });
               
            });
            </script>
               </div>
             </div>
          </div>
        </div>
      </div>
      <!-- Footer -->
      <!-- Footer -->
      <footer class="footer">
        <div class="row align-items-center justify-content-xl-between">
          <div class="col-xl-6">
            <div class="copyright text-center text-xl-left text-muted">
              &copy; 2018 <a href="https://www.creative-tim.com" class="font-weight-bold ml-1" target="_blank">Creative Tim</a>
            </div>
          </div>
          <div class="col-xl-6">
            <ul class="nav nav-footer justify-content-center justify-content-xl-end">
              <li class="nav-item">
                <a href="https://www.creative-tim.com" class="nav-link" target="_blank">Creative Tim</a>
              </li>
              <li class="nav-item">
                <a href="https://www.creative-tim.com/presentation" class="nav-link" target="_blank">About Us</a>
              </li>
              <li class="nav-item">
                <a href="http://blog.creative-tim.com" class="nav-link" target="_blank">Blog</a>
              </li>
              <li class="nav-item">
                <a href="https://github.com/creativetimofficial/argon-dashboard/blob/master/LICENSE.md" class="nav-link" target="_blank">MIT License</a>
              </li>
            </ul>
          </div>
        </div>
      </footer>
    </div>
  </div>
  <!--   Core   -->
  <script src="resources/assets/js/plugins/jquery/dist/jquery.min.js"></script>
  <script src="resources/assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <!--   Optional JS   -->
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
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