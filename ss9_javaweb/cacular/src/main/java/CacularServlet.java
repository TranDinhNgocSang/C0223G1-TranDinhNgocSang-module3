import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "cacularServlet", value = "/cacularServlet")
public class CacularServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
String description = request.getParameter("description");
double price = Double.parseDouble(request.getParameter("price"));
double percent = Double.parseDouble(request.getParameter("percent"));
double kq = percent*price*0.01;
request.setAttribute("result",kq);
request.getRequestDispatcher("hienthi.jsp").forward(request,response);

    }
}
