import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if ("admin".equals(username) && "admin".equals(password)) {
            String yes = "Welcome" + username + "website";
            request.setAttribute("end", yes);
            request.getRequestDispatcher("display.jsp").forward(request, response);
        } else {
            String no = "Login Error";
            request.setAttribute("end", no);
            request.getRequestDispatcher("display.jsp").forward(request, response);
        }

    }
}
