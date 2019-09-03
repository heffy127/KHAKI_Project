<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="resources/assets/css/argon-dashboard.css?v=1.1.0" rel="stylesheet" />
<div style="background-color: white; width: 100%; height: 1000px;">
<div id="handlerUseArea">Handler</div>
<label style="padding-left: 5%;">고객님께서 처리해야 할 부름서비스 내역입니다.<br>도착 완료시간내에 완료하지 못할 경우 패널티가 부과 될 수 있습니다.<br>완료한 차량이 경우 처리완료 버튼을 눌러주세요!</label>
<table border="1px solid #d9d9d9" style="width: 100%; text-align: center; margin-top: 5%;">
	<tr style="height: 50px; font-size: 20px; font-weight: bold; background-color: #c0f0dc;">
		<td>차량번호</td>
		<td>차종</td>
		<td>출발장소</td>
		<td>도착장소</td>
		<td>도착완료시간</td>
		<td>예상적립포인트</td>
		<td>완료여부</td>
	</tr>
	<c:forEach var="hudto" varStatus="status" items="${hulist}">
		<tr style="height: 50px;" id="handlerUseTr">
			<td>${hudto.h_carNum }</td>
			<td>${hudto.h_carModel }</td>
			<td>${hudto.h_startLocation }</td>
			<td>${hudto.h_returnLocation }</td>
			<td>${hudto.h_complete }</td>
			<td>
			<button type="button" class="btn btn-default" data-container="body" data-toggle="popover" data-placement="top" data-content="This is a very beautiful popover, show some love.">${hudto.h_point }</button>
			</td>
			<td><button type="button" class="btn btn-outline-success" style="width: 100%; margin: 0;">처리완료</button><input type="hidden" value="${hudto.h_using }"></td>
		</tr>
	</c:forEach>
</table>
</div>