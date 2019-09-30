<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
   		// 
   		$("#cTitle1").keyup(function(){
   			var cTitle1 = $("#cTitle1").val();
   			if(cTitle1 >= 24) {
   				cTitle1 -= 24;
   			}
   			var result = parseInt(cTitle1) + 4;
   			if(result >= 24) {
   				result -= 24;
   			}
   			$("#realCpp1").text(cTitle1);
   			$("#realCppp1").text(result);
   		})
   		$("#cTitle2").keyup(function(){
   			var cTitle2 = $("#cTitle2").val();
   			$("#realCpp2").text(cTitle2);
   		})
   		
   		$("#discount").keyup(function(){
   			var cDiscount = $("#discount").val();
   			$("#discount").val($.trim(cDiscount));
   			cDiscount = $("#discount").val();
   			
   			if($.isNumeric($("#discount").val()) == true) {
   				
   			} else {
   				$("#discount").val("");
   			}
   				
   				
   			$("#realDiscount").text(cDiscount);
   		})
   		
   		$("#cpOption").change(function(){
	   		var option = $("#cpOption option:selected").val();
	   		if(option == "M") {
	   			$("#realOption").text("원");
	   			$("#realOption1").text("원 ");
	   			$("#realDiscount").css("left", "28%");
	   		} else {
	   			$("#realOption").text("%");
	   			$("#realOption1").text("% ");
	   			$("#realDiscount").css("left", "33%");
	   		}
   			
   		})
   		
   		$("#year").change(function(){
   			var year = $("#year option:selected").val();
   			$("#endTimeYear").text(year+".");
   		})
   		
   		$("#month").change(function(){
   			var month = $("#month option:selected").val();
   			$("#endTimeMonth").text(month+".");
   		})
   		
   		$("#day").change(function(){
   			var day = $("#day option:selected").val();
   			$("#endTimeDay").text(day);
   		})
   		$("#download").mouseover(function(){
   			$(this).css("background-color", "#00000045");
   		})
   		$("#download").mouseleave(function(){
   			$(this).css("background-color", "");
   		})
   		
   		$("#cpBtn").click(function(){
   			var num = 0;
   			var cId = "";
   			var cTitle1 = $("#realCp1").text();
   			var cTitle2 = $("#realCp2").text();
   			var option = $("#cpOption option:selected").val();
   			var cOption = option;
   			var discount = $("#realDiscount").text();
   			var year = $("#year option:selected").val();
   			year = parseInt(year) - 2000;
   			var month = $("#month option:selected").val();
   			var day = $("#day option:selected").val();
   			var endDate = year+"."+month+"."+day;
   			var cpCondition = "3";
   			/* $.ajax({
	 			url:"cpConditionInsert.do",
	 			data : {
	 				"title" : cTitle1,
	 				"content" : cTitle2,
	 				"cOption" : cOption
	 			},
	 			success:function(data){
	 				alert("성공했습니다.");
	 				
	 			},
	 			error : function(xhr, status) {
	 				alert(xhr + " : " + status);
	 			}
	 		}); */
   			$.ajax({
	 			url:"insertCp.do",
	 			data : {
	 				"num" : num,
	 				"cId" : cId,
	 				"cTitle1" : cTitle1,
	 				"cTitle2" : cTitle2,
	 				"cOption" : cOption,
	 				"discount" : discount,
	 				"endDate" : endDate,
	 				"cpCondition" : cpCondition
	 			},
	 			success:function(data){
	 				alert("쿠폰 등록에 성공했습니다.");
	 				location.href="admin_coupon3.do";
	 				
	 			},
	 			error : function(xhr, status) {
	 				alert(xhr + " : " + status);
	 			}
	 		});
   			
   			
   		})
   		
   		
   		
   		
   	})
   </script>
