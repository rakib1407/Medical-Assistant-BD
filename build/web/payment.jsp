<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%
    if (session == null || session.getAttribute("userEmail") == null) {
        response.sendRedirect("login.html");
        return;
    }
%>
<!DOCTYPE html>
<html lang="bn">
<head>
    <meta charset="UTF-8" />
    <title>পেমেন্ট পেজ</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f9f9f9;
            padding: 20px;
        }
        .payment-container {
            max-width: 400px;
            margin: auto;
            background: white;
            padding: 30px 40px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
        h2 {
            color: #004080;
            margin-bottom: 20px;
            text-align: center;
        }
        label {
            display: block;
            margin-top: 15px;
            font-weight: 600;
        }
        select, input[type=text], input[type=number] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #aaa;
            border-radius: 5px;
            box-sizing: border-box;
        }
        button {
            width: 100%;
            margin-top: 25px;
            padding: 12px;
            background: #0077cc;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        button:hover {
            background: #005fa3;
        }
        #paymentNumber {
            margin-top: 10px;
            font-weight: bold;
            color: #0077cc;
        }
    </style>
    <script>
        function showPaymentNumber() {
            const method = document.getElementById("paymentMethod").value;
            const numberDisplay = document.getElementById("paymentNumber");
            if(method === "bkash") {
                numberDisplay.textContent = "বিকাশ নম্বর:01571247947";
            } else if(method === "nogod") {
                numberDisplay.textContent = "নগদ নম্বর: 01571247947";
            } else {
                numberDisplay.textContent = "";
            }
        }
        window.onload = function() {
            document.getElementById("paymentMethod").addEventListener("change", showPaymentNumber);
        }
    </script>
</head>
<body>

<div class="payment-container">
    <h2>পেমেন্ট করুন</h2>

    <form action="ProcessPaymentServlet" method="post">
        
          <!-- ✅ সার্ভিস অপশন -->
        <label for="service">সেবা নির্বাচন করুন</label>
        <select id="service" name="service" required>
            <option value="" disabled selected>-- একটি সেবা নির্বাচন করুন --</option>
            <option value="হাসপাতাল সহায়তা">১. হাসপাতাল সহায়তা</option>
            <option value="ঔষধ কেনা">২. ঔষধ কেনা</option>
            <option value="জরুরি সেবা">৩. জরুরি সেবা</option>
            <option value="ডাক্তারের অ্যাপয়েন্টমেন্ট">৪. ডাক্তারের অ্যাপয়েন্টমেন্ট</option>
        </select>
        
        <label for="paymentMethod">পেমেন্ট পদ্ধতি</label>
        <select id="paymentMethod" name="paymentMethod" required>
            <option value="" disabled selected>-- নির্বাচন করুন --</option>
            <option value="bkash">বিকাশ</option>
            <option value="nogod">নগদ</option>
        </select>

        <div id="paymentNumber"></div>

        <label for="mobileNumber">মোবাইল নম্বর</label>
        <input type="text" id="mobileNumber" name="mobileNumber" placeholder="০১XXXXXXXXX" pattern="[০-৯0-9]{11}" required>

        <label for="transactionId">ট্রানজেকশন আইডি</label>
        <input type="text" id="transactionId" name="transactionId" placeholder="আপনার ট্রানজেকশন আইডি লিখুন" required>

        <label for="amount">পরিমাণ (টাকা)</label>
        <input type="number" id="amount" name="amount" min="1" placeholder="পেমেন্টের পরিমাণ" required>

        <button type="submit">পেমেন্ট সাবমিট করুন</button>
    </form>
</div>

</body>
</html>
