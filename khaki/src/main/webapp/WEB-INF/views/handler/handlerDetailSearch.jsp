<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
%><c:forEach var="hdto" varStatus="status" items="${hlist}"><tr class="hb_table_content_tr" data-toggle="modal" data-target="#exampleModal2"><td class="hb_table_content_num">${status.count}</td><td class="hb_table_content_startLocation">${hdto.startLocation }</td><td class="hb_table_content_arrivalLocation">${hdto.returnLocation }</td><td class="hb_table_content_carNum">${hdto.carNum }</td><td class="hb_table_content_complete">${hdto.complete }</td><td class="hb_table_content_handler">${hdto.handler }</td><td class="hb_table_content_carModel">${hdto.carModel }</td><td class="hb_table_content_point">${hdto.point } p</td></tr></c:forEach>