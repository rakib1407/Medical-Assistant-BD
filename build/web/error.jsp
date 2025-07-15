<%-- 
    Document   : error
    Created on : Jul 7, 2025, 5:41:51 PM
    Author     : rk796
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="bn">
<head>
    <meta charset="UTF-8">
    <title>ত্রুটি ঘটেছে | Error</title>
    <style>
        body {
            background-color: #f8d7da;
            color: #721c24;
            font-family: 'SolaimanLipi', Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: #f5c6cb;
            padding: 30px 50px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(114, 28, 36, 0.3);
        }
        h1 {
            font-size: 48px;
            margin-bottom: 20px;
        }
        p {
            font-size: 20px;
            margin-bottom: 30px;
        }
        a {
            text-decoration: none;
            color: #721c24;
            font-weight: bold;
            border: 2px solid #721c24;
            padding: 10px 25px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        a:hover {
            background-color: #721c24;
            color: #fff;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>ত্রুটি ঘটেছে!</h1>
        <p>দুঃখিত, আপনার অনুরোধ প্রক্রিয়াকরণে সমস্যা হয়েছে।<br> অনুগ্রহ করে পরে আবার চেষ্টা করুন।</p>
        <a href="Login.html">লগইন পেজে ফিরে যান</a>
    </div>
</body>
</html>
