<%@ page import="co.kr.khaki.zone.DTO.KhakiZoneDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach var="dto" items="${list}">
${dto.zone_location_x}/${dto.zone_location_y}/${dto.zone_name}/${dto.zone_comment}★
</c:forEach>
