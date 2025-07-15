import java.io.IOException;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // doPost method: invoked when user submits login form via POST
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        // ইনপুট নেওয়া
        String email = request.getParameter("email").trim();
        String password = request.getParameter("password").trim();

        // যদি ফাঁকা থাকে, সরাসরি ফিরে যান
        if (email.isEmpty() || password.isEmpty()) {
            response.sendRedirect("login.jsp?error=1");
            return;
        }

        // ডাটাবেজ কানেকশন সেটআপ
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // ড্রাইভার লোড
            Class.forName("com.mysql.cj.jdbc.Driver");

            // ডাটাবেজ কানেকশন
            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/medical_assist", "root", "123456");

            // কোয়েরি প্রস্তুত
            String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);

            // কোয়েরি চালানো
            rs = ps.executeQuery();

            if (rs.next()) {
                // লগইন সফল, সেশন শুরু
                HttpSession session = request.getSession();
                session.setAttribute("userEmail", email);

                // ড্যাশবোর্ডে রিডাইরেক্ট
                response.sendRedirect("dashboard.jsp");
            } else {
                // লগইন ব্যর্থ
                response.sendRedirect("login.jsp?error=1");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.html"); // Optional error page
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) {}
            try { if (ps != null) ps.close(); } catch (Exception e) {}
            try { if (con != null) con.close(); } catch (Exception e) {}
        }
    }
}
