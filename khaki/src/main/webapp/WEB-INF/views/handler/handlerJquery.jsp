<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script type="text/javascript">
  	$(function() {
  		var sessionId = '<%=(String)session.getAttribute("sessionId")%>';
		$(".hb_table_content_tr").click(function(){
			$(".handler_detail").children().remove();
			
			var carImg = ""; // ������ȣ�� ���� ����� ������ �̹��� db���� ajax�� �����;���
			var carNum = $(this).children(".hb_table_content_carNum").text(); // ������ȣ
			var carModel = $(this).children(".hb_table_content_carModel").text(); // ��������
			var startLocation = $(this).children(".hb_table_content_startLocation").text(); // ������(����������ġ)
			var arrivalLocation = $(this).children(".hb_table_content_arrivalLocation").text(); // �������(����������ġ)
			var complete = $(this).children(".hb_table_content_complete").text(); // ��ۿϷ�ð�
			var point = $(this).children(".hb_table_content_point").text(); // ������������Ʈ
			var hb_num = $(this).children(".hb_table_content_num").children(".hb_num").val();
			
			var h_detail_img = "<form action=\"handlerUse.do\" id=\"handlerUseFrm\"><div class=\"h_detail_img\">"; // �̹��� div�±�
			var h_detail_image = "<img class=\"h_detail_image\" src=\"https://img.hankyung.com/photo/201903/AA.19251102.1.jpg\"></img>"; // ������ȣ�� db�� �����Ͽ� ������ ������ �̹��� �±�(���÷� src�� �ӽ� �̹��� ������)
			var h_detail_carNum = "</div><div class=\"h_detail_carNum_title\">������ȣ</div><div class=\"h_detail_carModel_title\">����</div><div class=\"h_detail_carNum\">"; // ������ȣ div�±�
			var h_detail_carModel = "</div><div class=\"h_detail_carModel\">"; // ���� div�±�
			var h_detail_startLocation = "</div><div class=\"h_detail_startLocation_title\">������</div><div class=\"h_detail_startLocation\">"; // ������(����������ġ) div �±�
			var h_detail_arrivallocation = "</div><div class=\"h_detail_arrivallocation_title\">�������</div><div class=\"h_detail_arrivallocation\">"; // �������(����������ġ) div �±�
			var h_detail_complete = "</div><div class=\"h_detail_complete_title\">��ۿϷ�ð�</div><div class=\"h_detail_complete\">"; // ��� �Ϸ� �ð� div �±�
			var h_detail_point = "</div><div class=\"h_detail_point_title\">������������Ʈ</div><div class=\"h_detail_point\">";
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