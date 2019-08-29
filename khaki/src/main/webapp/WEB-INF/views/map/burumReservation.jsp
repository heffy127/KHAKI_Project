<%@page import="java.io.IOException"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String zone_loc = request.getParameter("zone_loc");
String home_loc = request.getParameter("home_loc");

//String url = "https://map.kakao.com/?sName="+zone_loc+"&eName="+home_loc;
String url = "https://map.kakao.com/?sName=노량진역&eName=연신내역";
Document doc = null;

try {
    doc = Jsoup.connect(url).get();
} catch (IOException e) {
    e.printStackTrace();
}

Elements element = doc.select("div.info addInfo");

for(Element el : element.select("li")) {    // 하위 뉴스 기사들을 for문 돌면서 출력
    System.out.println(el.text());
}
 
System.out.println("============================================================");
%>
