<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
  <!-- Favicon -->
  <link href="resources/assets/img/brand/favicon.png" rel="icon" type="image/png">
  <!-- Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
  <!-- Icons -->
  <link href="resources/assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
  <link href="resources/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link href="resources/assets/css/argon-dashboard.css?v=1.1.0" rel="stylesheet" />
  <!-- jquery -->
  <script src="resources/assets/js/plugins/jquery/dist/jquery.min.js"></script>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
 <script type="text/javascript">
 $(document).ready(function() {
	  
	  $('#messageinput').keyup(
			function(event) {
				if(event.keyCode == 13){
					$('#sendBtn').click()
				}
		})
		
	  $('#chatStartBtn').click(
			function() {
				openSocket()
				$('#btn').hide()
				$('#main').show()
		})
			
	 
})
 </script>
<body>
 <script type="text/javascript">

	  var ws;
	  var messages=document.getElementById("messages");
	  
	  function openSocket(){
	      if(ws!==undefined && ws.readyState!==WebSocket.CLOSED){
	          writeResponse("WebSocket is already opened.");
	          return;
	      }
	      //웹소켓 객체 만드는 코드
	      ws=new WebSocket("ws://localhost:9999/khaki/echo.do");
	      
	      ws.onopen=function(event){
	          if(event.data===undefined) return;
	          
	          $('#chatContent').append(event.data + "<br>");
	          $('#chatContent').scrollTop($('#chatContent').prop('scrollHeight'));
	      };
	      ws.onmessage=function(event){
	    	  var message = event.data.split(',,,')
	    	  if(message[0] == '나'){ // 내가 보낸 메세지 표현
	    		  $('#chatContent').append(
	    			'<div align="right" style="padding-top: 4px;">'
	    			+ '<div style="background-color: #d1ffcf; width: 80%;">'
	    			+ '<b>나</b><br>' + message[1] + '</div></div>'
	    		  );
	    	  } else if(message == '채팅이 연결되었습니다.'){ // 채팅이 잘 연결 되었음을 띄움
	    				
	    		  $('#chatContent').append(message)
	    		  
	    	  } else if(message == "상담원과의 연결이 종료되었습니다.") {
	    		  
	    		  alert("상담원과의 연결이 종료되었습니다.\n계속 상담을 원하시면 다시 시도해주세요.")
	    		   parent.document.location.reload()
	    		  
	    	  }else if(message == '채팅가능관리자없음'){ // 채팅 가능 인원이 초과된경우 alert을 띄우고 새로고침
	    		  
	    		  alert("채팅 가능한 상담원이 없습니다.\n나중에 다시 시도해주세요.")
	    		  parent.document.location.reload()
	    		  
	    	  } else { // 상대방이 보낸 메세지 표현
	    		 
	    		  $('#chatContent').append(
		  	    			'<div align="left" style="padding-top: 4px;"><div style="background-color: #fff5b5; width: 80%;">'
		  	    			+ '<b>' + message[0] +'</b><br>' + message[1] + '</div></div>'
		  	    	);
	    	  }
	    	  
	          $('#chatContent').scrollTop($('#chatContent').prop('scrollHeight'));
	      };
	      /////
	      ws.onclose=function(event){
	    	  alert('상담이 종료되었습니다.')
	    	  $('#chatContent').text('')
	    	  $('#chatContent').scrollTop($('#chatContent').prop('scrollHeight'));
	      }
	      //////
	  }
	  
	  function send(){
		  // 내용없이 전송할 때
		  if($("#messageinput").val().trim() == ''){
			  alert("전송할 내용을 입력해주세요.")
			  $("#messageinput").focus()
			  return false
		  }
		  // 채팅 종료하기
		  if($("#messageinput").val().trim() == "종료"){
			  $('#messageinput').val('')
			  $('#chatContent').text('')
			  parent.document.location.reload()
			  return false
		  }
		  
	      var text=document.getElementById("messageinput").value+",,,"+document.getElementById("sender").value+",,,admin";
	      ws.send(text);
	      $('#messageinput').val('')
	  }
	  
	  function closeSocket(){
	      ws.close();
	  }
	  function writeResponse(text){
	      messages.innerHTML+="<br/>"+text;
	  }

  </script>
<div id="btn">
	<button class="btn btn-secondary" id="chatStartBtn" style="width: 315px; height: 395px; padding: 0px;">
		<img src="resources/assets/img/theme/chatBtn-cover.JPG" width="315px" height="395px">
	</button>
</div>
<div id="main" style="display: none;">
	 <div>
        <input type="text" id="sender" value="${sessionId}" style="display: none;">
        <table>
			<tr>
				<td>
					 <textarea class="form-control" rows="2" cols="28" id="messageinput"
					 placeholder="상담을 그만하시려면 '종료'를 입력하고 전송해주세요."></textarea>
				</td>
				<td>
					<button type="button" class="btn btn-outline-success" 
					onclick="send()" id="sendBtn" style="height: 55px;">전송</button>
				</td>
			</tr>        
			<tr>
				<td colspan="2">
					<div style="overflow:auto; height: 300px; margin-top : 10px;" id="chatContent">
					</div>
				</td>
			</tr>
        </table>
    </div>

    <div>
       <!--  <button type="button" onclick="closeSocket();">Close</button> -->
    </div>
    <!-- Server responses get written here -->
    <div id="messages"></div>
</div>
</body>
</html>