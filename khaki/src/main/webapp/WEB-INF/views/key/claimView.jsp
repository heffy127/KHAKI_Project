<%@page import="co.kr.khaki.key.ClaimDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="co.kr.khaki.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!-- Favicon -->
  <link href="resources/assets/img/brand/favicon.png" rel="icon" type="image/png">
  <!-- Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
  <!-- Icons -->
  <link href="resources/assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
  <link href="resources/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link href="resources/assets/css/argon-dashboard.css?v=1.1.0" rel="stylesheet" />
  <!-- 글씨체 -->
  <link href="https://fonts.googleapis.com/css?family=Hi+Melody&display=swap" rel="stylesheet">
  <!-- JQuery CDN -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <!-- 글쓰기 버튼 실행 -->
  <script type="text/javascript">
  	function claimView1() {
		var category = $('#claimCategory').val();
		location.href="claimView1.do?category="+category;
	}
  	$(function(){
  		$("#writeButton").click(function(){
  			location.href= 'insertPage.do';
  		});
  	});
  	function claimModal(content,id,num) {
  		
		$('#claim_answer').empty();
		$('#claim_num').text(num);
		$('#claim_answer').append(content);
		$('#claim_answer').append("처리내용 : <input class='form-control' id='claim_result' name='claim_result'>");
		$('#modal-claim').modal('show');
	}
  	function claimInput() {
		var num = $('#claim_num').text();
		var result = $('#claim_result').val();
		
		location.href="claimResult.do?claim_num="+num+"&claim_result="+result;
	}
  	function resultView(content,result) {
  		$('#claim_answer').empty();
		$('#claim_num').text(num);
		$('#claim_answer').append(content);
		$('#claim_answer').append("처리내용 : <input class='form-control' id='claim_result' name='claim_result' value="+result+" readonly>");
		$('#modal-claim').modal('show');
	}
  </script>
</head>

<body class="">
    
      <!-- 게시판 리스트 -->
      <div class="row">
        <div class="col">
          <div class="card shadow">
            <div class="card-header border-0">
              <h3 class="mb-0" style="font-family: 'Hi Melody', cursive; font-size: 20px;">신고내역
              <select id="claimCategory"onchange="claimView1()">
	               <option>유형선택</option>
	               <option value="disorder">불편</option>
	               <option value="accident">사고</option>
	               <option value="etc">기타</option>
              </select>
              </h3>
            </div>
            <div class="table-responsive">
              <table class="table align-items-center table-flush">
                <thead class="thead-light">
                  <tr>
                    <th class="bodyList" scope="col" width="10%">번호</th>
                    <th class="bodyList" scope="col" width="10%">신고유형</th>
                    <th class="bodyList" scope="col" width="30%">내용</th>
                    <th class="bodyList" scope="col" width="10%">작성자</th>
                    <th class="bodyList" scope="col" width="10%">진행상황</th>
                    <th class="bodyList" scope="col" width="10%">작성시간</th>
                    <th class="bodyList" scope="col" width="20%">답변시간</th>
                  </tr>
                </thead>
                
               
                <c:forEach var="claimDTO" items="${list}">
                <tbody class="listBody">
                
                  <tr>
                  <!-- num -->
                    <td scope="row">
                      <div id="num">
                      	${claimDTO.claim_num}
                      </div>
                  	</td>
                    <!-- category -->
                    <td >
                    	<c:set var="category" value="category" />
                    	<c:choose>
							<c:when test="${claimDTO.claim_category eq 'disorder'}">
								<font style="color: navy; font-weight: bold;">불편신고</font>
							</c:when>  
							                  	
							<c:when test="${claimDTO.claim_category eq 'accident'}">
								<font style="color: red; font-weight: bold;">사고신고</font>
							</c:when>                    	
							
							<c:when test="${claimDTO.claim_category eq 'etc'}">
								<font style="color: red; font-weight: bold;">기타</font>
							</c:when>                    	
                    	</c:choose>
                    </td>
                    <!-- subject -->
                    <td >
                    	<b>${claimDTO.claim_content}</b>
                    </td>
                  	<!-- writer -->
                    <td>
						${claimDTO.claim_id}
                    </td>
                    <!-- views -->
                    <td>
                      <div>
                      <c:set var="category" value="category" />
                      <c:choose>
                      
	                      <c:when test="${claimDTO.claim_result eq null}">
	                        <button class="btn btn-outline-danger" data-toggle="modal" data-target="#exampleModal" onclick="claimModal('${claimDTO.claim_content}','${claimDTO.claim_id}','${claimDTO.claim_num}')">확인중</button>
					      </c:when>
					      
	                      <c:when test="${claimDTO.claim_result ne null}">
	                        <button class="btn btn-success" data-toggle="modal" data-target="#exampleModal" onclick="resultView('${claimDTO.claim_content}','${claimDTO.claim_result}')">완료</button>
					      </c:when>
					      
				      </c:choose>
                      </div>
                    </td>
                    
                    <!-- result -->
                   	<td>
						${fn:substring(claimDTO.claim_subTime,0,14)}
                   	</td>
                   
                    <!-- time -->
                    <td>
                    	<!-- timestamp로 등록한 값을 분까지만 자름 -->
						${fn:substring(claimDTO.claim_ansTime,0,14)}
                    </td>
             	 </c:forEach>
             	 
                	<tr>
                	</tr>
              </table>
            </div>
            <!-- Modal -->
			<div class="modal fade" id="modal-claim" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="false">
			  <div class="modal-dialog modal-dialog-centered" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 id="claim_num" hidden=""></h5>
			        <h5 class="modal-title" id="exampleModalLabel">신고처리</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body" id="claim_answer">
			       
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
			        <button type="button" class="btn btn-primary" onclick="claimInput()">저장</button>
			      </div>
			    </div>
			  </div>
			</div>
			
            <div class="card-footer py-4">
             <nav aria-label="Page navigation example">
			  <ul class="pagination justify-content-center">
			    <li class="page-item disabled">
			      <a class="page-link" href="#" tabindex="-1">
			        <i class="fa fa-angle-left"></i>
			        <span class="sr-only">Previous</span>
			      </a>
			    </li>
			    <li class="page-item active"><a class="page-link" href="#">1</a></li>
			    <li class="page-item "><a class="page-link" href="#">2</a></li>
			    <li class="page-item"><a class="page-link" href="#">3</a></li>
			    <li class="page-item">
			      <a class="page-link" href="#">
			        <i class="fa fa-angle-right"></i>
			        <span class="sr-only">Next</span>
			      </a>
			    </li>
			    
			  </ul>
			</nav>
            </div>
          </div>
        </div>
      </div>
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
   window.TrackJS && TrackJS.install({
      token : "ee6fab19c5a04ac1a32a645abde4613a",
      application : "argon-dashboard-free"
   });
</script>
</body>

</html>
