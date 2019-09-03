<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table>
<c:forEach var="hudto" varStatus="status" items="${hulist}">
	<tr class="hb_table_content_tr">
		<td class="hb_table_content_startLocation">${hudto.h_id }</td>
		<td class="hb_table_content_arrivalLocation">${hudto.h_carNum }</td>
		<td class="hb_table_content_carNum">${hudto.h_carModel }</td>
		<td class="hb_table_content_complete">${hudto.h_startLocation }</td>
		<td class="hb_table_content_handler">${hudto.h_returnLocation }</td>
		<td class="hb_table_content_carModel">${hudto.h_complete }</td>
		<td class="hb_table_content_point">${hudto.h_point }p</td>
		<td class="hb_table_content_point">${hudto.h_using }</td>
	</tr>
</c:forEach>
</table>