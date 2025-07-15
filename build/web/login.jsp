<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="bn">
<head>
    <meta charset="UTF-8">
    <title>লগইন</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #e6f2ff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .login-box {
            background: white;
            padding: 30px;
            box-shadow: 0 0 15px #ccc;
            border-radius: 10px;
            width: 300px;
        }
        h2 {
            text-align: center;
            color: #004080;
        }
        input {
            width: 100%;
            padding: 10px;
            margin-top: 15px;
        }
        button {
            width: 100%;
            padding: 12px;
            margin-top: 20px;
            background: #0077cc;
            color: white;
            border: none;
            cursor: pointer;
        }
        p {
            text-align: center;
            margin-top: 10px;
        }
        a {
            color: #0077cc;
        }
    </style>
</head>
<body>

<div class="login-box">
    <h2>লগইন করুন</h2>

    <!-- ✅ ফর্ম একশন LoginServlet ও POST method ব্যবহার -->
    <form action="LoginServlet" method="post">
        <input type="email" name="email" placeholder="ইমেইল" required>
        <input type="password" name="password" placeholder="পাসওয়ার্ড" required>
        <button type="submit">লগইন</button>
    </form>

    <p>একাউন্ট নেই? <a href="signup.jsp">রেজিস্টার করুন</a></p>
</div>

<!-- ✅ যদি login.html?error=1 আসে তাহলে অ্যালার্ট দেখানো -->
<%
    String error = request.getParameter("error");
    if ("1".equals(error)) {
%>
    <script>alert("ইমেইল বা পাসওয়ার্ড ভুল!");</script>
<%
    }
%>

</body>
</html>
