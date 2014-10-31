<%@page import="com.google.gson.Gson"%>
<%@page import="vo.Board"%>
<%@page import="java.util.List"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" 
    contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true" %>
<%
List<Board> list = (List<Board>)request.getAttribute("list");
%>
<%=new Gson().toJson(list)%>
