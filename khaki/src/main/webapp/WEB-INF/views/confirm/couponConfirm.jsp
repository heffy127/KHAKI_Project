<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<option value="basic" class="cpu_choice" id="cpu_choice">- 쿠폰 선택 -</option>
<% int i = 0; %><c:forEach var="cpudto" items="${cpulist}">
<option value="${cpudto.cp_type },${cpudto.cp_num },${cpudto.num},${cpudto.cp_condition},${cpudto.cp_title}" id="cpu_choice<%= i %>" class="cpu_choice">${cpudto.cp_title } (유효기간 : ${cpudto.cp_end })</option>
<% i += 1; %>
</c:forEach>
