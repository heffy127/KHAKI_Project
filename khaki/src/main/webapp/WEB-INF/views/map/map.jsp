<%@page import="co.kr.khaki.zone.KhakiZoneDTO"%>
<%@page import="co.kr.khaki.zone.KhakiZoneDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<style>
select{
   width: 19%;
   height: 60px;
   text-align: center;
}
.wrap {
   position: absolute;
   left: 0;
   bottom: 40px;
   width: 288px;
   height: 132px;
   margin-left: -144px;
   text-align: left;
   overflow: hidden;
   font-size: 12px;
   font-family: 'Do Hyeon', sans-serif;
   line-height: 1.5
}

.wrap* {
   padding: 0;
   margin: 0
}

.wrap.info {
   width: 286px;
   height: 120px;
   border-radius: 5px;
   border-bottom: 2px solid #ccc;
   border-right: 1px solid #ccc;
   overflow: hidden;
   background: #fff
}

.wrap.info:nth-child(1) {
   border: 0;
   box-shadow: 0px 1px 2px #888
}

.info.title {
   padding: 5px 0 0 10px;
   height: 30px;
   background: #eee;
   border-bottom: 1px solid #ddd;
   font-size: 18px;
   font-weight: bold
}

.info.close {
   position: absolute;
   top: 10px;
   right: 10px;
   color: #888;
   width: 17px;
   height: 17px;
   background:
      url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png')
}

.info.close:hover {
   cursor: pointer
}

.info.body {
   position: relative;
   overflow: hidden
}

.info.desc {
   position: relative;
   margin: 13px 0 0 90px;
   height: 75px
}

.desc.ellipsis {
   overflow: hidden;
   text-overflow: ellipsis;
   white-space: nowrap
}

.desc.jibun {
   font-size: 11px;
   color: #888;
   margin-top: -2px
}

.info.img {
   position: absolute;
   top: 6px;
   left: 5px;
   width: 73px;
   height: 71px;
   border: 1px solid #ddd;
   color: #888;
   overflow: hidden
}