</head>
<body>
   <div id="tabs-icons-text-6" role="tabpanel" aria-labelledby="tabs-icons-text-6-tab" >
   <jsp:useBean id="now" class="java.util.Date"/>
      <div style="width: 50%; float: left; border-right: 8px solid #f5f5f5; padding: 1%;">
         <div id="cpPage" style="width:100%; text-align:right; margin-bottom: 10px; position: relative;">
         
            <div id="cpFrame" style="width: 100%;">
               <img src="resources/assets/img/icons/coupon/coupon.png" style="width: 100%;">
               <div id="realCp1" style="word-wrap:break-word; position: absolute; top: 42%; left: 32%; width: 255px; color: white; font-size: 23px; font-weight: bold; text-align: center;"><label id="realCpp1"></label>시 ~ <label id="realCppp1"></label>시 사이 출발시</div>
               <div id="realCp2" style="word-wrap:break-word; position: absolute; top: 47%; left: 32%; width: 255px; color: white; font-size: 23px; font-weight: bold; text-align: center;"><label id="realCpp2"></label><label id="realOption1" style="margin-right: 1%;"></label><label>할인 쿠폰!!</label></div>
               <div id="realOption" style="word-wrap:break-word; position: absolute; top: 50%; left: 58%; width: 20px; color: #ffcd4a; font-size: 60px; font-weight: bold; text-align: center;">
               </div>
               <div id="realDiscount" style="word-wrap:break-word; position: absolute; top: 50%; left: 28%; width: 260px; color: #ffcd4a; font-size: 60px; font-weight: bold; text-align: center;">
               </div>
               <div id="endTimeYear" style="word-wrap:break-word; position: absolute; top: 62%; left: 35%; width: 90px; color: white; font-size: 25px; font-weight: bold; text-align: center;">
               		${now.year+1900 }.
               </div>
               <div id="endTimeMonth" style="word-wrap:break-word; position: absolute; top: 62%; left: 43%; width: 90px; color: white; font-size: 25px; font-weight: bold; text-align: center;">
               		.
               </div>
               <div id="endTimeDay" style="word-wrap:break-word; position: absolute; top: 62%; left: 48%; width: 90px; color: white; font-size: 25px; font-weight: bold; text-align: center;">
               		
               </div>
               <div id="endTimeText" style="word-wrap:break-word; position: absolute; top: 62%; left: 54%; width: 90px; color: white; font-size: 25px; font-weight: bold; text-align: center;">
               		까지
               </div>
               <div id="download" style="word-wrap:break-word; position: absolute; top: 70%; left: 33%; width: 235px; color: white; font-size: 33px; font-weight: bold; text-align: center; border: 1px solid white; cursor: pointer;">
               		<div style="border: 1px solid white;">다운로드</div>
               </div>
            </div>
         </div>
      </div>
      <div id="cpInsert" style="text-align:center; width: 50%; float: left; padding: 1%;">
         <div>
            <div>
               <h1>쿠폰 등록</h1>
            </div>
               <label>이용 시간</label>&nbsp;&nbsp;&nbsp;<input type="text" id="cTitle1" name="cTitle1" placeholder="이용조건 시간을 입력해주세요." style="width: 35%;"><br><br>
               <label>할인 금액</label>&nbsp;&nbsp;&nbsp;<input type="text" id="cTitle2" name="cTitle2" placeholder="할인금액을 입력해주세요." style="width: 35%;"><br><br>
               <label>할인정도</label>&nbsp;&nbsp;&nbsp;<input type="text" id="discount" name="discount" maxlength="5"><br><br>
               <label>할인옵션</label>&nbsp;&nbsp;&nbsp;<select id="cpOption" name="option"><option value="">선택</option><option value="M">₩ 할인</option><option value="P">% 할인</option></select><br><br>
               <label>유효기간</label>&nbsp;&nbsp;&nbsp;
                   <select id="year" name="year">
                       <c:forEach var="i" begin="2019" end="2024" step="1" >
                           <option value="${i}" <c:if test="${i == (now.year + 1900)}">selected</c:if> >${i}년</option>
                       </c:forEach>
                   </select>
                   <select id="month" name="month">
                       <c:forEach var="i" begin="1" end="12" step="1" varStatus="status" >
                          
                           <option value="${status.index}"> ${status.index}월</option>
                       </c:forEach>
               </select>
               <select id="day">
                      <c:forEach var="i" begin="1" end="31" step="1" varStatus="status">
                           <option value="${status.index}"> ${status.index}일</option>
                      </c:forEach>
               </select><br><br>
               <button type="button" class="btn btn-default" id="cpBtn">쿠폰 등록</button>
               <br><br><br><br>
               <h1>조건 변경하기</h1><br>
               <button type="button" class="btn btn-outline-default" style="width: 30%; font-size: 15px; margin: 0 5% 0 5%;" onclick="location.href='admin_coupon1.do'">~이상 결제시</button>
		      	<button type="button" class="btn btn-outline-default" style="width: 30%; font-size: 15px; margin: 0 5% 0 5%;" onclick="location.href='admin_coupon2.do'">~시간 이용시</button>
         </div>
      </div>
      
   </div>
</body>
</html>