<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Fonts -->
<link
   href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
   rel="stylesheet">
<!-- Icons -->
<link href="resources/assets/js/plugins/nucleo/css/nucleo.css"
   rel="stylesheet" />
<link
   href="resources/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css"
   rel="stylesheet" />
<!-- CSS Files -->
<link href="resources/assets/css/argon-dashboard.css?v=1.1.0"
   rel="stylesheet" />
<script src="resources/assets/js/plugins/jquery/dist/jquery.min.js"></script>
<script type="text/javascript">

   fn_paging = function(curPage){ // 페이징 function 
         location.href = "surveyQ6.do?curPage="+curPage;          
   }

</script>
</head>
<body>
   <div align="center">
      <div style="width: 580px;">
         <div class="table-responsive">
            <div>
               <table class="table align-items-center">
                  <thead class="thead-light">
                     <tr>
                        <th scope="col"><font size="4">추가 의견</font></th>

                     </tr>
                  </thead>
                  <tbody class="list">
                     <c:forEach var="opinion" items="${opinionList}"
                        begin="${pagination.startIndex }" end="${pagination.endIndex }">
                        <tr>
                           <th scope="row" class="name">${opinion}</th>
                        </tr>
                     </c:forEach>
                     <!-- 페이지 네이션 구현 -->

                  </tbody>
               </table>
            </div>

         </div>
         <nav aria-label="Page navigation example">
         <ul class="pagination pagination-lg justify-content-center">
            <c:if test="${pagination.curRange ne 1 }">
               <li class="page-item"><a href="#" class="page-link" onClick="fn_paging(1)">
                <i class="fa fa-angle-left"></i><i class="fa fa-angle-left"></i> </a>
               </li>
            </c:if>
            <c:if test="${pagination.curPage ne 1}">
               <li class="page-item"><a class="page-link" href="#"
                  onClick="fn_paging('${pagination.prevPage }')"
                  aria-label="Previous"> <i class="fa fa-angle-left"></i> <span
                     class="sr-only">Previous</span>
               </a></li>
            </c:if>
            <!-- 페이지 숫자 표시 부분 -->
            <c:forEach var="pageNum" begin="${pagination.startPage }"
               end="${pagination.endPage }">
               <c:choose>
                  <c:when test="${pageNum eq pagination.curPage}">
                     <li class="page-item active"><a href="#" class="page-link"
                        onClick="fn_paging('${pageNum }')">${pageNum }<span
                           class="sr-only">(current)</span></a></li>
                  </c:when>
                  <c:otherwise>
                     <li class="page-item"><a class="page-link" href="#"
                        onClick="fn_paging('${pageNum }')">${pageNum }</a></li>
                  </c:otherwise>
               </c:choose>
            </c:forEach>
            <c:if
               test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
               <li class="page-item"><a class="page-link" href="#"
                  onClick="fn_paging('${pagination.nextPage }')" aria-label="Next">
                     <i class="fa fa-angle-right"></i> <span class="sr-only">Next</span>
               </a></li>

            </c:if>
         </ul>
         </nav>
      </div>
   </div>
   <script
      src="resources/assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
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