
import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/ProcessPaymentServlet")
public class ProcessPaymentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ইউজার ইনফো সেশন থেকে আনছি
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userEmail") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String userEmail = (String) session.getAttribute("userEmail");

        // ফর্মের ইনপুট ডেটা নিচ্ছি
        String service = request.getParameter("service");
        String paymentMethod = request.getParameter("paymentMethod");
        String mobileNumber = request.getParameter("mobileNumber");
        String transactionId = request.getParameter("transactionId");
        String amountStr = request.getParameter("amount");

        int amount = Integer.parseInt(amountStr); // int এ কনভার্ট

        try {
            // ড্রাইভার লোড
            Class.forName("com.mysql.cj.jdbc.Driver");

            // ডাটাবেজ কানেকশন
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/medical_assist", "root", "123456");

            // পেমেন্ট ইনসার্ট SQL
            String sql = "INSERT INTO payments (user_email, service, payment_method, mobile_number, transaction_id, amount) VALUES (?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, userEmail);
            ps.setString(2, service);
            ps.setString(3, paymentMethod);
            ps.setString(4, mobileNumber);
            ps.setString(5, transactionId);
            ps.setInt(6, amount);

            int count = ps.executeUpdate();

            if (count > 0) {
                // ✅ সফল হলে success পেজে পাঠাও
                response.sendRedirect("payment successfull.jsp");
            } else {
                // ❌ ব্যর্থ হলে আবার payment.jsp তে পাঠাও
                response.getWriter().println("<script>alert('পেমেন্ট ব্যর্থ হয়েছে!'); window.location='payment.jsp';</script>");
            }

            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h3>পেমেন্ট ত্রুটি: " + e.getMessage() + "</h3>");
        }
    }
}
