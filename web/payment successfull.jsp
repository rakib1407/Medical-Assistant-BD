<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%
    // সেশন থেকে ইউজার চেক (সিকিউরিটি এর জন্য)
    if (session == null || session.getAttribute("userEmail") == null) {
        response.sendRedirect("login.html");
        return;
    }

    String userEmail = (String) session.getAttribute("userEmail");
    String serviceName = request.getParameter("service"); // payment.jsp থেকে আসা সার্ভিসের নাম
%>
<!DOCTYPE html>
<html lang="bn">
<head>
    <meta charset="UTF-8" />
    <title>পেমেন্ট সফল হয়েছে</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #e6f7e6;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .success-box {
            background: white;
            padding: 40px 60px;
            border-radius: 10px;
            box-shadow: 0 0 20px #4CAF50;
            text-align: center;
            max-width: 400px;
        }
        h1 {
            color: #4CAF50;
            margin-bottom: 20px;
        }
        p {
            font-size: 18px;
            color: #333;
            margin-bottom: 30px;
        }
        a {
            text-decoration: none;
            color: white;
            background-color: #0077cc;
            padding: 12px 25px;
            border-radius: 5px;
            font-weight: 600;
        }
        a:hover {
            background-color: #005fa3;
        }
    </style>
</head>
<body>

<div class="success-box">
    <h1>🎉 পেমেন্ট সফল হয়েছে!</h1>
    <p><strong><%= userEmail %></strong> ঠিকানায় সফলভাবে <br> <em><%= serviceName != null ? serviceName : "সেবা" %></em> এর জন্য পেমেন্ট হয়েছে।</p>

    <a href="dashboard.jsp">ড্যাশবোর্ডে ফিরে যান</a>
</div>

</body>
</html>
