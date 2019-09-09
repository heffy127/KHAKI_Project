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
<script src="resources/assets/js/plugins/jquery/dist/jquery.min.js"></script>
<script type="text/javascript">
   $(document).ready(function() {
      

      $("#searchSelect").val('${searchMethod}').prop('selected', true); // 검색 셀렉트박스 자동 선택
      
      
      // 운전면허 
      modalLicense = function(val) {
         $('#licenseIframe').attr('src','admin_licenseAdmin.do' + val)
         $('#modal-license').modal('show') 
      }
      
      // 모달 닫기
      $('.close').click(
         function () {
            window.closeModal()
      })
      
      window.closeModal = function(changed){ //변화된것이 있을경우 changed변수로 값 넘어옴
         $('.modal').modal('hide')
         if(changed == 'changed'){
            setTimeout(function() {
               location.reload(true);
               }, 600); // 0.6초뒤 페이지 새로고침
         }
      }
      
      // 주소 상세보기
      showAddress = function(val) {
         $('#addressPopover').attr("data-content", val)
         $('#addressPopover').popover('toggle')
      }
      
      $('#searchBtn').click(
            function() {
               if($('#search').val() == ''){
                  $('#searchWarn').popover('show')
                  $('#search').focus()
                  setTimeout(function() {
                     $('#searchWarn').popover('hide')
                  }, 1800); // 1.8초뒤 popover닫기
               }else{
                  $('#searchF').submit()
               }
            })
            
   
      
   })
</script>
<style type="text/css">
tr 
{
   text-align: center;
   align-items: center;
}
td
{   
   text-align: center;
   font-size: 18px !important;
}
th
{
   font-size: 15px !important;
}

.btn-outline-secondary {
  color: white;
  background-color: transparent;
  background-image: none;
  border-color: #f7fafc;
}

.btn-outline-secondary:hover {
  color: black;
  background-color: #f7fafc;
  border-color: #f7fafc;
}

iframe 
{ 
   box-shadow: 0 15px 35px rgba(50, 50, 93, 0.2), 0 5px 15px rgba(0, 0, 0, 0.17);
   border-top-left-radius: 0.4375rem; 
   border-top-right-radius: 0.4375rem;
   border-bottom-left-radius: 0.4375rem; 
   border-bottom-right-radius: 0.4375rem;
}

