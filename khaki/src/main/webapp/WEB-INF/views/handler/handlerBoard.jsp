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
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script type="text/javascript">
  	$(function() {
  		var sessionId = '<%=(String)session.getAttribute("sessionId")%>';
  		var seoul = ["", "강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구"
			,"마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
		var busan = ["", "강서구", "금정구", "기장군", "남구", "동구", "동래구", "부산진구", "북구", "사상구", "사하구", 
				"서구", "수영구", "연제구", "영도구", "중구", "해운대구"];
		var daegu = ["", "중구", "동구", "서구", "남구", "북구", "수성구", "달서구", "달성군"];
		var incheon = ["", "중구", "동구", "미추홀구", "연수구", "남동구", "부평구", "계양구", "서구", "강화군", "옹진군"];
		var gwangju = ["", "동구", "서구", "남구", "북구", "광산구"];
		var daejeon = ["", "동구", "중구", "서구", "유성구", "대덕구"];
		var ulsan = ["", "중구", "남구", "동구", "북구", "울주군"];
		var sejong = ["", "반곡동", "소담동", "보람동", "대평동", "가람동", "한솔동", "나성동", "새롬동", "다정동", "어진동", "종촌동", "고운동",
			"아름동", "도담동", "조치원읍", "연기면", "연동면", "부강면", "금남면", "장군면", "연서면", "전의면", "전동면", "소정면"];
		var gyeonggi = ["", "수원시", "성남시", "의정부시", "안양시", "부천시", "광명시", "평택시", "동두천시", "안산시", "고양시", "과천시", "구리시", 
			"남양주시", "오산시", "시흥시", "군포시", "의왕시", "하남시", "용인시", "파주시", "이천시", "안성시", "김포시", "화성시", "광주시", "양주시", 
			"포천시", "여주시", "연천군", "가평군", "양평군"];
		var gangwon = ["", "춘천시", "원주시", "강릉시", "동해시", "태백시", "속초시", "삼척시", "홍천군", "횡성군", "영월군", "평창군", "정선군", "철원군", "화천군", "양구군", "인제군", "고성군", "양양군"];
		var chungbuk = ["", "청주시", "충주시", "제천시", "보은군", "옥천군", "영동군", "증평군", "진천군", "괴산군", "음성군", "단양군"];
		var chungnam = ["", "천안시", "공주시", "보령시", "아산시", "서산시", "논산시", "계룡시", "당진시", "금산군", "부여군", "서천군", "청양군", "홍성군", "예산군", "태안군"];
		var jeonbuk = ["", "전주시", "군산시", "익산시", "정읍시", "남원시", "김제시", "완주군", "진안군", "무주군", "장수군", "임실군", "순창군", "고창군", "부안군"];
		var jeonnam = ["", "목포시", "여수시", "순천시", "나주시", "광양시", "담양군", "곡성군", "구례군", "고흥군", "보성군", "화순군", "장흥군", "강진군", "해남군", "영암군", "무안군", "함평군", "영광군", "장성군", "완도군", "진도군", "신안군"];
		var gyeongbuk = ["", "경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
		var gyeongnam = ["", "거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
		var jeju = ["", "제주시", "서귀포시"];
		
		$("#region_1_n").change(function(){
			var result = "";
			$("#region_2_n").children().remove();
			var d = $("#region_1_n option:selected").val();
			switch(d) {
				case "서울" :
					for(var i = 0; i < seoul.length; i++) {
						if(i == 0) {
							result += "<option value=\"\" selected=\"true\">- 지역 선택 -</option>";
						} else if (i >= 9){
							result += "<option value=\""+seoul[i]+"\">"+seoul[i]+"</option>";
						} else {
							result += "<option value=\""+seoul[i]+"\">"+seoul[i]+"</option>";
						}
					}
					$("#region_2_n").append(result);
					break;
				case "부산" :
					for(var i = 0; i < busan.length; i++) {
						if(i == 0) {
							result += "<option value=\"\" selected=\"true\">- 지역 선택 -</option>";
						} else if (i >= 9){
							result += "<option value=\""+busan[i]+"\">"+busan[i]+"</option>";
						} else {
							result += "<option value=\""+busan[i]+"\">"+busan[i]+"</option>";
						}
					}
					$("#region_2_n").append(result);
					break;
				case "대구" :
					for(var i = 0; i < daegu.length; i++) {
						if(i == 0) {
							result += "<option value=\"\" selected=\"true\">- 지역 선택 -</option>";
						} else if (i >= 9){
							result += "<option value=\""+daegu[i]+"\">"+daegu[i]+"</option>";
						} else {
							result += "<option value=\""+daegu[i]+"\">"+daegu[i]+"</option>";
						}
					}
					$("#region_2_n").append(result);
					break;
				case "인천" :
					for(var i = 0; i < incheon.length; i++) {
						if(i == 0) {
							result += "<option value=\"\" selected=\"true\">- 지역 선택 -</option>";
						} else if (i >= 9){
							result += "<option value=\""+incheon[i]+"\">"+incheon[i]+"</option>";
						} else {
							result += "<option value=\""+incheon[i]+"\">"+incheon[i]+"</option>";
						}
					}
					$("#region_2_n").append(result);
					break;
				case "광주" :
					for(var i = 0; i < gwangju.length; i++) {
						if(i == 0) {
							result += "<option value=\"\" selected=\"true\">- 지역 선택 -</option>";
						} else if (i >= 9){
							result += "<option value=\""+gwangju[i]+"\">"+gwangju[i]+"</option>";
						} else {
							result += "<option value=\""+gwangju[i]+"\">"+gwangju[i]+"</option>";
						}
					}
					$("#region_2_n").append(result);
					break;
				case "대전" :
					for(var i = 0; i < daejeon.length; i++) {
						if(i == 0) {
							result += "<option value=\"\" selected=\"true\">- 지역 선택 -</option>";
						} else if (i >= 9){
							result += "<option value=\""+daejeon[i]+"\">"+daejeon[i]+"</option>";
						} else {
							result += "<option value=\""+daejeon[i]+"\">"+daejeon[i]+"</option>";
						}
					}
					$("#region_2_n").append(result);
					break;
				case "울산" :
					for(var i = 0; i < ulsan.length; i++) {
						if(i == 0) {
							result += "<option value=\"\" selected=\"true\">- 지역 선택 -</option>";
						} else if (i >= 9){
							result += "<option value=\""+ulsan[i]+"\">"+ulsan[i]+"</option>";
						} else {
							result += "<option value=\""+ulsan[i]+"\">"+ulsan[i]+"</option>";
						}
					}
					$("#region_2_n").append(result);
					break;
				case "세종특별자치시" :
					for(var i = 0; i < sejong.length; i++) {
						if(i == 0) {
							result += "<option value=\"\" selected=\"true\">- 지역 선택 -</option>";
						} else if (i >= 9){
							result += "<option value=\""+sejong[i]+"\">"+sejong[i]+"</option>";
						} else {
							result += "<option value=\""+sejong[i]+"\">"+sejong[i]+"</option>";
						}
					}
					$("#region_2_n").append(result);
					break;
				case "경기" :
					for(var i = 0; i < gyeonggi.length; i++) {
						if(i == 0) {
							result += "<option value=\"\" selected=\"true\">- 지역 선택 -</option>";
						} else if (i >= 9){
							result += "<option value=\""+gyeonggi[i]+"\">"+gyeonggi[i]+"</option>";
						} else {
							result += "<option value=\""+gyeonggi[i]+"\">"+gyeonggi[i]+"</option>";
						}
					}
					$("#region_2_n").append(result);
					break;
				case "강원" :
					for(var i = 0; i < gangwon.length; i++) {
						if(i == 0) {
							result += "<option value=\"\" selected=\"true\">- 지역 선택 -</option>";
						} else if (i >= 9){
							result += "<option value=\""+gangwon[i]+"\">"+gangwon[i]+"</option>";
						} else {
							result += "<option value=\""+gangwon[i]+"\">"+gangwon[i]+"</option>";
						}
					}
					$("#region_2_n").append(result);
					break;
				case "충북" :
					for(var i = 0; i < chungbuk.length; i++) {
						if(i == 0) {
							result += "<option value=\"\" selected=\"true\">- 지역 선택 -</option>";
						} else if (i >= 9){
							result += "<option value=\""+chungbuk[i]+"\">"+chungbuk[i]+"</option>";
						} else {
							result += "<option value=\""+chungbuk[i]+"\">"+chungbuk[i]+"</option>";
						}
					}
					$("#region_2_n").append(result);
					break;
				case "충남" :
					for(var i = 0; i < chungnam.length; i++) {
						if(i == 0) {
							result += "<option value=\"\" selected=\"true\">- 지역 선택 -</option>";
						} else if (i >= 9){
							result += "<option value=\""+chungnam[i]+"\">"+chungnam[i]+"</option>";
						} else {
							result += "<option value=\""+chungnam[i]+"\">"+chungnam[i]+"</option>";
						}
					}
					$("#region_2_n").append(result);
					break;
				case "전북" :
					for(var i = 0; i < jeonbuk.length; i++) {
						if(i == 0) {
							result += "<option value=\"\" selected=\"true\">- 지역 선택 -</option>";
						} else if (i >= 9){
							result += "<option value=\""+jeonbuk[i]+"\">"+jeonbuk[i]+"</option>";
						} else {
							result += "<option value=\""+jeonbuk[i]+"\">"+jeonbuk[i]+"</option>";
						}
					}
					$("#region_2_n").append(result);
					break;
				case "전남" :
					for(var i = 0; i < jeonnam.length; i++) {
						if(i == 0) {
							result += "<option value=\"\" selected=\"true\">- 지역 선택 -</option>";
						} else if (i >= 9){
							result += "<option value=\""+jeonnam[i]+"\">"+jeonnam[i]+"</option>";
						} else {
							result += "<option value=\""+jeonnam[i]+"\">"+jeonnam[i]+"</option>";
						}
					}
					$("#region_2_n").append(result);
					break;
				case "경북" :
					for(var i = 0; i < gyeongbuk.length; i++) {
						if(i == 0) {
							result += "<option value=\"\" selected=\"true\">- 지역 선택 -</option>";
						} else if (i >= 9){
							result += "<option value=\""+gyeongbuk[i]+"\">"+gyeongbuk[i]+"</option>";
						} else {
							result += "<option value=\""+gyeongbuk[i]+"\">"+gyeongbuk[i]+"</option>";
						}
					}
					$("#region_2_n").append(result);
					break;
				case "경남" :
					for(var i = 0; i < gyeongnam.length; i++) {
						if(i == 0) {
							result += "<option value=\"\" selected=\"true\">- 지역 선택 -</option>";
						} else if (i >= 9){
							result += "<option value=\""+gyeongnam[i]+"\">"+gyeongnam[i]+"</option>";
						} else {
							result += "<option value=\""+gyeongnam[i]+"\">"+gyeongnam[i]+"</option>";
						}
					}
					$("#region_2_n").append(result);
					break;
				case "제주특별자치도" :
					for(var i = 0; i < jeju.length; i++) {
						if(i == 0) {
							result += "<option value=\"\" selected=\"true\">- 지역 선택 -</option>";
						} else if (i >= 9){
							result += "<option value=\""+jeju[i]+"\">"+jeju[i]+"</option>";
						} else {
							result += "<option value=\""+jeju[i]+"\">"+jeju[i]+"</option>";
						}
					}
					$("#region_2_n").append(result);
					break;
			}
			

			
		})
		$("#location1").hide();
		$("#location2").hide();
		
		// 지역선택 modal에서 출발지점 선택시
		$(".start_lo").click(function(){
			$(".s_r_lo").css("height", "50px");
			$(".start_lo").css("line-height", "50px");
			$(".return_lo").css("line-height", "50px");
			$("#region_1_n option:eq(0)").prop("selected", true); // 클릭하면 첫번째 값으로 초기화
			$("#region_2_n option:eq(0)").prop("selected", true); // 클릭하면 첫번째 값으로 초기화
			$("#location1").show();
			$("#location2").show();
			$("#location_choice").val("1");
		})
		// 지역선택 modal에서 도착지점 선택시
		$(".return_lo").click(function(){
			$(".s_r_lo").css("height", "50px");
			$(".start_lo").css("line-height", "50px");
			$(".return_lo").css("line-height", "50px");
			$("#region_1_n option:eq(0)").prop("selected", true); // 클릭하면 첫번째 값으로 초기화
			$("#region_2_n option:eq(0)").prop("selected", true); // 클릭하면 첫번째 값으로 초기화
			$("#location1").show();
			$("#location2").show();
			$("#location_choice").val("2");
		})
		
		$("#handlerDetailSearch1").click(function(){
			location_choice = $("#location_choice").val();
			switch(location_choice){
				case "1" :
					var startLocation = $("#region_1_n option:selected").val();
					var d2 = $("#region_2_n option:selected").val();
					startLocation += " " + d2;
					location.href="handlerDetailSearch.do?startLocation="+startLocation;
					break;
				case "2" :
					var returnLocation = $("#region_1_n option:selected").val();
					var d2 = $("#region_2_n option:selected").val();
					returnLocation += " " + d2;
					location.href="handlerDetailSearch.do?startLocation="+returnLocation;
					break;
			}
		})
		
		$(".hb_table_content_tr").click(function(){
			$(".handler_detail").children().remove();
			
			var carImg = ""; // 차량번호를 통해 예약된 차량의 이미지 db에서 ajax로 가져와야함
			var carNum = $(this).children(".hb_table_content_carNum").text(); // 차량번호
			var carModel = $(this).children(".hb_table_content_carModel").text(); // 차량종류
			var startLocation = $(this).children(".hb_table_content_startLocation").text(); // 출발장소(현재차량위치)
			var arrivalLocation = $(this).children(".hb_table_content_arrivalLocation").text(); // 도착장소(차량도착위치)
			var complete = $(this).children(".hb_table_content_complete").text(); // 운송완료시간
			var point = $(this).children(".hb_table_content_point").text(); // 예상적립포인트
			var hb_num = $(this).children(".hb_table_content_num").children(".hb_num").val();
			$.ajax({
			      url:"carNumSelect.do",
			      data : {
			    	  carNum : carNum
			      },
			      success:function(data){
			    	  carImg = data;
						
						
						var h_detail_img = "<form action=\"handlerUse.do\" id=\"handlerUseFrm\"><div class=\"h_detail_img\">"; // 이미지 div태그
						var h_detail_image = "<img class=\"h_detail_image\" src=\""+carImg+"\"></img>"; // 차량번호로 db에 연결하여 가져온 차량의 이미지 태그(예시로 src에 임시 이미지 삽입함)
						var h_detail_carNum = "</div><div class=\"h_detail_carNum_title\">차량번호</div><div class=\"h_detail_carModel_title\">차종</div><div class=\"h_detail_carNum\">"; // 차량번호 div태그
						var h_detail_carModel = "</div><div class=\"h_detail_carModel\">"; // 차종 div태그
						var h_detail_startLocation = "</div><div class=\"h_detail_startLocation_title\">출발장소</div><div class=\"h_detail_startLocation\">"; // 출발장소(현재차량위치) div 태그
						var h_detail_arrivallocation = "</div><div class=\"h_detail_arrivallocation_title\">도착장소</div><div class=\"h_detail_arrivallocation\">"; // 도착장소(차량도착위치) div 태그
						var h_detail_complete = "</div><div class=\"h_detail_complete_title\">운송완료시간</div><div class=\"h_detail_complete\">"; // 운송 완료 시간 div 태그
						var h_detail_point = "</div><div class=\"h_detail_point_title\">예상적립포인트</div><div class=\"h_detail_point\">";
						var h_carNum = "</div><input type=\"hidden\" name=\"h_carNum\" value=\"" + carNum + "\">";
						var h_carModel = "<input type=\"hidden\" name=\"h_carModel\" value=\"" + carModel + "\">";
						var h_startLocation = "<input type=\"hidden\" name=\"h_startLocation\" value=\"" + startLocation + "\">";
						var h_returnLocation = "<input type=\"hidden\" name=\"h_returnLocation\" value=\"" + arrivalLocation + "\">";
						var h_complete = "<input type=\"hidden\" name=\"h_complete\" value=\"" + complete + "\">";
						var h_point = "<input type=\"hidden\" name=\"h_point\" value=\"" + point + "\">";
						var h_id = "<input type=\"hidden\" name=\"h_id\" value=\""+sessionId+"\">";
						var h_using = "<input type=\"hidden\" name=\"h_using\" value=\"N\"></form>";
						var h_id = "<input type=\"hidden\" name=\"h_id\" value=\""+sessionId+"\">";
						var h_using = "<input type=\"hidden\" name=\"h_using\" value=\"N\"></form>";
						var h_num = "<form action=\"handlerDelete.do\" id=\"handlerDeleteFrm\"><input type=\"hidden\" name=\"hb_num\" value=\"" + hb_num + "\"></form>";
						
						$(".handler_detail").append(h_detail_img + h_detail_image + h_detail_carNum + carNum + h_detail_carModel + carModel + h_detail_startLocation + startLocation + h_detail_arrivallocation + arrivalLocation + h_detail_complete + complete + h_detail_point + point + h_carNum + h_carModel + h_startLocation + h_returnLocation + h_complete + h_point + h_id + h_using + h_num);
			      },
			      error : function(xhr, status) {
		                swal(xhr + " : " + status);
		          }
			});
			
			
		})
		
		$("#handlerDetailSearch2").click(function(){
			var handlerUseFrm = $("#handlerUseFrm").serialize();
			var handlerDeleteFrm = $("#handlerDeleteFrm").serialize();
			$.ajax({
			      url:"handlerUse.do",
			      data : handlerUseFrm,
			      success:function(data){
			    	  $.ajax({
					      url:"handlerDelete.do",
					      data : handlerDeleteFrm,
					      success:function(data){
					    	  swal("핸들러 신청이 완료 되었습니다");
					    	  location.href="handlerBoard.do";
					      },
					      error : function(xhr, status) {
				                swal(xhr + " : " + status);
				          }
					});
			      },
			      error : function(xhr, status) {
		                swal(xhr + " : " + status);
		          }
			});
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
<div class="hb_query_content"></div>
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
          <% 
          if (session.getAttribute("sessionId")==null){ %>
            <a class="nav-link">
              <i class="ni ni-square-pin text-orange"></i> 카셰어링&nbsp;&nbsp;(로그인 필요)
            </a>
          <%
          } else {
          %>
            <a class="nav-link" href="map.do">
              <i class="ni ni-square-pin text-orange"></i> 카셰어링
            </a>
          <%}%>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="board.do">
              <i class="ni ni-bullet-list-67 text-blue"></i> 자유게시판
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="notice.do">
              <i class="ni ni-air-baloon text-red"></i> 공지사항
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="coupon.do">
              <i class="ni ni-collection text-green"></i> 쿠폰
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" id="handler_a" style="cursor: pointer;">
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
         <a class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block" href="#none" onclick="location.reload(true)">Handler</a>
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
    <div class="header bg-gradient-default pb-7 pt-5 pt-md-8">
      <div class="container-fluid">
        <div class="header-body">

        </div>
      </div>
    </div>
    <div class="container-fluid mt--7">
      <div class="row">
        <div class="col">
          <div class="card shadow border-0" style="padding: 40px;">
          	<div class="hb_title">
          		<label>Handler Board</label>
          	</div>
          	
          	 <!-- Button trigger modal -->
			<button type="button" class="btn btn-primary" id="btndddd" data-toggle="modal" data-target="#exampleModal" style="width: 20%; margin-top: 3%;">
			  지역선택
			</button>
			
			<button type="button" class="btn btn-primary" onclick="location.href='handlerBoard.do'" style="width: 20%; margin-top: 1%; margin-bottom: 3%;">
			  전체보기
			</button>
			
			<!-- 지역선택 Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">지역 선택</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			      	<div class="form-group">
						<div class="col-sm-3_jkh">
						<div id="association_out" style="width: 100%; height:auto;">
							<div class="s_r_lo">
								<label class="start_lo">출발지점</label>
								<label class="return_lo">도착지점</label>
							</div>
							<div class="cl_bo fl_left" id="location1" style="margin-right:20px; width: 100%;">
								<select name="region_1_n" id="region_1_n" required class="form-control input-sm">
									<option value="" selected>- 광역 지역 -</option>
				  					<option value="서울" class="si_do">서울</option>
				  					<option value="부산" class="si_do">부산</option>
				  					<option value="대구" class="si_do">대구</option>
				  					<option value="인천" class="si_do">인천</option>
				  					<option value="광주" class="si_do">광주</option>
				  					<option value="대전" class="si_do">대전</option>
				  					<option value="울산" class="si_do">울산</option>
				  					<option value="세종특별자치시" class="si_do">세종특별자치시</option>
				  					<option value="경기" class="si_do">경기</option>
				  					<option value="강원" class="si_do">강원</option>
				  					<option value="충북" class="si_do">충북</option>
				  					<option value="충남" class="si_do">충남</option>
				  					<option value="전북" class="si_do">전북</option>
				  					<option value="전남" class="si_do">전남</option>
				  					<option value="경북" class="si_do">경북</option>
				  					<option value="경남" class="si_do">경남</option>
				  					<option value="제주특별자치도" class="si_do">제주특별자치도</option>
				  				</select>
							</div>
							<div class="fl_left" id="location2">
								<select name="region_2_n" id="region_2_n" class="form-control input-sm">
									<option value="" selected>- 지역 선택 -</option>
				  				</select>
							</div>
						</div>
						</div>
						</div>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			        <button type="button" class="btn btn-primary" id="handlerDetailSearch1" data-dismiss="modal">Search</button>
			      </div>
			    </div>
			  </div>
			</div>
			
          	<div class="hb_table">
          		<table class="hb_table_head">
	          		<tr class="hb_table_head_tr">
	          			<td class="hb_table_head_num">
	          				번호
	          			</td>
	          			<td class="hb_table_head_startLocation">
	          				출발지점
	          			</td>
	          			<td class="hb_table_head_arrivalLocation">
	          				도착지점
	          			</td>
	          			<td class="hb_table_head_carNum">
	          				차량번호
	          			</td>
	          			<td class="hb_table_head_complete">
	          				운송완료시간
	          			</td>
	          			<td class="hb_table_head_handler">
	          				신청자
	          			</td>
	          			<td class="hb_table_head_carModel">
	          				차종
	          			</td>
	          			<td class="hb_table_head_point">
	          				예상적립포인트
	          			</td>
	          		</tr>
          		</table>
          		<table class="hb_table_content">
          			<c:forEach var="hdto" varStatus="status" items="${hlist}">
          			<tr class="hb_table_content_tr" data-toggle="modal" data-target="#exampleModal2">
	          			<td class="hb_table_content_num">${status.count}<input type="hidden" class="hb_num" name="hb_num" value="${hdto.hb_num }"></td>
	          			<td class="hb_table_content_startLocation">${hdto.startLocation }</td>
	          			<td class="hb_table_content_arrivalLocation">${hdto.returnLocation }</td>
	          			<td class="hb_table_content_carNum">${hdto.carNum }</td>
	          			<td class="hb_table_content_complete">${hdto.complete }</td>
	          			<td class="hb_table_content_handler">${hdto.handler }</td>
	          			<td class="hb_table_content_carModel">${hdto.carModel }</td>
	          			<td class="hb_table_content_point">${hdto.point }p</td>
          			</tr>
          			</c:forEach>
          		</table>
          	</div>
		  </div>
        </div>
      </div>
      
      
      
      
      
     		 <!-- 상세선택 Modal -->
			<div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">핸들러 신청 내역 상세정보</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			      	<div class="form-group">
						<div class="col-sm-3_jkh">
							<div id="association_out" style="width: 100%; height:auto;">
								<div class="handler_detail">
									
								</div>
							</div>
						</div>
					</div>
			      </div>
			      <div class="modal-footer">
			        <!-- <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> -->
			        <button type="button" class="btn btn-primary" id="handlerDetailSearch2" style="width: 100%; font-size: 25px;">신청하기</button>
			      </div>
			    </div>
			  </div>
			</div>
      
      
      
      
      
      
      <input type="hidden" id="location_choice">
      
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