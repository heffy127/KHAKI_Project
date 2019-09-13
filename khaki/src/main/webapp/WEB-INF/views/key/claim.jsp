<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8" />
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
  <!-- JQuery CDN -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  
  <!-- 스마트 에디터  -->
  <script src="https://code.jquery.com/jquery-latest.js"></script>
  <script type="text/javascript" src="./resources/smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>
  <script type="text/javascript">
  	$(function(){
  		// 전역변수
  		var obj = [];
  		// 스마트 에디터 프레임 생성
  		nhn.husky.EZCreator.createInIFrame({
            oAppRef: obj,
            elPlaceHolder: "content",
            sSkinURI: "./resources/smarteditor2/SmartEditor2Skin.html",
            htParams : {
                // 툴바 사용 여부
                bUseToolbar : true,            
                // 입력창 크기 조절바 사용 여부
                bUseVerticalResizer : true,    
                // 모드 탭(Editor | HTML | TEXT) 사용 여부
                bUseModeChanger : true,
            }
        });
        //전송버튼
        $("#insertBoard").click(function(){
            //id가 smarteditor인 textarea에 에디터에서 대입
            obj.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
            //폼 submit
            var title = $("#title").text();
            if(title == null){
            	alert("제목을 입력해주세요.")
            }else{
            	alert("게시글이 등록되었습니다.")
	            $("#insertBoardFrm").submit();
            }

        });
    });
  	
  </script>
</head>

<body class="">
<div id="board" style="width: 100%; padding: 5% 10% 5% 10%;">
		    		<div style=" width:800px; height: 30px; ">
						<div style="repeat-x; text-align:center;">
							<div ></div> 
							<div align="center"><h2>신고</h2></div>
						</div>
					</div>
					<form action="claimInsert.do" method="POST" id="insertBoardFrm" enctype="multipart/form-data">
						<div>
				   			
				        	<div>
				        	<!-- 관리자 권한  -->
				           		<div style="width: 100px;"><h3>글 카테고리 </h3>
									<div>
									<input type="radio" id="category" name="claim_category" value="disorder" checked>불편신고<br>
									<input type="radio" id="category" name="claim_category" value="accident">사고신고 <br>
									<input type="radio" id="category" name="claim_category" value="etc">기타<br>
									</div>
								</div>
							<!-- 관리자 권한  END -->
				        	</div>
				        		<div>
					           		<div style="width: 100px;"><h3>글 작성자 </h3></div>
									<div><input id="writer" name="claim_id" readonly="readonly" value=${sessionName } ></div>
				        		</div>
				        		<div>
				        			<div><h3>내용</h3></div>
				            		<div>
				    					<textarea class="form-control" name="claim_content" id="content" rows="20" cols="50" placeholder="<h1>ex) 차에 쓰레기가 있어요,시동이 안 걸려요, 이런 점이 있으면 좋겠어요</h1>" style="width: 70%"></textarea>
				    				</div>
				    			</div>
			    		</div>
				   			<button type="button" id="insertBoard" class="btn btn-outline-success" style="margin-left:330px;">게시글 등록</button>
				   			<button type="button" class="btn btn-outline-danger" OnClick="javascript:history.back(-1)">취소</button>
					</form>
			   		</div>
</body>

</html>
