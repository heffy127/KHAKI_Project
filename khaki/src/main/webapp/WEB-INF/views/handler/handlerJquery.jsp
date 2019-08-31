<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script type="text/javascript">
  	$(function() {
  		var sessionId = '<%=(String)session.getAttribute("sessionId")%>';
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
			
			var h_detail_img = "<form action=\"handlerUse.do\" id=\"handlerUseFrm\"><div class=\"h_detail_img\">"; // 이미지 div태그
			var h_detail_image = "<img class=\"h_detail_image\" src=\"https://img.hankyung.com/photo/201903/AA.19251102.1.jpg\"></img>"; // 차량번호로 db에 연결하여 가져온 차량의 이미지 태그(예시로 src에 임시 이미지 삽입함)
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
			
		})
  	})
  </script>