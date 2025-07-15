<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // সেশন নষ্ট করা
    session.invalidate();

    // লগইন পেজে রিডাইরেক্ট করা
    response.sendRedirect("login.jsp");
%>
