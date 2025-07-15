
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/ContactServlet")
public class ContactServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // ডাটাবেজ কানেকশন ইনফো
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/medical_assist";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASS = "123456";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        // ফর্ম ডেটা গ্রহণ
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        try (PrintWriter out = response.getWriter()) {
            // JDBC ড্রাইভার লোড
            Class.forName("com.mysql.cj.jdbc.Driver");

            // কানেকশন তৈরি
            Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);

            // ইনসার্ট SQL
            String sql = "INSERT INTO contact_messages (name, phone, email, message) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, phone);
            ps.setString(3, email);
            ps.setString(4, message);

            int result = ps.executeUpdate();

            // সফল হলে
            if (result > 0) {
                out.println("<html><body style='font-family:Segoe UI; padding:20px;'>");
                out.println("<h2>ধন্যবাদ, " + name + "!</h2>");
                out.println("<p>আপনার বার্তা সফলভাবে সংরক্ষণ করা হয়েছে।</p>");
              out.println("<a href='contact.jsp'>ফিরে যান</a> | <a href='index.jsp'>হোম</a>");
                
                out.println("</body></html>");
            } else {
                out.println("<script>alert('বার্তা পাঠানো যায়নি'); window.location='contact.jsp';</script>");
            }

            ps.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h3>ত্রুটি: " + e.getMessage() + "</h3>");
        }
    }
}
