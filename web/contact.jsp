

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="bn">
<head>
    <meta charset="UTF-8">
    <title>যোগাযোগ</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f0f8ff;
            padding: 20px;
        }
        h1 {
            text-align: center;
            color: #004080;
        }
        .contact-box {
            max-width: 600px;
            margin: auto;
            background: white;
            padding: 30px;
            box-shadow: 0 0 10px #ccc;
            border-radius: 10px;
        }
        label {
            display: block;
            margin: 15px 0 5px;
        }
        input, textarea {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
        }
        button {
            margin-top: 20px;
            background: #0077cc;
            color: white;
            border: none;
            padding: 12px 20px;
            cursor: pointer;
            border-radius: 5px;
        }
        .office-phone {
            max-width: 600px;
            margin: 20px auto;
            background: #d9eaff;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 0 8px #aaa;
            font-size: 18px;
            color: #003d66;
        }
    </style>
</head>
<body>

<h1>যোগাযোগ করুন</h1>

<div class="contact-box">
    <form action="ContactServlet" method="post">
        <label>আপনার নাম:</label>
        <input type="text" name="name" required>

        <label>ফোন নম্বর:</label>
        <input type="tel" name="phone" placeholder="০১XXXXXXXXX" pattern="[০-৯0-9]{11}" required>

        <label>ইমেইল ঠিকানা:</label>
        <input type="email" name="email" required>

        <label>বার্তা:</label>
        <textarea name="message" rows="5" required></textarea>

        <button type="submit">বার্তা পাঠান</button>
    </form>
</div>

<div class="office-phone">
    <strong>অফিস ফোন নম্বর:</strong> 01861084408
</div>

</body>
</html>
