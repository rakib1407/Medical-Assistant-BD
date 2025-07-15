
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="bn">
<head>
    <meta charset="UTF-8" />
    <title>আমাদের সেবা</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #e6f2ff;
            padding: 20px;
        }
        h1 {
            text-align: center;
            color: #004080;
        }
        .service-box {
            background: white;
            padding: 20px;
            margin: 20px auto;
            max-width: 600px;
            box-shadow: 0 0 10px #bbb;
            border-radius: 10px;
            text-align: center;
        }
        .price {
            color: green;
            font-weight: bold;
            font-size: 18px;
            margin-top: 10px;
        }
        .btn-book {
            margin-top: 15px;
            padding: 12px 30px;
            background: #0077cc;
            color: white;
            border: none;
            border-radius: 7px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .btn-book:hover {
            background: #005fa3;
        }
    </style>
</head>
<body>

<h1>আমাদের সেবাসমূহ</h1>

<div class="service-box">
    <h3>১। হাসপাতাল সহায়তা</h3>
    <p>রোগীকে হাসপাতালে পৌঁছে দেয়া, ডাক্তার দেখানো, রিপোর্ট সংগ্রহ ইত্যাদি।</p>
    <p class="price">মূল্য: ৫০০ টাকা (প্রতি ট্রিপ)</p>
    <button class="btn-book" onclick="bookService('হাসপাতাল সহায়তা')">সেবা নিন</button>
</div>

<div class="service-box">
    <h3>২। ঔষধ কেনা</h3>
    <p>প্রেসক্রিপশন অনুযায়ী ঔষধ সংগ্রহ করে বাসায় পৌঁছে দেওয়া।</p>
    <p class="price">মূল্য: ২০০ টাকা (একবারে)</p>
    <button class="btn-book" onclick="bookService('ঔষধ কেনা')">সেবা নিন</button>
</div>

<div class="service-box">
    <h3>৩। জরুরি সেবা</h3>
    <p>হঠাৎ অসুস্থ হলে দ্রুত সহায়ক পাঠানোর ব্যবস্থা।</p>
    <p class="price">মূল্য: ৭০০ টাকা (দ্রুত সাড়া সহ)</p>
    <button class="btn-book" onclick="bookService('জরুরি সেবা')">সেবা নিন</button>
</div>

<div class="service-box">
    <h3>৪। ডাক্তারের সিরিয়াল/অ্যাপয়েন্টমেন্ট</h3>
    <p>আপনার পক্ষে ডাক্তার অ্যাপয়েন্টমেন্ট বুকিং করে দেওয়া।</p>
    <p class="price">মূল্য: ১৫০ টাকা (অনলাইন বুকিং)</p>
    <button class="btn-book" onclick="bookService('ডাক্তারের সিরিয়াল/অ্যাপয়েন্টমেন্ট')">সেবা নিন</button>
</div>

<script>
    function bookService(serviceName) {
        // চেক করবো ইউজার লগইন করেছে কিনা
        const isLoggedIn = localStorage.getItem('isLoggedIn');

        if (isLoggedIn === 'true') {
            // যদি লগইন থাকে, তাহলে বুকিং পেইজে নিয়ে যাও (চাইলে serviceName পাস করতে পারো)
            alert(serviceName + " সেবা বুকিং ফিচার শীঘ্রই আসছে!");
            // window.location.href = 'booking.jsp?service=' + encodeURIComponent(serviceName);
        } else {
            // যদি লগইন না করা থাকে, তাহলে login.jsp এ পাঠিয়ে দাও
            alert("এই সেবা নিবেন!"); 
            window.location.href = 'payment.jsp';
        }
    }

    function logout() {
        localStorage.removeItem('isLoggedIn');
        localStorage.removeItem('userEmail');
        window.location.href = 'login.jsp';
    }
</script>


</body>
</html>
