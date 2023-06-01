package com.example.bai_tap;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "SumServlet", value = "/SumServlet")
public class SumServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double a = Double.parseDouble(request.getParameter("num1"));
        double b = Double.parseDouble(request.getParameter("num2"));
        double kq = a + b;
        request.setAttribute("tinhtong", kq);
        RequestDispatcher r = request.getRequestDispatcher("end.jsp");
        r.forward(request, response);
    }
}
