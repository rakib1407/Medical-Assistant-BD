<%-- 
    Document   : signup
    Created on : Jul 7, 2025, 5:39:08 PM
    Author     : rk796
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="bn">
<head>
    <meta charset="UTF-8" />
    <title>রেজিস্ট্রেশন / সাইন আপ</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #e6f2ff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .signup-box {
            background: white;
            padding: 30px 40px;
            box-shadow: 0 0 15px #ccc;
            border-radius: 10px;
            width: 350px;
        }
        h2 {
            text-align: center;
            color: #004080;
            margin-bottom: 25px;
        }
        label {
            display: block;
            margin-top: 15px;
            font-weight: 600;
        }
        input, select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            box-sizing: border-box;
            border: 1px solid #aaa;
            border-radius: 5px;
        }
        button {
            width: 100%;
            padding: 12px;
            background: #0077cc;
            color: white;
            font-size: 16px;
            margin-top: 25px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background: #005fa3;
        }
        p {
            text-align: center;
            margin-top: 20px;
        }
        a {
            color: #0077cc;
        }
    </style>
</head>
<body>

<div class="signup-box">
    <h2>নতুন একাউন্ট তৈরি করুন</h2>
    <form action="RegisterServlet" method="POST">
        <label for="userType">ব্যবহারকারীর ধরন</label>
        <select id="userType" name="userType" required>
            <option value="" disabled selected>-- নির্বাচন করুন --</option>
            <option value="patient">রোগী</option>
          <!--  <option value="assistant">সহায়ক</option> -->
        </select>

        <label for="name">পূর্ণ নাম</label>
        <input type="text" id="name" name="name" placeholder="আপনার নাম লিখুন" required>

        <label for="email">ইমেইল</label>
        <input type="email" id="email" name="email" placeholder="example@gmail.com" required>

        <label for="phone">ফোন নম্বর</label>
        <input type="tel" id="phone" name="phone" placeholder="০১XXXXXXXXX" pattern="[০-৯0-9]{11}" required>

        <label for="password">পাসওয়ার্ড</label>
        <input type="password" id="password" name="password" placeholder="কমপক্ষে ৬ অক্ষর" minlength="6" required>

        <label for="cpassword">কনফার্ম পাসওয়ার্ড</label>
        <input type="password" id="cpassword" name="cpassword" placeholder="পাসওয়ার্ড আবার লিখুন" minlength="6" required>

        <label for="nid">জাতীয় পরিচয়পত্র নম্বর (NID)</label>
        <input type="text" id="nid" name="nid" placeholder="যদি সহায়ক হন অবশ্যই" pattern="[0-9]{10,17}">

        <button type="submit">রেজিস্টার করুন</button>
    </form>
    <p>আগেই একাউন্ট করেছেন? <a href="login.html">লগইন করুন</a></p>
</div>

</body>
</html>
