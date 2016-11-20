<%@page import="com.lab.smart.core.Client"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String x = request.getParameter("spanX");
    String y = request.getParameter("spanY");
    System.out.println(x + ":in:" + y);
    out.write(x + ":" + y);
    Client.move((int)(Double.parseDouble(x)), (int)(Double.parseDouble(y)));
    %>
