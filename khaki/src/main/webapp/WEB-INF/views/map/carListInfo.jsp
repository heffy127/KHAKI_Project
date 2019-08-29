<%@ page import="co.kr.khaki.car.CarDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach var="dto" items="${carList}">
${dto.driven},${dto.fuel_gage},${dto.car_image}★
</c:forEach>