.info:after {
   content: '';
   position: absolute;
   margin-left: -12px;
   left: 50%;
   bottom: 0;
   width: 22px;
   height: 12px;
   background:
      url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.info.link {
   color: #5085BB
}
</style>
<title>1등 카셰어링, khaki</title>
<%
String sessionId = (String)session.getAttribute("sessionId"); //세션아이디를 가져옴
List<KhakiZoneDTO> list = (List<KhakiZoneDTO>)request.getAttribute("list"); //DB의 모든 카키존 정보를 가져옴
int strTimeCheck = 0; 
int endTimeCheck = 0;
double loc_x = 0;
double loc_y = 0;
String selectZoneNum = "";
if(request.getAttribute("selectZoneNum1")==null){
selectZoneNum = "";
	for(int k = 0; k<list.size(); k++){
		selectZoneNum = selectZoneNum + Integer.toString(k) + ",";
	} 
} else {
	selectZoneNum = (String)request.getAttribute("selectZoneNum1");
}
%>
<input id="selectZoneNum" type ="hidden" value='<%=selectZoneNum%>'>
<input id="sessionId" type ="hidden" value=<%=sessionId%>>
<input id="selectCarNum" type ="hidden" value='${selectCarNum}'>
<input id="car_num" type ="hidden">
<input id="buy_ins" type ="hidden" value="스페셜">
<input id="buy_carModel" type ="hidden">
<input id="buy_startTime" type ="hidden" value='${buy_startTime}'>
<input id="buy_endTime" type ="hidden" value='${buy_endTime}'>

</script>
<!-- ajax  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 주소 api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- Favicon -->
<link href="resources/assets/img/brand/favicon.png" rel="icon" type="image/png">
<!-- Fonts -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
<!-- Icons -->
<link href="resources/assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
<link href="resources/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" />
<!-- CSS Files -->
<link href="resources/assets/css/argon-dashboard.css?v=1.1.0" rel="stylesheet" />
<!-- 지도 api -->
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1148d6f91cf7fd9a3c17408122e52f57&libraries=services"></script>
<!-- 주소 api -->
<script>
   function sample5_execDaumPostcode() {
      new daum.Postcode({
         oncomplete : function(data) {
            var addr = data.address; // 최종 주소 변수

            // 주소 정보를 해당 필드에 넣는다.
            document.getElementById("sample5_address").value = addr;
            // 주소로 상세 정보를 검색
            geocoder.addressSearch(data.address, function(results, status) {
               // 정상적으로 검색이 완료됐으면
               if (status === daum.maps.services.Status.OK) {

                  var result = results[0]; //첫번째 결과의 값을 활용

                  // 해당 주소에 대한 좌표를 받아서
                  var coords = new daum.maps.LatLng(result.y, result.x);
                  // 지도를 보여준다.
                  mapContainer.style.display = "block";
                  map.relayout();
                  // 지도 중심을 변경한다.
                  map.setCenter(coords);
                  // 마커를 결과값으로 받은 위치로 옮긴다.
                  marker.setPosition(coords)
               }
            });
         }
      }).open();
   }
</script>
<!-- loadView -->
<script type="text/javascript">
function loadView(x,y) {
	$('#loadViewDIV').empty();
	$('#loadViewDIV').append("<iframe src='loadView.do?x="+ y + "&y="+ x +"' style='width: 100%; height: 430px;'></iframe>");
}
</script>

<!-- modal 닫기, 시간/차량/보험 정보 변수 -->
<script type="text/javascript"> 
   function burumClose1() { // 부름 장소설정 , 다음 눌렀을 때 부름 금액 크롤링하여 다음 모달에 보여줌
      $('#burum1').modal("hide"); //닫기 
      var number = parseInt($('#zoneNumber').val());
      var zone_loc = zone_addr[number];
      var home_loc = $('#sample5_address').val();
      
      if(zone_loc != home_loc){
    	  $('input[name=buy_burum]').val("y");
      } else {
    	  $('input[name=buy_burum]').val("n");
      }
      
      $.ajax({
         type : "POST",
         url : "burumReservation.do",
         data : {
            'zone_loc' : zone_loc,
            'home_loc' : home_loc
         },
         error : function(error) {
            alert("오류발생" + error);
         },
         success : function(data) {
            $('#burumFee').val(data);
         }
      })
   }
   function burumClose3() {
      $('#insurance').modal("hide");
   }
   function burumClose2() {
      $('#burum2').modal("hide"); //닫기 
   }
   function modalClose() {
      $('#reservation').modal("hide"); //닫기 
      var eeee = parseInt($('#zoneNumber').val());
      var buy_startLocation = zone_addr[eeee];
      $('#sample5_address').val(buy_startLocation);
      $('input[name=buy_returnLocation]').val(buy_startLocation);
      
   }
   function modalClose_1() {
      $('#reservation').modal("hide"); //닫기
      $('#sample5_address').val(null);
   }
   
   function modalClose1() {
      var startTime = $('#startTime').val();
      var endTime = $('#endTime').val();
      $('#reservation1').modal("hide"); //닫기
      $('#buy_startTime').val(startTime);
      $('#buy_endTime').val(endTime);
   }
   function modalClose2() {
      $('#reservation2').modal("hide"); //닫기 
   }
   function modalClose2_1(car) {
      $('#reservation2_1').modal("hide"); //닫기 
      $('#buy_carModel').val(car);
   }
   function modalClose2_2(car) {
      $('#reservation2_2').modal("hide"); //닫기 
      $('#buy_carModel').val(car);
   }
   function modalClose2_3(car) {
      $('#reservation2_3').modal("hide"); //닫기 
      $('#buy_carModel').val(car);
   }
   function modalClose3() {
      $('#reservation3').modal("hide"); //닫기 
   }
   function insSelect(arg1) {
      $('#buy_ins').val(arg1);
   }
   
</script>
<!-- 조건 입력 후 ajax  -->
<script type="text/javascript">

   var selectZoneNum1 = $('#selectZoneNum').val();
   // 세션에 들어있는 존 번호 나열(string)을 가져옴
   var selectZoneNum2 = selectZoneNum1.split(",");
   var selectZoneNum = [];
   var carNums="";
   var zones="";
   for (var i = 0; i < selectZoneNum2.length-1; i++) {
      selectZoneNum[i] = parseInt(selectZoneNum2[i]);
   }
   // 선택된 존 번호 배열로 맵에 마커를 나타냄
   // 맨 처음에는 모든 마커 나타내도록 되어있음
   
   // 처음 접속시 현재시간으로 예약 시작시간 셋팅하기 위해--------
   var d = new Date();
   function rererere() {
      $('#timeCheck').attr('disabled', true);
   }
   //---------------------------------------------------------------------------------------
   
   function leadingZeros(n, digits) {
        var zero = '';
        n = n.toString();

        if (n.length < digits) {
          for (var i = 0; i < digits - n.length; i++)
            zero += '0';
        }
       return zero + n;
   }
   
   function startTimeButton() {
	   var allTimeStr = $('#startYear').val() + $('#startMonth').val() + $('#startDay').val() + $('#startClock').val() + $('#startMin').val();
	   var tempY = String(d.getFullYear());
	      tempY = tempY.substr(2,3); // "19"
	      
	      var tempM = d.getMonth()+1;
	      tempM = String(leadingZeros(tempM,2)); // "09"
	      
	      var tempD = d.getDate();
	      tempD = String(leadingZeros(tempD,2)); // "04"
	      
	      var tempH = d.getHours();
	      tempH = String(leadingZeros(tempH,2)); // "13"

	      var tempMs = d.getMinutes();
	      tempMs = String(leadingZeros(tempMs,2)); // "35"
	      
	      var allTimePre = tempY + tempM + tempD + tempH + tempMs;
	   if(allTimeStr>=allTimePre){
		   alert("선택되었습니다.")
		   $('#endTimeButton').attr('disabled', false);
		   $('#startTimeButton').attr('disabled', true);
		   $('#startYear').attr('disabled', true);
		   $('#startMonth').attr('disabled', true);
		   $('#startDay').attr('disabled', true);
		   $('#startClock').attr('disabled', true);
		   $('#startMin').attr('disabled', true);
	   } else{
		   alert("현재시간 이후로 입력해주세요.")
	   }
}
   function endTimeButton() {
	   var allTimeStr = $('#startYear').val() + $('#startMonth').val() + $('#startDay').val() + $('#startClock').val() + $('#startMin').val();
	   var allTimeEnd = $('#endYear').val() + $('#endMonth').val() + $('#endDay').val() + $('#endClock').val() + $('#endMin').val();
	      var allTime = parseInt(allTimeEnd) + 100 - parseInt(allTimeStr);
	      if(allTime >= 0){
	         alert("선택되었습니다.")
	         $('#endTimeButton').attr('disabled', true);
		     $('#endYear').attr('disabled', true);
		     $('#endMonth').attr('disabled', true);
		     $('#endDay').attr('disabled', true);
		     $('#endClock').attr('disabled', true);
		     $('#endMin').attr('disabled', true);
	         $('#timeCheck').attr('disabled', false);
	      } else{
	    	 alert("시작시간 이후로 입력해주세요.");
	         $('#timeCheck').attr('disabled', true);
	      }
}
   function timeReset() {
	   $('#endTimeButton').attr('disabled', true);
	   $('#startTimeButton').attr('disabled', false);
	   $('#startYear').attr('disabled', false);
	   $('#startMonth').attr('disabled', false);
	   $('#startDay').attr('disabled', false);
	   $('#startClock').attr('disabled', false);
	   $('#startMin').attr('disabled', false);
	   $('#endYear').attr('disabled', false);
	   $('#endMonth').attr('disabled', false);
	   $('#endDay').attr('disabled', false);     
	   $('#endClock').attr('disabled', false);
	   $('#endMin').attr('disabled', false);
       $('#timeCheck').attr('disabled', true);
}
   function reset() {
      var zones = "0,1,2,3,4,5,6,7,8,9,";
      var buy_startTime = null;
      var buy_endTime = null;
      var carNums = null;
      location.href="mapReset.do?selectZoneNum=" + zones + "&startTime="+buy_startTime+"&endTime="+buy_endTime+"&carNums="+carNums;
   }
   function searchCar() { //reservation table에서 선택한 차량에 해당하는 건을 모두 가져옴
      $('#reservation3').modal("hide"); //닫기 
      var buy_carModel = $('#buy_carModel').val(); //선택된 차종
      var buy_startTime = $('#startYear').val() + $('#startMonth').val() + $('#startDay').val() + $('#startClock').val() + $('#startMin').val(); //입력된 시작시간
      var buy_endTime = $('#endYear').val() + $('#endMonth').val() + $('#endDay').val() + $('#endClock').val() + $('#endMin').val(); //입력된 반납시간
      $.ajax({
         type : "POST",
         url : "search1.do",
         data : {'buy_carModel' : buy_carModel},
         error : function(error) {
            alert("오류발생" + error);
         },
         success : function(data) { //data : 30허1111,3★30허1111,3★
        	if(data.trim()==""){
        		alert("조건에 만족하는 회사가 없습니다. 시간이나 차종을 다시 선택하세요.")
        	}
            var temp2 = data.split("★");   // 배열 temp2
            var carNums = "";
            var zones ="";
            var ee = 0;
            temp2.forEach(function(element) { //해당하는 차종 모두 실행
               var temp1 = element.split(",");
               /* 시작시간으로 비교한 값 */
               /* 반납시간으로 비교한 값 */
               /* 두 값 비교하여 예약가능여부 도출 */
               // DB에서 가져온 자료들 temp1
               temp1[0]=temp1[0].trim(); // 30호1111
               temp1[1]=temp1[1].trim(); // 3
               $.ajax({ //-----------------------------------------------------
                  type:"POST",
                  url : "search2.do",
                  data : {
                     'buy_endTime':buy_endTime,
                     'buy_startTime':buy_startTime,
                     'buy_carNum':temp1[0]
                  },
                  error : function(error) {
                     alert("오류발생" + error);
                  },
                  success : function(data) { // 조건에 만족하는 차량정보들을 나열한 문자 : data
                     ee = ee+1;
                     if(data.trim()=="y"){ 
                        carNums = carNums + temp1[0] + ",";
                        $('#car_num').val(carNums);
                        zones = zones + temp1[1] + ",";
                        $('#selectZoneNum').val(zones);
                     }
                     
                     if (ee == temp2.length-1){
                        location.href="mapReset.do?selectZoneNum=" + zones + "&startTime="+buy_startTime+"&endTime="+buy_endTime+"&carNums="+carNums;
                     }
                  }
               }) //-----------------------------------------------------
            })
            
         }
      })
      // alert($('#car_num').val());
      // 조건에 만족하는 차량들로 마커 재구성
   }
</script>
<!-- 조건에 맞는 차량번호, 존번호 ajax -->
<script type="text/javascript">
//숫자가 아닌 정규식
var replaceNotInt = /[^0-9]/gi;

$(document).ready(function(){
    $("#startTime").on("focusout", function() {
        var x = $(this).val();
        if (x.length > 0) {
            if (x.match(replaceNotInt)) {
               x = x.replace(replaceNotInt, "");
            }
            $(this).val(x);
        }
    }).on("keyup", function() {
        $(this).val($(this).val().replace(replaceNotInt, ""));
    });
});

$(document).ready(function(){
    $("#endTime").on("focusout", function() {
        var x = $(this).val();
        if (x.length > 0) {
            if (x.match(replaceNotInt)) {
               x = x.replace(replaceNotInt, "");
            }
            $(this).val(x);
        }
    }).on("keyup", function() {
        $(this).val($(this).val().replace(replaceNotInt, ""));
    });
});

function carListInfo(i) { //마컴를 클릭하면 해당 존 차량들을 모두 가져옴
                          // 존에 아무것도 없을 떄 오류남
   $("#carList").empty(); //기존에 있던 내용 지움
   $("#markerAddr").empty(); //기존에 있던 내용 지움
   $("#markerAddr").append(
		   '<h2 class="badge badge-pill badge-primary">'+zone_addr[i]+'</h2>'
			 );
   $.ajax({
      type : "POST",
      url : "carListInfo.do",
      data : {
         'zoneNum' : i
      },
      error : function(error) {
         alert("오류발생" + error);
      },
      success : function(data) {
         var xx = data.trim();
         var x1 = (xx).split("★"); // 해당 존에 있는 차량 갯수보다 1개 많은 배열로 생성됨
         var x2 = [];
         var car_num = null;
         var fee_hour = null;
         
         for (var i = 0; i < x1.length-1; i++) { // x1 배열갯수 -1 하여 for문
            x2 = x1[i].split(",");
         //x2[0] = 주행거리
         //x2[1] = 연료충전량
         //x2[2] = 차량이미지 (~~png)
         //x2[3] = 차량번호(30호1111)
         //x2[4] = 연료타입
         //x2[5] = 시간당 대여비용
         //x2[6] = 차량타입
         var x3 = x2[3] + "," + x2[6];
         var x4 =$('#selectCarNum').val();
         var xxxx = '${selectCarNum}';
         if(xxxx!=null){
        	 $("#markerAddr").append(
        			   '<h2 class="badge badge-success"> '+x2[6]+' </h2>'
        				 );
	         if(xxxx.indexOf(x2[3])==(-1)){
	        	 
	        	 $("#carList").append( // 마커클릭 후 오른쪽에 추가되는 내용들
	     	            '<tr><td width="30%"><img alt="" src="'+x2[2]+'" width="80%"></td>'
	     	            +'<td width="30%"><strong>'+x2[0]+'</strong></td>'
	     	            +'<td width="30%">'+x2[4]+" / "+x2[1]+'% </td>'
	     	            +'<td width="30%"><button id="res_start" type="button" class="btn btn-outline-danger" onclick="inputCheck()" data-toggle="modal" data-target="#reservation" value="'+x3+'" disabled>'+x2[6]+'</button></td></tr>'
	     	         );	 
	         } else {
				$("#carList").append( // 마커클릭 후 오른쪽에 추가되는 내용들
	        	          '<tr><td width="30%"><img alt="" src="'+x2[2]+'" width="80%"></td>'
	        	          +'<td width="30%"><strong>'+x2[0]+'</strong></td>'
	        	          +'<td width="30%">'+x2[4]+" / "+x2[1]+'% </td>'
	        	          +'<td width="30%"><button id="res_start" type="button" class="btn btn-outline-info" onclick="inputCheck()" data-toggle="modal" data-target="#reservation" value="'+x3+'">'+x2[6]+'</button></td></tr>'
	        	      );	 
	         }
         }
      
   }}
})
}

$(document).on('click','#res_start', function () {
   var xxxx = $(this).attr("value");
   var xxxx2 = xxxx.split(",");
   $('#selectCarNum').val(xxxx2[0]);
   $('#buy_carModel').val(xxxx2[1]);
})

</script>
<!-- 부름예약시 거리 및 비용계산 -->
<script type="text/javascript">
   function burum() { //부름예약시 실행 > 시작점과 도착점의 거리, 비용을 계산 (크롤링)
      $('#insurance').modal("hide"); //닫기 
      var number = parseInt($('#zoneNumber').val());
      var zone_loc = zone_addr[number];
      var home_loc = $('#sample5_address').val();
      alert(number + " - " + home_loc + " - " + zone_loc);
      $.ajax({
         type : "POST",
         url : "burumReservation.do",
         data : {
            'zone_loc' : zone_loc,
            'home_loc' : home_loc
         },
         error : function(error) {
            alert("오류발생" + error);
         },
         success : function(data) {
            alert("크롤링 성공했다 치고 : "+data)
         }
      })
   }
</script>
<!-- 최종예약하기 -->
<script type="text/javascript">
function reservation() {
   $('#insurance').modal("hide"); //닫기 
   var buy_id = $('#sessionId').val(); 
   $('input[name=buy_id]').val(buy_id);
   var buy_carModel = $('#buy_carModel').val();
   $('input[name=buy_carModel]').val(buy_carModel);
   var buy_carNum = $('#selectCarNum').val();
   $('input[name=buy_carNum]').val(buy_carNum);
   var buy_startTime = $('#buy_startTime').val();
   $('input[name=buy_startTime]').val(buy_startTime);
   var buy_endTime = $('#buy_endTime').val();
   $('input[name=buy_endTime]').val(buy_endTime);
   var buy_startLocation=$('#sample5_address').val();
   $('input[name=buy_startLocation]').val(buy_startLocation);
   var buy_amount=null; // 대여시 최종금액
   $('input[name=buy_amount]').val(buy_amount);
   var buy_ins = $('#buy_ins').val();
   $('input[name=buy_carIns]').val(buy_ins);
   //---------------------- 해당차량 초기지불금액 계산 (대여비 + 보험료)
   var insFee = null;
   
   if(buy_ins=='스페셜'){
      insFee = 0.2;
   } else if(buy_ins=='스텐다드'){
      insFee = 0.15;
   } else {
      insFee = 0.1;
   }
   
   
   var use_time = buy_endTime - buy_startTime; // 대여시간
   var use_day = parseInt(use_time/10000); // 日 시간금액*24
   var use_hour = 0;
   var use_min = 0;
   var strMin = parseInt(buy_startTime.substr(8,2));
   var endMin = parseInt(buy_endTime.substr(8,2));
   var strHour = parseInt(buy_startTime.substr(6,2));
   var endHour = parseInt(buy_endTime.substr(6,2));
   
   if ((endMin-strMin)>=0){
	   use_min = endMin-strMin;
   } else {
	   use_min = 60-(strMin-endMin);
	   endHour = endHour - 1;
   }
 //----------
   if ((endHour-strHour)>= 0){
	   use_hour = endHour-strHour;
	   alert(endHour-strHour)
   } else {
	   use_hour = 24-(strHour-endHour);
	   alert(endHour-strHour)
   }
 //----------
   $.ajax({
         type : "POST",
         url : "carNumSearch.do",
         data : {
            'car_num' : buy_carNum
         },
         error : function(error) {
            alert("오류발생" + error);
         },
         success : function(data) {
            var ww = data.split(",");
            var timeFee = parseInt(ww[0].trim());
            var carImage = ww[1].trim();
            buy_amount = (timeFee*24*use_day)+(use_hour*timeFee)+(use_min*timeFee*(1/60));
            buy_amount = parseInt(buy_amount + (buy_amount*insFee));   
            $('input[name=buy_amount]').val(buy_amount);
            $('input[name=buy_carImage]').val(carImage);
            $('#confirm').submit();
         }
      })
   //-------------------------------------------------------------------------------
}
$(document).ready(
		function() { //면허가 없으면 예약불가
			var sessionId = $('#sessionId').val();
			$.ajax({
		        type : "POST",
		        url : "mapLisence.do",
		        data : {
		           'sessionId' : sessionId
		        },
		        error : function(error) {
		           alert("오류발생" + error);
		        },
		        success : function(data) {
		        	if(data.trim()=="?"){
			        	$('#reserveSelectBox').attr("disabled","disabled")
			        	$('#reserveSelectBox').text("면허승인 후 예약가능합니다.")
			        	$('#resetBox').remove();
		        	} else if (data.trim()=="x"){
				        $('#reserveSelectBox').attr("disabled","disabled")
			        	$('#reserveSelectBox').text("면허승인 후 예약가능합니다.")
			        	$('#resetBox').remove();
		        	} else if (data.trim()==""){
				        $('#reserveSelectBox').attr("disabled","disabled")
			        	$('#reserveSelectBox').text("면허승인 후 예약가능합니다.")
			        	$('#resetBox').remove();
		        	} 
		        }
		     })
		}
		);

</script>
<div class="d-flex align-items-center">
   <img alt="" src="" width="10"> <span class="mr-2">100%</span>
   <div>
      <div class="progress">
         <div class="progress-bar bg-success" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%;"></div>
      </div>
   </div>
</div>
</head>
<body>

<form action="confirm.do" id="confirm" method="post">
   <input name="buy_id" type="hidden">
   <input name="buy_carIns" type="hidden">
   <input name="buy_carModel" type="hidden">
   <input name="buy_carNum" type="hidden">
   <input name="buy_startTime" type="hidden">
   <input name="buy_endTime" type="hidden">
   <input name="buy_startLocation" type="hidden">
   <input name="buy_returnLocation" type="hidden">
   <input name="buy_amount" type="hidden">
   <input name="buy_carImage" type="hidden">
   <input name="buy_burum" type="hidden">
</form>

<nav class="navbar navbar-vertical fixed-left navbar-expand-md navbar-light bg-white" id="sidenav-main">
   <div class="container-fluid">
      <!-- Toggler -->
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#sidenav-collapse-main" aria-controls="sidenav-main" aria-expanded="false" aria-label="Toggle navigation">
         <span class="navbar-toggler-icon"></span>
      </button>
      <!-- Brand -->
      <a class="navbar-brand pt-0" href="home.do"> <img src="resources/assets/img/brand/khaki2.png" class="navbar-brand-img" alt="...">
      </a>
      <!-- User -->
      <ul class="nav align-items-center d-md-none">
         <li class="nav-item dropdown"><a class="nav-link nav-link-icon" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="ni ni-bell-55"></i>
         </a>
            <div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right" aria-labelledby="navbar-default_dropdown_1">
               <a class="dropdown-item" href="#">Action</a> <a class="dropdown-item" href="#">Another action</a>
               <div class="dropdown-divider"></div>
               <a class="dropdown-item" href="#">Something else here</a>
            </div></li>
         <li class="nav-item dropdown"><a class="nav-link" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
               <div class="media align-items-center">
                  <span class="avatar avatar-sm rounded-circle"> <img alt="Image placeholder" src="resources/assets/img/theme/team-1-800x800.jpg">
                  </span>
               </div>
         </a>
            <div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
               <div class=" dropdown-header noti-title">
                  <h6 class="text-overflow m-0">Welcome!</h6>
               </div>
               <a href="profile.do" class="dropdown-item"> <i class="ni ni-single-02"></i> <span>My profile</span>
               </a> <a href="profile.do" class="dropdown-item"> <i class="ni ni-settings-gear-65"></i> <span>Settings</span>
               </a> <a href="profile.do" class="dropdown-item"> <i class="ni ni-calendar-grid-58"></i> <span>Activity</span>
               </a> <a href="profile.do" class="dropdown-item"> <i class="ni ni-support-16"></i> <span>Support</span>
               </a>
               <div class="dropdown-divider"></div>
               <a href="#!" class="dropdown-item"> <i class="ni ni-user-run"></i> <span>Logout</span>
               </a>
            </div></li>
      </ul>
      <!-- Collapse -->
      <div class="collapse navbar-collapse" id="sidenav-collapse-main">
         <!-- Collapse header -->
         <div class="navbar-collapse-header d-md-none">
            <div class="row">
               <div class="col-6 collapse-brand">
                  <a href="../index.html"> <img src="resources/assets/img/brand/blue.png">
                  </a>
               </div>
               <div class="col-6 collapse-close">
                  <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#sidenav-collapse-main" aria-controls="sidenav-main" aria-expanded="false" aria-label="Toggle sidenav">
                     <span></span> <span></span>
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
            <li class="nav-item "><a class=" nav-link" href="home.do"> <i class="ni ni-tv-2 text-black"></i> Home
            </a></li>
            <li class="nav-item"><a class="nav-link active" href="map.do"> <i class="ni ni-square-pin text-orange"></i> Map
            </a></li>
            <li class="nav-item"><a class="nav-link" href="board.do"> <i class="ni ni-bullet-list-67 text-blue"></i> board
            </a></li>
            <li class="nav-item"><a class="nav-link " href="notice.do"> <i class="ni ni-air-baloon text-red"></i> Notice
            </a></li>
            <li class="nav-item"><a class="nav-link " href="coupon.do"> <i class="ni ni-collection text-green"></i> Coupon
            </a></li>
         </ul>
         <!-- Divider -->
         <hr class="my-3">
         <!-- Heading -->
         <h6 class="navbar-heading text-muted">Documentation</h6>
         <!-- Navigation -->
         <ul class="navbar-nav mb-md-3">
            <li class="nav-item"><a class="nav-link" href="https://demos.creative-tim.com/argon-dashboard/docs/getting-started/overview.html"> <i class="ni ni-spaceship"></i> Getting started
            </a></li>
            <li class="nav-item"><a class="nav-link" href="https://demos.creative-tim.com/argon-dashboard/docs/foundation/colors.html"> <i class="ni ni-palette"></i> Foundation
            </a></li>
            <li class="nav-item"><a class="nav-link" href="https://demos.creative-tim.com/argon-dashboard/docs/components/alerts.html"> <i class="ni ni-ui-04"></i> Components
            </a></li>
         </ul>
      </div>
   </div>
</nav>
<div class="main-content">
   <!-- Navbar -->
   <nav class="navbar navbar-top navbar-expand-md navbar-dark" id="navbar-main">
      <div class="container-fluid">
         <!-- Brand -->
         <a class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block" href="../index.html">Map</a>
         <!-- Form -->
         <form class="navbar-search navbar-search-dark form-inline mr-3 d-none d-md-flex ml-lg-auto">
            <div class="form-group mb-0">
               <div class="input-group input-group-alternative">
                  <div class="input-group-prepend">
                     <span class="input-group-text"><i class="fas fa-search"></i></span>
                  </div>
                  <input class="form-control" placeholder="Search" type="text">
               </div>
            </div>
         </form>
         <!-- User -->
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
                <i class="ni ni-single-02"></i>
                <span>My profile</span>
              </a>
              <a href="profile.jsp" class="dropdown-item">
                <i class="ni ni-settings-gear-65"></i>
                <span>Settings</span>
              </a>
              <a href="profile.jsp" class="dropdown-item">
                <i class="ni ni-calendar-grid-58"></i>
                <span>Activity</span>
              </a>
              <a href="profile.jsp" class="dropdown-item">
                <i class="ni ni-support-16"></i>
                <span>Support</span>
              </a>
              <div class="dropdown-divider"></div>
              <a href="sessionLogout.do" class="dropdown-item">
                <i class="ni ni-user-run"></i>
                <span>Logout</span>
              </a>
            </div>
          </li>
        </ul>
      </div>
   </nav>
   <!-- End Navbar -->
   <!-- Header -->
   <div class="header bg-gradient-default pb-8 pt-5 pt-md-8">
      <div class="container-fluid">
         <div class="header-body">
            <!-- Card stats -->
            <div class="row" style="height: 180px">

               <div class="col-xl-3 col-lg-6" style="height: 100%;">
                  <div class="card card-stats mb-4 mb-xl-0" style="height: 100%;">
                     <div class="card-body" style="height: 100%">
                        <div class="row" style="height: 100%">
                           <div class="col">
                              <label style="font-size: 20px; font-weight: bold;">최소 30분<br> 10분 단위로 예약가능
                              </label>
                           </div>
                           
                           <div>
                              <button type="button" class="btn btn-outline-primary" style="height: 30%">자세히</button>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>

               <div class="col-xl-3 col-lg-6" style="height: 100%">
                  <div class="card card-stats mb-4 mb-xl-0" style="height: 100%">
                     <div class="card-body" style="height: 100%">
                        <div class="row" style="height: 100%">
                           <div class="col">
                              <label style="font-size: 20px; font-weight: bold;">세단, SUV, 소형차 등 <br> 다양한 차종
                              </label>
                           </div>
                           <div>
                              <button type="button" class="btn btn-outline-primary" style="height: 30%">자세히</button>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>

               <div class="col-xl-3 col-lg-6" style="height: 100%">
                  <div class="card card-stats mb-4 mb-xl-0" style="height: 100%">
                     <div class="card-body" style="height: 100%">
                        <div class="row" style="height: 100%">
                           <div class="col">
                              <label style="font-size: 20px; font-weight: bold;">필요할 땐 집 앞으로 !<br>부름서비스
                              </label>
                           </div>
                           <div>
                              <button type="button" class="btn btn-outline-primary" style="height: 30%">자세히</button>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="col-xl-3 col-lg-6" style="height: 100%">
                  <div class="card card-stats mb-4 mb-xl-0" style="height: 100%">
                     <div class="card-body" style="height: 100%">
                        <div class="row" style="height: 100%">
                           <!-- Button trigger modal -->
                           <button id="reserveSelectBox" type="button" class="btn btn-outline-default" style="font-weight: bold; font-size: 20px" data-toggle="modal" data-target="#reservation1" onclick="rererere()" >시간&차종 검색</button>
                           <button id="resetBox" type="button" class="btn btn-outline-default" style="font-weight: bold; font-size: 20px" onclick="reset()">설정초기화</button>
                           <!-------------------------------------------------->
                           <!-- 예약시간 선택 -->
                           <div class="modal fade" id="reservation1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static">
                              <div class="modal-dialog modal-dialog-centered" role="document">
                                 <div class="modal-content">
                                    <div class="modal-header">

                                       <h5 class="modal-title" id="exampleModalLabel">예약시간</h5>
                                       <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                          <span aria-hidden="true">&times;</span>
                                       </button>
                                    </div>
                                    <div class="modal-body" style="width: 100%">
                                       <table style="width: 100%">
                                       <div>
                                             <tr>
                                             <td>
                                             <%
                                                Calendar cal = Calendar.getInstance();
                                                    
                                                   //현재 년도, 월, 일
                                                   String year = Integer.toString(cal.get ( cal.YEAR ));
                                                   String month = Integer.toString(cal.get ( cal.MONTH ) + 1) ;
                                                   String date = Integer.toString(cal.get ( cal.DATE )) ;
                                                   String hour = Integer.toString(cal.get ( cal.HOUR_OF_DAY )) ;
                                                   String min = Integer.toString(cal.get ( cal.MINUTE )) ;
                                                   
                                                   if(Integer.parseInt(month) < 10) {
                                                      month = "0"+month;
                                                   }
                                                   
                                                   if(Integer.parseInt(date) < 10) {
                                                      date = "0"+date;
                                                   }
                                                   
                                                   if(Integer.parseInt(hour) < 10) {
                                                      hour = "0"+hour;
                                                   }
                                                   
                                                   if(Integer.parseInt(min) < 10) {
                                                      min = "0"+min;
                                                   }
                                                  
                                                %>
                                             <select id="startYear">
                                                <option value="19">19</option>
                                                <option value="20">20</option>
                                             </select>
                                             <select id="startMonth">
                                                
                                                <option value=<%=month%>><%=month%></option>
                                                <option value="01">01</option>
                                                <option value="02">02</option>
                                                <option value="03">03</option>
                                                <option value="04">04</option>
                                                <option value="05">05</option>
                                                <option value="06">06</option>
                                                <option value="07">07</option>
                                                <option value="08">08</option>
                                                <option value="09">09</option>
                                                <option value="10">10</option>
                                                <option value="11">11</option>
                                                <option value="12">12</option>
                                             </select>
                                             <select id="startDay">
                                                <option value=<%=date%>><%=date%></option>
                                                <option value="01">01</option><option value="02">02</option><option value="03">03</option>
                                                <option value="04">04</option><option value="05">05</option><option value="06">06</option>
                                                <option value="07">07</option><option value="08">08</option><option value="09">09</option>
                                                <option value="10">10</option><option value="11">11</option><option value="12">12</option>
                                                <option value="13">13</option><option value="14">14</option><option value="15">15</option>
                                                <option value="16">16</option><option value="17">17</option><option value="18">18</option>
                                                <option value="19">19</option><option value="20">20</option><option value="21">21</option>
                                                <option value="22">22</option><option value="23">23</option><option value="24">24</option>
                                                <option value="25">25</option><option value="26">26</option><option value="27">27</option>
                                                <option value="28">28</option><option value="29">29</option><option value="30">30</option>
                                                <option value="31">31</option>
                                             </select>
                                             <select id="startClock">
                                                <option value=<%=hour%>><%=hour%></option>
                                                <option value="00">00</option><option value="01">01</option><option value="02">02</option>
                                                <option value="03">03</option><option value="04">04</option><option value="05">05</option>
                                                <option value="06">06</option><option value="07">07</option><option value="08">08</option>
                                                <option value="09">09</option><option value="10">10</option><option value="11">11</option>
                                                <option value="12">12</option><option value="13">13</option><option value="14">14</option>
                                                <option value="15">15</option><option value="16">16</option><option value="17">17</option>
                                                <option value="18">18</option><option value="19">19</option><option value="20">20</option>
                                                <option value="21">21</option><option value="22">22</option><option value="23">23</option>
                                             </select>
                                             <select id="startMin">
                                                <option value=<%=min%>><%=min%></option>
                                                <option value="00">00</option><option value="10">10</option><option value="20">20</option>
                                                <option value="30">30</option><option value="40">40</option><option value="50">50</option>
                                             </select>
                                             </td>
                                             <td>
                                             <button class="btn btn-outline-default" id="startTimeButton" onclick="startTimeButton()">시간<br>입력</button>
                                             </td>
                                          </tr>
                                          </div>
                                          <div>
                                             <tr>
                                             <td>
                                             <select id="endYear">
                                                <option value="19">19</option>
                                                <option value="20">20</option>
                                             </select>
                                             <select id="endMonth">
                                                <option value=<%=month%>><%=month%></option>
                                                <option value="01">01</option>
                                                <option value="02">02</option>
                                                <option value="03">03</option>
                                                <option value="04">04</option>
                                                <option value="05">05</option>
                                                <option value="06">06</option>
                                                <option value="07">07</option>
                                                <option value="08">08</option>
                                                <option value="09">09</option>
                                                <option value="10">10</option>
                                                <option value="11">11</option>
                                                <option value="12">12</option>
                                             </select>
                                             <select id="endDay">
                                                <option value=<%=date%>><%=date%></option>
                                                <option value="01">01</option><option value="02">02</option><option value="03">03</option>
                                                <option value="04">04</option><option value="05">05</option><option value="06">06</option>
                                                <option value="07">07</option><option value="08">08</option><option value="09">09</option>
                                                <option value="10">10</option><option value="11">11</option><option value="12">12</option>
                                                <option value="13">13</option><option value="14">14</option><option value="15">15</option>
                                                <option value="16">16</option><option value="17">17</option><option value="18">18</option>
                                                <option value="19">19</option><option value="20">20</option><option value="21">21</option>
                                                <option value="22">22</option><option value="23">23</option><option value="24">24</option>
                                                <option value="25">25</option><option value="26">26</option><option value="27">27</option>
                                                <option value="28">28</option><option value="29">29</option><option value="30">30</option>
                                                <option value="31">31</option>
                                             </select>
                                             <select id="endClock">
                                                <option value=<%=Integer.parseInt(hour) + 1%>><%=Integer.parseInt(hour) + 1%></option>
                                                <option value="00">00</option><option value="01">01</option><option value="02">02</option>
                                                <option value="03">03</option><option value="04">04</option><option value="05">05</option>
                                                <option value="06">06</option><option value="07">07</option><option value="08">08</option>
                                                <option value="09">09</option><option value="10">10</option><option value="11">11</option>
                                                <option value="12">12</option><option value="13">13</option><option value="14">14</option>
                                                <option value="15">15</option><option value="16">16</option><option value="17">17</option>
                                                <option value="18">18</option><option value="19">19</option><option value="20">20</option>
                                                <option value="21">21</option><option value="22">22</option><option value="23">23</option>
                                             </select>
                                             <select id="endMin">
                                                <option value=<%=min%>><%=min%></option>
                                                <option value="00">00</option><option value="10">10</option><option value="20">20</option>
                                                <option value="30">30</option><option value="40">40</option><option value="50">50</option>
                                             </select>
                                             </td>
                                             <td>
                                             <button class="btn btn-outline-default" id="endTimeButton" disabled="true" onclick="endTimeButton()">시간<br>입력</button>
                                             </td>
                                          </tr>
                                          </div>
                                       </table>
                                    </div>
                                    <div class="modal-footer">
                                       <button type="button" class="btn btn-outline-danger" onclick="timeReset()">초기화</button>
                                       <button id="timeCheck" type="button" class="btn btn-primary" data-toggle="modal" data-target="#reservation2" onclick="modalClose1()" disabled="true">다음</button>
                                    </div>
                                 </div>
                              </div>
                           </div>
                           <!-------------------------------------------------->
                           <!-- 차종 선택 (소형/세단/SUV) -->
                           <div class="modal fade" id="reservation2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static">
                              <div class="modal-dialog modal-dialog-centered" role="document">
                                 <div class="modal-content">
                                    <div class="modal-header">
                                       <h5 class="modal-title" id="exampleModalLabel">차종선택</h5>
                                       <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                          <span aria-hidden="true">&times;</span>
                                       </button>
                                    </div>
                                    <div class="modal-body">
                                       <button type="button" class="btn btn-outline-default" style="width: 30%; height: 100px" data-toggle="modal" data-target="#reservation2_1" onclick="modalClose2()">소형</button>
                                       <button type="button" class="btn btn-outline-default" style="width: 30%; height: 100px" data-toggle="modal" data-target="#reservation2_2" onclick="modalClose2()">세단</button>
                                       <button type="button" class="btn btn-outline-default" style="width: 30%; height: 100px" data-toggle="modal" data-target="#reservation2_3" onclick="modalClose2()">SUV</button>
                                    </div>
                                    <div class="modal-footer">
                                       <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#reservation1" onclick="modalClose2()">이전</button>
                                    </div>
                                 </div>
                              </div>
                           </div>
                           <!-------------------------------------------------->
                           <!-- 소형차 중 선택 -->
                           <div class="modal fade" id="reservation2_1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static">
                              <div class="modal-dialog modal-dialog-centered" role="document">
                                 <div class="modal-content">
                                    <div class="modal-header">
                                       <div>
                                          <table>
                                             <tr>
                                                <td style="width: 30%">
                                                   <img alt="" src="resources/assets/img/car/spark.png" width="100%">
                                                </td>
                                                <td>
                                                   <button type="button" class="btn btn-outline-default" data-toggle="modal" data-target="#reservation3" onclick="modalClose2_1('SPARK')">SPARK</button>
                                                </td>
                                             </tr>
                                             <tr>
                                                <td style="width: 30%">
                                                   <img alt="" src="resources/assets/img/car/morning.png" width="100%">
                                                </td>
                                                <td>
                                                   <button type="button" class="btn btn-outline-default" data-toggle="modal" data-target="#reservation3" onclick="modalClose2_1('MORNING')">MORNING</button>
                                                </td>
                                             </tr>
                                             
                                             
                                          </table>
                                       </div>
                                       <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                          <span aria-hidden="true">&times;</span>
                                       </button>
                                    </div>
                                    <div class="modal-body"></div>
                                    <div class="modal-footer">
                                       <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#reservation2" onclick="modalClose2_1()">이전</button>
                                    </div>
                                 </div>
                              </div>
                           </div>
                           <!-- 세단 중 선택 -->
                           <div class="modal fade" id="reservation2_2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static">
                              <div class="modal-dialog modal-dialog-centered" role="document">
                                 <div class="modal-content">
                                    <div class="modal-header">
                                       <div>
                                          <table>
                                             <tr>
                                                <td style="width: 30%">
                                                   <img alt="" src="resources/assets/img/car/k3.png" width="100%">
                                                </td>
                                                <td>
                                                   <button type="button" class="btn btn-outline-default" data-toggle="modal" data-target="#reservation3" onclick="modalClose2_2('K3')">K3</button>
                                                </td>
                                             </tr>
                                             <tr>
                                                <td style="width: 30%">
                                                   <img alt="" src="resources/assets/img/car/i30.png" width="100%">
                                                </td>
                                                <td>
                                                   <button type="button" class="btn btn-outline-default" data-toggle="modal" data-target="#reservation3" onclick="modalClose2_2('I30')">I30</button>
                                                </td>
                                             </tr>
                                             <tr>
                                                <td style="width: 30%">
                                                   <img alt="" src="resources/assets/img/car/clio.png" width="100%">
                                                </td>
                                                <td>
                                                   <button type="button" class="btn btn-outline-default" data-toggle="modal" data-target="#reservation3" onclick="modalClose2_2('CLIO')">CLIO</button>
                                                </td>
                                             </tr>
                                             <tr>
                                                <td style="width: 30%">
                                                   <img alt="" src="resources/assets/img/car/ioniq.png" width="100%">
                                                </td>
                                                <td>
                                                   <button type="button" class="btn btn-outline-default" data-toggle="modal" data-target="#reservation3" onclick="modalClose2_2('IONIQ')">IONIQ</button>
                                                </td>
                                             </tr>
                                             <tr>
                                                <td style="width: 30%">
                                                   <img alt="" src="resources/assets/img/car/avante.png" width="100%">
                                                </td>
                                                <td>
                                                   <button type="button" class="btn btn-outline-default" data-toggle="modal" data-target="#reservation3" onclick="modalClose2_2('AVANTE')">AVANTE</button>
                                                </td>
                                             </tr>
                                             <tr>
                                                <td style="width: 30%">
                                                   <img alt="" src="resources/assets/img/car/stinger.png" width="100%">
                                                </td>
                                                <td>
                                                   <button type="button" class="btn btn-outline-default" data-toggle="modal" data-target="#reservation3" onclick="modalClose2_2('STINGER')">STINGER</button>
                                                </td>
                                             </tr>
                                             <tr>
                                                <td style="width: 30%">
                                                   <img alt="" src="resources/assets/img/car/sm6.png" width="100%">
                                                </td>
                                                <td>
                                                   <button type="button" class="btn btn-outline-default" data-toggle="modal" data-target="#reservation3" onclick="modalClose2_2('SM6')">SM6</button>
                                                </td>
                                             </tr>
                                             <tr>
                                                <td style="width: 30%">
                                                   <img alt="" src="resources/assets/img/car/g80.png" width="100%">
                                                </td>
                                                <td>
                                                   <button type="button" class="btn btn-outline-default" data-toggle="modal" data-target="#reservation3" onclick="modalClose2_2('G80')">G80</button>
                                                </td>
                                             </tr>
                                          </table>
                                       </div>
                                       <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                          <span aria-hidden="true">&times;</span>
                                       </button>
                                    </div>
                                    <div class="modal-body"></div>
                                    <div class="modal-footer">
                                       <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#reservation2" onclick="modalClose2_2()">이전</button>
                                    </div>
                                 </div>
                              </div>
                           </div>
                           <!-- SUV 중 선택 -->
                           <div class="modal fade" id="reservation2_3" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static">
                              <div class="modal-dialog modal-dialog-centered" role="document">
                                 <div class="modal-content">
                                    <div class="modal-header">
                                       <div>
                                          <table>
                                             <tr>
                                                <td style="width: 30%">
                                                   <img alt="" src="resources/assets/img/car/kona.png" width="100%">
                                                </td>
                                                <td>
                                                   <button type="button" class="btn btn-outline-default" data-toggle="modal" data-target="#reservation3" onclick="modalClose2_3('KONA')">KONA</button>
                                                </td>
                                             </tr>
                                             <tr>
                                                <td style="width: 30%">
                                                   <img alt="" src="resources/assets/img/car/stonic.png" width="100%">
                                                </td>
                                                <td>
                                                   <button type="button" class="btn btn-outline-default" data-toggle="modal" data-target="#reservation3" onclick="modalClose2_3('STONIC')">STONIC</button>
                                                </td>
                                             </tr>
                                             <tr>
                                                <td style="width: 30%">
                                                   <img alt="" src="resources/assets/img/car/palisade.png" width="100%">
                                                </td>
                                                <td>
                                                   <button type="button" class="btn btn-outline-default" data-toggle="modal" data-target="#reservation3" onclick="modalClose2_3('PALISADE')">PALISADE</button>
                                                </td>
                                             </tr>
                                          </table>
                                       </div>
                                       <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                          <span aria-hidden="true">&times;</span>
                                       </button>
                                    </div>
                                    <div class="modal-body"></div>
                                    <div class="modal-footer">
                                       <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#reservation2" onclick="modalClose2_3()">이전</button>
                                    </div>
                                 </div>
                              </div>
                           </div>
                           <!-- 선택 최종화면 -->
                           <div class="modal fade" id="reservation3" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static">
                              <div class="modal-dialog modal-dialog-centered" role="document">
                                 <div class="modal-content">
                                    <div class="modal-header">
                                       <h5 class="modal-title" id="exampleModalLabel">검색</h5>
                                       <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                          <span aria-hidden="true">&times;</span>
                                       </button>

                                    </div>
                                    <div class="modal-body">
                                    </div>
                                    <div class="modal-footer">
                                       <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#reservation2" onclick="modalClose3()">이전</button>
                                       <button type="button" class="btn btn-primary" onclick="searchCar()">가능한 차량검색</button>
                                    </div>
                                 </div>
                              </div>
                           </div>
                           <!-- 일반/부름 선택창-->
                           <div class="modal fade" id="reservation" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                              <div class="modal-dialog modal-dialog-centered" role="document">
                                 <div class="modal-content">
                                    <div class="modal-header">
                                       <h5 class="modal-title" id="exampleModalLabel">예약시작!</h5>
                                       <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                          <span aria-hidden="true">&times;</span>
                                       </button>
                                    </div>
                                    <div class="modal-body">
                                       <button type="button" class="btn btn-outline-default" style="width: 200px; height: 200px" data-toggle="modal" data-target="#insurance" onclick="modalClose()">일반예약</button>
                                       <button type="button" class="btn btn-outline-default" style="width: 200px; height: 200px" data-toggle="modal" data-target="#burum1" onclick="modalClose()">부름예약</button>
                                    </div>
                                 </div>
                              </div>
                           </div>
                           <!-- 부름예약1 -->
                           <div class="modal fade" id="burum1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                              <div class="modal-dialog modal-dialog-centered" role="document">
                                 <div class="modal-content">
                                    <div class="modal-header">
                                       <h5 class="modal-title" id="exampleModalLabel">부름 장소 설정</h5>
                                       <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                          <span aria-hidden="true">&times;</span>
                                       </button>
                                    </div>
                                    <div class="modal-body">
                                       <div class="alert alert-secondary" role="alert">
                                          <h2>주의사항!</h2>
                                          <h4>* 불법 주차구역으로 부과되는 과태료는 고객부담입니다.</h4>
                                          <h4>* 부름은 출발 4시간 이전까지만 예약 가능합니다.</h4>
                                       </div>
                                       <input type="text" id="sample5_address" class="form-control is-valid" placeholder="ex) 서울시 은평구 불광동 445-17" width="40%" readonly> <br> <input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색" class="btn btn-outline-primary"><br>
                                    </div>
                                    <div class="modal-footer">
                                       <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#reservation" onclick="burumClose1()">이전</button>
                                       <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#burum2" onclick="burumClose1()" id="burumNext">다음</button>
                                    </div>
                                 </div>
                              </div>
                           </div>
                           <!-- 부름예약2 -->
                           <div class="modal fade" id="burum2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                              <div class="modal-dialog modal-dialog-centered" role="document">
                                 <div class="modal-content">
                                    <div class="modal-header">
                                       <h5 class="modal-title" id="exampleModalLabel">부름 장소 설정</h5>
                                       <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                          <span aria-hidden="true">&times;</span>
                                       </button>
                                    </div>
                                    <div class="modal-body">
                                       <div class="alert alert-secondary" role="alert">
                                          <h2>안내사항</h2>
                                          <h4>
                                             부름 지점에 도착하면 문자가 전송됩니다. <i class="ni ni-send"></i>
                                          </h4>
                                          <h4>부름 추가요금(왕복)은 <input id="burumFee" style="width: 25%" class="alert alert-secondary">원 입니다. </h4>
                                          <i class="send"></i>
                                       </div>
                                    </div>
                                    <div class="modal-footer">
                                       <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#burum1" onclick="burumClose2()">이전</button>
                                       <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#insurance" onclick="burumClose2()">다음</button>
                                    </div>
                                 </div>
                              </div>
                           </div>
                           <!-- 보험설정 -->
                           <div class="modal fade" id="insurance" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                              <div class="modal-dialog modal-dialog-centered" role="document">
                                 <div class="modal-content">
                                    <div class="modal-header">
                                       <h5 class="modal-title" id="exampleModalLabel">보험설정</h5>
                                       <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                          <span aria-hidden="true">&times;</span>
                                       </button>
                                    </div>
                                    <div class="modal-body">
                                       <div class="alert alert-secondary" role="alert">
                                          <div class="custom-control custom-control-alternative custom-checkbox mb-3">
                                             <div class="nav-wrapper">
                                                <ul class="nav nav-pills nav-fill flex-column flex-md-row" id="tabs-icons-text" role="tablist">
                                                   <li class="nav-item"><a class="nav-link mb-sm-3 mb-md-0 active" id="tabs-icons-text-1-tab" data-toggle="tab" href="#tabs-icons-text-1" role="tab" aria-controls="tabs-icons-text-1" aria-selected="true" onclick="insSelect('스페셜')">스페셜</a></li>
                                                   <li class="nav-item"><a class="nav-link mb-sm-3 mb-md-0" id="tabs-icons-text-2-tab" data-toggle="tab" href="#tabs-icons-text-2" role="tab" aria-controls="tabs-icons-text-2" aria-selected="false" onclick="insSelect('스텐다드')">스텐다드</a></li>
                                                   <li class="nav-item"><a class="nav-link mb-sm-3 mb-md-0" id="tabs-icons-text-3-tab" data-toggle="tab" href="#tabs-icons-text-3" role="tab" aria-controls="tabs-icons-text-3" aria-selected="false" onclick="insSelect('라이트')">라이트</a></li>
                                                </ul>
                                             </div>
                                             <div class="card shadow">
                                                <div class="card-body">
                                                   <div class="tab-content" id="myTabContent">
                                                      <div class="tab-pane fade show active" id="tabs-icons-text-1" role="tabpanel" aria-labelledby="tabs-icons-text-1-tab">
                                                         <p class="description">자기부담금 최대 5만원</p>
                                                         <p class="description">AXA 운전자보험 포함</p>
                                                      </div>
                                                      <div class="tab-pane fade" id="tabs-icons-text-2" role="tabpanel" aria-labelledby="tabs-icons-text-2-tab">
                                                         <p class="description">자기부담금 최대 30만원</p>
                                                      </div>
                                                      <div class="tab-pane fade" id="tabs-icons-text-3" role="tabpanel" aria-labelledby="tabs-icons-text-3-tab">
                                                         <p class="description">자기부담금 최대 70만원</p>
                                                      </div>
                                                   </div>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                    <div class="modal-footer">
                                       <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#reservation" onclick="burumClose3()">처음으로</button>
                                       <button type="button" class="btn btn-primary" onclick="reservation()">결제하기</button>
                                    </div>
                                 </div>
                              </div>
                           </div>

                        </div>
                     </div>
                  </div>
               </div>

            </div>
         </div>
      </div>
   </div>
   <div class="container-fluid mt--7">
      <div class="row">
         <div class="col">
            <div class="card shadow border-0">
               <div style="float: left;">

                  <div id="map" style="width: 70%; height: 700px; float: left; border-radius: 10px;"></div>
                  <!--지도 DIV-->

                  <div style="width: 30%; height: 700px; float: left; border-radius: 10px;">
                     <div class="card-header bg-transparent" style="width: 100%; height: 56%">
                        <div id="carListInfo1" style="width: 100%;"></div>
                        <div style="width: 100%">
                        <!-- 마커를 클릭했을 때 주소가 들어갈 장소 -->
                        <div id = "markerAddr"></div>
                           <div style="width: 100%;">
                              <table class="table align-items-center table-flush" style="width: 100%;">
                                 <thead class="thead-light">
                                    <tr>
                                       <td>차종</td>
                                       <td>주행거리</td>
                                       <td>연료량</td>
                                       <td>예약</td>
                                    </tr>
                                 </thead>
                              </table>
                              <!------------------------------------------------------------->
                              <div style="width: 106%; height: 100%;">
                              <div class="alert alert-secondary" role="alert"><table id="carList">
                              </table></div>
                              <!---------------------------------------------------------------------------->
                              </div>
                           </div>
                        </div>

                     </div>
                     <div id="loadViewDIV" style="height: 50%;">
                        <iframe src="loadView.do" style="width: 100%; height: 430px; border-radius: 10px;"></iframe>
                     </div>
                  </div>
               </div>

               <script>
                  var MARKER_WIDTH = 33, // 기본, 클릭 마커의 너비
                  MARKER_HEIGHT = 36, // 기본, 클릭 마커의 높이
                  OFFSET_X = 12, // 기본, 클릭 마커의 기준 X좌표
                  OFFSET_Y = MARKER_HEIGHT, // 기본, 클릭 마커의 기준 Y좌표
                  OVER_MARKER_WIDTH = 40, // 오버 마커의 너비
                  OVER_MARKER_HEIGHT = 42, // 오버 마커의 높이
                  OVER_OFFSET_X = 13, // 오버 마커의 기준 X좌표
                  OVER_OFFSET_Y = OVER_MARKER_HEIGHT, // 오버 마커의 기준 Y좌표
                  SPRITE_MARKER_URL = 'resources/assets/img/brand/markers.png', // 스프라이트 마커 이미지 URL
                  SPRITE_WIDTH = 126, // 스프라이트 이미지 너비
                  SPRITE_HEIGHT = 146, // 스프라이트 이미지 높이
                  SPRITE_GAP = 10; // 스프라이트 이미지에서 마커간 간격

                  var markerSize = new kakao.maps.Size(MARKER_WIDTH, MARKER_HEIGHT), // 기본, 클릭 마커의 크기
                  markerOffset = new kakao.maps.Point(OFFSET_X, OFFSET_Y), // 기본, 클릭 마커의 기준좌표
                  overMarkerSize = new kakao.maps.Size(OVER_MARKER_WIDTH, OVER_MARKER_HEIGHT), // 오버 마커의 크기
                  overMarkerOffset = new kakao.maps.Point(OVER_OFFSET_X, OVER_OFFSET_Y), // 오버 마커의 기준 좌표
                  spriteImageSize = new kakao.maps.Size(SPRITE_WIDTH,SPRITE_HEIGHT); // 스프라이트 이미지의 크기
                  //----------------------------------------------------------------------------------------------------------------------
                var list = [];
                var temp = [];
                var selectedMarker = null;

                var positionsAll = [
                	<%
                	for(int k = 0; k<list.size();k++){
                		loc_x = list.get(k).getZone_location_x();
                		loc_y = list.get(k).getZone_location_y();
                		String zName = list.get(k).getZone_name();
                		%>
                		new kakao.maps.LatLng(<%=loc_x%>, <%=loc_y%>),
                		<% 
                		} 
                		%>
                ];
                var zone_addr = [];
                	<%
                	for(int k = 0; k<list.size();k++){
                	String loc_name = list.get(k).getZone_name();
                	System.out.println(loc_name);
                	%>
                	zone_addr.push("<%=loc_name%>");
                	<%                	}                	%>
                $.ajax({
                	url : "khakizone_map.do",
                	success : function(result) {
						result = result.trim();
						list = result.split("★");
						for (var i = 0; i < list.length-1; i++) {
							list[i] = list[i].trim();
							temp = list[i].split("/");
							positionsInsert(temp[0],temp[1]);
						}
                	}
                })
                   //----------------------------------------------------------------------------------------------------------------------
                var positions = [];
	                selectZoneNum.forEach(function(item) {
	                positions.push(positionsAll[item]);
	                });
	                
                    	var mapContainer = document.getElementById('map'); // 지도를 표시할 div
                        var mapOption = {
                           center : new kakao.maps.LatLng(sessionStorage.getItem('preLoc_x'),sessionStorage.getItem('preLoc_y')), // 지도의 중심좌표 > 회원정보에 입력된 주소를 좌표로 변환하여 입력됨
                           level : 5
                        // 지도의 확대 레벨 
                        };

                  var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

                  // 지도에 교통정보를 표시하도록 지도타입을 추가합니다
                  map.addOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC);   
                  
                  // 지도 위에 마커를 표시합니다
                  for (var i = 0, len = positions.length; i < len; i++) {
                     var gapX = (MARKER_WIDTH + SPRITE_GAP), // 스프라이트 이미지에서 마커로 사용할 이미지 X좌표 간격 값
                     originY = 0, // 스프라이트 이미지에서 기본, 클릭 마커로 사용할 Y좌표 값
                     overOriginY = 0, // 스프라이트 이미지에서 오버 마커로 사용할 Y좌표 값
                     normalOrigin = new kakao.maps.Point(0, originY), // 스프라이트 이미지에서 기본 마커로 사용할 영역의 좌상단 좌표
                     clickOrigin = new kakao.maps.Point(gapX, originY), // 스프라이트 이미지에서 마우스오버 마커로 사용할 영역의 좌상단 좌표
                     overOrigin = new kakao.maps.Point(gapX * 2, overOriginY); // 스프라이트 이미지에서 클릭 마커로 사용할 영역의 좌상단 좌표

                     // 마커를 생성하고 지도위에 표시합니다
                     addMarker(positions[i], normalOrigin, overOrigin, clickOrigin);
                  }

                  // 마커를 생성하고 지도 위에 표시하고, 마커에 mouseover, mouseout, click 이벤트를 등록하는 함수입니다
                  function addMarker(position, normalOrigin, overOrigin,clickOrigin) {

                     // 기본 마커이미지, 오버 마커이미지, 클릭 마커이미지를 생성합니다
                     var normalImage = createMarkerImage(markerSize,
                           markerOffset, normalOrigin), overImage = createMarkerImage(
                           overMarkerSize, overMarkerOffset,
                           overOrigin), clickImage = createMarkerImage(
                           markerSize, markerOffset, clickOrigin);

                     // 마커를 생성하고 이미지는 기본 마커 이미지를 사용합니다
                     var marker = new kakao.maps.Marker({
                        map : map,
                        position : position,
                        image : normalImage,
                     });

                     // 마커 객체에 마커아이디와 마커의 기본 이미지를 추가합니다
                     marker.normalImage = normalImage;

                     // 마커에 mouseover 이벤트를 등록합니다
                     kakao.maps.event.addListener(marker, 'mouseover',function() {

                              // 클릭된 마커가 없고, mouseover된 마커가 클릭된 마커가 아니면
                              // 마커의 이미지를 오버 이미지로 변경합니다
                              if (!selectedMarker || selectedMarker !== marker) {
                                 marker.setImage(overImage);
                              }
                           });

                     // 마커에 mouseout 이벤트를 등록합니다
                     kakao.maps.event.addListener(marker, 'mouseout',function() {

                              // 클릭된 마커가 없고, mouseout된 마커가 클릭된 마커가 아니면
                              // 마커의 이미지를 기본 이미지로 변경합니다
                              if (!selectedMarker || selectedMarker !== marker) {
                                 marker.setImage(normalImage);
                              }
                           });

                     // 마커에 click 이벤트를 등록합니다
                     kakao.maps.event.addListener(marker,'click',function() {

                                    // 클릭된 마커가 없고, click 마커가 클릭된 마커가 아니면
                                    // 마커의 이미지를 클릭 이미지로 변경합니다
                                    if (!selectedMarker || selectedMarker !== marker) {

                                       // 클릭된 마커 객체가 null이 아니면
                                       // 클릭된 마커의 이미지를 기본 이미지로 변경하고
                                       !!selectedMarker&& selectedMarker.setImage(selectedMarker.normalImage);

                                       // 현재 클릭된 마커의 이미지는 클릭 이미지로 변경합니다
                                       marker.setImage(clickImage);
                                    }

                                    // 클릭된 마커를 현재 클릭된 마커 객체로 설정합니다
                                    selectedMarker = marker;
                                    var selected = (JSON.stringify(selectedMarker.getPosition())).split(","); // 선택된 마커의 좌표를 [위도,경도] 배열로 만듦
                                    selected[0] = Number(selected[0].substring(6,selected[0].length)); 
                                    selected[1] = Number(selected[1].substring(5,selected[1].length - 1));
                                    // 선택된 좌표의 경도,위도값을 숫자로 받아옴

                                    selected[0] = selected[0].toFixed(5);
                                    selected[1] = selected[1].toFixed(5);
                                    // 맨 뒤 이상한 소숫점 없애기위해 13번째 자리에서 반올림

                                    var markers = [];

                                    for (var i = 0; i < positions.length; i++) {
                                       markers = (JSON.stringify(positions[i])).split(",");
                                       markers[0] = Number(markers[0].substring(6,markers[0].length));
                                       markers[1] = Number(markers[1].substring(5,markers[1].length - 1));
                                       markers[0] = markers[0].toFixed(5);
                                       markers[1] = markers[1].toFixed(5);

                                       if (markers[0] == selected[0] && markers[1] == selected[1]) { // 선택된 좌표와 입력되어있던 좌표가 같을 경우
                                          selectNum = selectZoneNum[i]; // 선택된것 중 순번 > 절대순번을 찾아서 보냄
                                          $('#zoneNumber').val(selectNum);
                                          carListInfo(selectNum); // 몇번째 마커인지 번호와 함께 전송
                                    	  loadView(markers[0],markers[1]);
                                       }
                                    } //for문종료 : 마커를 클릭하면 몇번째 마커인지 표시
                                 });
                  }

                  // MakrerImage 객체를 생성하여 반환하는 함수입니다
                  function createMarkerImage(markerSize, offset,spriteOrigin) {
                     var markerImage = new kakao.maps.MarkerImage(
                           SPRITE_MARKER_URL, // 스프라이트 마커 이미지 URL
                           markerSize, // 마커의 크기
                           {
                              offset : offset, // 마커 이미지에서의 기준 좌표
                              spriteOrigin : spriteOrigin, // 스트라이프 이미지 중 사용할 영역의 좌상단 좌표
                              spriteSize : spriteImageSize // 스프라이트 이미지의 크기
                           });
                     return markerImage;
                  }
               </script>
               <input id="zoneNumber" type="hidden">
            </div>
         </div>
      </div>
      <!-- Footer -->
      <!-- Footer -->
      <footer class="footer">
         <div id="selectCarList" class="row align-items-center justify-content-xl-between">
            <div class="col-xl-6">
               <div class="copyright text-center text-xl-left text-muted">
                  &copy; 2018 <a href="https://www.creative-tim.com" class="font-weight-bold ml-1" target="_blank">Creative Tim</a>
               </div>
            </div>
            <div class="col-xl-6">
               <ul class="nav nav-footer justify-content-center justify-content-xl-end">
                  <li class="nav-item"><a href="https://www.creative-tim.com" class="nav-link" target="_blank">Creative Tim</a></li>
                  <li class="nav-item"><a href="https://www.creative-tim.com/presentation" class="nav-link" target="_blank">About Us</a></li>
                  <li class="nav-item"><a href="http://blog.creative-tim.com" class="nav-link" target="_blank">Blog</a></li>
                  <li class="nav-item"><a href="https://github.com/creativetimofficial/argon-dashboard/blob/master/LICENSE.md" class="nav-link" target="_blank">MIT License</a></li>
               </ul>
            </div>
         </div>
      </footer>
   </div>
</div>
<input type="hidden" id="preLocLat">
<input type="hidden" id="preLocLon">
<!--   Core   -->
<script src="resources/assets/js/plugins/jquery/dist/jquery.min.js"></script>
<script src="resources/assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<!--   Optional JS   -->
<!--   Argon JS   -->
<script src="resources/assets/js/argon-dashboard.min.js?v=1.1.0"></script>
<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
<script>
   window.TrackJS && TrackJS.install({
      token : "ee6fab19c5a04ac1a32a645abde4613a",
      application : "argon-dashboard-free"
   });
</script>

</body>

</html>