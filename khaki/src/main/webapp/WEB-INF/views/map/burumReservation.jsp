<%@page import="java.io.IOException"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
500
<%
	String zone_loc = request.getParameter("zone_loc");
	String home_loc = request.getParameter("home_loc");
	//String url = "https://map.kakao.com/?sName="+zone_loc+"&eName="+home_loc;
	int num = 3;
	String url = "https://map.kakao.com/?sName=노량진역&eName=연신내역"; // 파라메터값으로 가져온 검색 데이터를 url주소에 추가
	Document doc = null;
	
	try {
		doc = Jsoup.connect(url).get();
		Elements element = doc.select("span.taxi");
		for (Element el : element.select("span.num")) {
			%>
			<%=num%>
			<%
		}
	} catch (IOException e) {
		e.printStackTrace();
	}

%>