</style>
</head>
<body>
   <div align="center">
      <form id="searchF" name="searchF" action="admin_search.do" method="post">
         <nav class="navbar navbar-horizontal navbar-expand-lg navbar-dark bg-default">
             <div class="container">
                 <a class="navbar-brand" href="admin_memberAll.do"><font size="4">MEMBER MANAGEMENT</font></a>
                        <div style="width: 40%;">
                              <div style="float: left; width: 15%;">
                                 <select id = "searchSelect" name="searchSelect" style="margin-top:7%; font-size: 22px;">
                                    <option value="id">ID</option>
                                    <option value="name">이름</option>
                                 </select>
                              </div>
                              <div style="float: left; width: 65%;">
                                    <input type="text" class="form-control" id="search" name="search" placeholder="검색" 
                                    style="width: 100%; padding: 15px; font-size: 20px;">
                                 <div id="searchWarn" data-container="body" data-toggle="popover" data-color="warning" data-placement="bottom" data-content="검색할 내용을 입력"></div>
                              </div>
                              <div style="float: left; width: 20%;">
                                 <button id="searchBtn" type="button" class="btn btn-outline-secondary" style="margin-top: 1%;">검색</button>
                              </div>
                       </div>
                </div>
            </nav>
      </form>
      <div class="table-responsive">
         <div>
            <table class="table align-items-center">
               <thead class="thead-light">
                     <tr>
                        <th scope="col">ID</th>
                        <th scope="col">LEVEL</th>
                        <th scope="col">NAME</th>
                        <th scope="col">PHONE</th>
                        <th scope="col">EMAIL</th>
                        <th scope="col">ADRRESS</th>
                        <th scope="col">LICENSE<div class="dropdown">
                                    <a class="btn btn-sm btn-icon-only text-light" href="#"
                                       role="button" data-toggle="dropdown" aria-haspopup="true"
                                       aria-expanded="false"> <i class="fas fa-ellipsis-v" style="padding-top: 25%;"></i>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-left dropdown-menu-arrow" style="min-width: 95px; width: 95px;">
                                       <a class="dropdown-item" href="admin_licenseSort.do?permission=?" style="color: #ff9203;">심사대기</a> 
                                       <a class="dropdown-item" href="admin_licenseSort.do?permission=o" style="color: #17bd3d;">승인완료</a> 
                                       <a class="dropdown-item" href="admin_licenseSort.do?permission=x" style="color: #ff0055;">승인거절</a>
                                       <a class="dropdown-item" href="admin_licenseSort.do?permission=NULL" style="color: #525252;">미등록</a>
                                    </div>
                                 </div></th>
                                 
                        <th scope="col">POINT</th>
                        <th scope="col" colspan="2">PUSH<div class="dropdown">
                                    <a class="btn btn-sm btn-icon-only text-light" href="#"
                                       role="button" data-toggle="dropdown" aria-haspopup="true"
                                       aria-expanded="false"> <i class="fas fa-ellipsis-v" style="padding-top: 25%;"></i>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-left dropdown-menu-arrow" style="min-width: 95px; width: 95px;">
                                       <a class="dropdown-item" href="admin_selectPushSort.do?push=sms">SMS</a> 
                                       <a class="dropdown-item" href="admin_selectPushSort.do?push=email">Email</a>
                                    </div>
                                 </div></th>
                        <th scope="col"></th>
                     </tr>
                  </thead>
                  <tbody class="list">
                  
                  <c:set var="num" value="1"/>
                   <!-- 회원정보 출력 -->
                  <c:choose>
                     <c:when test="${fn:length(memberAdminList) eq 0}">
                        <tr>
                           <td colspan="11">
                              <div class="alert alert-warning" role="alert">
                                  <strong>검색된 결과가 없습니다.</strong>
                              </div>
                           </td>
                        </tr>
                     </c:when>
                     <c:otherwise>
                        <c:forEach var="memberAdminDTO" items="${memberAdminList}">
                           
                           <tr>
                              <th scope="row" class="name">
                                 <div class="media align-items-center" align="left">
                                    <img class="avatar rounded-circle mr-3" alt="Image placeholder"
                                       src="${memberAdminDTO.photo }">
                                    <div class="media-body">
                                       <span class="mb-0 text-md" style="font-size: 17px;">${memberAdminDTO.id }</span>
                                    </div>
                                 </div>
                              </th>
                              <td>Lv.${memberAdminDTO.memberLevel }</td>
                              <td>${memberAdminDTO.name }</td>
                              <td>${memberAdminDTO.phone1 }-${memberAdminDTO.phone2 }-${memberAdminDTO.phone3 }</td>
                              <c:choose>
                                 <c:when test="${memberAdminDTO.email_id == null}">
                                    <td>미등록</td>
                                 </c:when>
                                 <c:otherwise>
                                    <td>${memberAdminDTO.email_id }@${memberAdminDTO.email_site }</td>
                                 </c:otherwise>   
                              </c:choose>
                              <td >
                                 <a href="#none" id="addressPopover${num}" data-container="body" data-toggle="popover" data-color="warning" 
                                 data-placement="top" data-content="${memberAdminDTO.postcode } ${memberAdminDTO.address1 } ${memberAdminDTO.address2 } ${memberAdminDTO.address3 }" 
                                 onclick="showAddress(this.value)">
                                 ${fn:split(memberAdminDTO.address1,' ')[0]}&nbsp;${fn:split(memberAdminDTO.address1,' ')[1]}
                                 </a>
                              </td>
                                 
                           
                              <c:choose>
                                 <c:when test="${memberAdminDTO.permission eq null}">
                                 <td>
                                    <button type="button" class="btn btn-default" disabled="disabled">&nbsp;&nbsp;미등록&nbsp;&nbsp;</button>
                                 </td>   
                                 </c:when>
                                 <c:when test="${memberAdminDTO.permission eq '?'}">
                                    <td>
                                       <button id="licenseBtn${num}" type="button" class="btn btn-warning" 
                                       value="?id=${memberAdminDTO.id }&name=${memberAdminDTO.name}" onclick="modalLicense(this.value)">심사대기</button>
                                    </td>   
                                 </c:when>
                                 <c:when test="${memberAdminDTO.permission eq 'x'}">
                                    <td>
                                       <button id="licenseBtn${num}" type="button" class="btn btn-danger" 
                                       value="?id=${memberAdminDTO.id }&name=${memberAdminDTO.name}" onclick="modalLicense(this.value)">승인거절</button>
                                    </td>   
                                 </c:when>
                                 <c:otherwise>
                                    <td>
                                       <button id= "licenseBtn${num}" type="button" class="btn btn-success" 
                                       value="?id=${memberAdminDTO.id }&name=${memberAdminDTO.name}" onclick="modalLicense(this.value)">승인완료</button>
                                    </td>   
                                 </c:otherwise>
                              </c:choose>
      
                              
                              <td>${memberAdminDTO.point }&nbsp;pt</td>
                              
                              <!-- jstl을 통해 push 수신 여부에 따라 출력 분기  -->
                              <td class="completion" style="padding: 4px;">
                                 <c:choose>
                                    <c:when test="${memberAdminDTO.smsPush == 1}">
                                       <div class="custom-control custom-checkbox mb-3" style="margin-top: 20%;">
                                          <input class="custom-control-input" id="customCheck3" type="checkbox" checked="checked" disabled>
                                          <label class="custom-control-label" for="customCheck3"><i class="ni ni-mobile-button ni-2x"></i></label>
                                       </div>
                                    </c:when>
                                    <c:otherwise>
                                       <div class="custom-control custom-checkbox mb-3" style="margin-top: 20%;">
                                          <input class="custom-control-input" id="customCheck3" type="checkbox" disabled>
                                          <label class="custom-control-label" for="customCheck3"><i class="ni ni-mobile-button ni-2x"></i></label>
                                       </div>
                                    </c:otherwise>
                                 </c:choose>
                              </td>
                              <td class="completion" style="padding: 4px;">
                                 <c:choose>
                                    <c:when test="${memberAdminDTO.emailPush == 1}">
                                       <div class="custom-control custom-checkbox mb-3" style="margin-top: 20%;">
                                         <input class="custom-control-input" id="customCheck3" type="checkbox" checked="checked" disabled>
                                         <label class="custom-control-label" for="customCheck3"><i class="ni ni-email-83 ni-2x"></i></label>
                                       </div>
                                    </c:when>
                                    <c:otherwise>
                                       <div class="custom-control custom-checkbox mb-3" style="margin-top: 20%;">
                                         <input class="custom-control-input" id="customCheck3" type="checkbox" disabled>
                                         <label class="custom-control-label" for="customCheck3"><i class="ni ni-email-83 ni-2x"></i></label>
                                       </div>
                                    </c:otherwise>
                                 </c:choose>
                              </td>
                              <td class="text-right">
                                 <div class="dropdown">
                                    <a class="btn btn-sm btn-icon-only text-light" href="#"
                                       role="button" data-toggle="dropdown" aria-haspopup="true"
                                       aria-expanded="false"> <i class="fas fa-ellipsis-v"></i>
                                    </a>
                                    <div
                                       class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">
                                       <a class="dropdown-item" href="#">Action</a> <a
                                          class="dropdown-item" href="#">Another action</a> <a
                                          class="dropdown-item" href="#">Something else here</a>
                                    </div>
                                 </div>
                              </td>
                           </tr>
                           
                           <!-- 면허심사 창 -->
                           <div class="modal fade" id="modal-license" tabindex="-1" role="dialog" aria-labelledby="modal-license" aria-hidden="true" style="top: -150px;">
                               <div class="modal-dialog modal-lg modal-dialog-centered modal-" role="document">
                                   <div class="modal-content bg-gradient-primary">
                                      
                                       <div class="modal-header">
                                           <h2 class="modal-title" id="modal-title-default" style="color: #f5f5f5;">운전면허심사</h2>
                                           <button type="button" class="close" id="modal-close">
                                               <span><font color="white">x</font></span>
                                           </button>
                                        </div>
                                       
                                          <iframe id="licenseIframe" src="" width="730px" height="500px" frameborder="0"></iframe>
                                       
                                         <div class="modal-footer" style="padding: 0.5rem;">
                                              &nbsp;
                                          </div>
                  
                                   </div>
                               </div>
                             </div>
                           
                           <c:set var="num" value="${num + 1}"/>
                        </c:forEach>
                     </c:otherwise>
                  </c:choose> 
               </tbody>
            </table>
         </div>

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