<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<option value="" class="cpu_choice" id="cpu_choice">- 쿠폰 선택 -</option>
<% int i = 0; %><c:forEach var="cpudto" items="${cpulist}">
<option value="${cpudto.cp_mon }" id="cpu_choice<%= i %>" class="cpu_choice">${cpudto.cp_title } (유효기간 : ${cpudto.cp_end })</option>
<% i += 1; %>
</c:forEach>
