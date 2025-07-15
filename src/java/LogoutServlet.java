
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // সেশন ইনভ্যালিড করে লগআউট
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }

        // লগইন পেজে রিডাইরেক্ট
        response.sendRedirect("login.jsp");
    }
}
