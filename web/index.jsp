<%-- 
    Document   : index
    Created on : Jul 7, 2025, 5:35:31 PM
    Author     : rk796
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="bn">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Medical Assistant BD</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            padding: 0;
            background: #f2f9ff;
        }
        header {
            background-color: #0077cc;
            color: white;
            padding: 20px;
            text-align: center;
        }
        nav {
            background: #005fa3;
            display: flex;
            justify-content: center;
        }
        nav a {
            color: white;
            padding: 15px 20px;
            text-decoration: none;
            display: inline-block;
        }
        nav a:hover {
            background: #004c82;
        }
        .hero {
            background-image: url('https://i.ibb.co/fCtqz0G/doctor-patient.jpg');
            background-size: cover;
            background-position: center;
            color: white;
            padding: 100px 20px;
            text-align: center;
        }
        .hero h1 {
            font-size: 36px;
        }
        .hero p {
            font-size: 20px;
            margin-top: 10px;
        }
        .btn {
            background: #ff6600;
            color: white;
            padding: 12px 25px;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 20px;
            display: inline-block;
        }
        .features {
            padding: 40px 20px;
            background: #fff;
            text-align: center;
        }
        .features h2 {
            margin-bottom: 20px;
        }
        .feature-box {
            max-width: 300px;
            margin: 20px auto;
            padding: 20px;
            background: #e6f2ff;
            border-radius: 10px;
            box-shadow: 0 0 10px #ccc;
        }
        footer {
            background: #003d66;
            color: white;
            text-align: center;
            padding: 15px;
            margin-top: 30px;
        }
    </style>
</head>
<body>

<header>
    <h1>Medical Assistant BD</h1>
    <p>আপনার চিকিৎসা সেবায় আমরা আছি সবসময় পাশে</p>
</header>

<nav>
    <a href="index.jsp">হোম</a>
    <a href="about.jsp">আমাদের সম্পর্কে</a>
    <a href="service.jsp">সেবা</a>
    <a href="contact.jsp">যোগাযোগ</a>
    <a href="login.jsp">লগইন</a>
</nav>

<section class="hero">
    <h1>চিকিৎসা নিতে আর একা যেতে হবে না</h1>
    <p>বিশ্বস্ত মেডিকেল সহায়ক এখন মাত্র একটি ক্লিকে</p>
    <a class="btn" href="service.jsp">সেবা নিন এখনই</a>
</section>

<section class="features">
    <h2>আমাদের সেবাসমূহ</h2>
    
    <div class="feature-box">
        <h3>হাসপাতালে পৌঁছাতে সহায়তা</h3>
        <p>আপনার নির্ধারিত সময়ে হাসপাতালে পৌঁছে দেবো।</p>
    </div>

    <div class="feature-box">
        <h3>ঔষধ সংগ্রহ</h3>
        <p>ডাক্তার লিখে দিলে আমাদের সহায়ক ঔষধ এনে দেবে।</p>
    </div>

    <div class="feature-box">
        <h3>জরুরি সহায়তা</h3>
        <p>জরুরি প্রয়োজনে দ্রুত সহায়ক পাঠানো হবে।</p>
    </div>
</section>

<footer>
    &copy; 2025 Medical Assistant BD. সর্বস্বত্ব সংরক্ষিত।
</footer>

</body>
</html>

