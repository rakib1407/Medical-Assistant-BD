
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // ফর্ম থেকে ডেটা নেওয়া
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
       String cpassword = request.getParameter("cpassword");  // Confirm Password
        String userType = request.getParameter("userType");
        String nid = request.getParameter("nid");

        try {
            // Password match চেক
            if (!password.equals(cpassword)) {
                out.println("<script type='text/javascript'>");
                out.println("alert('Password and Confirm Password do not match');");
                out.println("location='Register.html';");
                out.println("</script>");
                return;
            }

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/medical_assist", "root", "123456");

            // INSERT SQL - অবশ্যই ডাটাবেসের টেবিলের কলামগুলো চেক করে নাও
            String sql = "INSERT INTO users (name, email, phone, password, user_type, nid) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, password);  // বাস্তবে password হ্যাশ করা উচিত
            ps.setString(5, userType);
            ps.setString(6, nid);

            int count = ps.executeUpdate();

            if (count > 0) {
                out.println("<script type='text/javascript'>");
                out.println("alert('User registered successfully!');");
                out.println("location='login.jsp';");
                out.println("</script>");
            } else {
                out.println("<script type='text/javascript'>");
                out.println("alert('User registration failed. Try again.');");
                out.println("location='Register.jsp';");
                out.println("</script>");
            }

            ps.close();
            con.close();

        } catch (Exception e) {
            out.println("<script type='text/javascript'>");
            out.println("alert('Error: " + e.getMessage().replace("'", "") + "');");
            out.println("location='Register.jsp';");
            out.println("</script>");
            e.printStackTrace();
        }
    }
}
