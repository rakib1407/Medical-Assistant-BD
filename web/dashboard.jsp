<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%
    // সেশন চেক করুন
    if (session == null || session.getAttribute("userEmail") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String email = (String) session.getAttribute("userEmail");

    String name = "", phone = "", userType = "", nid = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medical_assist", "root", "123456");

        PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE email = ?");
        ps.setString(1, email);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            name = rs.getString("name");
            phone = rs.getString("phone");
            userType = rs.getString("user_type");
            nid = rs.getString("nid");
        }

        rs.close();
        ps.close();
        con.close();
    } catch (Exception e) {
        out.println("ডাটাবেজ সংযোগ ত্রুটি: " + e.getMessage());
    }
%>

<!DOCTYPE html>
<html lang="bn">
<head>
    <meta charset="UTF-8">
    <title>ড্যাশবোর্ড</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f0f8ff;
            padding: 30px;
        }
        .container {
            background-color: #ffffff;
            max-width: 600px;
            margin: auto;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 0 10px #ccc;
        }
        h2 {
            color: #004080;
            text-align: center;
        }
        .info {
            margin: 10px 0;
            font-size: 16px;
        }
        .services {
            margin-top: 30px;
            background: #e6f2ff;
            padding: 15px;
            border-radius: 8px;
        }
        .services ul {
            list-style: none;
            padding-left: 0;
        }
        .services ul li {
            margin: 8px 0;
        }
        a {
            text-decoration: none;
            color: #0077cc;
        }
        .logout {
            margin-top: 20px;
            text-align: center;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>স্বাগতম, <%= name %>!</h2>

    <div class="info">📧 <strong>ইমেইল:</strong> <%= email %></div>
    <div class="info">📱 <strong>ফোন:</strong> <%= phone %></div>
    <div class="info">🆔 <strong>এনআইডি:</strong> <%= nid %></div>
    <div class="info">👤 <strong>ইউজার টাইপ:</strong> <%= userType %></div>

    <div class="services">
        <h3>🔧 আমাদের সার্ভিসসমূহ:</h3>
        <ul>
            <li><a href="service1.jsp">সেবা</a></li>
           
        </ul>
    </div>

    <div class="logout">
        <a href="logout.jsp">🚪 লগআউট করুন</a>
    </div>
</div>

</body>
</html>
