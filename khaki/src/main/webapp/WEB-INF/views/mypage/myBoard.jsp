<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Fonts -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
<!-- Icons -->
<link href="resources/assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
<link href="resources/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" />
<!-- CSS Files -->
<link href="resources/assets/css/argon-dashboard.css?v=1.1.0" rel="stylesheet" />
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="resources/assets/js/plugins/jquery/dist/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(
	function() {
        //게시글 삭제버튼
        deleteBtn = function(val){
        	var retVal = confirm("게시글을 삭제하시겠습니까?");
        	   if( retVal == true ){
	        	   swal("삭제되었습니다.");
			       var num = ${dto.bNum}
			       location.href = 'delete.do?bNum=' + val
        	   }else{
        		   return false
        	   }
        }
})
</script>
</head>
<body>
	<div style="width: 98%">
      <!-- 게시판 리스트 -->
      <div class="row" style="padding-left: 2%;">
        <div class="col">
          <div class="card shadow">
            <div class="card-header border-0">
              <h3 class="mb-0" style="font-size: 20px;">내가 쓴 글</h3>
            </div>
            <div class="table-responsive">
              <table class="table align-items-center table-flush">
                <thead class="thead-light">
                  <tr>
                    <th class="bodyList" scope="col" width="10%">N   U   M</th>
                    <th class="bodyList" scope="col" width="10">C A T E</th>
                    <th class="bodyList" scope="col" width="30%">S U B J E C T</th>
                    <th class="bodyList" scope="col" width="10%">W R I T E R</th>
                    <th class="bodyList" scope="col" width="10%">V I E W S</th>
                    <th class="bodyList" scope="col" width="10%">H   I   T</th>
                    <th class="bodyList" scope="col" width="15%">D  A  T  E</th>
                    <th class="bodyList" scope="col" width="5%"></th>
                  </tr>
                </thead>
                <c:choose>
                	<c:when test="${fn:length(list) eq 0}">
                		<tr>
                           <td colspan="7">
                              <div class="alert alert-warning" role="alert" align="center">
                                  <strong>작성하신 글이 없습니다.</strong>
                              </div>
                           </td>
                        </tr>
                	</c:when>
                	<c:otherwise>
			            <c:forEach var="bDTO" items="${list}">
			                <tbody class="listBody">
			                
			                  <tr>
			                  <!-- num -->
			                    <td scope="row">
			                      <div id="num">
			                      	${bDTO.bNum}
			                      </div>
			                  	</td>
			                    <!-- category -->
			                    <td >
			                    	<c:set var="category" value="category" />
			                    	<c:choose>
										<c:when test="${bDTO.category eq 'free'}">
											<font style="color: navy; font-weight: bold;">일반</font>
										</c:when>  
										                  	
										<c:when test="${bDTO.category eq 'notice'}">
											<font style="color: red; font-weight: bold;">공지</font>
										</c:when>                    	
			                    	</c:choose>
			                    </td>
			                    <!-- subject -->
			                    <td >
			                    	<!-- 부모 페이지의 창 변환 -->
			                    	<a href="#none" onclick="javascript:window.parent.location.href='select.do?bNum=${bDTO.bNum}'"><b>${bDTO.title}</b></a>
			                    </td>
			                  	<!-- writer -->
			                    <td>
									${bDTO.writer}
			                    </td>
			                    <!-- views -->
			                    <td>
			                      <div>
			                        ${bDTO.views}
			                      </div>
			                    </td>
			                    
			                    <!-- hit -->
			                   	<td>
			                     	${bDTO.hit}
			                   	</td>
			                    
			                    <!-- time -->
			                    <td>
			                    	<!-- timestamp로 등록한 값을 분까지만 자름 -->
									${fn:substring(bDTO.write_date,0,14)}
			                    </td>
			                    
			                    <!-- deleteBtn -->
			                    <td>
			                    	<button type="button" class="btn btn-outline-danger" 
			                    	value="${bDTO.bNum}" onclick="deleteBtn(this.value)">삭제</button>
			                    </td>
			                 
			             	 </c:forEach>
                	</c:otherwise>
                </c:choose>
               
             
              </table>
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
</body>
</html>