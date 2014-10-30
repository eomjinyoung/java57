<%@page import="com.google.gson.Gson"%>
<%@page import="vo.Board"%>
<%@page import="java.util.List"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" 
    contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true" %>
<%
BoardDao dao = new BoardDao();
List<Board> list = dao.list();
%>
<%=new Gson().toJson(list)%>
