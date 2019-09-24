<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>   <!-- UTF로 인코딩 -->
<%@page import="co.kr.khaki.member.DTO.MemberDTO"%>


     <html>

    <head>
        <title></title>
    <%
		String phone = (String)request.getAttribute("phone"); 
		String authNum = (String)request.getAttribute("authNum");
		session.setAttribute("sessionPhoneAuth", authNum);
	%>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script type="text/javascript">
        $(document).ready(
        		function () {
					
				})
        
            function setPhoneNumber(val) {
                var numList = val.split("-");
                document.smsForm.sphone1.value = numList[0];
                document.smsForm.sphone2.value = numList[1];
            if(numList[2] != undefined){
                    document.smsForm.sphone3.value = numList[2];
              }
            }

            function loadJSON() {
               // form 객체 엘리먼트 생성
               var f = document.getElementById("smsForm");
               
                var data_file = "/calljson.jsp";
                var http_request = new XMLHttpRequest();
                try {
                    // Opera 8.0+, Firefox, Chrome, Safari
                    http_request = new XMLHttpRequest();
                } catch (e) {
                    // Internet Explorer Browsers
                    try {
                        http_request = new ActiveXObject("Msxml2.XMLHTTP");

                    } catch (e) {

                        try {
                            http_request = new ActiveXObject("Microsoft.XMLHTTP");
                        } catch (e) {
                            // Eror
                            alert("지원하지 않는브라우저!");
                            return false;
                        }

                    }
                }
                http_request.onreadystatechange = function() {
                    if (http_request.readyState == 4) {
                        // Javascript function JSON.parse to parse JSON data
                        var jsonObj = JSON.parse(http_request.responseText);
                        if (jsonObj['result'] == "Success") {
                            var aList = jsonObj['list'];
                            var selectHtml = "<select name=\"sendPhone\" onchange=\"setPhoneNumber(this.value)\">";
                            selectHtml += "<option value='' selected>발신번호를 선택해주세요</option>";
                            for (var i = 0; i < aList.length; i++) {
                                selectHtml += "<option value=\"" + aList[i] + "\">";
                                selectHtml += aList[i];
                                selectHtml += "</option>";
                            }
                            selectHtml += "</select>";
                            document.getElementById("sendPhoneList").innerHTML = selectHtml;
                        }
                    }
                }

                http_request.open("GET", data_file, true);
                http_request.send();
                
                //form 객체 자동 submit
                f.submit();
            }
        </script>
    </head>
   
   <!--
      sms 사용방법
      -- 사용전 셋팅 --
      1. cafe24 로그인(id : min1265 / pw : khaki4268! )
      
      2. 나의 서비스 관리
      
      3. 좌측 문자보내기 설정 / API 발송 IP설정 - 현재 IP 입력하여 등록(활용후에는 꼭 지워주기! 사용하는 사람들을 위해서ㅎㅎ)
      3-1. 발신번호 관리에서 보내고자 하는 번호 설정(현재 내번호만 설정 되어 있음)
      
      4. 각자의 Controller에서 sms/smsindex로 갈 수 있게 설정
      4-1. 예시코드
      
      sms샘플코드 사용 관련
      문자 전송 흐름 : smsindex(각자 작성할 내용을 제목, 전송메시지에 기입(자동 submit되게 만듦) -> smssend -> home화면
      보내는 번호는 일단은 내번호로 했고, 받는 번호는 앞으로 DB에서 가져온 내용을 가져오는 식으로 만들면 될듯
      
      @RequestMapping("sms.do")   
      //샘플은 sms.do로 사용하지만 각자의 시그니쳐 넣어서 활용 ex) smsmin.do와 같이
      // RequestMapping을 통해서 각자 도메인 주소로 가게끔 설계 
      public String sms(){
         // smstest 페이지로 이동하기 위한 컨트롤러로 각자 사용하는 컨트롤러에 가져가서 사용하면 됨
         
         return "sms/smsindex";
      }
      
      @RequestMapping("smssend.do")
      public String smssend(){
         
         return "sms/smssend";
      }
      
      작성할 내용 : 제목, 전송메시지, 받는 번호, test flag(Y로 기본값 지정해놓음, value에 Y를 없애면 실제 전송)
      
      ※ 사이트 서비스 사용현황에서 문자 300건 사용할 수 있게 되어있음, 사용하면 1건씩 차감되므로 확인 후 진행하시기 바람~
    -->

    <body onload="loadJSON()"><!-- 객체 불러오면서 실행 -->
    <form method="post" name="smsForm" id="smsForm" action="smssend_phAuth.do">   <!-- action에 발송처리를 담당할 jsp파일을 입력해줌  -->
        <input type="hidden" name="action" value="go"><!--  발송타입 -->
        <input type="hidden" name="smssend_go" value="phoneCheck">
        <!-- 단문 메시지만 사용할 예정으로 현재 checked되어 있음 -->

          <input type="hidden" name="smsType" value="S" >

        
        <!-- value에 제목 작성 : 우리는 작성된 문자를 보내는 것이기에 여기서 작성-->  
        <input type="hidden" name="subject" value="테스트문자" id="subject"><!--  장문(LMS)인 경우(한글30자이내) -->
        
        <!-- textarea -->
 
        <textarea name="msg" cols="30" rows="10" style="width:455px; display: none;" id="content" >[KHAKI] 인증번호는 [ <%=authNum %> ] 입니다.
        </textarea>


        <!--rphone은 받는번호로 ,를 이용해서 지정 가능, -도 입력  -->
        <input type="text" name="rphone" value="<%=phone%>"><!--  예) 011-011-111 , '-' 포함해서 입력. -->
        
        <!-- <br />이름삽입번호
        <input type="text" name="destination" value="" size=80> 예) 010-000-0000|홍길동 -->
        

        <!-- 보내는 번호는 cafe24에 발신번호 관리에 등록된 번호에 한해서 -->
        <input type="hidden" name="sphone1" value="010">
        <input type="hidden" name="sphone2" value="3343">
        <input type="hidden" name="sphone3" value="5653">
        <span id="sendPhoneList"></span>
        
        <!-- <br />예약 날짜
        <input type="text" name="rdate" maxlength="8"> 예)20090909
        <br />예약 시간
        <input type="text" name="rtime" maxlength="6"> 예)173000 ,오후 5시 30분,예약시간은 최소 10분 이상으로 설정.
        <br />return url
        <input type="text" name="returnurl" maxlength="64" value=""> -->
        

        <input type="hidden" name="testflag" maxlength="1" value=""> <!-- 테스트는 Y -->
        <!-- 예) 테스트시: Y -->
        
        <!-- <br />nointeractive
        <input type="text" name="nointeractive" maxlength="1"> 예) 사용할 경우 : 1, 성공시 대화상자(alert)를 생략.
        <br />반복설정
        <input type="checkbox" name="repeatFlag" value="Y">
        <br /> 반복횟수
        <select name="repeatNum">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
        </select> 예) 1~10회 가능.
        <br />전송간격
        <select name="repeatTime"> 예)15분 이상부터 가능.
            <option value="15">15</option>
            <option value="20">20</option>
            <option value="25">25</option>
        </select>분마다
        <br> -->
       <!-- 이통사 정책에 따라 발신번호와 수신번호가 같은 경우 발송되지 않습니다. -->
    </form>
    </body>

    </html>
            